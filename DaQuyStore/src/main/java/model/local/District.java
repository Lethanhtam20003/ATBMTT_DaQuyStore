package model.local;

public class District {
    private int districtID;
    private String districtName;

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public District(int districtID, String districtName) {
        this.districtID = districtID;
        this.districtName = districtName;
    }

    @Override
    public String toString() {
        return "District{" +
                "districtID=" + districtID +
                ", districtName='" + districtName + '\'' +
                '}';
    }
}
