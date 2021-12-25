package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;

public class DauGiaModel {
    public static void deleteSanPhamDauGia(String id)
    {
        String sql = "delete from daugia where IDSanPham = :ID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ID", id)
                    .executeUpdate();
        }
    }
}
