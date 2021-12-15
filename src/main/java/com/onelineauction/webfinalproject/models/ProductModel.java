package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.Product;
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

    public static List<Product> findByCatId(int catId) {
        final String query = "select * from product where IDDanhMuc = :IDDanhMuc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("IDDanhMuc", catId)
                    .executeAndFetch(Product.class);
        }
    }
    public static Product findById(int id) {
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
}
