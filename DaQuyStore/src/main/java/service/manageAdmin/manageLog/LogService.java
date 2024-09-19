package service.manageAdmin.manageLog;

import dao.adminDAO.adminLog.LogAdminDAO;
import dao.adminDAO.orderAdmin.OrderAdminDAO;
import dao.adminDAO.productAdmin.ProductAdminDAO;
import dao.adminDAO.userAdmin.UserAdminDAO;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminOrderDetail;
import model.modelAdmin.AdminUser;
import model.modelAdmin.AdminProduct;

import java.sql.SQLException;
import java.util.ArrayList;

public class LogService<T> {
    public ArrayList<AdminLog> getLogList() throws SQLException {
        ArrayList<AdminLog> list = LogAdminDAO.getInstance().getListLog();
        return list;
    }

    public void addLogInform(AdminLog adminLog, T obj) throws SQLException {
        if (obj instanceof AdminUser) {
            UserAdminDAO.getInstance().addLogInformForSelect(adminLog);
        }else if(obj instanceof AdminOrderDetail){
            OrderAdminDAO.getInstance().addLogInformForSelect(adminLog);
        }else if(obj instanceof AdminProduct){
            ProductAdminDAO.getInstance().addLogInformForSelect(adminLog);
        }


    }

    public void addLogAlert(AdminLog adminLog, T obj) throws SQLException {
        if(obj instanceof AdminProduct){
            ProductAdminDAO.getInstance().addLogALertForAdd(adminLog);
        }
    }

    public void addLogDanger(AdminLog adminLog, T obj) throws SQLException {
        if (obj instanceof AdminUser) {
            UserAdminDAO.getInstance().addLogDangerForDelete(adminLog);
        }else if(obj instanceof AdminOrderDetail){
            OrderAdminDAO.getInstance().addLogDangerForDelete(adminLog);
        }else if(obj instanceof AdminProduct){
            ProductAdminDAO.getInstance().addLogDangerForDelete(adminLog);
        }
    }

    public void addLogWarning(AdminLog adminLog, T obj) throws SQLException {
        if (obj instanceof AdminUser) {
            UserAdminDAO.getInstance().addLogWarningForUpdateRole(adminLog);
        }else if(obj instanceof AdminProduct){
            ProductAdminDAO.getInstance().addLogWarningForUpdate(adminLog);
        }else if(obj instanceof AdminOrderDetail){
            OrderAdminDAO.getInstance().addLogWarningForUpdate(adminLog);
        }
    }
}

