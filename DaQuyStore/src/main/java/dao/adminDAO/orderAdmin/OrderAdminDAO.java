package dao.adminDAO.orderAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminOrderDetail;
import model.modelAdmin.AdminOrderDetail_fixed;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class OrderAdminDAO extends AbsAdminDAO<AdminOrderDetail> {
    public static OrderAdminDAO getInstance() {
        return new OrderAdminDAO();
    }

    @Override
    public ArrayList select(AdminOrderDetail obj) throws SQLException {

        return null;
    }

    @Override
    public void add(AdminOrderDetail obj) {

    }

    @Override
    public boolean deletebyID(AdminOrderDetail obj, int id) throws SQLException {
        String sql = "Update  orders set status_deleted='đã xóa' where status_deleted='chưa xóa' and id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        int rows = pr.executeUpdate();
        if (rows >= 1) {
            return true;
        } else {
            return false;
        }
    }


//    @Override
//    public void filter(AdminOrderDetail obj) throws SQLException {
//        String sql = "Select ... from order_details where created_at=?";
//        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
//        pr.setString(1, "");
//        ResultSet rs = pr.executeQuery();
//        while (rs.next()) {
//
//        }
//
//    }

    public ArrayList findbyName(AdminOrderDetail obj, String input) throws SQLException {
        String sql = "Select quantity_total,total_price from order_details where name=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, input);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {

        }
        pr.close();
        rs.close();
        return null;
    }

    @Override
    public ArrayList<AdminOrderDetail> callSelect(AdminOrderDetail obj) throws SQLException {
        return null;
    }

    @Override
    public void callAdd(AdminOrderDetail obj) throws SQLException {

    }

    @Override
    public boolean callDelete(AdminOrderDetail obj, int id) throws SQLException {
        super.deletebyID(obj, id);
        return false;
    }

    @Override
    public void callFilter(AdminOrderDetail obj) throws SQLException {

    }

    @Override
    public ArrayList callSearch(AdminOrderDetail obj, String name) throws SQLException {
        return null;
    }


    public ArrayList<AdminOrderDetail_fixed> selectByStatusWaiting() throws SQLException {
        ArrayList<AdminOrderDetail_fixed> list = new ArrayList<>();
        //lấy tạm dữ liệu là đang giao
        String sql = "select orders.id,orders.created_at,orders.total_price,orders.status,orders.user_id,orders.statusPayment,orders.typeShip,orders.address,orders.TypePayment,orders.note,products.product_name from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where orders.status='chờ xác nhận'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail_fixed adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail=new AdminOrderDetail_fixed();
            adminOrderDetail.setId(rs.getInt("orders.id"));
            adminOrderDetail.setCreated_at(rs.getTimestamp("orders.created_at"));
            adminOrderDetail.setPrice(rs.getFloat("orders.total_price"));
            adminOrderDetail.setStatus(rs.getString("orders.status"));
            adminOrderDetail.setUser_id(rs.getInt("orders.user_id"));
            adminOrderDetail.setStatus_payment(rs.getString("orders.statusPayment"));
            adminOrderDetail.setTypeShip(rs.getString("orders.typeShip"));
            adminOrderDetail.setAddress(rs.getString("orders.address"));
            adminOrderDetail.setTypePayment(rs.getString("orders.TypePayment"));
            adminOrderDetail.setNote(rs.getString("orders.note"));
            adminOrderDetail.setProduct_name(rs.getString("products.product_name"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail_fixed> selectByStatusGiving() throws SQLException {
        ArrayList<AdminOrderDetail_fixed> list = new ArrayList<>();
        String sql = "select orders.id,orders.created_at,orders.total_price,orders.status,orders.user_id,orders.statusPayment,orders.typeShip,orders.address,orders.TypePayment,orders.note,products.product_name from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where orders.status='đang giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail_fixed adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail=new AdminOrderDetail_fixed();
            adminOrderDetail.setId(rs.getInt("orders.id"));
            adminOrderDetail.setCreated_at(rs.getTimestamp("orders.created_at"));
            adminOrderDetail.setPrice(rs.getFloat("orders.total_price"));
            adminOrderDetail.setStatus(rs.getString("orders.status"));
            adminOrderDetail.setUser_id(rs.getInt("orders.user_id"));
            adminOrderDetail.setStatus_payment(rs.getString("orders.statusPayment"));
            adminOrderDetail.setTypeShip(rs.getString("orders.typeShip"));
            adminOrderDetail.setAddress(rs.getString("orders.address"));
            adminOrderDetail.setTypePayment(rs.getString("orders.TypePayment"));
            adminOrderDetail.setNote(rs.getString("orders.note"));
            adminOrderDetail.setProduct_name(rs.getString("products.product_name"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail_fixed> selectByStatusForWaitingGiving() throws SQLException {
        ArrayList<AdminOrderDetail_fixed> list = new ArrayList<>();
        String sql = "select orders.id,orders.created_at,orders.total_price,orders.status,orders.user_id,orders.statusPayment,orders.typeShip,orders.address,orders.TypePayment,orders.note,products.product_name from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where orders.status='chờ giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail_fixed adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail=new AdminOrderDetail_fixed();
            adminOrderDetail.setId(rs.getInt("orders.id"));
            adminOrderDetail.setCreated_at(rs.getTimestamp("orders.created_at"));
            adminOrderDetail.setPrice(rs.getFloat("orders.total_price"));
            adminOrderDetail.setStatus(rs.getString("orders.status"));
            adminOrderDetail.setUser_id(rs.getInt("orders.user_id"));
            adminOrderDetail.setStatus_payment(rs.getString("orders.statusPayment"));
            adminOrderDetail.setTypeShip(rs.getString("orders.typeShip"));
            adminOrderDetail.setAddress(rs.getString("orders.address"));
            adminOrderDetail.setTypePayment(rs.getString("orders.TypePayment"));
            adminOrderDetail.setNote(rs.getString("orders.note"));
            adminOrderDetail.setProduct_name(rs.getString("products.product_name"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail_fixed> selectByStatusGived() throws SQLException {
        ArrayList<AdminOrderDetail_fixed> list = new ArrayList<>();
        String sql = " select orders.id,orders.created_at,orders.total_price,orders.status,orders.user_id,orders.statusPayment,orders.typeShip,orders.address,orders.TypePayment,orders.note,products.product_name from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where orders.status='đã giao'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail_fixed adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail=new AdminOrderDetail_fixed();
            adminOrderDetail.setId(rs.getInt("orders.id"));
            adminOrderDetail.setCreated_at(rs.getTimestamp("orders.created_at"));
            adminOrderDetail.setPrice(rs.getFloat("orders.total_price"));
            adminOrderDetail.setStatus(rs.getString("orders.status"));
            adminOrderDetail.setUser_id(rs.getInt("orders.user_id"));
            adminOrderDetail.setStatus_payment(rs.getString("orders.statusPayment"));
            adminOrderDetail.setTypeShip(rs.getString("orders.typeShip"));
            adminOrderDetail.setAddress(rs.getString("orders.address"));
            adminOrderDetail.setTypePayment(rs.getString("orders.TypePayment"));
            adminOrderDetail.setNote(rs.getString("orders.note"));
            adminOrderDetail.setProduct_name(rs.getString("products.product_name"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public ArrayList<AdminOrderDetail_fixed> selectByStatusCanceled() throws SQLException {
        ArrayList<AdminOrderDetail_fixed> list = new ArrayList<>();
        String sql = "select orders.id,orders.created_at,orders.total_price,orders.status,orders.user_id,orders.statusPayment,orders.typeShip,orders.address,orders.TypePayment,orders.note,products.product_name from orders join order_details on orders.id=order_details.order_id join products on products.id=order_details.product_id where orders.status='hủy'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminOrderDetail_fixed adminOrderDetail = null;
        while (rs.next()) {
            adminOrderDetail=new AdminOrderDetail_fixed();
            adminOrderDetail.setId(rs.getInt("orders.id"));
            adminOrderDetail.setCreated_at(rs.getTimestamp("orders.created_at"));
            adminOrderDetail.setPrice(rs.getFloat("orders.total_price"));
            adminOrderDetail.setStatus(rs.getString("orders.status"));
            adminOrderDetail.setUser_id(rs.getInt("orders.user_id"));
            adminOrderDetail.setStatus_payment(rs.getString("orders.statusPayment"));
            adminOrderDetail.setTypeShip(rs.getString("orders.typeShip"));
            adminOrderDetail.setAddress(rs.getString("orders.address"));
            adminOrderDetail.setTypePayment(rs.getString("orders.TypePayment"));
            adminOrderDetail.setNote(rs.getString("orders.note"));
            adminOrderDetail.setProduct_name(rs.getString("products.product_name"));
            list.add(adminOrderDetail);
        }
        return list;
    }

    public void updateStatusOrder(int id, String selected_status) throws SQLException {
        String sql = "Update orders set status=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, selected_status);
        pr.setInt(2, id);
        pr.executeUpdate();

    }

    public String getCurrentStatusOrder(int id) throws SQLException {
        String sql = "Select status from orders where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        String status = "";
        while (rs.next()) {
            status = rs.getString("status");
        }
        return status;
    }

    /*
    thêm hàm ghi log cho chức năng xóa,truy vấn,cập nhật trạng thái
     */
    public void addLogInformForSelect(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.INFORM.toString());
        ps.executeUpdate();
    }

    public void addLogDangerForDelete(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.DANGER.toString());
        ps.executeUpdate();
    }

    public void addLogWarningForUpdate(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.WARNING.toString());
        ps.executeUpdate();
    }

    public int getMaxID() throws SQLException {
        String sql = "Select max(id) from log";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(OrderAdminDAO.getInstance().selectByStatusWaiting().size());
    }
}
