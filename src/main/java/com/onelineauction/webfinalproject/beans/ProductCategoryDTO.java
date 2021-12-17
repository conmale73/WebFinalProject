package com.onelineauction.webfinalproject.beans;

import java.time.format.DateTimeFormatter;

public class ProductCategoryDTO {
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

    private String TenDanhMuc;

    public String getIDSanPham() {
        return IDSanPham;
    }

    public String getTenSanPham() {
        return TenSanPham;
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

    public String getTenDanhMuc() {
        return TenDanhMuc;
    }
}
