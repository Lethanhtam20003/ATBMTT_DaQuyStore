package dao;

import connector.DAOConnection;
import model.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CategoryDao {
    private static CategoryDao instance ;
    public CategoryDao() {}
    public static CategoryDao getInstance() {
        if(instance == null) {
            instance = new CategoryDao();
        }
        return instance;
    }
    private int id ;
    private String category_name;
    private Date create_at;
    private Date update_at;
    private Date delete_at;
    private String status;
    private String img;

    public List<Category> listCategory()  {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM categories;\n";
            PreparedStatement ps = DAOConnection.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                category_name = rs.getString("category_name");
                create_at = rs.getDate("created_at");
                update_at = rs.getDate("updated_at");
                delete_at = rs.getDate("deleted_at");
                status = rs.getString("status");
                img = rs.getString("img_link");

                Category c = new Category(id, category_name, create_at, update_at, delete_at, status, img);
                list.add(c);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;

    }

    public static void main(String[] args) throws SQLException {
        CategoryDao dao = new CategoryDao();
        List<Category> list = dao.listCategory();
            for(Category c : list){
                System.out.println(c);
            }
    }

}
