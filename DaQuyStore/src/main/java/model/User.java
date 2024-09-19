package model;

import com.google.gson.Gson;

import java.sql.Date;

public class User implements IModel {
    private String id;
    private String username;
    private String password;
    private String fullName;
    private String gender;
    private Date birthday;
    private String email;
    private String phoneNumber;
    private String address;
    private String avatar;
    private Date createAt;
    private Date updateAt;
    private Date deleteAt;
    private String role;
    private String status;
    private String typeLogin;

    private User data;
    private Gson gson = new Gson();
    private int count = 0;

    public User() {}

    public User(String id, String username, String password, String fullName, String gender, Date birthday, String email, String phoneNumber, String address, String avatar, Date createAt, Date updateAt, Date deleteAt, String role, String status, String typeLogin) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.avatar = avatar;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.deleteAt = deleteAt;
        this.role = role;
        this.status = status;
        this.typeLogin = typeLogin;
        setData();
    }



    private void setData() {
        this.data = this;
    }

    public User(String username, String password, String email, String typeLogin, String avatar, String fullname) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = "user";
        this.typeLogin = typeLogin;
        this.avatar = avatar;
        this.fullName = fullname;
        setData();
    }

    public User(String username, String password, String email, String typeLogin) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = "user";
        this.typeLogin = typeLogin;
        this.avatar = "/DaQuyStore_war/img/avatar.png";
//        https://hinhnen4k.com/wp-content/uploads/2023/03/avatar-vo-danh-4.jpg
        setData();
    }

    public String getUsername() {
        return username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        count++;
    }

    public String getusername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
        count++;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
        count++;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
        count++;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
        count++;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
        count++;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
        count++;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
        count++;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
        count++;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
        count++;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
        count++;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
        count++;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
        count++;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
        count++;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
        count++;
    }

    public String getTypeLogin() {
        return typeLogin;
    }

    public void setTypeLogin(String typeLogin) {
        this.typeLogin = typeLogin;
        count++;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", fullName='" + fullName + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", avatar='" + avatar + '\'' +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                ", deleteAt=" + deleteAt +
                ", role='" + role + '\'' +
                ", status='" + status + '\'' +
                ", typeLogin='" + typeLogin + '\'' +
                '}';
    }

    @Override
    public String getTable() {
        return "User";
    }
    @Override
    public String getDataBefore() {
        if(count==0)
            return null;
        // chuyen du lieu cu sang json
        String dataBefore = gson.toJson(data);
        // gan du lieu moi thay doi
        data = this;
        return  dataBefore;
    }

    @Override
    public String getDataAfter() {
        return gson.toJson(data);
    }
}
