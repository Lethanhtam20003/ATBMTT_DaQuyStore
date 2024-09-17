package dao.adminDAO;

import dao.adminDAO.orderAdmin.OrderAdminDAO;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminOrderDetail;
import model.modelAdmin.AdminUser;
import model.modelAdmin.AdminProduct;

import java.sql.SQLException;
import java.util.ArrayList;


//truyền kiểu dữ liệu cho Generic và 1 object rỗng để xử lí logic
public abstract class AbsAdminDAO<T> implements IDAOAdmin<T> {
    @Override
    public ArrayList select(T obj) throws SQLException {
        if (obj instanceof AdminUser) {
            ArrayList<AdminUser> arrayList = UserAdminDAO.getInstance().select((AdminUser) obj);
            return arrayList;
        } else if (obj instanceof AdminProduct) {
            ArrayList<AdminProduct> arrayList = ProductAdminDAO.getInstance().select((AdminProduct) obj);
            return arrayList;
        }
        return null;
    }

    @Override
    public void add(T obj) {

    }

    @Override
    public boolean deletebyID(T obj, int id) throws SQLException {
        if (obj instanceof AdminUser) {
            UserAdminDAO.getInstance().deletebyID((AdminUser) obj, id);
        } else if (obj instanceof AdminProduct) {
            ProductAdminDAO.getInstance().deletebyID((AdminProduct) obj, id);
        } else if (obj instanceof AdminOrderDetail)
            OrderAdminDAO.getInstance().deletebyID((AdminOrderDetail) obj, id);
        return false;
    }


    @Override
    public void filter(T obj) throws SQLException {

    }



    @Override
    public ArrayList search(T obj, String name) throws SQLException {
        if (obj instanceof AdminProduct) {
            ArrayList<AdminProduct> adminProducts = ProductAdminDAO.getInstance().search((AdminProduct) obj, name);
            return adminProducts;
        }
        return null;
    }
}
