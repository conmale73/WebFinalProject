package com.onelineauction.webfinalproject.beans;

import java.time.format.DateTimeFormatter;

public class Product {
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

    public Product(){

    }

    public Product(String IDSanPham, String tenSanPham, int IDNguoiBan, double giaHienTai, double giaMuaNgay, double buocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, DateTimeFormatter thoiGianDangBan, DateTimeFormatter thoiGianKetThuc, String chiTiet, String anhChinh, String anhPhu) {
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
    }

    //    public Product(String IDSanPham, int IDNguoiBan, double GiaHienTai, double GiaMuaNgay, double BuocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, DateTimeFormatter ThoiGianDangBan, DateTimeFormatter ThoiGianKetThuc, String ChiTiet, String AnhChinh, String AnhPhu){
//        this.IDSanPham = IDSanPham;
//        this.IDNguoiBan = IDNguoiBan;
//        this.GiaHienTai = GiaHienTai;
//        this.GiaMuaNgay = GiaMuaNgay;
//        this.BuocGia = BuocGia;
//        this.IDDanhMuc = IDDanhMuc;
//        this.IDNguoiGiuGiaHienTai = IDNguoiGiuGiaHienTai;
//        this.ThoiGianDangBan = ThoiGianDangBan;
//        this.ThoiGianKetThuc = ThoiGianKetThuc;
//        this.ChiTiet = ChiTiet;
//        this.AnhChinh = AnhChinh;
//        this.AnhPhu = AnhPhu;
//    }


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
}
