package service.manageUser.cart;

import dao.userDAO.ProductDao;

import java.sql.SQLException;

public class CartService {
//    public static void addProduct(Product product) {
//        boolean productExists = false;
//
//        for (Product item : Cart.products) {
//            if (item.getProductName().equalsIgnoreCase(product.getProductName())) {
//                productExists = true;
//                break;
//            }
//        }
//
//        if (!productExists) {
//            Cart.addProduct(product);
//        }
//    }
//
//
//
//
//    public static void removeProduct(Product product) {
//        for (Product item : Cart.products) {
//            if (item.getProductName().equalsIgnoreCase(product.getProductName())) {
//                Cart.removeProduct(item);
//                return;
//            }
//        }
//    }
    //kiểm tra số lượng trước khi mua
    public boolean checkExistQuantittyItem(String nameproduct) throws SQLException {
        ProductDao productDao=new ProductDao();
       return  productDao.checkExistQuantityItem(nameproduct);
    }
}
