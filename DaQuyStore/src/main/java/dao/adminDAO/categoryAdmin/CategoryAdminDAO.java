package dao.adminDAO.categoryAdmin;

import connector.DAOConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryAdminDAO {
    public static CategoryAdminDAO getInstance() {
        return new CategoryAdminDAO();
    }

    public int getProductType(String product_type) throws SQLException {
        String sql = "Select categories.id from categories where category_name=?";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setString(1, product_type);
        ResultSet rs = pr.executeQuery();
        int product_type_id = 0;
        while (rs.next()) {
            product_type_id = rs.getInt("categories.id");
        }
        return product_type_id;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(CategoryAdminDAO.getInstance().getProductType("Aquamarine"));
    }
}
