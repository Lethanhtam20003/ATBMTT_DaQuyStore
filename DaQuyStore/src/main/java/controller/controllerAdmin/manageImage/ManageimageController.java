package controller.controllerAdmin.manageImage;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import service.manageAdmin.manageProduct.GetImageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/getimage")
public class ManageimageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GetImageService getImageService = new GetImageService();
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        try {
            String json = gson.toJson(getImageService.getImageList());
            JsonArray jsonElements = JsonParser.parseString(json).getAsJsonArray();
            resp.setContentType("application/json");
            resp.getWriter().println(jsonElements);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
