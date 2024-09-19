package dao.adminDAO;

import model.Log;
import model.modelAdmin.AdminLog;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDAOLogAdmin<T> {
    public void addLogAlert(AdminLog log) throws SQLException;
    public void addLogWarning(AdminLog log) throws SQLException;
    public void addLogDanger(AdminLog log) throws SQLException;
    public ArrayList<AdminLog> getListLog() throws SQLException;

}
