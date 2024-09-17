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

@WebServlet("/RemoveItemCart")
public class RemoveItemsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        int id = Integer.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (cart_list == null) {
            cart_list = new ArrayList<>();
        }else{
            cart_list.removeIf(c -> c.getId() == id);
        }

        double newTotal =0;
        int newItemCount = 0;
        for (Cart c : cart_list) {
            newTotal += c.getPrice() * c.getQuantity();
            newItemCount += c.getQuantity();
        }


        out.print("{\"newTotal\": " + newTotal + ", \"newItemCount\": " + newItemCount + "}");
        out.flush();
    }
}
