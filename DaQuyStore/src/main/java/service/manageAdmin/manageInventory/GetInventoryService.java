package service.manageAdmin.manageInventory;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import dao.adminDAO.inventoryAdmin.InventoryAdminDAO;
import model.modelAdmin.AdminInventoryDetailed_fixed;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetInventoryService {
    public JsonArray getInventory() throws SQLException {
        Gson gson = new Gson();
        ArrayList<AdminInventoryDetailed_fixed> list = InventoryAdminDAO.getInstance().getListInventoryDetail();
        String json = gson.toJson(list);
        JsonArray jsonElements = JsonParser.parseString(json).getAsJsonArray();
        return jsonElements;
    }

    public static void main(String[] args) throws SQLException {
        GetInventoryService getInventoryService=new GetInventoryService();
        System.out.println(getInventoryService.getInventory());
    }
}
