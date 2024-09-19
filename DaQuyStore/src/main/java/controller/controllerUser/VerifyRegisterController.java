package controller.controllerUser;

import dao.userDAO.ActivacationCodeDao;
import dao.userDAO.UserDAO;
import model.ActivacationCode;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/verifyRegister")
public class VerifyRegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//        req.getSession(false); lấy phiên hiện tại nếu có tông tại ko có trả về null
            HttpSession session = req.getSession(true);
            String code = req.getParameter("code");
            ActivacationCodeDao dao = new ActivacationCodeDao();
            String ipAddress = (String) session.getAttribute("ipAddress");
            ActivacationCode ac = dao.selectById(code,"create activity code",ipAddress);
            if(ac==null){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/error/404.jsp");
                requestDispatcher.forward(req, resp);
            }
            if(ac!=null){
               User u = new User(ac.getUsername(),ac.getPassword(),ac.getEmail(),"web");
               UserDAO uDao = new UserDAO();
               if(uDao.insert(u,"create user",ipAddress)) {
                   session.setAttribute("user", u);
                   resp.sendRedirect(req.getContextPath() + "/views/index.jsp");
               }
           }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
