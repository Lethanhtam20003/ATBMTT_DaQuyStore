package controller.controllerWeb.order;

import com.google.gson.Gson;
import dao.userDAO.LocalDao;
import model.local.District;
import model.local.Ward;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/getListWard")
public class GetListWard extends HttpServlet {
    List<Ward> ward;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String district = req.getParameter("district");
        try {
            ward = LocalDao.getInstance().getListWard(district);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Gson gson = new Gson();
        String json = gson.toJson(ward);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        out.flush();

    }

}
