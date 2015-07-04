package com.hexor.common;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-02
 * Time: 16:33
 */
public class PostUser {
    private String username;
    private String password;

    public PostUser(String username, String password) {
        this.username = username;
        this.password = password;
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
}
