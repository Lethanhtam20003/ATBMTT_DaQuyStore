package service.manageAdmin.manageUser;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dao.adminDAO.AbsAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminUser;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class GetUserService extends HttpServlet {
    public void getUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        AbsAdminDAO<AdminUser> usersAbsAdminDAO= UserAdminDAO.getInstance();
        AdminUser adminUser =new AdminUser();
        try {
            Gson gson=new Gson();
            String jsonElements=gson.toJson(usersAbsAdminDAO.callSelect(adminUser));
            JsonArray jsonArray=gson.fromJson(jsonElements, JsonArray.class);
            response.getWriter().println(jsonArray);
//            for(JsonElement element:jsonArray){
////
////            JsonObject jsonObject= element.getAsJsonObject();
////            jsonObject.get("name").getAsString();
//            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
