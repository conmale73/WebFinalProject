package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.DauGia;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.models.DauGiaModel;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "AuctionBidderServlet", value = "/Bidder/Auction/*")
public class BidderAuctionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                int i = 0;
                HttpSession session = request.getSession();
                User curUser = (User) session.getAttribute("authUser");

                List<DauGia> list1 = DauGiaModel.findUserAuctions(curUser.getId());

                List<String> listPro = new ArrayList<String>();

                for (DauGia dauGia : list1){
                    listPro.add(i, dauGia.getIDSanPham());
                    i++;
                }
                List<String> listProName = new ArrayList<String>();
                for (String s : listPro){
                    if (!listProName.contains(s)){
                        listProName.add(s);
                    }
                }

                List<Product> products = new ArrayList<Product>();
                for (String s : listProName){
                    products.add(ProductModel.findById(s));
                }
                request.setAttribute("productsAuction", products);
                ServletUtils.forward("/views/vwBidder/ProductAuction.jsp", request,response);
                break;
            default:
                ServletUtils.forward("/views/vwBidder/404.jsp", request, response);
                break;
        }
    }
}
