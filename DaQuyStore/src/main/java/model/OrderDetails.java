package model;

import java.util.Date;

public class OrderDetails {
    private int id,product_id,order_id,quantity_total;
    private double price_total;
    private Date created_at,updated_at;
    private String status;


    public OrderDetails() {
    }

    public OrderDetails(int id, int product_id, int order_id, int quantity_total, double price_total, Date created_at, Date updated_at, String status) {
        this.id = id;
        this.product_id = product_id;
        this.order_id = order_id;
        this.quantity_total = quantity_total;
        this.price_total = price_total;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getQuantity_total() {
        return quantity_total;
    }

    public void setQuantity_total(int quantity_total) {
        this.quantity_total = quantity_total;
    }

    public double getPrice_total() {
        return price_total;
    }

    public void setPrice_total(double price_total) {
        this.price_total = price_total;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
