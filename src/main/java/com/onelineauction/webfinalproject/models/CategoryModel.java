package com.onelineauction.webfinalproject.models;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;
import com.onelineauction.webfinalproject.beans.Category;

public class CategoryModel {
    public static List<Category> findAll(){
        final String query = "select * from category";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }

    public static Category findById(int id) {
        final String query = "select * from category where IDDanhMuc = :IDDanhMuc";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("IDDanhMuc", id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void add(Category c) {
        String insertSql = "insert into category(TenDanhMuc) values (:TenDanhMuc)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("TenDanhMuc", c.getTenDanhMuc())
                    .executeUpdate();
        }
    }
    public static void update(Category c) {
        String sql = "update category set TenDanhMuc = :TenDanhMuc where IDDanhMuc = :IDDanhMuc";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("IDDanhMuc", c.getIDDanhMuc())
                    .addParameter("TenDanhMuc", c.getTenDanhMuc())
                    .executeUpdate();
        }
    }
    public static void delete(int id) {
        String sql = "delete from category where IDDanhMuc = :IDDanhMuc";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("IDDanhMuc", id)
                    .executeUpdate();
        }
    }
}
