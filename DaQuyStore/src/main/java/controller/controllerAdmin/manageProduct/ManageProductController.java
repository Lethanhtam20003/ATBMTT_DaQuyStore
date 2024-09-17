package controller.controllerAdmin.manageProduct;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import dao.adminDAO.adminImage.ImageAdminDAO;
import dao.adminDAO.categoryAdmin.CategoryAdminDAO;
import dao.adminDAO.inventoryAdmin.InventoryAdminDAO;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminProduct;
import service.manageAdmin.manageLog.LogService;
import service.manageAdmin.manageProduct.DeleteProductService;
import service.manageAdmin.manageProduct.GetProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)    // 50MB
@WebServlet(name = "ManageProductController", urlPatterns = {"/addproduct_admin", "/deleteproduct_admin", "/filterproduct_admin", "/updateproduct_admin", "/findproduct_admin", "/getproduct_admin", "/redirect_update"})
public class ManageProductController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        if (url.endsWith("/addproduct_admin")) {
            // Xử lý thêm sản phẩm
            try {
                //lay cac gia tri tu form them san pham
                String productName = req.getParameter("productName");
                String price = req.getParameter("price");
                Part image_main = req.getPart("image-main");
                Part image_1 = req.getPart("image-1");
                Part image_2 = req.getPart("image-2");
                Part image_3 = req.getPart("image-3");
                Part image_4 = req.getPart("image-4");
                String number_import = req.getParameter("number_import");
                String description = req.getParameter("description");
                String product_type = req.getParameter("productType");
                String status = req.getParameter("status");
                String cutting_form = req.getParameter("cutting_form");
                String weight = req.getParameter("weight");
                String size = req.getParameter("size");
                String color = req.getParameter("color");
                String opactity = req.getParameter("opacity");
                /*
                điêù kiện kiểm tra nếu thiếu 1 thông tin không cho up
                 */
                if (!productName.isEmpty()) {
                    if (!price.isEmpty()) {
                        if (!description.isEmpty()) {
                            if (!product_type.isEmpty()) {
                                if (image_main != null && image_main.getSize() > 0) {
                                    if (image_1 != null && image_1.getSize() > 0) {
                                        if (image_2 != null && image_2.getSize() > 0) {
                                            if (image_3 != null && image_3.getSize() > 0) {
                                                if (image_4 != null && image_4.getSize() > 0) {
                                                    if (!status.isEmpty()) {
                                                        if (!cutting_form.isEmpty()) {
                                                            if (!weight.isEmpty()) {
                                                                if (!size.isEmpty()) {
                                                                    if (!opactity.isEmpty()) {
                                                                        if (!color.isEmpty()) {
                                                                            if (!number_import.isEmpty()) {
                                                                                //ten cac buc anh
                                                                                String name_image_main = image_main.getSubmittedFileName();
                                                                                String name_image_1 = image_1.getSubmittedFileName();
                                                                                String name_image_2 = image_2.getSubmittedFileName();
                                                                                String name_image_3 = image_3.getSubmittedFileName();
                                                                                String name_image_4 = image_4.getSubmittedFileName();
                                                                                // Khởi tạo một mảng byte để lưu dữ liệu từ phần tải lên
                                                                                byte[] data_image_main = new byte[(int) image_main.getSize()];
                                                                                byte[] data_image_1 = new byte[(int) image_1.getSize()];
                                                                                byte[] data_image_2 = new byte[(int) image_2.getSize()];
                                                                                byte[] data_image_3 = new byte[(int) image_3.getSize()];
                                                                                byte[] data_image_4 = new byte[(int) image_4.getSize()];
                                                                                //đưa dữ lieu anh vao mảng nhi phan
                                                                                image_main.getInputStream().read(data_image_main);
                                                                                image_1.getInputStream().read(data_image_1);
                                                                                image_2.getInputStream().read(data_image_2);
                                                                                image_3.getInputStream().read(data_image_3);
                                                                                image_4.getInputStream().read(data_image_4);
                                                                                // Khởi tạo Cloudinary object
                                                                                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                                                                                        "cloud_name", "dvarqsigv",
                                                                                        "api_key", "312676887848818",
                                                                                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));

                                                                                // Upload ảnh lên Cloudinary
                                                                                Map uploadresult_main = cloudinary.uploader().upload(data_image_main, ObjectUtils.asMap("public_id", name_image_main));
                                                                                Map uploadresult_1 = cloudinary.uploader().upload(data_image_1, ObjectUtils.asMap("public_id", name_image_1));
                                                                                Map uploadresult_2 = cloudinary.uploader().upload(data_image_2, ObjectUtils.asMap("public_id", name_image_2));
                                                                                Map uploadresult_3 = cloudinary.uploader().upload(data_image_3, ObjectUtils.asMap("public_id", name_image_3));
                                                                                Map uploadresult_4 = cloudinary.uploader().upload(data_image_4, ObjectUtils.asMap("public_id", name_image_4));
                                                                                // Lấy đường dẫn URL của ảnh
                                                                                String imageUrl = uploadresult_main.get("url").toString();
                                                                                String imageUrl1 = uploadresult_1.get("url").toString();
                                                                                String imageUrl2 = uploadresult_2.get("url").toString();
                                                                                String imageUrl3 = uploadresult_3.get("url").toString();
                                                                                String imageUrl4 = uploadresult_4.get("url").toString();
                                                                                System.out.println("Đường dẫn ảnh: " + imageUrl);
                                                                                System.out.println("Đường dẫn ảnh: " + imageUrl1);
                                                                                System.out.println("Đường dẫn ảnh: " + imageUrl2);
                                                                                System.out.println("Đường dẫn ảnh: " + imageUrl3);
                                                                                System.out.println("Đường dẫn ảnh: " + imageUrl4);
                                                                                ImageAdminDAO.getInstance().addImage(imageUrl, imageUrl1, imageUrl2, imageUrl3, imageUrl4);
                                                                                AdminLog adminLog = new AdminLog();
                                                                                adminLog.setLevel(LogLevel.INFORM.toString());
                                                                                adminLog.setIpaddress(req.getRemoteAddr());
                                                                                adminLog.setPrevValue("Chưa thêm dữ liệu");
                                                                                adminLog.setCurrentValue("Đã thêm sản phẩm thảnh công" + new Timestamp(new Date().getTime()));
                                                                                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                                                                                // Gửi thông báo thành công về client
                                                                                LogService<AdminProduct> adminLogService = new LogService<>();
                                                                                AdminProduct adminProduct = new AdminProduct();
                                                                                adminLogService.addLogAlert(adminLog, adminProduct);
                                                                                //bien nay dung de cap nhat thong tin o bang product
                                                                                AdminProduct adminProduct_result = new AdminProduct();
                                                                                //set up cac thong so cho 1 product
                                                                                adminProduct_result.setProduct_name(productName);
                                                                                adminProduct_result.setPrice(Float.parseFloat(price));
                                                                                adminProduct_result.setDescription(description);
                                                                                adminProduct_result.setCreated_at(new Timestamp(new Date().getTime()));
                                                                                adminProduct_result.setUpdated_at(new Timestamp(new Date().getTime()));
                                                                                adminProduct_result.setStatus(status);
                                                                                adminProduct_result.setId_product_type(CategoryAdminDAO.getInstance().getProductType(product_type));
                                                                                adminProduct_result.setColor(color);
                                                                                adminProduct_result.setWeight(weight);
                                                                                adminProduct_result.setSize(size);
                                                                                adminProduct_result.setOpactity(opactity);
                                                                                adminProduct_result.setCutting_form(cutting_form);
                                                                                adminProduct_result.setQuantity(Integer.parseInt(number_import));
                                                                                ProductAdminDAO.getInstance().insertProduct(adminProduct_result);
                                                                                adminProduct_result.setProduct_id(InventoryAdminDAO.getInstance().getProduct_ID(productName));
                                                                                InventoryAdminDAO.getInstance().insertInventory();
                                                                                InventoryAdminDAO.getInstance().insertInventoryDetail(adminProduct_result);
                                                                                resp.getWriter().println("Đã gửi ảnh lên Cloudinary và gửi dữ liệu sản phẩm thành công  ");
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        } else if (url.endsWith("/updateproduct_admin")) {
            //xử lí cập nhật thông tin sản phẩm
            int id = Integer.parseInt(req.getParameter("id"));
            String productname = req.getParameter("productName");
            String price = req.getParameter("price");
            String status = req.getParameter("status");
            String sale = req.getParameter("sale");
            String hot = req.getParameter("hot");
            String description = req.getParameter("description");
            Part image_main = req.getPart("image-main");
            Part image_1 = req.getPart("image-1");
            Part image_2 = req.getPart("image-2");
            Part image_3 = req.getPart("image-3");
            Part image_4 = req.getPart("image-4");
            String product_type = req.getParameter("productType");

            //biến đếm số lượng thông tin được cập nhật trong db
            int count = 0;
            //xử lí từng trường hợp khi người dùng đưa các giá trị
            if (!productname.isEmpty()) {
                ProductAdminDAO productAdminDAO = ProductAdminDAO.getInstance();
                try {
                    productAdminDAO.updateProductName(productname, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (!price.isEmpty()) {
                try {
                    int int_price = Integer.parseInt(price);
                    ProductAdminDAO.getInstance().updateProductPrice(int_price, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
            if (status != null) {
                try {
                    ProductAdminDAO.getInstance().updateProductStatus(status, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
            if (!sale.isEmpty()) {
                int discount_price = Integer.parseInt(sale);
                try {
                    ProductAdminDAO.getInstance().updateProductSale(discount_price, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (hot != null) {
                int hot_price = Integer.parseInt(hot);
                try {
                    ProductAdminDAO.getInstance().updateProductHot(hot_price, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
            if (!description.isEmpty()) {
                try {
                    ProductAdminDAO.getInstance().updateProductDescription(description, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (image_main != null && image_main.getSize() > 0) {
                String name_image_main = image_main.getSubmittedFileName();
                byte[] data_image_main = new byte[(int) image_main.getSize()];
                image_main.getInputStream().read(data_image_main);
                // Khởi tạo Cloudinary object
                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dvarqsigv",
                        "api_key", "312676887848818",
                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));
                Map uploadresult_main = cloudinary.uploader().upload(data_image_main, ObjectUtils.asMap("public_id", name_image_main));
                // Lấy đường dẫn URL của ảnh
                String imageUrl = uploadresult_main.get("url").toString();
                //cập nhật đường dẫn trong db
                ProductAdminDAO productAdminDAO = new ProductAdminDAO();
                try {
                    productAdminDAO.updateProductImageMain(imageUrl, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (image_1 != null && image_1.getSize() > 0) {
                String name_image_1 = image_1.getSubmittedFileName();
                byte[] data_image_1 = new byte[(int) image_1.getSize()];
                image_1.getInputStream().read(data_image_1);
                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dvarqsigv",
                        "api_key", "312676887848818",
                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));
                Map uploadresult_main = cloudinary.uploader().upload(data_image_1, ObjectUtils.asMap("public_id", name_image_1));
                // Lấy đường dẫn URL của ảnh
                String imageUrl = uploadresult_main.get("url").toString();
                //cập nhật đường dẫn trong db
                ProductAdminDAO productAdminDAO = new ProductAdminDAO();
                try {
                    productAdminDAO.updateProductImage1(imageUrl, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (image_2 != null && image_2.getSize() > 0) {
                String name_image_2 = image_2.getSubmittedFileName();
                byte[] data_image_2 = new byte[(int) image_2.getSize()];
                image_2.getInputStream().read(data_image_2);
                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dvarqsigv",
                        "api_key", "312676887848818",
                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));
                Map uploadresult_main = cloudinary.uploader().upload(data_image_2, ObjectUtils.asMap("public_id", name_image_2));
                // Lấy đường dẫn URL của ảnh
                String imageUrl = uploadresult_main.get("url").toString();
                //cập nhật đường dẫn trong db
                ProductAdminDAO productAdminDAO = new ProductAdminDAO();
                try {
                    productAdminDAO.updateProductImage2(imageUrl, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (image_3 != null && image_3.getSize() > 0) {
                String name_image_3 = image_3.getSubmittedFileName();
                byte[] data_image_3 = new byte[(int) image_3.getSize()];
                image_3.getInputStream().read(data_image_3);
                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dvarqsigv",
                        "api_key", "312676887848818",
                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));
                Map uploadresult_main = cloudinary.uploader().upload(data_image_3, ObjectUtils.asMap("public_id", name_image_3));
                // Lấy đường dẫn URL của ảnh
                String imageUrl = uploadresult_main.get("url").toString();
                //cập nhật đường dẫn trong db
                ProductAdminDAO productAdminDAO = new ProductAdminDAO();
                try {
                    productAdminDAO.updateProductImage3(imageUrl, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (image_4 != null && image_4.getSize() > 0) {
                String name_image_4 = image_4.getSubmittedFileName();
                byte[] data_image_4 = new byte[(int) image_4.getSize()];
                image_4.getInputStream().read(data_image_4);
                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dvarqsigv",
                        "api_key", "312676887848818",
                        "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));
                Map uploadresult_main = cloudinary.uploader().upload(data_image_4, ObjectUtils.asMap("public_id", name_image_4));
                // Lấy đường dẫn URL của ảnh
                String imageUrl = uploadresult_main.get("url").toString();
                //cập nhật đường dẫn trong db
                ProductAdminDAO productAdminDAO = new ProductAdminDAO();
                try {
                    productAdminDAO.updateProductImage4(imageUrl, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (product_type != null) {
                try {
                    int category_id = CategoryAdminDAO.getInstance().getProductType(product_type);
                    ProductAdminDAO.getInstance().updateProductType(category_id, id);
                    count++;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

            if (count >= 1) {
                AdminLog adminLog = new AdminLog();
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setLevel(LogLevel.DANGER.toString());
                adminLog.setPrevValue("Chưa  cập nhật thành công sản phẩm có id:" + id + new Timestamp(new Date().getTime()));
                adminLog.setCurrentValue("Đã cập nhật thành công sản phẩm có id:" + id + new Timestamp(new Date().getTime()));
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                LogService<AdminProduct> productAdminLogService = new LogService<>();
                try {
                    productAdminLogService.addLogWarning(adminLog, new AdminProduct());
                    req.getRequestDispatcher("views/admin/admin_backward_product.jsp").forward(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }

        } else {
            // URL không hợp lệ
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        resp.setContentType("text/html;charset=UTF-8");
        if (uri.endsWith("/getproduct_admin")) {
            try {
                GetProductService getProductService = new GetProductService();
                LogService<AdminProduct> productAdminLogService = new LogService<>();
                AdminLog adminLog = new AdminLog();
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                adminLog.setPrevValue("Chưa truy cập ngày" + new Timestamp(new Date().getTime()));
                adminLog.setCurrentValue("Đã truy cập ngày:" + new Timestamp(new Date().getTime()));
                productAdminLogService.addLogInform(adminLog, new AdminProduct());
                getProductService.getProduct(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (uri.endsWith("/deleteproduct_admin")) {
            // Xử lý xóa sản phẩm
            int id = Integer.parseInt(req.getParameter("id"));
            DeleteProductService deleteProductService = new DeleteProductService();
            GetProductService getProductService = new GetProductService();
            LogService<AdminProduct> productAdminLogService = new LogService<>();
            AdminLog adminLog = new AdminLog();
            adminLog.setIpaddress(req.getRemoteAddr());
            adminLog.setLevel(LogLevel.DANGER.toString());
            adminLog.setCreated_at(new Timestamp(new Date().getTime()));
            adminLog.setPrevValue("Chưa xóa ngày" + new Timestamp(new Date().getTime()) + "sản phẩm có id" + id);
            adminLog.setCurrentValue("Đã xóa  ngày:" + new Timestamp(new Date().getTime()) + "sản phẩm có id" + id);
            try {
                if (ProductAdminDAO.getInstance().deletebyID(new AdminProduct(), id)) {
                    productAdminLogService.addLogDanger(adminLog, new AdminProduct());
                    resp.getWriter().println(new Gson().toJson("Xóa thành công "));
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
//            try {
//                deleteProductService.delete(req, resp, id);
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }

        } else if (uri.endsWith("/redirect_update")) {
            int id = Integer.parseInt(req.getParameter("id"));
            // Xử lý cập nhật sản phẩm
            ProductAdminDAO productAdminDAO = ProductAdminDAO.getInstance();

            try {
                AdminProduct adminProduct = productAdminDAO.selectByID(id);
                HttpSession session = req.getSession(true);
                session.setAttribute("id", id);
                session.setAttribute("productname", adminProduct.getProduct_name());
                session.setAttribute("price", adminProduct.getPrice());
//                session.setAttribute("status", adminProduct.getStatus());
                RequestDispatcher rd = session.getServletContext().getRequestDispatcher("/views/admin/admin_form_update.jsp");
                rd.forward(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }
}
