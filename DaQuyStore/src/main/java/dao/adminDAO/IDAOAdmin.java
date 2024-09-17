package dao.adminDAO;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDAOAdmin<T> {


    public ArrayList select(T obj) throws SQLException;

    public void add(T obj) throws SQLException;

    public boolean deletebyID(T obj,int id) throws SQLException;

    public void filter(T obj) throws SQLException;

    public ArrayList<T> callSelect(T obj) throws SQLException;
    public void callAdd(T obj) throws SQLException;
    public boolean callDelete(T obj,int id) throws SQLException;
    public void callFilter(T obj) throws SQLException;
    public ArrayList search(T obj,String name) throws SQLException;
    public ArrayList callSearch(T obj,String name) throws SQLException;
}
