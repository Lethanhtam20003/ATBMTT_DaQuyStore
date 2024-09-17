package model.modelAdmin;

public class AdminSummary_fixed {
    private int month;
    private long summary;

    public AdminSummary_fixed() {
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public long getSummary() {
        return summary;
    }

    public void setSummary(long summary) {
        this.summary = summary;
    }

    @Override
    public String toString() {
        return "AdminSummary_fixed{" +
                "month=" + month +
                ", summary=" + summary +
                '}';
    }
}
