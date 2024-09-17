package controller.controllerAdmin.manageSummary;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import model.modelAdmin.AdminSummary;
import model.modelAdmin.AdminSummary_fixed;
import service.manageAdmin.manageSummary.GetSummaryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(value = "/summary")

public class ManageSummaryController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        Gson gson = new Gson();
        GetSummaryService getSummaryService = new GetSummaryService();
        try {
            ArrayList<AdminSummary_fixed> list=getSummaryService.getList();
            String json=gson.toJson(list);
            JsonArray jsonArray= JsonParser.parseString(json).getAsJsonArray();
            resp.getWriter().println(jsonArray);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}


