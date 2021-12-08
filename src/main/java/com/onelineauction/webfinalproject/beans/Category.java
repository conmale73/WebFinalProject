package com.onelineauction.webfinalproject.beans;

public class Category {
    private int IDDanhMuc;
    private String TenDanhMuc;

    public Category(){

    }

    public Category(int ID, String TenDM){
        this.IDDanhMuc = ID;
        this.TenDanhMuc = TenDM;
    }

    public int getIDDanhMuc() {
        return IDDanhMuc;
    }

    public void setIDDanhMuc(int IDDanhMuc) {
        this.IDDanhMuc = IDDanhMuc;
    }

    public String getTenDanhMuc() {
        return TenDanhMuc;
    }

    public void setTenDanhMuc(String tenDanhMuc) {
        TenDanhMuc = tenDanhMuc;
    }
}
