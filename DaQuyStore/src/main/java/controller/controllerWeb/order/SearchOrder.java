package controller.controllerWeb.order;

import dao.userDAO.OrderDao;
import model.Order;
import model.Product;
import model.User;
import service.manageUser.order.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet("/searchOrder")
public class SearchOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String data = req.getParameter("data");
        String tapId = req.getParameter("tapId");
        String status ="";
        switch (tapId) {
            case "nav-waitingPay":
                status = "Chờ xác nhận";
                break;
            case "nav-transport":
                status = "Đang chờ giao";
                break;
            case "nav-waitingForDelivery":
                status = "Đang giao";
                break;
            case "nav-done":
                status = "Đã giao";
                break;
            case "nav-cancelled":
                status = "Hủy";
                break;
            case "nav-returnProduct":
                status="Hoàn trả";
                break;
        }
        ArrayList<Order> orders;
        try {
            orders = OrderDao.getInstance().selectOrderByidUser(((User) req.getSession().getAttribute("user")).getId(), status);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Order> res = new ArrayList<>();
        for (Order order : orders){
//        data is  orderId
            if((order.getId()+"").equals(data)){
                res.add(order);
            }else {
                for(Map.Entry<Product,Integer> entry : order.getProducts().entrySet()){
                    Product product = entry.getKey();
                    if(removeAccents(product.getName().toLowerCase()).contains(removeAccents(data))){
                        res.add(order);
                        break;
                    }
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        if(res.size()>0){
            for(Order o : res){
                sb.append("<div class=\"product my-3 mt-4 border-top\">");
                sb.append("<div class=\"text-end border-bottom m-3 d-flex justify-content-between\">");
                sb.append("<span><STRONG>id Đơn hàng:</STRONG>" + o.getId() + "</span>");
                sb.append("<span><strong>Tình Trạng đơn hàng:</strong> " + o.getStatus() + "</span>");
                sb.append("<span>Đơn hàng " + o.getStatusPayment() + "</span>");
                sb.append("</div>");

                for (Map.Entry<Product, Integer> en : o.getProducts().entrySet()) {
                    sb.append("<div class=\"row product \">");
                    sb.append("<div class=\"col-2 mx-auto \">");
                    sb.append("<img class=\" \" src=\"" + en.getKey().getImg_main() + "\" alt=\"\" style=\"height: 100px; width: 100px;\">");
                    sb.append("</div>");
                    sb.append("<div class=\"col-7 my-3\">");
                    sb.append("<p class=\"mb-3\"><Strong>" + en.getKey().getName() + "</Strong></p>");
                    sb.append("<span class=\"align-text-bottom\">");
                    sb.append("<p class=\"\">số lượng: " + en.getValue() + "</p>");
                    sb.append("</span>");
                    sb.append("</div>");
                    sb.append("<p class=\"col-2 text-end mx-auto \">" + OrderService.getInstance().formatNumber(en.getKey().getPrice() * en.getValue()) + "</p>");
                    sb.append("<p class=\"border w-75 mx-auto fw-bold\"></p>");
                    sb.append("</div>");
                }

                sb.append("<div class=\"\">");
                sb.append("<p class=\"text-end mx-4\"><Strong> Thành tiền:</Strong> " + OrderService.getInstance().formatNumber(o.getTotal_price()) + "</p>");
                sb.append("</div>");
                sb.append("</div>");

            }
        }else{
            sb.append("<p>Khong tìm thấy nào sản phẩm </p>");
        }

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(sb.toString());
        out.flush();


    }
    public static String removeAccents(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(normalized).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d");
    }
}
