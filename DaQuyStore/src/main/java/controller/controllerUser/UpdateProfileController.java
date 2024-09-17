package controller.controllerUser;

import service.manageUser.ServiceIPAddress;
import service.manageUser.registerAndLogin.UpdateProfileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateProfile")
public class UpdateProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/login/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");
        String birthday = req.getParameter("birthday");

        HttpSession session = req.getSession();
        String ipAddress = ServiceIPAddress.convertToIPv4(req.getRemoteAddr());
        if (session != null) {
            if (session.getAttribute("username") != null) {
               String userName = session.getAttribute("username").toString();
                // check
                try {
                    if(UpdateProfileService.update(userName, name,phone,email,address,gender,birthday,"update profile",ipAddress)){
                        req.setAttribute("notify", "Cập nhật thành công");
                        req.getRequestDispatcher("/views/login/profile.jsp").forward(req, resp);
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            req.setAttribute("notify", "Cập nhật khong thành công");
            req.getRequestDispatcher("/views/login/login.jsp").forward(req, resp);
        }
    }
}
