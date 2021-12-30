package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.DauGia;
import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.beans.SendEmail;
import com.onelineauction.webfinalproject.beans.User;
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
                loadData(request, response);
                break;

            default:
                ServletUtils.forward("/views/vwSeller/404.jsp", request, response);
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

        int idNB = p.getIDNguoiBan();
        User seller = UserModel.findById(idNB);
        //Gửi email cho ng đấu giá và ng đăng bán
        SendEmail sm1 = new SendEmail();
        SendEmail sm2 = new SendEmail();
        //Gui cho Bidder
        sm1.sendBidderorSeller(curUser.getEmail(),"You are bidding with price:",giaDat);
        sm2.sendBidderorSeller(seller.getEmail(),"Your order is being auctioned with price: ",giaDat);

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
            ServletUtils.forward("/views/vwSeller/ProductDetail.jsp", request, response);
        }
    }
}
