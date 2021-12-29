package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.beans.ProductForFindID;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Guest/Product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catId);
//                List<Product> list = ProductModel.findPhanTrang(1, 0);
//                if (catId==21) {
//                    list = ProductModel.findPhanTrang(2, 0);
//                    request.setAttribute("productsByCat", list);
//                    ServletUtils.forward("/views/vwGuest/ProductByCat2.jsp", request, response);
//                }
//                else
//                if (catId==12) {
//                    list = ProductModel.findPhanTrang(1, 3);
//                }
//                else
//                if (catId==22)
//                {
//                    list = ProductModel.findPhanTrang(2, 3);
//                    request.setAttribute("productsByCat", list);
//                    ServletUtils.forward("/views/vwGuest/ProductByCat2.jsp", request, response);
//                }
                request.setAttribute("productsByCat", list);
                ServletUtils.forward("/views/vwGuest/ProductByCat.jsp", request, response);
                break;

            case "/Detail":
                String proId = request.getParameter("id");
                List<ProductForFindID> product = ProductModel.findID(proId);
                request.setAttribute("products", product);
                ServletUtils.forward("/views/vwGuest/ProductDetail.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/vwGuest/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
