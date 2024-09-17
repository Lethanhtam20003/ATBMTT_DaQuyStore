package dao.adminDAO.inventoryAdmin;

import connector.DAOConnection;
import model.LogLevel;
import model.modelAdmin.AdminInventoryDetailed_fixed;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class InventoryAdminDAO {
    public static InventoryAdminDAO getInstance() {
        return new InventoryAdminDAO();
    }

    public boolean deleteInventory(String productname) throws SQLException {
        String sql = "Update inventory_detail set status_deleted='đã xóa' where productname=? and status_deleted='chưa xóa'";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, productname);
        int rows = pr.executeUpdate();
        if (rows == 1) {
            return true;
        } else {
            return false;
        }
    }

    /*
    hàm thêm log cho chức năng truy vấn hiển thị số lượng
     */
    public void addLogInformForSelect(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxIDLog() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.INFORM.toString());
        ps.executeUpdate();
    }

    //xử lí số lượng còn lại sau khi mua hàng
    public int getInventoryRemain() throws SQLException {
        String sql = "Select remaining,product_name from products join inventory_detail on products.id=inventory_detail.product_id group by product_name";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected++;
        }
        return rows_affected;
    }

    /*
    hàm này dùng để lấy lên số lượng của sản phẩm
     */
    public ArrayList<AdminInventoryDetailed_fixed> getListInventoryDetail() throws SQLException {
        ArrayList<AdminInventoryDetailed_fixed> detailArrayList = new ArrayList<>();
        String sql = "SELECT p.id,p.product_name, ifnull(xuat.sl_da_ban,0) , ifnull(nhap.sl_nhap,0) FROM products p\n" +
                "left JOIN (SELECT  id.product_id as op,ifnull(SUM(id.quantity ),0)  AS sl_nhap\n" +
                "\tFROM inventories i\n" +
                "\tJOIN inventory_detail id ON i.id=id.id\n" +
                "\tGROUP BY id.product_id) AS nhap \n" +
                "\tON p.id = nhap.op\n" +
                "left JOIN (SELECT d.product_id AS sa,sum(d.quantity_total) AS sl_da_ban  \n" +
                "\tFROM orders o \n" +
                "\tJOIN order_details d ON o.id = d.order_id\n" +
                "\tGROUP BY d.product_id) AS xuat\n" +
                "\tON p.id = xuat.sa ";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            AdminInventoryDetailed_fixed admindetail = new AdminInventoryDetailed_fixed();
            admindetail.setId(rs.getInt("p.id"));
            admindetail.setProduct_name(rs.getString("p.product_name"));
            admindetail.setSell_quantity(rs.getInt("ifnull(xuat.sl_da_ban,0)"));
            admindetail.setImported_quantity(rs.getInt("ifnull(nhap.sl_nhap,0)"));
            detailArrayList.add(admindetail);
        }
        return detailArrayList;
    }

    //lấy ra ID lớn nhất từ bảng log
    public int getMaxIDLog() throws SQLException {
        String sql = "select max(id)  from log";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }

    //lấy ra ID lớn nhất từ bảng inventories
    public int getMAXIDInventories() throws SQLException {
        String sql = "select max(id) from inventories";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }

    public int getProduct_ID(String productname) throws SQLException {
        String sql = "select id from products where product_name=?";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        preparedStatement.setString(1, productname);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("id");
        }
        return rows_affected;
    }

    //lấy ra ID lớn nhất từ bảng inventory_detail
    public int getMaxIDInventory() throws SQLException {
        String sql = "select max(id)  from inventory_detail";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        int rows_affected = 0;
        while (rs.next()) {
            rows_affected = rs.getInt("max(id)");
        }
        return rows_affected;
    }

    public void insertInventoryDetail(AdminProduct adminProduct) throws SQLException {
        String sql = "Insert into inventory_detail(id,product_id,quantity,price) values(?,?,?,?)";
        PreparedStatement preparedStatement = DAOConnection.getConnection().prepareStatement(sql);
        preparedStatement.setInt(1, getMaxIDInventory() + 1);
        preparedStatement.setInt(2, adminProduct.getProduct_id());
        preparedStatement.setInt(3, adminProduct.getQuantity());
        preparedStatement.setFloat(4, adminProduct.getPrice());
        preparedStatement.executeUpdate();
    }

    public void insertInventory() throws SQLException {
        String sql = "Insert into inventories values(?,?,?)";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, getMAXIDInventories() + 1);
        pr.setTimestamp(2, new Timestamp(new Date().getTime()));
        pr.setString(3, "Admin");
        pr.executeUpdate();
    }

    public static void main(String[] args) throws SQLException {
//        InventoryAdminDAO inventoryAdminDAO = new InventoryAdminDAO();
//        System.out.println(inventoryAdminDAO.getListInventoryDetail());
//        System.out.println(inventoryAdminDAO.getMaxID());
//        System.out.println("Thêm dữ liệu thành công");
//        AdminProduct adminProduct = new AdminProduct();
//        adminProduct.setProduct_id(1);
//        adminProduct.setPrice(100000);
//        adminProduct.setQuantity(1);

//        InventoryAdminDAO.getInstance().insertInventoryDetail(adminProduct);
//        InventoryAdminDAO.getInstance().insertInventory();
        System.out.println(InventoryAdminDAO.getInstance().getListInventoryDetail().toString());
        System.out.println("Them thanh cong");
    }
}
