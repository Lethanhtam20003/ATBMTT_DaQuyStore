package dao.userDAO;

import connector.DAOConnection;
import model.ActivacationCode;

import java.sql.*;
import java.util.ArrayList;

public class ActivacationCodeDao implements IDAO<ActivacationCode> {
    private String code;
    private String username;
    private String password;
    private String email;
    @Override
    public boolean insert(ActivacationCode activacationCode,String action,String ipAddress) throws SQLException {
        Connection con = DAOConnection.getConnection();
        String sql = "insert into activacation_code(activationCode,username,password,email) " +
                "values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, activacationCode.getActivationCode());
        ps.setString(2, activacationCode.getUsername());
        ps.setString(3, activacationCode.getPassword());
        ps.setString(4, activacationCode.getEmail());

        int res = ps.executeUpdate();
        ps.close();
        con.close();
        return res >= 1;
    }

    @Override
    public boolean update(ActivacationCode activacationCode,String action,String ipAddress) throws SQLException {
        return false;
    }

    @Override
    public int delete(ActivacationCode ac,String action,String ipAddress) throws SQLException {
       return 0;
    }

    @Override
    public ActivacationCode selectById(String id,String action,String ipAddress) throws SQLException {
        String sql = " select * from activacation_code where activationCode = ? ";

        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, id);
        ResultSet rs = pst.executeQuery();
        ActivacationCode ac = null;
        if (rs.next()) {
            code = rs.getString("activationCode");
            username = rs.getString("username");
            password = rs.getString("password");
            email = rs.getString("email");

        }
        ac = new ActivacationCode(code, username, password, email);
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return ac;
    }

    @Override
    public ActivacationCode selectByName(String id,String action,String ipAddress) throws SQLException {
        return null;
    }

    @Override
    public ArrayList<ActivacationCode> selectAll() throws SQLException {
        return null;
    }

    public int deleteAll() throws SQLException {
        String sql = "TRUNCATE table activacation_code";
        Statement st = null;
        try {
            st = DAOConnection.getConnection().createStatement();
            st.execute(sql);
            return 1; // Trả về 1 nếu thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Trả về 0 nếu thất bại
        } finally {
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
