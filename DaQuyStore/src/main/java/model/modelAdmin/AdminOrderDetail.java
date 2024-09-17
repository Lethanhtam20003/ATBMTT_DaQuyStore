package model.modelAdmin;

public class AdminOrderDetail {
    private int id;
    private String status;

    public AdminOrderDetail(int id, String status) {
        this.id = id;
        this.status = status;
    }
    public AdminOrderDetail(){

    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AdminOrderDetail{" +
                "id=" + id +
                ", status='" + status + '\'' +
                '}';
    }
}
