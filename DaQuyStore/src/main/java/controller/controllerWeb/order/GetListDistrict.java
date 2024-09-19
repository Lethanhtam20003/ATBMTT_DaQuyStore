package controller.controllerWeb.order;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dao.userDAO.LocalDao;
import model.local.District;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getListDistrict")
public class GetListDistrict  extends HttpServlet {
    List<District> districts;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cityCode = req.getParameter("city");
        try {
            districts = LocalDao.getInstance().getListDistrict(cityCode);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

       Gson gson = new Gson();
       String json = gson.toJson(districts);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();

    }


}
