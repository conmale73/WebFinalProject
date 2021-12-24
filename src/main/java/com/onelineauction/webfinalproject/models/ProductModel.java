package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.beans.ProductCategoryDTO;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;
import org.testng.annotations.Test;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll() {
        final String query =
                "SELECT * FROM product";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findTop5KetThuc() {
        final String query =
                "select IDSanPham, TenSanPham, IDNguoiBan, GiaHienTai, GiaMuaNgay, BuocGia, IDDanhMuc, IDNguoiGiuGiaHienTai, ThoiGianDangBan, ThoiGianKetThuc, ChiTiet, AnhChinh, AnhPhu  from product\n" +
                        "WHERE datediff(ThoiGianKetThuc,CURDATE())>=0\n" +
                        "ORDER BY datediff(ThoiGianKetThuc,CURDATE()) ASC\n" +
                        "LIMIT 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findTop5GiaCao() {
        final String query =
                "Select * from product\n" +
                        "order by GiaMuaNgay DESC\n" +
                        "LIMIT 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findTop5DanhGia() {
        final String query =
                "Select * FROM product\n" +
                        "Where IDSanPham = (Select IDSanPham from daugia\n" +
                        "                    order by count(IDSanPham) DESC\n" +
                        "                    LIMIT 5)";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findPhanTrang(int catId, int a) {
        final String query = "select * from product where IDDanhMuc = :IDDanhMuc Limit :dau,3";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("IDDanhMuc", catId)
                    .addParameter("dau", a)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findName(String TenSanPham) {
        final String query =
                "Select * from product\n" +
                        "where match(TenSanPham)\n" +
                        "against(:Tensp)";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("Tensp", TenSanPham)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findByCatId(int catId) {
        final String query = "select * from product where IDDanhMuc = :IDDanhMuc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("IDDanhMuc", catId)
                    .executeAndFetch(Product.class);
        }
    }
    public static Product findById(String id) {
        final String query = "select * from product where IDSanPham = :IDSanPham";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("IDSanPham", id)
                    .executeAndFetch(Product.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static List<ProductCategoryDTO> findCategoryAndProduct() {
        final String query =
                "SELECT * FROM product,category where product.IDDanhMuc = category.IDDanhMuc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductCategoryDTO.class);
        }
    }
    public static List<ProductCategoryDTO> paginationProduct(int offset, int limit) {
        final String query =
                "SELECT * FROM product,category where product.IDDanhMuc = category.IDDanhMuc  LIMIT "+offset+" ," +limit;
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductCategoryDTO.class);
        }
    }
}
