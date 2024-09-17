package controller;

import connector.DAOConnection;
import dao.userDAO.ProductDao;
import model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/QuantityInDeCre")
public class QuantityInDeCreController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

        int newQuantity = 0;
        double total = 0;

        if (cart_list != null) {
            for (Cart c : cart_list) {
                if (c.getId() == id) {
                    if ("inc".equals(action)) {
                        c.setQuantity(c.getQuantity() + 1);
                    } else if ("dec".equals(action) && c.getQuantity() > 1) {
                        c.setQuantity(c.getQuantity() - 1);
                    }
                    newQuantity = c.getQuantity();
                    break;
                }
            }

            ProductDao dao;
            try {
                dao = new ProductDao(DAOConnection.getConnection());
                total = dao.getTotalCartPrice(cart_list);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        PrintWriter out = response.getWriter();
        out.print("{\"newQuantity\": " + newQuantity + ", \"newTotal\": " + total + "}");
        out.flush();
    }

}

