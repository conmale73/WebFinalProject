package com.onelineauction.webfinalproject.controllers;

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

@WebServlet(name = "ProductSellerServlet", value = "/Seller/Product/*")
public class ProductSellerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catId);
                request.setAttribute("productsByCat", list);
                ServletUtils.forward("/views/vwSeller/ProductByCat.jsp", request, response);
                break;

            case "/Detail":
                String proId = request.getParameter("id");
                Product product = ProductModel.findById(proId);
                if (product == null) {
                    ServletUtils.redirect("/Index", request, response);
                } else {
                    request.setAttribute("product", product);
                    ServletUtils.forward("/views/vwSeller/ProductDetail.jsp", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/vwSeller/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
