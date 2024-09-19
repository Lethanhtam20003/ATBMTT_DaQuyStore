package controller;

import model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ArrayList<Cart> cartList = new ArrayList<>();

            int id = Integer.parseInt(request.getParameter("id"));
            Cart cart = new Cart();
            cart.setId(id);
            cart.setQuantity(1);

            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

            if (cart_list == null) {
                cartList.add(cart);
                session.setAttribute("cart-list", cartList);
                if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                    out.print("{\"status\":\"success\"}");
                } else {
                    response.sendRedirect("category.jsp");
                }
            } else {
                cartList = cart_list;
                boolean exist = false;

                for (Cart c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                            out.print("{\"status\":\"exists\"}");
                        } else {
                            out.println("<h3 style='color:crimson; text-align:center'>Item already exists in Cart.<a href='shoppingcart.jsp'>Go to Cart page</a></h3>");
                        }
                        break;
                    }
                }
                if (!exist) {
                    cartList.add(cart);
                    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                        out.print("{\"status\":\"success\"}");
                    } else {
                        response.sendRedirect("category.jsp");
                    }
                }
            }
        }
    }
}