package com.onelineauction.webfinalproject.models;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays
        ;
import org.sql2o.Connection;
import org.sql2o.Sql2o;
import com.onelineauction.webfinalproject.beans.Category;

public class CategoryModel {
    public static List<Category> findAll(){
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/onlineauction", "root", "");
        final String query = "select * from category";
        try (Connection con = sql2o.open()){
            return con.createQuery(query).executeAndFetch(Category.class);
        }
    }
}
