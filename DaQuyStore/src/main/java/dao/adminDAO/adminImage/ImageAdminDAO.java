package dao.adminDAO.adminImage;

import connector.DAOConnection;
import model.modelAdmin.AdminImage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImageAdminDAO {
    public static ImageAdminDAO getInstance() {
        return new ImageAdminDAO();
    }

    public ArrayList<AdminImage> getImageList() throws SQLException {
        String sql = "Select product_image.id ,products.product_name,img_main,img_1,img_2,img_3,img_4 from product_image join products on products.id=product_image.id";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        ArrayList<AdminImage> list = new ArrayList<>();
        while (rs.next()) {
            AdminImage image = new AdminImage();
            image.setId(rs.getInt("id"));
            image.setProduct_name(rs.getString("product_name"));
            image.setImg_main(rs.getString("img_main"));
            image.setImg_1(rs.getString("img_1"));
            image.setImg_2(rs.getString("img_2"));
            image.setImg_3(rs.getString("img_3"));
            image.setImg_4(rs.getString("img_4"));
            list.add(image);
        }
        return list;
    }
    public void addImage(String img_main,String img_1,String img_2,String img_3,String img_4) throws SQLException {
        String sql="Insert into product_image(id,img_main,img_1,img_2,img_3,img_4) values(?,?,?,?,?,?)";
        PreparedStatement pr=DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1,getMaxID()+1);
        pr.setString(2,img_main);
        pr.setString(3,img_1);
        pr.setString(4,img_2);
        pr.setString(5,img_3);
        pr.setString(6,img_4);
        pr.executeUpdate();
    }
    public int getMaxID() throws SQLException {
        String sql = "select max(id) from product_image";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int maxID = 0;
        while (rs.next()) {
            maxID= rs.getInt("max(id)");
        }
        return maxID;
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(ImageAdminDAO.getInstance().getImageList());
        for(AdminImage image: ImageAdminDAO.getInstance().getImageList()) {
            System.out.println(image);
        }
    }
}
