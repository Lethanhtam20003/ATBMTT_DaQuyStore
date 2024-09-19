package controller;

import dao.userDAO.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.List;

@WebServlet(name = "ProductByCategory", value = "/ProductByCategory")
public class ProductByCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/text;charset=UTF-8");
//        String category = req.getParameter("index");
        int id = Integer.parseInt(req.getParameter("id"));
        String indexP = req.getParameter("indexP");
        int index;
        if (indexP!=null){
            index = Integer.parseInt(indexP);
        }else{
            index=1;
        }
        ProductDao dao = new ProductDao();
        //Phân trang
        int count = dao.getTotalProductOfCate(id);
        int endPage= count/4;
            endPage++;
        List<Product> listProductOfCate = dao.pagingCate(id,index);
        try {
            String pathInfo = req.getPathInfo(); // /{name}/{id}
            String name = null;
            name = req.getParameter("name");

            List<Product> list = null;

            list = dao.getProductByCategory(name);
            req.setAttribute("id", id);
            req.setAttribute("listA", list);
            req.setAttribute("name", name);
            req.setAttribute("listCat",listProductOfCate);
            req.setAttribute("endPage",endPage);
            req.setAttribute("status",index);
            req.getRequestDispatcher("views/web/cart/category-product.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
