package dao.adminDAO.adminLog;

import connector.DAOConnection;
import dao.adminDAO.IDAOLogAdmin;
import model.Log;
import model.LogLevel;
import model.modelAdmin.AdminLog;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class LogAdminDAO implements IDAOLogAdmin<Log> {
    public static LogAdminDAO getInstance() {
        return new LogAdminDAO();
    }


    public int getMaxID() throws SQLException {
        String sql = "Select max(id) as max_id from log";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        int max = 0;
        while (rs.next()) {
            max = rs.getInt("max_id");
        }
        pr.close();
        rs.close();
        return max;
    }

    public static void main(String[] args) throws SQLException {


    }


    @Override
    public void addLogAlert(AdminLog log) throws SQLException {
        String sql = "Insert into log(id,ip_address,prev_value,current_value,created_at,level) values(?,?,?,?,?,?)";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, getMaxID() + 1);
        pr.setString(2, log.getIpaddress());
        pr.setString(3, log.getPrevValue());
        pr.setString(4, log.getCurrentValue());
        pr.setTimestamp(5, new Timestamp(new Date().getTime()));
        pr.setString(6, LogLevel.ALERT.toString());
        pr.executeUpdate();
    }

    @Override
    public void addLogWarning(AdminLog log) throws SQLException {
        String sql = "Insert into log(id,ip_address,prev_value,current_value,created_at,level) values(?,?,?,?,?,?)";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, getMaxID() + 1);
        pr.setString(2, log.getIpaddress());
        pr.setString(3, log.getPrevValue());
        pr.setString(4, log.getCurrentValue());
        pr.setTimestamp(5, new Timestamp(new Date().getTime()));
        pr.setString(6, LogLevel.WARNING.toString());
        pr.executeUpdate();
    }

    @Override
    public void addLogDanger(AdminLog log) throws SQLException {
        String sql = "Insert into log(id,ip_address,prev_value,current_value,created_at,level) values(?,?,?,?,?,?)";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        pr.setInt(1, getMaxID() + 1);
        pr.setString(2, log.getIpaddress());
        pr.setString(3, log.getPrevValue());
        pr.setString(4, log.getCurrentValue());
        pr.setTimestamp(5, new Timestamp(new Date().getTime()));
        pr.setString(6, LogLevel.DANGER.toString());
        pr.executeUpdate();
    }

    @Override
    public ArrayList<AdminLog> getListLog() throws SQLException {
        ArrayList<AdminLog> list = new ArrayList<>();
        String sql = "Select id,level,ip_address,prev_value,current_value,created_at from log";
        PreparedStatement pr = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        AdminLog adminLog=null;
        while (rs.next()) {
            adminLog=new AdminLog();
            adminLog.setId(rs.getInt("id"));
            adminLog.setIpaddress(rs.getString("ip_address"));
            adminLog.setPrevValue(rs.getString("prev_value"));
            adminLog.setCurrentValue(rs.getString("current_value"));
            adminLog.setCreated_at(rs.getTimestamp("created_at"));
            adminLog.setLevel(rs.getString("level"));
            list.add(adminLog);
        }
        return list;
    }
}
