package com.onelineauction.webfinalproject.beans;

import java.time.LocalDate;


public class User {
    private int id;
    private String username,password,name,email,address;
    private LocalDate dob;
    private int level;
    public User()
    {

    }

    public String getAddress() {
        return address;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public LocalDate getDob() {
        return dob;
    }

    public int getLevel() {
        return level;
    }
    public User(int id, String username, String password, String name, String email, String address, LocalDate dob, int level) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.address = address;
        this.dob = dob;
        this.level = level;
    }
}

