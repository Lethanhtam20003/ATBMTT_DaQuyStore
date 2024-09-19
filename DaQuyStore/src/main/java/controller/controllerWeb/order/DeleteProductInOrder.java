package controller.controllerWeb.order;


import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;

@WebServlet("/deleteProductInOrder")
public class DeleteProductInOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<Product, Integer> listOrder = (Map<Product, Integer>) session.getAttribute("listOrder");

        StringBuilder stringBuilder =  new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader( req.getInputStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        String idProduct = stringBuilder.toString();
        Product p = null;
        for(Map.Entry<Product, Integer> entry : listOrder.entrySet()) {
            if((entry.getKey().getId()+"").equals(idProduct)) {
                p = entry.getKey();
            }
        }
        if(p != null) {
            listOrder.remove(p);
        }
        System.out.println("da xoa san pham "+ idProduct);


    }
}
