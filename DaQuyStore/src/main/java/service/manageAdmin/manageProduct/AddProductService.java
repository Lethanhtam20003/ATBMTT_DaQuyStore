package service.manageAdmin.manageProduct;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.SQLException;

public class AddProductService extends HttpServlet {
    public void add(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        try {
            //lay cac gia tri tu form them san pham
            String productName = request.getParameter("productName");
            String price = request.getParameter("price");
            Part image_main = request.getPart("image-main");
            Part image_1 = request.getPart("image-1");
            Part image_2 = request.getPart("image-2");
            Part image_3 = request.getPart("image-3");
            Part image_4 = request.getPart("image-4");
            String link_image_main = request.getParameter("link-image-main");
            String link_image_1 = request.getParameter("link-image-1");
            String link_image_2 = request.getParameter("link-image-2");
            String link_image_3 = request.getParameter("link-image-3");
            String link_image_4 = request.getParameter("link-image-4");
            String description = request.getParameter("description");
            String product_type = request.getParameter("productType");
            // Khởi tạo một mảng byte để lưu dữ liệu từ phần tải lên
            byte[] data_image_main = new byte[(int) image_main.getSize()];
            byte[] data_image_1 = new byte[(int) image_1.getSize()];
            byte[] data_image_2 = new byte[(int) image_2.getSize()];
            byte[] data_image_3 = new byte[(int) image_3.getSize()];
            byte[] data_image_4 = new byte[(int) image_4.getSize()];
            // Khởi tạo Cloudinary object
            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", "dvarqsigv",
                    "api_key", "312676887848818",
                    "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));

            // Upload ảnh lên Cloudinary
            cloudinary.uploader().upload(data_image_main, ObjectUtils.emptyMap());
            cloudinary.uploader().upload(data_image_1, ObjectUtils.emptyMap());
            cloudinary.uploader().upload(data_image_2, ObjectUtils.emptyMap());
            cloudinary.uploader().upload(data_image_3, ObjectUtils.emptyMap());
            cloudinary.uploader().upload(data_image_4, ObjectUtils.emptyMap());
            // Gửi thông báo thành công về client
            response.getWriter().println("Đã gửi ảnh lên Cloudinary thành công: ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi gửi ảnh lên Cloudinary");
        }

    }

}
