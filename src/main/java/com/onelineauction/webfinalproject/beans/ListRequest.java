package com.onelineauction.webfinalproject.beans;

import java.time.LocalDate;

public class ListRequest {
    private int id;
    private  LocalDate ThoiGian;//Thời gian tính từ lúc người dùng gửi request
    private int request;//
    private int xacnhan;

    public int getId() {
        return id;
    }

    public LocalDate getThoiGian() {
        return ThoiGian;
    }

    public int getXacnhan() {
        return xacnhan;
    }

    public ListRequest(int id, LocalDate thoiGian, int request, int xacnhan) {
        this.id = id;
        ThoiGian = thoiGian;
        this.request = request;
        this.xacnhan = xacnhan;
    }

    public int getRequest() {
        return request;
    }


}
