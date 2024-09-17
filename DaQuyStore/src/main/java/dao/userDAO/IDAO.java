package dao.userDAO;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDAO<T>{
    public boolean insert(T t,String action,String ipAddress) throws SQLException;
    public boolean update(T t,String action,String ipAddress)throws SQLException;
    public int delete(T t,String action,String ipAddress)throws SQLException;
    public T selectById(String id,String action,String ipAddress)throws SQLException;
    public T selectByName(String name,String action,String ipAddress)throws SQLException;
    public ArrayList<T> selectAll()throws SQLException;

}
