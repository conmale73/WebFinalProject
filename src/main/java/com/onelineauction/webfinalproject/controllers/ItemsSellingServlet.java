package com.onelineauction.webfinalproject.controllers;


import com.onelineauction.webfinalproject.beans.*;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;

import com.onelineauction.webfinalproject.utils.ServletUtils;
import jdk.nashorn.internal.ir.Terminal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Console;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "ItemsSellingServlet", value = "/Seller/Sell/*")
public class ItemsSellingServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                loadSellerItems(request, response);
                break;

            default:
                ServletUtils.forward("/views/vwSeller/404.jsp", request, response);
                break;
        }
    }
    public void loadSellerItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("authUser");
        List<Product> listitem = ProductModel.findBySellerID(curUser.getId());
        request.setAttribute("selleritems", listitem);
        request.setAttribute("sell", true);
        ServletUtils.forward("/views/vwSeller/ProductSeller.jsp", request,response);
    }
}
