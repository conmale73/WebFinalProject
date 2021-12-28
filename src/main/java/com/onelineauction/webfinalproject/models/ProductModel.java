package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.*;
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
                "select product.* from product, (select IDSanPham, count(IDSanPham) as LanDauGia\n" +
                        "                        from daugia\n" +
                        "                        group by IDSanPham\n" +
                        "                        order by LanDauGia desc) as d\n" +
                        "where product.IDSanPham = d.IDSanPham\n" +
                        "limit 5";
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

    public static List<ProductForNew> findName(String TenSanPham) {
        final String query =
                "select *, timestampdiff(minute,ThoiGianDangBan,curtime()) as neworold from product\n" +
                        "where match(TenSanPham)\n" +
                        "against(:Tensp)\n" +
                        "order by ThoiGianKetThuc DESC";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("Tensp", TenSanPham)
                    .executeAndFetch(ProductForNew.class);
        }
    }

    public static List<ProductForNew> findNamePrice(String TenSanPham) {
        final String query =
                "select *, timestampdiff(minute,ThoiGianDangBan,curtime()) as neworold from product\n" +
                        "where match(TenSanPham)\n" +
                        "against(:Tensp)\n" +
                        "order by GiaHienTai ASC";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("Tensp", TenSanPham)
                    .executeAndFetch(ProductForNew.class);
        }
    }

    public static List<ProductForNew> findNametimeup(String TenSanPham) {
        final String query =
                "select *, timestampdiff(minute,ThoiGianDangBan,curtime()) as neworold from product\n" +
                        "where match(TenSanPham)\n" +
                        "    against(:Tensp)\n" +
                        "And timestampdiff(minute,ThoiGianDangBan,curtime())<30\n" +
                        "order by neworold asc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("Tensp", TenSanPham)
                    .executeAndFetch(ProductForNew.class);
        }
    }

    public static List<ProductForShow> ShowDanhSach() {
        final String query = "select product.IDSanPham,product.TenSanPham, product.IDNguoiBan, product.GiaHienTai, product.GiaMuaNgay, product.BuocGia, product.IDDanhMuc, product.IDNguoiGiuGiaHienTai,convert(product.ThoiGianDangBan,date) as ThoiGianDangBan, convert(product.ThoiGianKetThuc,date) as ThoiGianKetThuc, product.ChiTiet, product.AnhChinh, product.AnhPhu, datediff(product.ThoiGianKetThuc,curtime()) as TGcon, count(daugia.IDSanPham) as LanDauGia\n" +
                "from product\n" +
                "left join daugia on daugia.IDSanPham = product.IDSanPham\n" +
                "group by product.IDSanPham\n" +
                "order by LanDauGia desc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductForShow.class);
        }
    }

    public static List<ProductForFindID> findID(String proId) {
        final String query =
                "select IDSanPham,TenSanPham, IDNguoiBan, GiaHienTai, GiaMuaNgay, BuocGia, IDDanhMuc, IDNguoiGiuGiaHienTai,convert(ThoiGianDangBan,date) as ThoiGianDangBan, convert(ThoiGianKetThuc,date) as ThoiGianKetThuc, ChiTiet, AnhChinh, AnhPhu, datediff(ThoiGianKetThuc,curtime()) as TGcon, timestampdiff(hour ,curtime(),ThoiGianKetThuc) as TGconH, timestampdiff(minute,curtime(),ThoiGianKetThuc) as TGconS\n" +
                        "from product\n" +
                        "Where IDSanPham = :IDSanPham";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("IDSanPham", proId)
                    .executeAndFetch(ProductForFindID.class);
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
    public static void deleteProduct(String id)
    {
        String sql = "delete from product where IDSanPham = :ID ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ID", id)
                    .executeUpdate();
        }
    }
}
