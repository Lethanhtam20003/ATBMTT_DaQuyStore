package controller.controllerWeb.order;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.userDAO.LocalDao;
import model.local.City;
import org.cloudinary.json.JSONArray;

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

@WebServlet("/getListCity")
public class GetListCity extends HttpServlet {
    private static final long serialVersionUID = 1L;
    List<City> listCity;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        danh sach du lieu thanh pho
        try {
            listCity =LocalDao.getInstance().getListCity();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//      chuyen doi danh sach thanh pho thanh json
        Gson gson = new Gson();
        String json = gson.toJson(listCity);

//      gui du lieu ve
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json);
        out.flush();
    }
}
