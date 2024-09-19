package dao.userDAO;

import com.google.gson.Gson;
import connector.DAOConnection;
import model.IModel;
import model.Log;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

public class LogDao  {

    public  void insert(IModel user,String action,String id) throws SQLException {
        Gson gson = new Gson();
        String jsonBefore = gson.toJson(user.getDataBefore());
        String jsonAfter = gson.toJson(user.getDataAfter());
        Log log = new Log(id,action,"info",user.getTable(),jsonBefore,jsonAfter,Date.valueOf( LocalDate.now()));
        insertLog(log);
    }

    public  <T extends IModel> void update(T t,  String action,String id) throws SQLException {
    }

    public  void selectById(String id,String action) throws SQLException {

    }

    public  void selectByName(String name,String action,String ip) throws SQLException {
        Log log = new Log(ip,action,"info","user",null,null,Date.valueOf( LocalDate.now()));
        insertLog(log);
    }
    public  void selectByName(IModel b, String action, String ip) throws SQLException {
        Log log= null;
        String level = getLevelByAction(action);
        if(b == null){
            log = new Log(ip,action,"info","user",null,null,Date.valueOf( LocalDate.now()));
        }else{
            log = new Log(ip,action,"info","user",b.getDataBefore(),b.getDataAfter(),Date.valueOf( LocalDate.now()));
        }

        insertLog(log);
    }

    private String getLevelByAction(String action) {
        switch (action) {
            case "a":
                return "info";
        }
        return "info";
    }

    public void insertLog(Log log) throws SQLException {
        Connection dao = DAOConnection.getConnection();
        String sql = "insert into log(ip,level,action,address,priviousValue,currentValue,createAt) values(?,?,?,?,?,?,?)";
        PreparedStatement pre = dao.prepareStatement(sql);
        pre.setString(1, log.getIp());
        pre.setString(2, log.getLevel());
        pre.setString(3, log.getAction());
        pre.setString(4, log.getAddress());
        pre.setString(5, log.getPreviousValue());
        pre.setString(6,log.getCurrentValue());
        pre.setDate(7,log.getCreated_at());
        pre.execute();
    }

    public static LogDao getInstance() {
        return new LogDao();
    }
}
