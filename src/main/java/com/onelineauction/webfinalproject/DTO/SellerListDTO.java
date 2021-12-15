package com.onelineauction.webfinalproject.DTO;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class SellerListDTO {
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
    private int ID;
    private String username;
    private String password;
    private String HoTen;
    private LocalDate NgaySinh;
    private String DiaChi;
    private String Email;
    private int DiemUyTin;
    private int Quyen;
    public SellerListDTO() {

    }

    public SellerListDTO(String IDSanPham, String tenSanPham, int IDNguoiBan, double giaHienTai, double giaMuaNgay, double buocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, DateTimeFormatter thoiGianDangBan, DateTimeFormatter thoiGianKetThuc, String chiTiet, String anhChinh, String anhPhu, int ID, String username, String password, String hoTen, LocalDate ngaySinh, String diaChi, String email, int diemUyTin, int quyen) {
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
        this.ID = ID;
        this.username = username;
        this.password = password;
        HoTen = hoTen;
        NgaySinh = ngaySinh;
        DiaChi = diaChi;
        Email = email;
        DiemUyTin = diemUyTin;
        Quyen = quyen;
    }

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

    public int getID() {
        return ID;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getHoTen() {
        return HoTen;
    }

    public LocalDate getNgaySinh() {
        return NgaySinh;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public String getEmail() {
        return Email;
    }

    public int getDiemUyTin() {
        return DiemUyTin;
    }

    public int getQuyen() {
        return Quyen;
    }
}
