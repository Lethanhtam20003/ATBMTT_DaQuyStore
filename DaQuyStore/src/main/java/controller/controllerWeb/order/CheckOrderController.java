package controller.controllerWeb.order;

import dao.userDAO.LocalDao;
import dao.userDAO.OrderDao;
import dao.userDAO.UserDAO;
import model.Order;
import model.Product;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet("/checkOut")
public class CheckOrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        Map<Product,Integer> listOrder = new HashMap<>();
        if(session.getAttribute("listOrder") != null) {
            listOrder = (HashMap<Product,Integer>) session.getAttribute("listOrder");
        }else{
            // TODO tro loi
        }
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        // lay thong tin
        String gender = req.getParameter("gender")!=null?req.getParameter("gender"):"";
        String full_name = req.getParameter("nameCustommer");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNumber");

        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String wards = req.getParameter("wards");
        String address = req.getParameter("address");

        String note = req.getParameter("note");
        String note2 = req.getParameter("note2");
        String accept_nhantaicuahang= req.getParameter("accept_nhantaicuahang");

        // update user
        if(user==null){
            System.out.println("user is null");
            req.getRequestDispatcher("views/user/login.jsp").forward(req, resp);
            return;
        }else{
//            da dang nhap va thay doi thong tin
            int count =0;
            // email
            if(!user.getEmail().equals(email)){
                count++;
            }
            // fuul name
            if(user.getFullName() == null){
                count++;
                user.setFullName(full_name);
            }else if(!user.getFullName().equalsIgnoreCase(full_name)){
                count++;
                user.setFullName(full_name);
            }
            // phone
            if(user.getPhoneNumber()== null){
                count++;
                user.setPhoneNumber(phone);
            }else  if(!user.getPhoneNumber().equals(phone)){
                count++;
                user.setPhoneNumber(phone);
            }
            // gender
            if(!gender.equalsIgnoreCase("")){
                if(user.getGender() == null){
                    count++;
                    user.setGender(gender);
                }else if(!user.getGender().equalsIgnoreCase(gender)){
                    count++;
                    user.setGender(gender);
                }
            }
//             thay doi thong tin
            if(count>0){
                UserDAO.getInstance().update(user,"thay doi user",req.getRemoteAddr());
            }

        }
//      tao order
        String addressMain = "";
        try {
            addressMain = LocalDao.getInstance().getAddress(address,wards,district,city);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Order order = new Order(user ,listOrder,"chờ xác nhận");
        /**
         *  phan biet loai nhan hang
         *  - nhan hang tai cua hang
         *  - nhan hang qua ship do
         */
        if(accept_nhantaicuahang != null){
//        nhan tai cua hang
            order.setTypeShip("Nhận tại của hàng");
            order.setStatusPayment("chưa thanh toán");
            if(note2!=null)order.setNote(note2);
        }else{
//            nhan qua shiper
            if(addressMain!=null){
                order.setAddress(addressMain);
            }else{
//                TODO trang error
            }
            order.setTypeShip("giao hàng");
            order.setStatusPayment("chưa thanh toán");
            if(note!=null)order.setNote(note);
        }
        int orderID = -1;
        // thanh toan
        try {
             orderID  = OrderDao.getInstance().insertAndGetOrderID(order,"tao don hang",req.getRemoteAddr());
        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
        if (orderID== -1){
            resp.sendRedirect("home");
            return;
        }
        order.setId(orderID);
        req.setAttribute("totalPrice",order.getTotal_price());
        session.setAttribute("order", order);
//        xoa danh sach san pham cua order
        if(session.getAttribute("listOrder") != null) {
            session.removeAttribute("listOrder");
        }
        req.getRequestDispatcher("views/web/payment/payment.jsp").forward(req, resp);
    }

}

