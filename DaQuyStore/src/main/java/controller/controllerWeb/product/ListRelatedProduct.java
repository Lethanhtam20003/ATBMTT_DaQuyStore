package controller.controllerWeb.product;

import dao.userDAO.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/relatedProduct")
public class ListRelatedProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category_id =  req.getParameter("category_id");
        String product_id =  req.getParameter("product_id");


        ArrayList<Product> list;
        try {
             list = ProductDao.getInstance().getRelatedProduct(category_id,product_id);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        for (Product p : list) {
            out.println(" <div class=\"product col card  border-0 d-flex align-items-center justify-content-center m-0 p-0 \">\n" +
                    "                <div class=\"position-relative\">\n" +
                    "                    <a href=\""+req.getContextPath()+"/productDetail?id="+p.getId()+"\">\n" +
                    "                        <img class=\"card-img-top border-2 \"\n" +
                    "                             src=\""+p.getImg_main()+"\"\n" +
                    "                             alt=\"anh\">\n" +
                    "                        <p\n" +
                    "                                class=\"d-inline position-absolute top-0 start-0 ms-2 mt-2  bg-danger text-white rounded fw-bold fs-6\">\n" +
                    "                            -12%</p>\n" +
                    "                    </a>\n" +
                    "                    <div class=\"d-flex justify-content-between border-0 position-absolute bottom-0 start-0 \"\n" +
                    "                         style=\"width: 100%;\">\n" +
                    "                        <a class=\"btn  rounded-0  btn-d-none p-0 fw-bold \" href=\"#mua\">mua</a>\n" +
                    "                        <a class=\"btn  rounded-0  btn-d-none p-0 fw-bold \" href=\"#gio\">gio hang</a>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "                <a class=\"card-body pt-1 text-decoration-none\" href=\"#chitiet\">\n" +
                    "\n" +
                    "                    <p class=\"card-text text-center d-block fs-5  m-0 \">"+p.getName()+"</p>\n" +
                    "                    <p class=\"card-text text-center d-block fs-6 mt-1\""+p.getPrice()+" đ</p>\n" +
                    "                </a>\n" +
                    "            </div>");
        }


    }

}
