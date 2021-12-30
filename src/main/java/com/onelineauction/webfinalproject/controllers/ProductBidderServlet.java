package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.DauGia;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.DauGiaModel;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "ProductBidderServlet", value = "/Bidder/Product/*")
public class ProductBidderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catId);
                request.setAttribute("productsByCat", list);
                ServletUtils.forward("/views/vwBidder/ProductByCat.jsp", request, response);
                break;

            case "/Detail":
                loadData(request, response);
                break;

            default:
                ServletUtils.forward("/views/vwBidder/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/SubmitAuction":
                submitAuction(request, response);
                break;

        }
    }

    private void submitAuction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSP = request.getParameter("id");
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("authUser");

        DauGia previousAuction = DauGiaModel.luotDauGiaCuoiCung(idSP);
        double giaDat = Double.parseDouble(request.getParameter("soTien"));
        DauGia dg = new DauGia(idSP, previousAuction.getLuotDauGia() + 1, giaDat, curUser.getId());
        DauGiaModel.add(dg);

        Product p = ProductModel.findById(idSP);
        Product product = new Product(p.getIDSanPham(), p.getTenSanPham(), p.getIDNguoiBan(), giaDat, p.getGiaMuaNgay(), p.getBuocGia(), p.getIDDanhMuc(), curUser.getId(), p.getThoiGianDangBan(), p.getThoiGianKetThuc(), p.getChiTiet(), p.getAnhChinh(), p.getAnhPhu());
        ProductModel.update(product);
        loadData(request, response);

    }
    private void loadData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String auctionID = request.getParameter("id");
        Product productAuction = ProductModel.findById(auctionID);
        List<DauGia> list1 = DauGiaModel.findAllByID(auctionID);
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("authUser");
        if (productAuction == null || list1 == null) {
            ServletUtils.redirect("/Home", request, response);
        } else {
            request.setAttribute("daugia", true);
            request.setAttribute("productAuction", productAuction);
            request.setAttribute("auctionList", list1);
            request.setAttribute("currentUser", curUser);
            ServletUtils.forward("/views/vwBidder/ProductDetail.jsp", request, response);
        }
    }
}
