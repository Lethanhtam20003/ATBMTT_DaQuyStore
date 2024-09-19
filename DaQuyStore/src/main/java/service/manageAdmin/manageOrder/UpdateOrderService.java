package service.manageAdmin.manageOrder;

import dao.adminDAO.orderAdmin.OrderAdminDAO;

import java.sql.SQLException;

public class UpdateOrderService {
    public void updateStatusOrder(int id, String status_order) throws SQLException {
        OrderAdminDAO orderAdminDAO = new OrderAdminDAO();
        orderAdminDAO.updateStatusOrder(id,status_order);
    }

//    public String getStatusCurrentOrder(int id) throws SQLException {
//        String status_current = OrderAdminDAO.getInstance().getCurrentStatusOrder(id);
//        return status_current;
//    }
}
