package model.modelAdmin;

import java.sql.Timestamp;

public class AdminLog {
    int id;
    String ipaddress;
    String prevValue;
    String currentValue;
    Timestamp created_at;
    String level;

    public AdminLog() {

    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public AdminLog(String prevValue, String currentValue) {
        this.prevValue = prevValue;
        this.currentValue = currentValue;
    }

    public AdminLog(int id, String ipaddress, String prevValue, String currentValue, Timestamp created_at, String level) {
        this.id = id;
        this.ipaddress = ipaddress;
        this.prevValue = prevValue;
        this.currentValue = currentValue;
        this.created_at = created_at;
        this.level = level;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getPrevValue() {
        return prevValue;
    }

    public void setPrevValue(String prevValue) {
        this.prevValue = prevValue;
    }

    public String getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(String currentValue) {
        this.currentValue = currentValue;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "AdminLog{" +
                "id=" + id +
                ", ipaddress='" + ipaddress + '\'' +
                ", prevValue='" + prevValue + '\'' +
                ", currentValue='" + currentValue + '\'' +
                ", created_at=" + created_at +
                ", level='" + level + '\'' +
                '}';
    }

}

