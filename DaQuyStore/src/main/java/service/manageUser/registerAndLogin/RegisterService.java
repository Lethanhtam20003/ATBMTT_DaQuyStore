package service.manageUser.registerAndLogin;

import dao.userDAO.ActivacationCodeDao;
import dao.userDAO.UserDAO;
import model.ActivacationCode;
import model.User;
import service.manageUser.security.EncryptAndDencrypt;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;
public class RegisterService {
    private EncryptAndDencrypt encryptAndDencrypt = new EncryptAndDencrypt();
    public boolean insertUser(User user,String action,String ipAddress) throws SQLException {
        UserDAO userDAO = UserDAO.getInstance();
        return userDAO.insert(user,action,ipAddress);
    }



    public boolean checkDuplicatedEmail(String email) throws SQLException {
        UserDAO userDAO = UserDAO.getInstance();
        List<String> emails = userDAO.getListEmail();
        for (String e : emails) {
            if (e.equals(email)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkDuplicatedUsername(String username) throws SQLException {
        UserDAO userDAO = UserDAO.getInstance();
        List<String> usernames = userDAO.getListUserName();
        for (String u : usernames) {
            if (u.equals(username)) {
                return true;
            }
        }
        return false;
    }

    public String getEmailforAuth(String username) throws SQLException {
        UserDAO userDAO = UserDAO.getInstance();
//        String email = userDAO.getEmailforRegister(username);
//        return email;
        return null;
    }


    public String createActivationCode(String name,String password,String email,String action,String ipAddress) throws SQLException {
        String id = generateRandomString(10);
        ActivacationCode res = new ActivacationCode(id,name,password, email);
        ActivacationCodeDao acd = new ActivacationCodeDao();
        acd.insert(res,action,ipAddress);
        return id;
    }
    public static String generateRandomString(int length) {
        // Khai báo một mảng chứa các ký tự có thể sử dụng
        String candidateChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

        // Khởi tạo đối tượng Random
        Random random = new Random();

        // Khai báo một StringBuilder để xây dựng chuỗi ngẫu nhiên
        StringBuilder sb = new StringBuilder();
        sb.append(LocalDate.now());
        // Tạo chuỗi ngẫu nhiên bằng cách chọn ngẫu nhiên ký tự từ mảng candidateChars
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(candidateChars.length());
            char randomChar = candidateChars.charAt(index);
            sb.append(randomChar);
        }

        // Trả về chuỗi ngẫu nhiên đã được tạo
        return sb.toString();
    }
}
