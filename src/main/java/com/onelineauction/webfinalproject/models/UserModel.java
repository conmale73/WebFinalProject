package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {
    public static User findByUsername(String account) {
        final String query = "select * from user where account = :account";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("account", account)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static void add(User c)
    {
        String insertSql = "INSERT INTO user ( account, pass, name, address, email, level, dob) VALUES (:account,:pass,:name,:address,:email,:level,:dob)\n";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("account", c.getUsername())
                    .addParameter("pass", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("address", c.getAddress())
                    .addParameter("email", c.getEmail())
                    .addParameter("level", c.getLevel())
                    .addParameter("dob", c.getDob())
                    .executeUpdate();
        }


    }

}
