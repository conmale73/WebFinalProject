package com.onelineauction.webfinalproject.beans;

public class DauGia {
    String IDSanPham;
    int LuotDauGia;
    double GiaDat;
    int IDNguoiDatGia;

    public DauGia(String IDSanPham, int luotDauGia, double giaDat, int IDNguoiDatGia) {
        this.IDSanPham = IDSanPham;
        LuotDauGia = luotDauGia;
        GiaDat = giaDat;
        this.IDNguoiDatGia = IDNguoiDatGia;
    }

    public String getIDSanPham() {
        return IDSanPham;
    }

    public void setIDSanPham(String IDSanPham) {
        this.IDSanPham = IDSanPham;
    }

    public int getLuotDauGia() {
        return LuotDauGia;
    }

    public void setLuotDauGia(int luotDauGia) {
        LuotDauGia = luotDauGia;
    }

    public double getGiaDat() {
        return GiaDat;
    }

    public void setGiaDat(double giaDat) {
        GiaDat = giaDat;
    }

    public int getIDNguoiDatGia() {
        return IDNguoiDatGia;
    }

    public void setIDNguoiDatGia(int IDNguoiDatGia) {
        this.IDNguoiDatGia = IDNguoiDatGia;
    }

    public DauGia() {

    }
}



