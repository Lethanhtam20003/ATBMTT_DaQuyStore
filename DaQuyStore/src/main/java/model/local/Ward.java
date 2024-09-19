package model.local;

public class Ward {
    private String id;
    private String wardName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public Ward(String id, String wardName) {
        this.id = id;
        this.wardName = wardName;
    }

    @Override
    public String toString() {
        return "Ward{" +
                "id='" + id + '\'' +
                ", wardName='" + wardName + '\'' +
                '}';
    }
}
