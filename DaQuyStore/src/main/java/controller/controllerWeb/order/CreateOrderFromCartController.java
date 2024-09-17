package controller.controllerWeb.order;

import dao.userDAO.ProductDao;
import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/createOrderFromCart")
public class CreateOrderFromCartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<Product, Integer> order = new HashMap<Product, Integer>();

        List<Cart> cartList = (List<Cart>) session.getAttribute("cart-list");
        for (Cart cart : cartList) {
            Product p = null;
            try {
                p = ProductDao.getInstance().selectById(cart.getId()+"","","");
            }catch (Exception e) {
                e.printStackTrace();
            }
            order.put(p,cart.getQuantity());
        }
        session.setAttribute("listOrder", order);
        req.getRequestDispatcher( "views/web/order/order.jsp").forward(req, resp);
    }
}
