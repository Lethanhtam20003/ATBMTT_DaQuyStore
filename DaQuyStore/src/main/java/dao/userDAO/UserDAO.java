package dao.userDAO;

import connector.DAOConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class UserDAO extends AbsDAO<User> implements IDAO<User> {
    private String id;
    private String username;
    private String password;
    private String fullName;
    private String gender;
    private Date birthday;
    private String email;
    private String phoneNumber;
    private String address;
    private String avatar;
    private Date createAt;
    private Date updateAt;
    private Date deleteAt;
    private String role;
    private String status;
    private String typeLogin;

    public static UserDAO instence;
    public static UserDAO getInstance() {
        if (instence == null) {
            instence = new UserDAO();
        }
        return new UserDAO();
    }

    @Override
    public boolean insert(User user,String action,String ipAddress) throws SQLException {
        Connection con = DAOConnection.getConnection();
        String sql = "insert into users(username,password,full_name,gender,birthday, email,phone,address,avatar,role,status,type_login) " +
                "values (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getFullName());
        ps.setString(4, user.getGender());
        ps.setDate(5, user.getBirthday());
        ps.setString(6, user.getEmail());
        ps.setString(7, user.getPhoneNumber());
        ps.setString(8, user.getAddress());
        ps.setString(9, user.getAvatar());
        ps.setString(10, user.getRole());
        ps.setString(11, "chưa xóa");
        ps.setString(12, user.getTypeLogin());

        int res = ps.executeUpdate();
        ps.close();
        con.close();
//        super.insert(user,action,ipAddress);
        return res >= 1;
    }

    @Override
    public boolean update(User user,String action,String ipAddress) {
        try {
            Connection con = DAOConnection.getConnection();
            String sql = "update users u set " +
                "u.username=?, u.password=?,u.full_name=?, u.gender =?,u.birthday=?,u.email=?,u.phone=?,u.address=?," +
                "u.avatar=?, u.updated_at=CURRENT_TIMESTAMP,u.role=?, u.status=? ,u.type_login=?  " +
                "where u.id=?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getBirthday());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhoneNumber());
            ps.setString(8, user.getAddress());
            ps.setString(9, user.getAvatar());
            ps.setString(10, user.getRole());
            ps.setString(11, user.getStatus());
            ps.setString(12, user.getTypeLogin());
            ps.setString(13, user.getId());

            int res = ps.executeUpdate();
            ps.close();
            con.close();
//            super.update(user,action,ipAddress);
            return res >= 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(User u,String action,String ipAddress) {
        return 0;
    }

    @Override
    public User selectById(String id,String action,String ipAddress) throws SQLException {
        String sql = " select * from users where id = ? ";

        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, id);
        ResultSet rs = pst.executeQuery();
        User user = null;
        if (rs.next()) {
            id = rs.getString("id");
            username = rs.getString("username");
            password = rs.getString("password");
            fullName= rs.getString("full_name");
            gender = rs.getString("gender");
            birthday = rs.getDate("birthday");
            email = rs.getString("email");
            phoneNumber = rs.getString("phone");
            address = rs.getString("address");
            avatar = rs.getString("avatar");
            createAt= rs.getDate("created_at");
            updateAt= rs.getDate("updated_at");
            deleteAt= rs.getDate("delete_at");
            role = rs.getString("role");
            status = rs.getString("status");
            typeLogin = rs.getString("type_login");
        }
        user = new User(id,username,password,fullName,gender,birthday,email,phoneNumber,address,avatar,createAt,updateAt,deleteAt,role,status,typeLogin);
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
//        super.selectById(id,action,address);
        return user;
    }

    @Override
    public User selectByName(String username,String action,String ipAddress) throws SQLException {
        String sql = " select * from users where username = ? ";

        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();
        User user = null;
        if (rs.next()) {
            id = rs.getString("id");
            username = rs.getString("username");
            password = rs.getString("password");
            fullName= rs.getString("full_name");
            gender = rs.getString("gender");
            birthday = rs.getDate("birthday");
            email = rs.getString("email");
            phoneNumber = rs.getString("phone");
            address = rs.getString("address");
            avatar = rs.getString("avatar");
            createAt= rs.getDate("created_at");
            updateAt= rs.getDate("updated_at");
            deleteAt= rs.getDate("delete_at");
            role = rs.getString("role");
            status = rs.getString("status");
            typeLogin = rs.getString("type_login");
            user = new User(id,username,password,fullName,gender,birthday,email,phoneNumber,address,avatar,createAt,updateAt,deleteAt,role,status,typeLogin);
        }

        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        if(user==null){
            action = action+" : false";
        }
//        super.selectByName(user,action,ipAddress);
        return user;
    }


    @Override
    public ArrayList<User> selectAll() throws SQLException {
        String sql = " select * from users ";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<User> users = new ArrayList<>();
        while (rs.next()) {
            id = rs.getString("id");
            username = rs.getString("username");
            password = rs.getString("password");
            fullName= rs.getString("full_name");
            gender = (rs.getString("gender")==null?"":rs.getString("gender"));
            birthday = (rs.getDate("birthday") == null ? null : rs.getDate("birthday"));
            email = rs.getString("email");
            phoneNumber = (rs.getString("phone")==null?"":rs.getString("phone"));
            address = (rs.getString("address")==null?"":rs.getString("address"));
            avatar = (rs.getString("avatar")==null?"":rs.getString("avatar"));
            createAt= (rs.getDate("created_at")==null?null:rs.getDate("created_at"));
            updateAt= (rs.getDate("updated_at")==null?null:rs.getDate("updated_at"));
            deleteAt= rs.getDate("delete_at")==null?null:rs.getDate("delete_at");
            role = rs.getString("role")==null?"user":rs.getString("role");
            status = rs.getString("status")==null?"":rs.getString("status");
            typeLogin = rs.getString("type_login")==null?"web":rs.getString("type_login");
            User user = new User(id,username,password,fullName,gender,birthday,email,phoneNumber,address,avatar,createAt,updateAt,deleteAt,role,status,typeLogin);
            users.add(user);
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return users;
    }


    public List<String> getListEmail() throws SQLException {
        String sql = " select email  from users ";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<String> emails = new ArrayList<>();
        while (rs.next()) {
            emails.add(rs.getString("email"));
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return emails;
    }


    public List<String> getListUserName() throws SQLException {
        String sql = " select username  from users ";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        ArrayList<String> users = new ArrayList<>();
        while (rs.next()) {
            users.add(rs.getString("username"));
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
        return users;
    }

    public ArrayList<User> selectAllByTypeLogin(String typeLogin,String ip) throws SQLException {
        String sql = " select * from users where type_login=?";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, typeLogin);
        ResultSet rs = pst.executeQuery();
        ArrayList<User> users = new ArrayList<>();
        while (rs.next()) {
            id = rs.getString("id");
            username = rs.getString("username");
            password = rs.getString("password");
            fullName= rs.getString("full_name");
            gender = (rs.getString("gender")==null?"":rs.getString("gender"));
            birthday = (rs.getDate("birthday") == null ? null : rs.getDate("birthday"));
            email = rs.getString("email");
            phoneNumber = (rs.getString("phone")==null?"":rs.getString("phone"));
            address = (rs.getString("address")==null?"":rs.getString("address"));
            avatar = (rs.getString("avatar")==null?"":rs.getString("avatar"));
            createAt= (rs.getDate("created_at")==null?null:rs.getDate("created_at"));
            updateAt= (rs.getDate("updated_at")==null?null:rs.getDate("updated_at"));
            deleteAt= rs.getDate("delete_at")==null?null:rs.getDate("delete_at");
            role = rs.getString("role")==null?"user":rs.getString("role");
            status = rs.getString("status")==null?"":rs.getString("status");
            typeLogin = rs.getString("type_login")==null?"web":rs.getString("type_login");
            User user = new User(id,username,password,fullName,gender,birthday,email,phoneNumber,address,avatar,createAt,updateAt,deleteAt,role,status,typeLogin);
            users.add(user);
        }
        rs.close();
        pst.close();
        DAOConnection.getConnection().close();
//        super.selectById("login","loginGoogle",ip);
        return users;
    }

    public String getUserid(String email) throws SQLException {
        String sql = "select id from users where email=?";
        PreparedStatement pst = DAOConnection.getConnection().prepareStatement(sql);
        pst.setString(1, email);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            id = rs.getString("id");
        }
        return id;
    }
}
