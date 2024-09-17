package service.manageUser.registerAndLogin;

import dao.userDAO.UserDAO;
import model.User;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class UpdateProfileService {
    public static  UpdateProfileService instance;
    public static UpdateProfileService getInstance() {
        if (instance == null) {
            instance = new UpdateProfileService();
        }
        return instance;
    }
    public static boolean update(String userName,String name, String phone, String email, String address, String gender, String birthday,String action,String ipAddress) throws SQLException {
        User user = UserDAO.getInstance().selectByName(userName,action,ipAddress);
        user.setFullName(name);
        user.setPhoneNumber(phone);
        user.setEmail(email);
        user.setAddress(address);
        user.setGender(gender);
        DateTimeFormatter dtm = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(birthday, dtm);
        user.setBirthday(Date.valueOf(date));
        return UserDAO.getInstance().update(user,action,ipAddress);
    }

    public boolean updateProfile(User user, String remoteAddr) {
        System.out.println("user:+ "+user);
        return UserDAO.getInstance().update(user,"update profile",remoteAddr);
    }
}
