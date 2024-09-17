package model;

import java.sql.Timestamp;
import java.util.Map;

public class Order implements IModel {
//    thong tin don hang
    private int id;
    private Timestamp created_at;
    private Timestamp updated_at;
    private double total_price;
    private String status;
//    hong tin nguoi dung
    private User User;
//    chi tiep asn pham
    private Map<Product, Integer> products;

//    ship
    private String typeShip;// ship / tu di lay
    private final int shiping = 20000;
    private String address;
//    thong tin thanh toan
    private String typePayment;// thanh toan khi nhan, chuyen khoan truoc
    private String statusPayment;// chua thanh toan , hoan thanh thanh toan
//  ghi chu
    private String note;

    public Order(){}
    public Order(model.User user, Map<Product,Integer> products, String status) {
        this.id = id;
        this.User = user;
        this.products = products;
        this.total_price = getTotalPrice(products);
        this.status = status;
    }

    public double getTotalPrice(Map<Product, Integer> products) {
        double result = 0;
        for (Map.Entry<Product, Integer> entry : products.entrySet()) {
            result += entry.getValue() * entry.getKey().getPrice();
        }
        return result - shiping;
    }
    @Override
    public String getTable() {
        return "";
    }

    @Override
    public String getDataBefore() {
        return "";
    }

    @Override
    public String getDataAfter() {
        return "";
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public model.User getUser() {
        return User;
    }

    public void setUser(model.User user) {
        User = user;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public Map<Product, Integer> getProducts() {
        return products;
    }

    public void setProducts(Map<Product, Integer> products) {
        this.products = products;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getTypeShip() {
        return typeShip;
    }


    public void setTypeShip(String typeShip) {
        this.typeShip = typeShip;
    }

    public int getShiping() {
        return shiping;
    }

    public String getTypePayment() {
        return typePayment;
    }

    public void setTypePayment(String typePayment) {
        this.typePayment = typePayment;
    }

    public String getStatusPayment() {
        return statusPayment;
    }

    public void setStatusPayment(String statusPayment) {
        this.statusPayment = statusPayment;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                ", total_price=" + total_price +
                ", status='" + status + '\'' +
                ", User=" + User +
                ", products=" + products +
                ", typeShip='" + typeShip + '\'' +
                ", shiping=" + shiping +
                ", address='" + address + '\'' +
                ", typePayment='" + typePayment + '\'' +
                ", statusPayment='" + statusPayment + '\'' +
                ", note='" + note + '\'' +
                "} \n *** \n";
    }
}
