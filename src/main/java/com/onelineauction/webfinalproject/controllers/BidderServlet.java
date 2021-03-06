package com.onelineauction.webfinalproject.controllers;


import com.onelineauction.webfinalproject.beans.*;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.DauGiaModel;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;

import com.onelineauction.webfinalproject.utils.ServletUtils;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

@WebServlet(name = "BidderServlet", value = "/Bidder/Home/*")
public class BidderServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwBidder/index.jsp", request,response);
                break;
            default:
                ServletUtils.forward("/views/vwBidder/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
