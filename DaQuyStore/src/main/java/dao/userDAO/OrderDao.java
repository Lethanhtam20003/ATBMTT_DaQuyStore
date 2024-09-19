package dao.userDAO;

import connector.DAOConnection;
import model.Order;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class OrderDao extends AbsDAO<Order> implements IDAO<Order>{
    public OrderDao() throws SQLException {}
    public static OrderDao instance;
    public static OrderDao getInstance() throws SQLException {
        if (instance == null) {
            instance = new OrderDao();
        }
        return instance;
    }
    Connection connection = DAOConnection.getConnection();


    @Override
    public boolean insert(Order order, String action, String ipAddress) throws SQLException {

        String sql = "INSERT INTO orders ( total_price, status, user_id, statusPayment, typeShip, address, shipCost, TypePayment, note) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";


            PreparedStatement pstmt = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setDouble(1, order.getTotal_price());
            pstmt.setString(2, order.getStatus());
            pstmt.setInt(3, Integer.parseInt(order.getUser().getId()));
            pstmt.setString(4, order.getStatusPayment());
            pstmt.setString(5, order.getTypeShip());
            pstmt.setString(6, (order.getAddress()==null)?"":order.getAddress());
            pstmt.setFloat(7, order.getShiping());
            pstmt.setString(8, (order.getTypePayment()==null)?"":order.getTypePayment());
            pstmt.setString(9, (order.getNote()!=null)?order.getNote():"");

            int rowsAffected = pstmt.executeUpdate();
        String idOrder = "";
        if(rowsAffected>0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()){
                    if(rs.next()) {
                         idOrder = rs.getString(1);
                    }
                }catch(SQLException e) {
                    e.printStackTrace();
                }
            }
        // insert order_details
        if(idOrder.equals("")) {
            return false;
        }
        for (Map.Entry<Product,Integer> entry : order.getProducts().entrySet()) {
            String sql2 = "INSERT INTO order_details(order_id,product_id,quantity_total,total_price)\n" +
                    "VALUES (?,?,?,?) ";
            PreparedStatement pstmt2 = connection.prepareStatement(sql2);
            pstmt2.setString(1,idOrder);
            pstmt2.setInt(2,  entry.getKey().getId());
            pstmt2.setInt(3, entry.getValue());
            Double totalPrice = entry.getValue()*entry.getKey().getPrice();
            pstmt2.setDouble(4, totalPrice);
            int rowsAffected2 = pstmt2.executeUpdate();

        }
        return rowsAffected > 0;
    }

    @Override
    public boolean update(Order order, String action, String ipAddress) throws SQLException {

        return false;
    }

    @Override
    public int delete(Order order, String action, String ipAddress) throws SQLException {
        return 0;
    }

    @Override
    public Order selectById(String id, String action, String ipAddress) throws SQLException {
        Order order = null;
        String sql = "SELECT o.id AS orderID ,o.total_price,o.`status`,o.statusPayment,o.typeShip,o.TypePayment,\n" +
                "                p.id AS product_id, p.product_name,p.price,\n" +
                "                od.quantity_total,                          \n" +
                "                i.img_main  FROM orders o\n" +
                "                JOIN order_details od ON o.id = od.order_id\n" +
                "                JOIN products p ON od.product_id = p.id\n" +
                "                JOIN product_image i ON p.image_product = i.id\n" +
                "                WHERE o.id = ?";

        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, id);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {

            String orderId = id;
            double totalPrice = rs.getDouble("total_price");
            String status = rs.getString("status");
            String statusPayment = rs.getString("statusPayment");
            int quantityTotal = rs.getInt("quantity_total");
            int idproduct = rs.getInt("product_id");
            double price = rs.getDouble("price");
            String productName = rs.getString("product_name");
            String imgMain = rs.getString("img_main");
            String typeShip = rs.getString("typeShip");
            String typePayment = rs.getString("TypePayment");
            if(order == null) {
                order = new Order();
                order.setId(Integer.parseInt(orderId));
                order.setTotal_price(totalPrice);
                order.setStatus(status);
                order.setStatusPayment(statusPayment);
                order.setTypeShip(typeShip);
                order.setTypePayment(typePayment);

                Product p = new Product();
                p.setId(idproduct);
                p.setName(productName);
                p.setImg_main(imgMain);
                p.setPrice(price);

                Map<Product , Integer> products = new HashMap<Product , Integer>();
                products.put(p, quantityTotal);

                order.setProducts(products);
            }else{
                Product p = new Product();
                p.setId(idproduct);
                p.setName(productName);
                p.setImg_main(imgMain);
                p.setPrice(price);
                order.getProducts().put(p, quantityTotal);
            }
        }
        return order;
    }

    @Override
    public Order selectByName(String name, String action, String ipAddress) throws SQLException {

        return null;
    }

    @Override
    public ArrayList<Order> selectAll() throws SQLException {
        return null;
    }

    public void updatePayment(Order order, String thanhToan, String remoteAddr) throws SQLException {
        String sql = "update orders set statusPayment=?, TypePayment=? , updated_at=CURRENT_TIMESTAMP() where id=?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, order.getStatusPayment());
        pstmt.setString(2, order.getTypePayment());
        pstmt.setInt(3, order.getId());
        pstmt.executeUpdate();
    }

    public int insertAndGetOrderID(Order order, String taoDonHang, String remoteAddr) throws SQLException {
        String sql = "INSERT INTO orders ( total_price, status, user_id, statusPayment, typeShip, address, shipCost, note) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?,  ?)";


        PreparedStatement pstmt = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);

        pstmt.setDouble(1, order.getTotal_price());
        pstmt.setString(2, order.getStatus());
        pstmt.setInt(3, Integer.parseInt(order.getUser().getId()));
        pstmt.setString(4, order.getStatusPayment());
        pstmt.setString(5, order.getTypeShip());
        pstmt.setString(6, (order.getAddress()==null)?"":order.getAddress());
        pstmt.setFloat(7, order.getShiping());
//        pstmt.setString(8, (order.getTypePayment()==null)?"":order.getTypePayment());
        pstmt.setString(8, (order.getNote()!=null)?order.getNote():"");

        int rowsAffected = pstmt.executeUpdate();
        String idOrder = "";
        if(rowsAffected>0) {
            try (ResultSet rs = pstmt.getGeneratedKeys()){
                if(rs.next()) {
                    idOrder = rs.getString(1);
                }
            }catch(SQLException e) {
                e.printStackTrace();
            }
        }
        // insert order_details
        if(idOrder.equals("")) {
            return -1;
        }
        for (Map.Entry<Product,Integer> entry : order.getProducts().entrySet()) {
            String sql2 = "INSERT INTO order_details(order_id,product_id,quantity_total,total_price)\n" +
                    "VALUES (?,?,?,?) ";
            PreparedStatement pstmt2 = connection.prepareStatement(sql2);
            pstmt2.setString(1,idOrder);
            pstmt2.setInt(2,  entry.getKey().getId());
            pstmt2.setInt(3, entry.getValue());
            Double totalPrice = entry.getValue()*entry.getKey().getPrice();
            pstmt2.setDouble(4, totalPrice);
            int rowsAffected2 = pstmt2.executeUpdate();
            if(rowsAffected2<=0) {
                return -1;
            }
        }
        return Integer.parseInt(idOrder);
    }

    public ArrayList<Order> selectOrderByidUser(String id, String type) throws SQLException {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT o.id AS orderID ,o.total_price,o.`status`,o.statusPayment,\n" +
                "od.quantity_total, \n" +
                "p.id AS product_id, p.product_name,p.price, \n" +
                "i.img_main  FROM orders o\n" +
                "JOIN order_details od ON o.id = od.order_id\n" +
                "JOIN products p ON od.product_id = p.id\n" +
                "JOIN product_image i ON p.image_product = i.id\n" +
                "WHERE o.user_id =  ?";
        if(!type.equals("")){
            if(type.equalsIgnoreCase("Chưa thanh toán") || type.equalsIgnoreCase("đã thanh toán")){
                sql += " AND o.statusPayment = ?";
            }else{
                sql += " AND o.status=?";
            }
        }
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, id);
        if(!type.equals("")){
            pstmt.setString(2, type);
        }
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()) {
        Order order = null;
            String orderId = rs.getString("orderID");
            double totalPrice = rs.getDouble("total_price");
            String status = rs.getString("status");
            String statusPayment = rs.getString("statusPayment");
            int quantityTotal = rs.getInt("quantity_total");
            int idproduct = rs.getInt("product_id");
            double price = rs.getDouble("price");
            String productName = rs.getString("product_name");
            String imgMain = rs.getString("img_main");
            if (!orderId.equals("")) {
                if(orders.size()<1 || orders.getLast().getId()!=Integer.parseInt(orderId)) {
                    order = new Order();
                    order.setId(Integer.parseInt(orderId));
                    order.setTotal_price(totalPrice);
                    order.setStatus(status);
                    order.setStatusPayment(statusPayment);

                    Product p = new Product();
                    p.setId(idproduct);
                    p.setName(productName);
                    p.setImg_main(imgMain);
                    p.setPrice(price);

                    Map<Product , Integer> products = new HashMap<Product , Integer>();
                    products.put(p, quantityTotal);

                    order.setProducts(products);

                    orders.add(order);

                }else{
                    order = orders.getLast();
                    Map<Product , Integer> products = order.getProducts();
                    Product p = new Product();
                    p.setId(idproduct);
                    p.setName(productName);
                    p.setImg_main(imgMain);
                    p.setPrice(price);
                    if(checkProductContai(products,p))
                        products.put(p, quantityTotal);
                }
            }
        }
        return orders;
    }

    private boolean checkProductContai(Map<Product, Integer> products, Product p) {
        for (Map.Entry<Product , Integer> entry : products.entrySet()) {
            if(entry.getKey().getId()!=p.getId()) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(OrderDao.getInstance().selectById("207","",""));
    }

}
