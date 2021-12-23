package com.onelineauction.webfinalproject.controllers;
import com.mysql.cj.xdevapi.Schema;
import com.onelineauction.webfinalproject.beans.Category;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.models.CategoryModel;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home1Servlet", value = "/Guest/Home/*")
public class Home1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwGuest/index.jsp", request,response);
                break;
            case "/GiaCao":
                List<Product> lists = ProductModel.findTop5GiaCao();
                request.setAttribute("products", lists);
                ServletUtils.forward("/views/vwGuest/GiaCao.jsp", request,response);
                break;
            case "/DanhGia":
                List<Product> listing = ProductModel.findTop5DanhGia();
                request.setAttribute("products", listing);
                ServletUtils.forward("/views/vwGuest/DanhGia.jsp", request,response);
                break;
            default:
                ServletUtils.forward("/views/Guest/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
