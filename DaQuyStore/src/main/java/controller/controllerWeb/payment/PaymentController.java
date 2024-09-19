package controller.controllerWeb.payment;

import com.google.gson.Gson;
import dao.userDAO.OrderDao;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");
        if(order == null) {
            resp.sendRedirect("home");
            return;
        }
        String typePayment = req.getParameter("typePayment");
        if(typePayment == null) {
            resp.sendRedirect("home");
            return;
        }
        order.setTypePayment(typePayment);
        order.setStatusPayment("đã thanh toán");
        try {
            OrderDao.getInstance().updatePayment(order,"thanh toan",req.getRemoteAddr());
            resp.sendRedirect("home");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
