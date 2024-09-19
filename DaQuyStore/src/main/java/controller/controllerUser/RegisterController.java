package controller.controllerUser;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import controller.controllerUser.google.GoogleInfo;
import controller.controllerUser.google.TokenGoogle;

import dao.userDAO.UserDAO;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import service.manageUser.ServiceIPAddress;
import service.manageUser.security.EncryptAndDencrypt;
import service.manageUser.registerAndLogin.RegisterService;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/register","/registerGoogle","/registerFacebook"})
public class RegisterController extends HttpServlet {
    private RegisterService registerService = new RegisterService();
    private EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if ("/register".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/register"
            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/register.jsp");
            dispatcher.forward(req, resp);
        } else if ("/registerGoogle".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginGoogle"
            try {
                registerGoogle(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/registerFacebook".equals(servletPath)) {
            // Xử lý khi client đến từ URL "/loginFaceBook"

        } else {
            // Xử lý khi không phân biệt được URL
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password =request.getParameter("pass");
        String email = request.getParameter("email");
        //kiểm tra mật khẩu
        if (!checkPassword(password)) {
            String announced = "Mật khẩu không hợp lệ!";
            request.setAttribute("announced", announced);
        }
        password =  encryptAndDencrypt.encrypt(password);
                //kiểm tra user namme và email
        try {
            checkRegister(request,response,username,email);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // đang ky
        try {
            registerWeb(request,response,username,password,email);
        } catch (SQLException e) {
                throw new RuntimeException(e);
        }
    }

    private boolean checkPassword(String password) {
        // Kiểm tra độ dài của mật khẩu
        if (password.length() < 8 || password.length() > 15) {
            return false;
        }
        // Kiểm tra xem mật khẩu có chứa khoảng trắng hay không
        if (password.contains(" ")) {
            return false;
        }
        // Kiểm tra xem mật khẩu có chứa ký tự đặc biệt hay không
        String specialCharacters = "[^a-zA-Z0-9]";
        if (password.matches(".*" + specialCharacters + ".*")) {
            return false;
        }
        // Tất cả các kiểm tra đều thành công
        return true;
    }

    /*
    * đăng ký tài khoản trên web
    * */
    private void registerWeb(HttpServletRequest request, HttpServletResponse response,String username,String password,String email) throws ServletException, IOException, SQLException {
        String ipAddress = ServiceIPAddress.convertToIPv4(request.getRemoteAddr());
        request.getRequestDispatcher("/notificationThenRegister").forward(request,response);

        String code = registerService.createActivationCode(username,password,email,"login web",ipAddress);

        sendEmail(request,response,code,email);
    }

    /*
    * gửi email
    * */
    protected void sendEmail(HttpServletRequest request, HttpServletResponse response, String code,String email) throws IOException {
        try {
            final String HOST_NAME = "smtp.gmail.com";
            final int SSL_PORT = 465; // Port for SSL
            // email Tân
//            final String APP_EMAIL = "ngoken102@gmail.com"; // your email
//            final String APP_PASSWORD = "hfef chqv lick rcfx"; // your password
            // email Tâm
            final String APP_EMAIL = "tamlethanh20032@gmail.com"; // your email
            final String APP_PASSWORD = "wris fjra duqq gvgp"; // your password
            final String RECEIVE_EMAIL = email;

            // Get properties object
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", HOST_NAME);
            props.put("mail.smtp.socketFactory.port", SSL_PORT);
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.port", SSL_PORT);

            // get Session
            Session session = Session.getDefaultInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
                }
            });

            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(RECEIVE_EMAIL));
                String url = "<a href=\"http://localhost:8080/DaQuyStore_war/verifyRegister?code="+code+"\">Click vào đây để xác nhận</a>";

                message.setSubject("Xác nhận tài khoản!");
                message.setContent("<h1>Xác nhận tài khoản:</h1>" + url, "text/html;charset=utf-8");

                // send message
                Transport.send(message);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    protected void checkRegister(HttpServletRequest servletRequest, HttpServletResponse servletResponse, String username, String email) throws ServletException, IOException, SQLException {
        String announced =null;
        if (registerService.checkDuplicatedUsername(username)) {
            announced= "Tài khoản đã tồn tại,";
        }
        if (registerService.checkDuplicatedEmail(email)) {
            announced += " email đã tồn tại";
        }
        if(announced!=null){
            servletRequest.setAttribute("announced", announced);
            RequestDispatcher requestDispatcher = servletRequest.getRequestDispatcher("/views/login/register.jsp");
            requestDispatcher.forward(servletRequest, servletResponse);
        }

    }

    /*
    * Đăng ký tài khoản google
    * */
    private void registerGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        HttpSession session = req.getSession(false);
        String ipAddress  = ServiceIPAddress.convertToIPv4(req.getRemoteAddr());
        String code = req.getParameter("code");
        String token =  getToken(code);
        GoogleInfo user = getUserInfo(token);
        checkRegister(req,resp,user.getEmail(),user.getEmail());
        // email: username; id: password;
        User u = new User(user.getEmail(),encryptAndDencrypt.encrypt(user.getId()),user.getEmail(),"google",user.getPicture(),user.getFamily_name()+" "+user.getGiven_name());
        if(registerService.insertUser(u,"register account google",ipAddress)){
            String id = UserDAO.getInstance().getUserid(u.getEmail());
            u.setId(id);
            session.setAttribute("user", u);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/index.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    public  String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(TokenGoogle.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", TokenGoogle.GOOGLE_CLIENT_ID_REGISTER)
                        .add("client_secret", TokenGoogle.GOOGLE_CLIENT_SECRET_REGISTER)
                        .add("redirect_uri", TokenGoogle.GOOGLE_REDIRECT_URI_REGISTER).add("code", code)
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
