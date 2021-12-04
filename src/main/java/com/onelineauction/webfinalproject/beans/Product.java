package com.onelineauction.webfinalproject.beans;

import javax.xml.crypto.Data;
import java.sql.Date;
import java.time.format.DateTimeFormatter;

public class Product {
    private String IDSanPham;
    private int IDNguoiBan;
    private double GiaHienTai;
    private double GiaMuaNgay;
    private double BuocGia;
    private int IDDanhMuc;
    private int IDNguoiGiuGiaHienTai;
    private Date ThoiGianDangBan;
    private Date ThoiGianKetThuc;
    private String ChiTiet;
    private String AnhChinh;
    private String AnhPhu;

    public Product(){

    }

    public Product(String IDSanPham, int IDNguoiBan, double GiaHienTai, double GiaMuaNgay, double BuocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, Date ThoiGianDangBan, Date ThoiGianKetThuc, String ChiTiet, String AnhChinh, String AnhPhu){
        this.IDSanPham = IDSanPham;
        this.IDNguoiBan = IDNguoiBan;
        this.GiaHienTai = GiaHienTai;
        this.GiaMuaNgay = GiaMuaNgay;
        this.BuocGia = BuocGia;
        this.IDDanhMuc = IDDanhMuc;
        this.IDNguoiGiuGiaHienTai = IDNguoiGiuGiaHienTai;
        this.ThoiGianDangBan = ThoiGianDangBan;
        this.ThoiGianKetThuc = ThoiGianKetThuc;
        this.ChiTiet = ChiTiet;
        this.AnhChinh = AnhChinh;
        this.AnhPhu = AnhPhu;
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

    public Date getThoiGianDangBan() {
        return ThoiGianDangBan;
    }

    public Date getThoiGianKetThuc() {
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
