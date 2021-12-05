package com.onelineauction.webfinalproject.controllers;
import com.mysql.cj.xdevapi.Schema;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home1Servlet", value = "/Home/*")
public class Home1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                ServletUtils.forward("/views/vwGuest/index.jsp", request,response);
                break;
            case "/Product":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("Product", list);
                ServletUtils.forward("/views/vwGuest/Product.jsp", request,response);
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
