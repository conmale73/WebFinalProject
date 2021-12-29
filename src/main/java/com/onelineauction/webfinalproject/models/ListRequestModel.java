package com.onelineauction.webfinalproject.models;

import com.onelineauction.webfinalproject.beans.ListRequest;
import com.onelineauction.webfinalproject.beans.ListRequestUserDTO;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ListRequestModel {
    public static List<ListRequestUserDTO> findAllRequest()  {
        final String query = "select users.ID,users.HoTen,listrequest.request,listrequest.ThoiGian,listrequest.xacnhan\n" +
                "from listrequest,users\n" +
                "where listrequest.id=users.ID";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(ListRequestUserDTO.class);
        }
    }
    public static void acceptRequest(int iduser,int Quyen) {
        if(Quyen==1)
            Quyen=0;
        else
            Quyen=1;
        String sql1 = "update users set Quyen=:Quyen where ID =:id_user";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql1)
                    .addParameter("id_user", iduser)
                    .addParameter("Quyen",Quyen)
                    .executeUpdate();
        }
        String sql2 = "update listrequest set xacnhan=1 where ID =:id_user";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql2)
                    .addParameter("id_user", iduser)
                    .executeUpdate();
        }
    }

}
