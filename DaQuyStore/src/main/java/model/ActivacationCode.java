package model;

public class ActivacationCode {
    private String activationCode;
    private String username;
    private String password;
    private String email;
    public ActivacationCode(String activationCode, String username, String password, String email) {
        this.activationCode = activationCode;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public ActivacationCode() {
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }


}
