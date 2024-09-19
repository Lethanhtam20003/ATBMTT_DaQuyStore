package controller.controllerWeb.payment;

import dao.userDAO.OrderDao;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/showPayment")
public class ShowPayment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String orderID = req.getParameter("orderID");
        Order order;
        try {
            order = OrderDao.getInstance().selectById(orderID,"","");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("totalPrice",order.getTotal_price());
        session.setAttribute("order", order);
        req.getRequestDispatcher("views/web/payment/payment.jsp").forward(req, resp);
    }
}
