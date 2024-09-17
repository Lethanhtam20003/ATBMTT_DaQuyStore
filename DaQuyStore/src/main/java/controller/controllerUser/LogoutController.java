package controller.controllerUser;

import com.google.gson.Gson;
import dao.userDAO.LogDao;
import model.Log;
import model.User;
import service.manageUser.ServiceIPAddress;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession(false);
        User u = (User)session.getAttribute("user");
        Gson gson = new Gson();
        String json = gson.toJson(u);
        if(session!=null){

            session.invalidate();

            Log log = new Log(ServiceIPAddress.convertToIPv4(req.getLocalAddr()), "logout", "info", "", json, null, Date.valueOf(LocalDate.now()));
//            TODO remember open comment
//            try {
//                LogDao.getInstance().insertLog(log);
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
        }
        resp.sendRedirect(req.getContextPath()+"/loginWeb");
    }
}
