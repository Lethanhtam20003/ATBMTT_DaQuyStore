package service.manageUser.registerAndLogin;

import dao.userDAO.UserDAO;
import model.User;

import java.sql.SQLException;

public class ChangePasswordService {
    public boolean updatePassword(String username, String newpassword,String action,String ipAddress) throws SQLException {
        UserDAO userDAO=UserDAO.getInstance();
        User u = userDAO.selectByName(username, action,ipAddress);
        u.setPassword(newpassword);
        if(userDAO.update(u,action,ipAddress)){
            return true;
        }else{
            return false;
        }
    }
}
