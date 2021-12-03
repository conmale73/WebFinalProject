package com.onelineauction.webfinalproject.beans;

import java.time.LocalDate;


public class User {
    private int id;
    private String username,password,HoTen,Email,DiaChi;
    private LocalDate NgaySinh;
    private int DiemUyTin, Quyen;
    public User()
    {

    }

    public String getAddress() {
        return DiaChi;
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
        return HoTen;
    }

    public String getEmail() {
        return Email;
    }

    public LocalDate getDob() {
        return NgaySinh;
    }

    public int getLevel() {
        return Quyen;
    }

    public int getDiemUyTin() {
        return DiemUyTin;
    }

    public User(int id, String username, String password, String name, LocalDate NgaySinh,String address,String email,int DiemUyTin, int level) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.HoTen = name;
        this.NgaySinh = NgaySinh;
        this.DiaChi = address;
        this.Email = email;
        this.DiemUyTin = DiemUyTin;
        this.Quyen = level;
    }
}

