package controller;

import dao.CategoryDao;
import dao.userDAO.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Category")
public class CateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("html/css;charset=UTF8");

        String indexPage = req.getParameter("index");
        int index;
        if (indexPage==null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }

        //Hiển thị category
        CategoryDao daCa = new CategoryDao();
        List<model.Category> listCate = null;
        listCate = daCa.listCategory();

        //Phân trang
        ProductDao dao = new ProductDao();
        int count = dao.getTotalProduct();
        int endPage = count/8;
        if(count %8 !=0){
            endPage++;

        }
        List<Product> listP = dao.pagingProduct(index);

        req.setAttribute("listP",listP);
        req.setAttribute("cate",listCate);
        req.setAttribute("endP",endPage);
        req.setAttribute("tag",index);
        req.getRequestDispatcher("views/web/cart/category.jsp").forward(req,resp);
    }
}
