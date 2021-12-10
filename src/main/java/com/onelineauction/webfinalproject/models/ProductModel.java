package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll() {
        //Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/onlineauction", "root", "");
        final String query =
                "SELECT * FROM product";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
}
