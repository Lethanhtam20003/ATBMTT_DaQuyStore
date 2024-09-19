package service.manageAdmin.manageOrder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.restfb.json.Json;
import dao.adminDAO.orderAdmin.OrderAdminDAO;
import model.modelAdmin.AdminOrderDetail;
import model.modelAdmin.AdminOrderDetail_fixed;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetOrderService {
    public JsonArray getAsJsonArrayStatusWaiting() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail_fixed> list = orderAdminDAO.selectByStatusWaiting();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }


    public JsonArray getAsJsonArrayStatusGiving() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail_fixed> list = orderAdminDAO.selectByStatusGiving();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }

    public JsonArray getAsJsonArrayStatusForWaitingGiving() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail_fixed> list = orderAdminDAO.selectByStatusForWaitingGiving();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }

    public JsonArray getAsJsonArrayStatusGived() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail_fixed> list = orderAdminDAO.selectByStatusGived();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }

    public JsonArray getAsJsonArrayStatusCanceled() throws SQLException {
        OrderAdminDAO orderAdminDAO = OrderAdminDAO.getInstance();
        ArrayList<AdminOrderDetail_fixed> list = orderAdminDAO.selectByStatusCanceled();
        Gson gson = new Gson();
        String resultjson = gson.toJson(list);
        JsonArray jsonArray = JsonParser.parseString(resultjson).getAsJsonArray();
        return jsonArray;
    }
}
