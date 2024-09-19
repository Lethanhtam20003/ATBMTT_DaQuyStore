package controller.controllerUser;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
//import jakarta.mail.internet.AddressException;
import controller.controllerUser.google.GoogleInfo;
import controller.controllerUser.google.TokenGoogle;
import model.User;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import service.manageUser.ServiceIPAddress;
import service.manageUser.security.EncryptAndDencrypt;
import service.manageUser.registerAndLogin.LoginService;

import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns={ "/loginWeb" ,"/loginGoogle","/loginFaceBook"})
public class LoginController  extends HttpServlet {
    EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();
    LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if ("/loginWeb".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginWeb"
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/login.jsp");
            dispatcher.forward(req, resp);
        } else if ("/loginGoogle".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginGoogle"
            try {
                loginGoogle(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/loginFaceBook".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginFaceBook"
        } else {
            // Xử lý khi không phân biệt được URL
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("email"+ req.getParameter("username"));
            loginWeb(req,resp);
        } catch (SQLException | AddressException e) {
            throw new RuntimeException(e);
        }
    }

    protected void loginWeb(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException, AddressException {
        String idUser = "";
        String username = req.getParameter("username");
        String pass =req.getParameter("password");
        HttpSession session = req.getSession(true);
        if (username == null || pass == null) {
            req.setAttribute("notify", "Vui lòng nhập đầy đủ thông tin");
            req.getRequestDispatcher(req.getContextPath()+"/views/index.jsp").forward(req, resp);
        } else {
            String ipAddress = ServiceIPAddress.convertToIPv4(req.getRemoteAddr());
            User user = loginService.login(username, pass,"web","login web",ipAddress);
            if (user != null) {
                if (session != null) {
                    session.setAttribute("user", user);
                    if (user.getRole().equals("admin")) {
                        req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
                    } else if (user.getRole().equals("user")) {
                        req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
                    }else if(user.getRole().equals("prohibit")){
                        session.removeAttribute("user");
                        req.getRequestDispatcher("/views/notification/notificationThenCheckProhibit.jsp").forward(req,resp);
                    }
                }
            } else {
                req.setAttribute("notify", "Tài khoản hoặc mật khẩu không tồn tại");
                req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
            }

        }
    }

    private void loginGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        HttpSession session = req.getSession(true);
        String code = req.getParameter("code");
        String token =  getToken(code);
        GoogleInfo user = getUserInfo(token);
        String ipAddress = ServiceIPAddress.convertToIPv4(req.getRemoteAddr());
        User account = loginService.login(user.getEmail(),user.getId(),"google","login google",ipAddress);
        if(account != null) {
            session.setAttribute("user", account);
            if (account.getRole().equals("admin")) {
                req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
            } else if (account.getRole().equals("user")) {
                req.getRequestDispatcher("/home").forward(req,resp);
            }else if(account.getRole().equals("prohibit")){
                session.removeAttribute("user");
                req.getRequestDispatcher("/views/notification/notificationThenCheckProhibit.jsp").forward(req,resp);
            }
        }else{
            req.setAttribute("notify","tài khoản không tồn tại!");

            req.getRequestDispatcher("/loginWeb").forward(req,resp);
        }
    }
    public  String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(TokenGoogle.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", TokenGoogle.GOOGLE_CLIENT_ID_LOGIN)
                        .add("client_secret", TokenGoogle.GOOGLE_CLIENT_SECRET_LOGIN)
                        .add("redirect_uri", TokenGoogle.GOOGLE_REDIRECT_URI_LOGIN).add("code", code)
                        .add("grant_type", TokenGoogle.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        return jobj.get("access_token").toString().replaceAll("\"", "");
    }

    public  GoogleInfo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = TokenGoogle.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, GoogleInfo.class);
    }

}
