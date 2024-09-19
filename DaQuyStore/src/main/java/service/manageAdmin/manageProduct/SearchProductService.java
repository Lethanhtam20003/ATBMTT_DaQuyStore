package service.manageAdmin.manageProduct;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.modelAdmin.AdminProduct;

import java.sql.SQLException;
import java.util.ArrayList;

public class SearchProductService {
    public JsonArray getJSONResult( String name) throws SQLException {
        AdminProduct adminProduct =new AdminProduct();
     ArrayList<AdminProduct> list= ProductAdminDAO.getInstance().callSearch(adminProduct,name);
        Gson gson=new Gson();
        String listjson=gson.toJson(list);
        JsonObject jsonObject= JsonParser.parseString(listjson).getAsJsonObject();
        JsonArray jsonArray=jsonObject.getAsJsonArray();
        return jsonArray;
    }
}
