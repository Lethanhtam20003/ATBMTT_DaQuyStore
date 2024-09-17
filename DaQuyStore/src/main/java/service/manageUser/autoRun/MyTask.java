package service.manageUser.autoRun;

import dao.userDAO.ActivacationCodeDao;

import java.sql.SQLException;

public class MyTask implements Runnable{
    @Override
    public void run() {
        System.out.println("MyTask run: delete all row from activacation_code");
        ActivacationCodeDao dao = new ActivacationCodeDao();
        try {
            dao.deleteAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
