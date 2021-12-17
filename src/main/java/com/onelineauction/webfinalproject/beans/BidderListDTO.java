package com.onelineauction.webfinalproject.beans;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class BidderListDTO {
    //User
    private int id;
    private String username,password,HoTen,Email,DiaChi;
    private LocalDate NgaySinh;
    private int DiemUyTin, Quyen;
    //Dau gia
    String IDSanPham;
    int LuotDauGia;
    double GiaDat;
    int IDNguoiDatGia;
    private LocalDate ThoiGian;
    //Product

    public LocalDate getThoiGian() {
        return ThoiGian;
    }

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

    public BidderListDTO(int id, String username, String password, String hoTen, String email, String diaChi, LocalDate ngaySinh, int diemUyTin, int quyen, String IDSanPham, int luotDauGia, double giaDat, int IDNguoiDatGia, String tenSanPham, int IDNguoiBan, double giaHienTai, double giaMuaNgay, double buocGia, int IDDanhMuc, int IDNguoiGiuGiaHienTai, DateTimeFormatter thoiGianDangBan, DateTimeFormatter thoiGianKetThuc, String chiTiet, String anhChinh, String anhPhu) {
        this.id = id;
        this.username = username;
        this.password = password;
        HoTen = hoTen;
        Email = email;
        DiaChi = diaChi;
        NgaySinh = ngaySinh;
        DiemUyTin = diemUyTin;
        Quyen = quyen;
        this.IDSanPham = IDSanPham;
        LuotDauGia = luotDauGia;
        GiaDat = giaDat;
        this.IDNguoiDatGia = IDNguoiDatGia;
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

    public BidderListDTO() {

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

    public String getHoTen() {
        return HoTen;
    }

    public String getEmail() {
        return Email;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public LocalDate getNgaySinh() {
        return NgaySinh;
    }

    public int getDiemUyTin() {
        return DiemUyTin;
    }

    public int getQuyen() {
        return Quyen;
    }

    public String getIDSanPham() {
        return IDSanPham;
    }

    public int getLuotDauGia() {
        return LuotDauGia;
    }

    public double getGiaDat() {
        return GiaDat;
    }

    public int getIDNguoiDatGia() {
        return IDNguoiDatGia;
    }
}
