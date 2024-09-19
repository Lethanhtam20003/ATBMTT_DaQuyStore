package dao.userDAO;

import model.IModel;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

public abstract   class AbsDAO<T extends IModel> implements IDAO<T>{

    @Override
    public boolean insert(T t,String action,String id) throws SQLException {
        LogDao.getInstance().insert(t,"register",id);
        return true;
    }

    @Override
    public boolean update(T t,String action,String ip) throws SQLException {
        LogDao.getInstance().update(t,action,ip);
        return true;
    }

    @Override
    public int delete(T t,String action,String ip) throws SQLException {
        return 0;
    }

    @Override
    public T selectById(String id,String action,String ip) throws SQLException {
        LogDao.getInstance().selectById(id,action);
        return null;
    }

    @Override
    public T  selectByName(String name,String action,String ip) throws SQLException {
        LogDao.getInstance().selectByName(name,action,ip);
        return null;
    }

    public T  selectByName(IModel b, String action, String ip) throws SQLException {
        LogDao.getInstance().selectByName(b,action,ip);
        return null;
    }

    @Override
    public ArrayList<T> selectAll() throws SQLException {
        return null;
    }

}
