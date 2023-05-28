package com.aturstudio.dto.user;

/**
 * @author Fan Yunlong
 * @create 2018/7/5 上午 3:18
 * @update 2018/7/5 上午 3:18
 */
public class UserDTO {
    private String userId;
    private String userName;
    private String password;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
