package com.onelineauction.webfinalproject.utils;

import org.sql2o.Connection;
import org.sql2o.Sql2o;



public class DbUtils {
    //Chỗ để kết nối
    //xài cho remote
    static Sql2o sql2o = new Sql2o("jdbc:mysql://onlineauction.cmrzbffgylbi.ap-southeast-1.rds.amazonaws.com:3306/onlineauction", "admin", "12345678");

    //cái này xài cho local host
    //static Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/onlineauction", "root", "");
    public static Connection getConnection()
    {
        return sql2o.open() ;
    }
}
