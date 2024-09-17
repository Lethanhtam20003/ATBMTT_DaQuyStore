package controller.controllerWeb.product;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.userDAO.OrderDao;
import dao.userDAO.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/checkQuanlityProduct")
public class CheckQuanlityProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num = Integer.parseInt(req.getParameter("numProduct"));
        int id = Integer.parseInt(req.getParameter("productID"));
        String notification = "";
        int tyte = 0;
        try {
            tyte =  ProductDao.getInstance().checkQualityProduct(id);
            if(tyte >= num) {
              notification = "ok";
            }else if(tyte <= 0) {
                notification = "Sản phẩm đã hết hàng";
            }else {
               notification ="Số lượng Sản phẩm khong đủ, Vui lòng giảm số lượng ";
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Gson gson = new Gson();
        JsonObject jsonObject = new JsonObject();
        System.out.println(notification + "dang chay; " + id +"sl"+ num + "type"+ tyte);
        if(!notification.equals("")){
            jsonObject.addProperty("notification",notification);
            jsonObject.addProperty("num",tyte);
            String json = gson.toJson(jsonObject);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");

            PrintWriter out = resp.getWriter();
            out.println(json);
            out.flush();
        }
    }
}
