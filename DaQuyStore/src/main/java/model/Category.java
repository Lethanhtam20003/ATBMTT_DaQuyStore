package model;

import java.util.Date;
import java.util.List;

public class Category {
    private int id ;
    private String category_name;
    private Date create_at;
    private Date update_at;
    private Date delete_at;
    private String status;
    private String img;

    private List<Product> productOfCate;

    public Category(int id, String category_name, Date create_at, Date update_at, Date delete_at, String status, String img, List<Product> productOfCate) {
        this.id = id;
        this.category_name = category_name;
        this.create_at = create_at;
        this.update_at = update_at;
        this.delete_at = delete_at;
        this.status = status;
        this.img = img;
        this.productOfCate = productOfCate;
    }

    public Category(int id, String category_name, Date create_at, Date update_at, Date delete_at, String status, String img) {
        this.id = id;
        this.category_name = category_name;
        this.create_at = create_at;
        this.update_at = update_at;
        this.delete_at = delete_at;
        this.status = status;
        this.img = img;
    }

    public Category() {

    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId(){return id;}

    public void setId(int id){this.id = id;}

    public List<Product> getProductOfCate() {
        return productOfCate;
    }

    public void setProductOfCate(List<Product> productOfCate) {
        this.productOfCate = productOfCate;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", category_name='" + category_name + '\'' +
                ", create_at=" + create_at +
                ", update_at=" + update_at +
                ", delete_at=" + delete_at +
                ", status='" + status + '\'' +
                '}';
    }
}
