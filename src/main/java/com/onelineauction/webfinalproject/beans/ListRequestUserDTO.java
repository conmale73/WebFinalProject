package com.onelineauction.webfinalproject.beans;

import java.time.LocalDate;

public class ListRequestUserDTO {
    private int id;
    private LocalDate ThoiGian;
    private int request;
    private int xacnhan;
    private LocalDate NgaySinh;
    private String HoTen;

    public int getId() {
        return id;
    }

    public LocalDate getThoiGian() {
        return ThoiGian;
    }

    public int getRequest() {
        return request;
    }

    public int getXacnhan() {
        return xacnhan;
    }

    public LocalDate getNgaySinh() {
        return NgaySinh;
    }

    public String getHoTen() {
        return HoTen;
    }

    public ListRequestUserDTO(int id, LocalDate thoiGian, int request, int xacnhan, LocalDate ngaySinh, String hoTen) {
        this.id = id;
        ThoiGian = thoiGian;
        this.request = request;
        this.xacnhan = xacnhan;
        NgaySinh = ngaySinh;
        HoTen = hoTen;
    }
}
