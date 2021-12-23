package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.BidderListDTO;
import com.onelineauction.webfinalproject.beans.SellerListDTO;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

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
    public static User findById(int ID) {
        final String query = "select * from users where ID =:ID";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("ID", ID)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    //Lấy thông tin User ra
    public static List<User> showUsers() {
        final String query = "select ID,HoTen,NgaySinh,DiaChi,Email,DiemUyTin,Quyen from users ";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class);
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
    public static void updateUser(User c) {
        String sql = "update users set HoTen = :HoTen ,NgaySinh =:NgaySinh, DiaChi=:DiaChi,Email=:Email,DiemUyTin=:DiemUyTin,Quyen=:Quyen where ID =:id_user";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("HoTen", c.getName())
                    .addParameter("NgaySinh", c.getDob())
                    .addParameter("DiaChi", c.getAddress())
                    .addParameter("Email", c.getEmail())
                    .addParameter("DiemUyTin", c.getDiemUyTin())
                    .addParameter("Quyen", c.getLevel())
                    .addParameter("id_user", c.getId())
                    .executeUpdate();
        }
    }
    public static boolean findLevelAdmin(String username)
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
    public static boolean findLevelBidder(String username)
    {
        final String query = "select * from users where username =:username and Quyen =0 ";
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
    public static boolean findLevelSeller(String username)
    {
        final String query = "select * from users where username =:username and Quyen =1 ";
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
    public static List<BidderListDTO> findBidders()  {
        final String query = "select * from daugia , users ,product where Quyen=0 and users.ID =daugia.IDNguoiDatGia and product.IDSanPham = daugia.IDSanPham";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(BidderListDTO.class);
        }
    }
//    @Test
//    public void testJDBC() {
//        List<SellerListDTO> findSellers = UserModel.findSellers();
//        for (SellerListDTO user : findSellers) {
//            System.out.println(user.getTenSanPham());
//        }
//    }
    public static List<SellerListDTO> findSellers()  {
        final String query = "select * from product , users where Quyen=1 and users.ID = product.IDNguoiBan";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(SellerListDTO.class);
        }
    }
    public static void deleteUser(int id)
    {
        String sql = "delete from users where ID =:ID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ID", id)
                    .executeUpdate();
        }


    }
}
