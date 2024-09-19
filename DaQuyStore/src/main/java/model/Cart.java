package model;


public class Cart extends Product {
    private int quantity;

    public Cart() {

    }

    public Cart(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public int getQuantity() {
        return quantity;
    }

    @Override
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "quantity=" + quantity +
                '}';
    }
}