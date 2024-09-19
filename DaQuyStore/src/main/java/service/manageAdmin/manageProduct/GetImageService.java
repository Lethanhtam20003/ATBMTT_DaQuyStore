package service.manageAdmin.manageProduct;

import dao.adminDAO.adminImage.ImageAdminDAO;
import model.modelAdmin.AdminImage;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetImageService {
    public ArrayList<AdminImage> getImageList() throws SQLException {
        ArrayList<AdminImage> list = ImageAdminDAO.getInstance().getImageList();
        return list;
    }
}
