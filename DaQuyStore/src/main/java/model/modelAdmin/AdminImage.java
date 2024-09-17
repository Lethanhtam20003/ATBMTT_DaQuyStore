package model.modelAdmin;

public class AdminImage {
    private int id;
    private String product_name;
    private String img_main;
    private String img_1;
    private String img_2;
    private String img_3;
    private String img_4;

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg_main() {
        return img_main;
    }

    public void setImg_main(String img_main) {
        this.img_main = img_main;
    }

    public String getImg_1() {
        return img_1;
    }

    public void setImg_1(String img_1) {
        this.img_1 = img_1;
    }

    public String getImg_2() {
        return img_2;
    }

    public void setImg_2(String img_2) {
        this.img_2 = img_2;
    }

    public String getImg_3() {
        return img_3;
    }

    public void setImg_3(String img_3) {
        this.img_3 = img_3;
    }

    public String getImg_4() {
        return img_4;
    }

    public void setImg_4(String img_4) {
        this.img_4 = img_4;
    }

    @Override
    public String toString() {
        return "AdminImage{" +
                "id=" + id +
                ", product_name='" + product_name + '\'' +
                ", img_main='" + img_main + '\'' +
                ", img_1='" + img_1 + '\'' +
                ", img_2='" + img_2 + '\'' +
                ", img_3='" + img_3 + '\'' +
                ", img_4='" + img_4 + '\'' +
                '}';
    }
}
