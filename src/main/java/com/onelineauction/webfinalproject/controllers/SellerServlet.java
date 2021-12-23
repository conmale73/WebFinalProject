package com.onelineauction.webfinalproject.controllers;


import com.onelineauction.webfinalproject.beans.*;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;

import com.onelineauction.webfinalproject.utils.ServletUtils;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "SellerServlet", value = "/Seller/Home/*")
public class SellerServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwSeller/index.jsp", request,response);
                break;
            default:
                ServletUtils.forward("/views/vwSeller/404.jsp", request, response);
                break;
        }
    }
}
