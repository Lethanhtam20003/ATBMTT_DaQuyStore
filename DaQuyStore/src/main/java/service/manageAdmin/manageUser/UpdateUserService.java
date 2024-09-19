package service.manageAdmin.manageUser;

import dao.adminDAO.userAdmin.UserAdminDAO;

import java.sql.SQLException;

public class UpdateUserService {
    public String updateRole(int id, String selected_role) throws SQLException {
        UserAdminDAO userAdminDAO = UserAdminDAO.getInstance();
        if (userAdminDAO.updateRole(id, selected_role)) {
            return "Cap nhat thanh cong";
        }

        return null;
    }
}
