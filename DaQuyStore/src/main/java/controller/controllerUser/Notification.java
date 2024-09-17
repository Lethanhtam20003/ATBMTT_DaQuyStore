package controller.controllerUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/notificationThenRegister"})
public class Notification extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if ("/notificationThenRegister".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/notificationThenRegister"
            req.getRequestDispatcher("/views/notification/notificationThenRegister.jsp").forward(req, resp);
        } else {
            // Xử lý khi không phân biệt được URL
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
