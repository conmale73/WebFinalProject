package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.models.ProductModel;
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
                ServletUtils.forward("/views/vwAdmin/index.jsp", request,response);
                break;
            case "/Product":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("Product", list);
                ServletUtils.forward("/views/vwGuest/Product.jsp", request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
