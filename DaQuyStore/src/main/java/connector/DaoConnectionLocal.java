package connector;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoConnectionLocal {
    public static Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new Driver());
        String url = "jdbc:mysql://localhost:3306/local";
        String user = "root";
        String password = "";
        return DriverManager.getConnection(url, user, password);
    }
}
