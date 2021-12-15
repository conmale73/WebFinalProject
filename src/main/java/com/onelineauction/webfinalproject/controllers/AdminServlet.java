package com.onelineauction.webfinalproject.controllers;


import com.onelineauction.webfinalproject.DTO.SellerListDTO;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.beans.User;

import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/AdminServlet/*")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<User> userlistx = UserModel.showUsers();
                request.setAttribute("users", userlistx);
                request.setAttribute("user", true);
                ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);
                break;
            case "/SellerList":
                List<SellerListDTO> sellerlist = UserModel.findSellers();
                request.setAttribute("sellers", sellerlist);
                request.setAttribute("sell", true);
                ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);
                break;
            case "/BidderList":
                List<User> bidderlist = UserModel.findBidders();
                request.setAttribute("bidders", bidderlist);
                request.setAttribute("bid", true);
                ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);

                break;
            case "/Edit":
                int userId = Integer.parseInt(request.getParameter("id"));
                constant.idUser=userId;
                User id_find_user = UserModel.findById(userId);
                request.setAttribute("user", id_find_user); //Day la đối tượng user sau khi cần edit
                if(id_find_user == null)
                {
                }
                else {

                    ServletUtils.forward("/views/Home/Edit.jsp", request, response);
                }
                break;
            case "/User":
                List<User> userlist = UserModel.showUsers();
                request.setAttribute("users", userlist);
                request.setAttribute("user", true);
                ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Update":
                updateUser(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String strDob = request.getParameter("dob");

        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate dob = LocalDate.parse(strDob, df);

        String address = request.getParameter("address");
        String email = request.getParameter("email");
        int pointId = Integer.parseInt(request.getParameter("point"));
        //System.out.println(pointId);
        int permission = Integer.parseInt(request.getParameter("permission"));
        User c = new User(constant.idUser,"","",name,dob,address,email,pointId,permission);
        UserModel.updateUser(c);

        List<User> userlist = UserModel.showUsers();
        request.setAttribute("users", userlist);
        request.setAttribute("lev2",true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);


    }
}
