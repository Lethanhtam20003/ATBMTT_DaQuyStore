package controller.controllerUser;

import service.manageUser.ServiceIPAddress;
import service.manageUser.registerAndLogin.ChangePasswordService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/changepassword")
public class ChangePasswordController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ChangePasswordService changePasswordService = new ChangePasswordService();
        String currentpassword = req.getParameter("currentpassword");
        String newpassword = req.getParameter("newpassword");
        String repeatpassword = req.getParameter("repeatpassword");
        HttpSession session = req.getSession();
        String ipAddress = ServiceIPAddress.convertToIPv4(req.getRemoteAddr());
        if (session != null) {
            String username = (String) session.getAttribute("username");
            if (!currentpassword.equals(newpassword)) {
                if (newpassword.equals(repeatpassword)) {
                    try {
                        if (changePasswordService.updatePassword(username, newpassword,"chage password",ipAddress)) {
                            req.setAttribute("notify", "Đổi mật khẩu thành công");
                            req.getRequestDispatcher("/views/login/changepassword.jsp").forward(req, resp);
                        } else {
                            req.setAttribute("notify", "Đổi mật khẩu thất bại");
                            req.getRequestDispatcher("/views/login/changepassword.jsp").forward(req, resp);

                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }


            } else {
                req.setAttribute("notify", "Mật khẩu phải trùng khớp với nhau");
                req.getRequestDispatcher("/views/login/changepassword.jsp").forward(req, resp);
            }
        }
    }
}
