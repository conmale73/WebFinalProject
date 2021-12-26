package com.onelineauction.webfinalproject.beans;

import java.time.format.DateTimeFormatter;

public class ProductForNew {
    private String IDSanPham;
    private String TenSanPham;
    private int IDNguoiBan;
    private double GiaHienTai;
    private double GiaMuaNgay;
    private double BuocGia;
    private int IDDanhMuc;
    private int IDNguoiGiuGiaHienTai;
    private DateTimeFormatter ThoiGianDangBan;
    private DateTimeFormatter ThoiGianKetThuc;
    private String ChiTiet;
    private String AnhChinh;
    private String AnhPhu;
    private int neworold;

    public ProductForNew(){

    }

    public ProductForNew(String IDSanPham, String tenSanPham, int IDNguoiBan, double giaHienTai, double giaMuaNgay, double buocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, DateTimeFormatter thoiGianDangBan, DateTimeFormatter thoiGianKetThuc, String chiTiet, String anhChinh, String anhPhu, int neworold) {
        this.IDSanPham = IDSanPham;
        TenSanPham = tenSanPham;
        this.IDNguoiBan = IDNguoiBan;
        GiaHienTai = giaHienTai;
        GiaMuaNgay = giaMuaNgay;
        BuocGia = buocGia;
        this.IDDanhMuc = IDDanhMuc;
        this.IDNguoiGiuGiaHienTai = IDNguoiGiuGiaHienTai;
        ThoiGianDangBan = thoiGianDangBan;
        ThoiGianKetThuc = thoiGianKetThuc;
        ChiTiet = chiTiet;
        AnhChinh = anhChinh;
        AnhPhu = anhPhu;
        this.neworold = neworold;
    }




    public String getTenSanPham() {
        return TenSanPham;
    }

    public String getIDSanPham() {
        return IDSanPham;
    }

    public int getIDNguoiBan() {
        return IDNguoiBan;
    }

    public double getGiaHienTai() {
        return GiaHienTai;
    }

    public double getGiaMuaNgay() {
        return GiaMuaNgay;
    }

    public double getBuocGia() {
        return BuocGia;
    }

    public int getIDDanhMuc() {
        return IDDanhMuc;
    }

    public int getIDNguoiGiuGiaHienTai() {
        return IDNguoiGiuGiaHienTai;
    }

    public DateTimeFormatter getThoiGianDangBan() {
        return ThoiGianDangBan;
    }

    public DateTimeFormatter getThoiGianKetThuc() {
        return ThoiGianKetThuc;
    }

    public String getChiTiet() {
        return ChiTiet;
    }

    public String getAnhChinh() {
        return AnhChinh;
    }

    public String getAnhPhu() {
        return AnhPhu;
    }

    public int getNeworold() { return neworold; }
}
