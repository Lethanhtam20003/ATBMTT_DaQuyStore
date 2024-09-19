package controller.controllerUser.facebook;

import com.restfb.types.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login-facebook")
public class FacebookLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = RestFB.getToken(code);
            User user = RestFB.getUserInfo(accessToken);
            request.setAttribute("id", user.getId());
            request.setAttribute("name", user.getName());
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
        }

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
