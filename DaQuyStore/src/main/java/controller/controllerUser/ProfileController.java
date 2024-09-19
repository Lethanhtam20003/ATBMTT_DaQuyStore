package controller.controllerUser;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import model.User;
import service.manageUser.registerAndLogin.UpdateProfileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.Map;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UpdateProfileService service = UpdateProfileService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");
        String birthday = req.getParameter("birthday");
        if(fullName != null && !fullName.trim().equals("")){
            user.setFullName(fullName);
        }
        if (phoneNumber != null && !phoneNumber.trim().equals("")){}
            user.setPhoneNumber(phoneNumber);
        if (address != null && !address.trim().equals("")) {
            user.setAddress(address);
        }
        if (gender != null && !gender.trim().equals("")) {
            user.setGender(gender);
        }
        if (birthday != null && !birthday.trim().equals("")) {
            Date birthdayThenPartDate = Date.valueOf(birthday);
            user.setBirthday(birthdayThenPartDate);
        }
//        them anh
        System.out.println(req.getParameter("avatar"));
        Part avatar = req.getPart("avatar");
        String nameAvata = avatar.getSubmittedFileName();
        byte[] data_image_main = new byte[(int) avatar.getSize()];
        avatar.getInputStream().read(data_image_main);
        // Khởi tạo Cloudinary object
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dvarqsigv",
                "api_key", "312676887848818",
                "api_secret", "mDYfyME8asyBQJJe6VFENakGoOc"));
        Map uploadAvata = cloudinary.uploader().upload(data_image_main, ObjectUtils.asMap("public_id", nameAvata));

        String urlAvatar = uploadAvata.get("url").toString();
        user.setAvatar(urlAvatar);
//        session.setAttribute("user", user);
        service.updateProfile(user,req.getRemoteAddr());
        req.getRequestDispatcher("/views/user/profile.jsp").forward(req, resp);
    }

}
