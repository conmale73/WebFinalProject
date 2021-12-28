package com.onelineauction.webfinalproject.beans;

import java.time.format.DateTimeFormatter;
import java.util.Date;

public class ProductForFindID {
    private String IDSanPham;
    private String TenSanPham;
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
    private int TGcon;
    private int TGconH;
    private int TGconS;

    public ProductForFindID(){

    }

    public ProductForFindID(String IDSanPham, String tenSanPham, int IDNguoiBan, double giaHienTai, double giaMuaNgay, double buocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, Date thoiGianDangBan, Date thoiGianKetThuc, String chiTiet, String anhChinh, String anhPhu, int TGcon, int TGconH, int TGconS) {
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
        this.TGcon = TGcon;
        this.TGconH = TGconH;
        this.TGconS = TGconS;
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

    public int getTGcon() {
        return TGcon;
    }

    public int getTGconH() {
        return TGconH;
    }

    public int getTGconS() {
        return TGconS;
    }

}
