package com.chatRobot.model;

import java.util.Date;

/**
 * @author Uxiahnan OR 14027
 * @version Dragon1.0
 * @createTime 2018年12月30日19时17分
 * @desciption This is a program.
 * @since Java10
 */
public class User {
    private int userid;
    private String username;
    private String password;
    private int phone;
    private String email;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
