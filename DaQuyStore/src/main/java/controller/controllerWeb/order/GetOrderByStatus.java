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
import java.util.Comparator;
import java.util.Map;

@WebServlet("/getOrderByStatus")
public class GetOrderByStatus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String data = req.getParameter("data");
        System.out.println(data);
        User user = (User) req.getSession().getAttribute("user");
//        Chờ xác nhận Đang chờ giao Đang giao Đã giao Hủy
        String status = "";
//        nav-returnProduct
        switch (data) {
            case "nav-waitingPay":
                status = "Chờ xác nhận";
                break;
            case "nav-transport":
                status = "chờ giao";
                break;
            case "nav-noPayment":
                status= "chưa thanh toán";
                break;
            case "nav-paymentWas":
                status = "đã thanh toán";
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
        ArrayList<Order> orders = null;
        try {
            orders = OrderDao.getInstance().selectOrderByidUser(user.getId(), status);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        orders.sort(new Comparator<Order>() {
            @Override
            public int compare(Order o1, Order o2) {
                return o2.getId()-o1.getId();
            }
        });

        StringBuilder stringBuilder = new StringBuilder();
        for (Order o : orders) {
            stringBuilder.append("<div class=\"product my-3 mt-4 border-top\">");
            stringBuilder.append("<div class=\"text-end border-bottom m-3 d-flex justify-content-between\">");
            stringBuilder.append("<span><STRONG>id Đơn hàng:</STRONG>" + o.getId() + "</span>");
            stringBuilder.append("<span><strong>Tình Trạng đơn hàng:</strong> " + o.getStatus() + "</span>");
            stringBuilder.append("<span>Đơn hàng: " + o.getStatusPayment() + "</span>");
            stringBuilder.append("</div>");

            for (Map.Entry<Product, Integer> en : o.getProducts().entrySet()) {
                stringBuilder.append("<div class=\"row product \">");
                stringBuilder.append("<div class=\"col-2 mx-auto \">");
                stringBuilder.append("<img class=\" \" src=\"" + en.getKey().getImg_main() + "\" alt=\"\" style=\"height: 100px; width: 100px;\">");
                stringBuilder.append("</div>");
                stringBuilder.append("<div class=\"col-7 my-3\">");
                stringBuilder.append("<p class=\"mb-3\"><Strong>" + en.getKey().getName() + "</Strong></p>");
                stringBuilder.append("<span class=\"align-text-bottom\">");
                stringBuilder.append("<p class=\"\">số lượng: " + en.getValue() + "</p>");
                stringBuilder.append("</span>");
                stringBuilder.append("</div>");
                stringBuilder.append("<p class=\"col-2 text-end mx-auto \">" + OrderService.getInstance().formatNumber(en.getKey().getPrice() * en.getValue()) + "</p>");
                stringBuilder.append("<p class=\"border w-75 mx-auto fw-bold\"></p>");
                stringBuilder.append("</div>");
            }

            stringBuilder.append("<div class=\"d-flex justify-content-between\">");
            stringBuilder.append("<p class=\"text-end mx-4\"><Strong> Thành tiền:</Strong> " + OrderService.getInstance().formatNumber(o.getTotal_price()) + "</p>");
            stringBuilder.append(" <form action=\"../../../showPayment\" method=\"post\">");
            stringBuilder.append("<input type=\"hidden\" name=\"orderID\" value=\""+o.getId()+"\">");
            stringBuilder.append(" <button type=\"submit\" class=\"btn btn-info\">Xem trang thanh toán</button>");
            stringBuilder.append("</form>");
            stringBuilder.append("</div>");
            stringBuilder.append("</div>");
        }


        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(stringBuilder.toString());
        out.flush();
    }

    public static void main(String[] args) {
        String data = "ruby";
        ArrayList<Order> orders;
        try {
            orders = OrderDao.getInstance().selectOrderByidUser(27+"","Chờ xác nhận");
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
                    if(product.getName().toLowerCase().contains(data)){
                        res.add(order);
                        break;
                    }
                }
            }
        }
        System.out.println(res.toString());
    }

}

