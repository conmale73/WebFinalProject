package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.Category;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
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
//                List<User> list = UserModel.findBidders();
//                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);
                break;
            case "/SellerList":
                ServletUtils.forward("/views/vwAdmin/Sellers.jsp", request,response);
                break;
            case "/BidderList":
                List<User> list = UserModel.findBidders();
                request.setAttribute("bidders", list);
                ServletUtils.forward("/views/vwAdmin/Bidders.jsp", request,response);

                break;
//            case "/Category":
//                List<Category> categoryList = CategoryModel.findAll();
//                request.setAttribute("Category", categoryList);
//                ServletUtils.forward("", request, response);
//                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
