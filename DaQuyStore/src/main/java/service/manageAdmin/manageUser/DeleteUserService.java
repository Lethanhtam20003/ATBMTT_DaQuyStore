package service.manageAdmin.manageUser;

import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUser;

import java.sql.SQLException;

public class DeleteUserService {
    public String deleteUser(int id) throws SQLException {
        AdminUser adminUser = new AdminUser();
        UserAdminDAO userAdminDAO = UserAdminDAO.getInstance();
        if (userAdminDAO.callDelete(adminUser, id)) {
            return "Xoa thanh cong";
        }
        return null;
    }

}
