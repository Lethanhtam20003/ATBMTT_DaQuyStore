package dao.userDAO;

import connector.DaoConnectionLocal;
import model.local.City;
import model.local.District;
import model.local.Ward;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LocalDao {
     Connection connection = DaoConnectionLocal.getConnection();
    public static LocalDao instance = null;
    public LocalDao() throws SQLException {}
    public static LocalDao getInstance() throws SQLException {
        if (instance == null) {
            instance = new LocalDao();
        }
        return instance;
    }
    public ArrayList<City> getListCity() throws SQLException {
        ArrayList<City> res = new ArrayList<>();
        String sql = "SELECT matp,name FROM `devvn_tinhthanhpho`;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String id = rs.getString("matp");
            String name = rs.getString("name");
            if(name.startsWith("Thành phố ")){
                name = name.substring(7);
            }
            if(name.startsWith("Tỉnh ")){
                name = name.substring(5);
            }
            City city   = new City(id,name);
            res.add(city);
        }
        return res;
    }


    public List<District> getListDistrict(String cityCode) throws SQLException {
        List<District> res = new ArrayList<>();

        String sql = "SELECT maqh,name FROM `devvn_quanhuyen` WHERE matp = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, cityCode);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("maqh");
            String name = rs.getString("name");
            District district = new District(id,name);
            res.add(district);
        }
        return res;
    }

    public List<Ward> getListWard(String district) throws SQLException {
        List<Ward> res = new ArrayList<>();
        String inp = district;
        if(district.length()==1){
            inp="00"+district;
        }else if(district.length()==2){
            inp="0"+district;
        }
        String sql = "SELECT xaid,name FROM `devvn_xaphuongthitran` WHERE maqh = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, inp);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String id = rs.getString("xaid");
            String name = rs.getString("name");
            Ward ward = new Ward(id,name);
            res.add(ward);
        }
        System.out.println(res);
        return res;
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(LocalDao.getInstance().getListWard("002").toString());
    }

    public String getAddress(String address, String wards, String district, String city) throws SQLException {
        String res = address;
        String sql = "SELECT c.name as cityname,d.name as districtname,w.name as wordname FROM  devvn_quanhuyen d\n" +
                "JOIN devvn_tinhthanhpho c ON c.matp=d.matp\n" +
                "JOIN devvn_xaphuongthitran w ON d.maqh=w.maqh\n" +
                "WHERE c.matp =? AND d.maqh= ? AND w.xaid=?";
        PreparedStatement ps =connection.prepareStatement(sql);
        ps.setString(1, city);
        ps.setString(2, district);
        ps.setString(3, wards);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String cityName = rs.getString("cityname");
            String districtName = rs.getString("districtname");
            String wordName = rs.getString("wordname");
            res+=", "+ wordName+", "+districtName+", "+cityName;
        }
        return res;
    }
}
