package service.manageAdmin.manageOrder;

import dao.adminDAO.orderAdmin.OrderAdminDAO;
import model.modelAdmin.AdminOrderDetail;

import java.sql.SQLException;

public class DeleteOrderService {
    public boolean deleteOrder(int id) throws SQLException {
        OrderAdminDAO orderAdminDAO = new OrderAdminDAO();
        AdminOrderDetail orderDetail = new AdminOrderDetail();
        if (orderAdminDAO.deletebyID(orderDetail,id)) {
            return true;
        }
        return false;
    }
}
