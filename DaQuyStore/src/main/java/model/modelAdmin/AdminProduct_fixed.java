package model.modelAdmin;

public class AdminProduct_fixed {
    private int id;
    private String category;
    private String product_name;
    private int price;
    private String status;
    private int sale;
    private int hot;

    public AdminProduct_fixed() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getPrice() {
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

    @Override
    public String toString() {
        return "AdminProduct_fixed{" +
                "id=" + id +
                ", category='" + category + '\'' +
                ", product_name='" + product_name + '\'' +
                ", price=" + price +
                ", status='" + status + '\'' +
                ", sale=" + sale +
                ", hot=" + hot +
                '}';
    }
}
