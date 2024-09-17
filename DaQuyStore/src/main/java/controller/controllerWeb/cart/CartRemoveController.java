package controller.controllerWeb.cart;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/removeproduct")
public class CartRemoveController extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String productImage = request.getParameter("img");
//        String productName = request.getParameter("name");
//        int productPrice = Integer.parseInt(request.getParameter("price"));
//        int id = Integer.parseInt(request.getParameter("id"));
//        HttpSession session = request.getSession();
//        ProductService productService = new ProductService();
//        if (session != null) {
//            try {
//                Product product = new Product(productService.getProductid(productName), productName, productPrice, productService.getProductImg(productName));
//                CartService.removeProduct(product);
//                session.setAttribute("list", Cart.products);
//                request.getRequestDispatcher("/views/web/cart/cart.jsp").forward(request, response);
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//
//        }
//    }
}
