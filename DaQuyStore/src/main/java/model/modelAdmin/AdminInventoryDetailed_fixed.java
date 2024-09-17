package model.modelAdmin;

public class AdminInventoryDetailed_fixed {
    private int id;
    private String product_name;
    private int sell_quantity;
    private int imported_quantity;

    public AdminInventoryDetailed_fixed() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getSell_quantity() {
        return sell_quantity;
    }

    public void setSell_quantity(int sell_quantity) {
        this.sell_quantity = sell_quantity;
    }

    public int getImported_quantity() {
        return imported_quantity;
    }

    public void setImported_quantity(int imported_quantity) {
        this.imported_quantity = imported_quantity;
    }

    @Override
    public String toString() {
        return "AdminInventoryDetailed_fixed{" +
                "id=" + id +
                ", product_name='" + product_name + '\'' +
                ", sell_quantity=" + sell_quantity +
                ", imported_quantity=" + imported_quantity +
                '}';
    }
}
