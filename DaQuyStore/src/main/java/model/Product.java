package model;

import java.util.Date;
import java.util.Map;

public class Product implements IModel{
    private int id;
    private String category;
    private String name;
    private double price;
    private int quantity;
    private String status;
    private int sale;
    private int hot;
    private String description;
    private Date create_at;
    private Date update_at;
    private Date delete_at;
    private Map<String,String> infor;
    private String img_main;
    private String img_extra1;
    private String img_extra2;
    private String img_extra3;
    private String img_extra4;
    private String status_deleted;

    public Product(int id, String category, String name, double price, String status, int sale, int hot, String description, Map<String, String> infor, Date create_at, Date update_at, Date delete_at, String img_main, String img_extra1, String img_extra2, String img_extra3, String img_extra4) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.price = price;
        this.status = status;
        this.sale = sale;
        this.hot = hot;
        this.description = description;
        this.create_at = create_at;
        this.update_at = update_at;
        this.delete_at = delete_at;
        this.infor = infor;
        this.img_main = img_main;
        this.img_extra1 = img_extra1;
        this.img_extra2 = img_extra2;
        this.img_extra3 = img_extra3;
        this.img_extra4 = img_extra4;

    }

    public Product(int id, String name, double price, String img_main) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.price = price;
        this.img_main = img_main;
    }
    public Product(int id, String category, String name, double price, String status, int sale, int hot, String description, Map<String, String> infor, Date create_at, Date update_at, Date delete_at, String img_main) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.price = price;
        this.status = status;
        this.sale = sale;
        this.hot = hot;
        this.description = description;
        this.infor = infor;
        this.create_at = create_at;
        this.update_at = update_at;
        this.delete_at = delete_at;
        this.img_main = img_main;
    }

    public Product(int id, String categoryId, String productName, double price, String imgMain) {
        this.id = id;
        this.category = categoryId;
        this.name = productName;
        this.price = price;
        this.img_main = imgMain;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return null;
    }

    public String getCategory_id() {
        return this.category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public Date getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }

    public Date getDelete_at() {
        return delete_at;
    }

    public void setDelete_at(Date delete_at) {
        this.delete_at = delete_at;
    }

    public Map<String, String> getInfor() {
        return infor;
    }

    public void setInfor(Map<String, String> infor) {
        this.infor = infor;
    }

    public String getImg_main() {
        return img_main;
    }

    public void setImg_main(String img_main) {
        this.img_main = img_main;
    }

    public String getImg_extra1() {
        return img_extra1;
    }

    public void setImg_extra1(String img_extra1) {
        this.img_extra1 = img_extra1;
    }

    public String getImg_extra2() {
        return img_extra2;
    }

    public void setImg_extra2(String img_extra2) {
        this.img_extra2 = img_extra2;
    }

    public String getImg_extra3() {
        return img_extra3;
    }

    public void setImg_extra3(String img_extra3) {
        this.img_extra3 = img_extra3;
    }

    public String getImg_extra4() {
        return img_extra4;
    }

    public void setImg_extra4(String img_extra4) {
        this.img_extra4 = img_extra4;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", category='" + category + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", status='" + status + '\'' +
                ", sale=" + sale +
                ", quantity=" + quantity +
                ", hot=" + hot +
                ", description='" + description + '\'' +
                ", create_at=" + create_at +
                ", update_at=" + update_at +
                ", delete_at=" + delete_at +
                ", infor=" + infor +
                ", img_main='" + img_main + '\'' +
                ", img_extra1='" + img_extra1 + '\'' +
                ", img_extra2='" + img_extra2 + '\'' +
                ", img_extra3='" + img_extra3 + '\'' +
                ", img_extra4='" + img_extra4 + '\'' +
                "} \n";
    }

    @Override
    public String getTable() {
        return "product";
    }

    @Override
    public String getDataBefore() {
        return "";
    }

    @Override
    public String getDataAfter() {
        return "";
    }
}