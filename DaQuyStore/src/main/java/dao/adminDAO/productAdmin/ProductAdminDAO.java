package dao.adminDAO.productAdmin;

import connector.DAOConnection;
import dao.adminDAO.AbsAdminDAO;
import dao.adminDAO.categoryAdmin.CategoryAdminDAO;
import dao.adminDAO.inventoryAdmin.InventoryAdminDAO;
import dao.adminDAO.orderAdmin.OrderAdminDAO;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminProduct;
import model.modelAdmin.AdminProduct_fixed;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class ProductAdminDAO extends AbsAdminDAO<AdminProduct> {

    @Override
    public boolean deletebyID(AdminProduct obj, int id) throws SQLException {
        String sql = "Update products set status_deleted='đã xóa' where status_deleted='chưa xóa' and id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        int rows = pr.executeUpdate();
        pr.close();
        if (rows >= 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public ArrayList search(AdminProduct obj, String name) throws SQLException {
        return super.search(obj, name);
    }

    public static ProductAdminDAO getInstance() {
        return new ProductAdminDAO();
    }

    @Override
    public ArrayList callSelect(AdminProduct obj) throws SQLException {
        ArrayList<AdminProduct> products = super.select(obj);
        return products;
    }

    @Override
    public void callAdd(AdminProduct obj) throws SQLException {

    }

    @Override
    public boolean callDelete(AdminProduct obj, int id) throws SQLException {
        return super.deletebyID(obj, id);
    }


    @Override
    public void callFilter(AdminProduct obj) throws SQLException {

    }

    @Override
    public ArrayList callSearch(AdminProduct obj, String name) throws SQLException {
        return null;
    }

    public AdminProduct selectByID(int id) throws SQLException {
        String sql = "Select id,product_name,price,status,sale,hot from products where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        AdminProduct adminProduct = null;
        while (rs.next()) {
            adminProduct = new AdminProduct(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
        }
        pr.close();
        rs.close();
        return adminProduct;
    }

    @Override
    public ArrayList select(AdminProduct obj) throws SQLException {
        ArrayList<AdminProduct_fixed> products = new ArrayList<>();
        String sql = "Select products.id,categories.category_name,products.product_name,products.price,products.status,products.sale,products.hot from products join categories on products.category_id=categories.id where products.status_deleted='chưa xóa' order by id asc ";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            AdminProduct_fixed adminProductFixed=new AdminProduct_fixed();
            adminProductFixed.setId(rs.getInt("products.id"));
            adminProductFixed.setCategory(rs.getString("categories.category_name"));
            adminProductFixed.setProduct_name(rs.getString("products.product_name"));
            adminProductFixed.setPrice(rs.getInt("products.price"));
            adminProductFixed.setStatus(rs.getString("products.status"));
            adminProductFixed.setSale(rs.getInt("products.sale"));
            adminProductFixed.setHot(rs.getInt("products.hot"));
            products.add(adminProductFixed);
        }
        rs.close();
        pr.close();
        return products;
    }


    public AdminProduct getAfterValueByID(int id) throws SQLException {
        String sql = "Select id,product_name,price,status,sale,hot from products where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        AdminProduct adminProduct = null;
        while (rs.next()) {
            adminProduct = new AdminProduct(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
        }
        rs.close();
        pr.close();
        return adminProduct;
    }

    public AdminProduct getPrevValueByID(int id) throws SQLException {
        String sql = "Select id,product_name,price,status,sale,hot from products where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, id);
        ResultSet rs = pr.executeQuery();
        AdminProduct adminProduct = null;
        while (rs.next()) {
            adminProduct = new AdminProduct(rs.getInt("id"), rs.getString("product_name"), rs.getInt("price"), rs.getString("status"), rs.getInt("sale"), rs.getInt("hot"));
        }
        rs.close();
        pr.close();
        return adminProduct;
    }

    //xử lí cập nhật thông tin sản phẩm cho từng trường hợp
    public void updateProductName(String name, int id) throws SQLException {
        String sql = "Update products set product_name=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, name);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductPrice(int price, int id) throws SQLException {
        String sql = "Update products set price=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, price);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductStatus(String status, int id) throws SQLException {
        String sql = "Update products set status=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, status);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();

    }

    public void updateProductSale(int sale, int id) throws SQLException {
        String sql = "Update products set sale=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, sale);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductColor(String color, int id) throws SQLException {
        String sql = "Update products set color=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, color);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductDescription(String description, int id) throws SQLException {
        String sql = "Update products set description=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, description);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    //cập nhật thông tin về ảnh của sản phẩm
//id của ảnh bằng id của sản phẩm
    public void updateProductImageMain(String imagemain, int id) throws SQLException {
        String sql = "Update product_image set img_main=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, imagemain);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage1(String image_1, int id) throws SQLException {
        String sql = "Update product_image set img_1=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_1);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage2(String image_2, int id) throws SQLException {
        String sql = "Update product_image set img_2=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_2);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage3(String image_3, int id) throws SQLException {
        String sql = "Update product_image set img_3=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_3);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductImage4(String image_4, int id) throws SQLException {
        String sql = "Update product_image set img_4=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, image_4);
        pr.setInt(2, id);
        pr.executeUpdate();
        pr.close();
    }

    public void updateProductHot(int hot, int id) throws SQLException {
        String sql = "Update products set hot=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, hot);
        pr.setInt(2, id);
        pr.executeUpdate();
    }
    public void updateProductType(int category_id, int id) throws SQLException {
        String sql = "Update products set category_id=? where id=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, category_id);
        pr.setInt(2, id);
        pr.executeUpdate();
    }
    /*
    các hàm thêm log cho chức năng cập nhật,thêm,xóa sản phẩm,truy vấn

     */
    public void addLogWarningForUpdate(AdminLog log) throws SQLException {
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

    public void addLogALertForAdd(AdminLog log) throws SQLException {
        String sql = "insert into log values(?,?,?,?,?,?)";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ps.setInt(1, getMaxID() + 1);
        ps.setString(2, log.getIpaddress());
        ps.setString(3, log.getPrevValue());
        ps.setString(4, log.getCurrentValue());
        ps.setTimestamp(5, new Timestamp(new Date().getTime()));
        ps.setString(6, LogLevel.ALERT.toString());
        ps.executeUpdate();
    }

    public int getMaxID() throws SQLException {
        String sql = "select max(id) from log";
        PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int index = 0;
        while (rs.next()) {
            index = rs.getInt("max(id)");
        }
        return index;
    }

    public int getMaxIDProduct() throws SQLException {
        String sql = "Select max(id) from products";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int index = 0;
        while (rs.next()) {
            index = rs.getInt("max(id)");

        }
        return index;
    }

    //hàm thêm dữ liệu sản phẩm
    public void insertProduct(AdminProduct product) throws SQLException {
        String information_insert = "/color:" + product.getColor() + ";" + "weight:" + product.getWeight() + ";" + "size:" + product.getSize() + ";" + "opacity:" + product.getOpactity() + ";" + "cutting_form:" + product.getCutting_form()+"/";
        String sql = "Insert into products(id,category_id,product_name,price,status,description,information,created_at,updated_at,status_deleted) values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1,getMaxIDProduct()+1);
        pr.setInt(2, product.getId_product_type());
        pr.setString(3, product.getProduct_name());
        pr.setFloat(4,  product.getPrice());
        pr.setString(5, product.getStatus());
        pr.setString(6, product.getDescription());
        pr.setString(7, information_insert);
        pr.setTimestamp(8, new Timestamp(new Date().getTime()));
        pr.setTimestamp(9,new Timestamp(new Date().getTime()));
        pr.setString(10,"chưa xóa");
        pr.executeUpdate();
        pr.close();
    }

    public void updateCategory_ID(String productType,int id) throws SQLException {
        String sql="Update products set category_id=? where id=?";
    }
    public static void main(String[] args) throws SQLException {
        ProductAdminDAO productAdminDAO = ProductAdminDAO.getInstance();

        System.out.println(productAdminDAO.callSelect(new AdminProduct()));
    }
}
