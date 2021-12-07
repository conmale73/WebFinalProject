package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class UserModel {
    public static User findByUsername(String username) {
        final String query = "select * from users where username =:username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static void add(User c)
    {
        String insertSql = "INSERT INTO users ( username, password, HoTen, NgaySinh, DiaChi, Email,DiemUyTin, Quyen) VALUES (:username,:password,:HoTen,:NgaySinh,:DiaChi,:Email,:DiemUyTin,:Quyen)\n";

        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("username", c.getUsername())
                    .addParameter("password", c.getPassword())
                    .addParameter("HoTen", c.getName())
                    .addParameter("NgaySinh", c.getDob())
                    .addParameter("DiaChi", c.getAddress())
                    .addParameter("Email", c.getEmail())
                    .addParameter("DiemUyTin", c.getDiemUyTin())
                    .addParameter("Quyen", c.getLevel())
                    .executeUpdate();
        }


    }
    public static boolean findLevel(String username)
    {
        final String query = "select * from users where username =:username and Quyen =2 ";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return false;
            }
            else
                return true;
        }
    }

}
