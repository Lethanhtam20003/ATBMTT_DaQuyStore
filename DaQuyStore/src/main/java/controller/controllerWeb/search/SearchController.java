package controller.controllerWeb.search;

import dao.userDAO.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/search")
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int ITEM_PER_PAGE = 4;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txtSearch = req.getParameter("txtSearch");
        try {
            ArrayList<Product> list = ProductDao.getInstance().getListProductForSearch(txtSearch);
            String page = req.getParameter("page");
            if(page == null) {
                int total_product = list.size();
                int total_page = total_product / ITEM_PER_PAGE;
                //đang test trường hợp trang đầu
                ArrayList<Product> products=ProductDao.getInstance().getListProductForEachPage(txtSearch,1);
                req.setAttribute("products", products);
                req.setAttribute("total_page", total_page);
                req.setAttribute("txtSearch", txtSearch);
                req.getRequestDispatcher("/views/search.jsp").forward(req, resp);
            }else{
                int total_product = list.size();
                int total_page = total_product / ITEM_PER_PAGE;
                //đang test trường hợp trang đầu
                ArrayList<Product> products=ProductDao.getInstance().getListProductForEachPage(txtSearch,Integer.parseInt(page));
                req.setAttribute("products", products);
                req.setAttribute("total_page", total_page);
                req.setAttribute("txtSearch", txtSearch);
                req.getRequestDispatcher("/views/search.jsp").forward(req, resp);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
