package com.onelineauction.webfinalproject.models;

import java.util.List;

import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;
import com.onelineauction.webfinalproject.beans.DauGia;

public class DauGiaModel {
    public static void deleteSanPhamDauGia(String id) {
        String sql = "delete from daugia where IDSanPham =: ID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ID", id)
                    .executeUpdate();
        }
    }

    public static DauGia findByID (String id){
        final String query = "select * from daugia where IDSanPham = :IDSanPham";
        try (Connection con = DbUtils.getConnection()) {
            List<DauGia> list = con.createQuery(query)
                    .addParameter("IDSanPham", id)
                    .executeAndFetch(DauGia.class);

            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static List<DauGia> findAllByID(String id) {
        final String query =
                "SELECT * FROM daugia where IDSanPham = :IDSanPham";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("IDSanPham", id)
                    .executeAndFetch(DauGia.class);
        }
    }

    public static DauGia luotDauGiaCuoiCung(String id){
        String query = "SELECT *\n" +
                "FROM daugia\n" +
                "WHERE LuotDauGia=(SELECT MAX(LuotDauGia) FROM daugia WHERE IDSanPham =:ID)\n" +
                "AND IDSanPham=:ID";
        try (Connection con = DbUtils.getConnection()){
            List<DauGia> list = con.createQuery(query)
                    .addParameter("ID", id)
                    .executeAndFetch(DauGia.class);
            return list.get(0);
        }
    }
    public static void add(DauGia d) {

        String insertSql = "INSERT INTO `daugia` (`IDSanPham`, `LuotDauGia`, `GiaDat`, `IDNguoiDatGia`) VALUES (:IDSanPham, :LuotDauGia, :GiaDat, :IDNguoiDatGia);";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("IDSanPham", d.getIDSanPham())
                    .addParameter("LuotDauGia", d.getLuotDauGia())
                    .addParameter("GiaDat", d.getGiaDat())
                    .addParameter("IDNguoiDatGia", d.getIDNguoiDatGia())
                    .executeUpdate();
        }
    }
    public static List<DauGia> findUserAuctions(int id){
        String query = "SELECT * FROM daugia WHERE IDNguoiDatGia=:ID";
        try (Connection con = DbUtils.getConnection()){
            return con.createQuery(query)
                    .addParameter("ID", id)
                    .executeAndFetch(DauGia.class);
        }

    }
}
