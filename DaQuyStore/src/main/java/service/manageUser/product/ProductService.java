package service.manageUser.product;

import dao.userDAO.ProductDao;
import model.ImageProduct;
import model.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ProductService {

    public ArrayList<Product> getProductPerPage(int pageNo) throws SQLException {

        ProductDao dao =  ProductDao.getInstance();
        int start = (pageNo-1)*8;
        int end = pageNo*8;
        ArrayList<Product> res = new ArrayList<>();
        res = dao.getListProductPerPage(start,end);
        return res;
    }

    public static Map<String, String> StringToMap(String info) {
        Map<String, String> map = new HashMap<>();
        String[] split = info.substring(1, info.length() - 1).split(";");
        for (String attribute : split) {
            String[] keyValue = attribute.split(":");
            String key = keyValue[0].trim();
            String value = keyValue.length > 1 ? keyValue[1].trim() : "";
            map.put(key, value);
        }
        return map;
    }

    public static void main(String[] args) throws SQLException {
    }
}
