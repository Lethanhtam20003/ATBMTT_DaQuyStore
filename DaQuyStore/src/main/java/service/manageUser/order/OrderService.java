package service.manageUser.order;

import java.text.NumberFormat;
import java.util.Locale;

public class OrderService {
    public OrderService() {}

    private static OrderService instance;
    public static OrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }

    public String formatNumber(double price){
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormatter.format(price);
    }
}
