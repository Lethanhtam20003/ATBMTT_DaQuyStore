package controller;




import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet("/sendmail")
public class SendMailFormContact extends HttpServlet {
    String name, subject, email, mess;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/contact.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html; charset=UTF-8");
        name = req.getParameter("fullname");
        subject = req.getParameter("subject");
        email = req.getParameter("email");
        mess = req.getParameter("message");


        final String username = "taitanvo16@gmail.com";
        final String password = "uehb tlud sslm enqw";
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", true);
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");//smtp
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = "Họ và tên " + name +"    "+ " +Email:" + email +"    "+ "Subject" + subject +"    "+ "Nội dung:" + mess;
            textPart.setText(final_Text);
            message.setSubject(subject);
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            message.setSubject("Chi tiết Liên hệ");
            Transport.send(message);
            out.println("<center><h2 style='color:green;'>Gửi Thành Công</h2>");
            out.println("Cảm ơn" + name + ",your message has been submited to us.<a href='sendmail'>Quay trở lại</a>></center>");
        } catch (Exception e) {
            out.println(e);
        }
    }
}
