package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.DauGia;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.models.DauGiaModel;
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
                String auctionID = request.getParameter("id");
                Product productAuction = ProductModel.findById(auctionID);
                List<DauGia> list1 = DauGiaModel.findAllByID(auctionID);

                if (productAuction == null || list1 == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("daugia", true);
                    request.setAttribute("productAuction", productAuction);
                    request.setAttribute("auctionList", list1);

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
