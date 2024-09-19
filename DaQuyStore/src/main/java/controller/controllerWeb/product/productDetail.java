package controller.controllerWeb.product;

import dao.userDAO.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/productDetail")
public class productDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String id = req.getParameter("id");
        //lấy thông tin thông qua tên sản phẩm
        String id=req.getParameter("id");

        ProductDao dao = ProductDao.getInstance();
        Product p;

        try {
            p = dao.selectById(id,"get product",req.getRemoteAddr());
            System.out.println(p);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (p != null) {
            req.setAttribute("product", p);
            req.getRequestDispatcher( "views/web/product/product_details.jsp").forward(req, resp);
        }else{

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
