package model.modelAdmin;
import java.util.Date;

public class AdminInventory {
    private int id;
    private Date date;
    private AdminUser user;

    public AdminInventory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public AdminUser getUser() {
        return user;
    }

    public void setUser(AdminUser user) {
        this.user = user;
    }
}
