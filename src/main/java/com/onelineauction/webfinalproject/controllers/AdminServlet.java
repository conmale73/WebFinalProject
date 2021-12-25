package com.onelineauction.webfinalproject.controllers;


import com.onelineauction.webfinalproject.beans.BidderListDTO;
import com.onelineauction.webfinalproject.beans.ProductCategoryDTO;
import com.onelineauction.webfinalproject.beans.SellerListDTO;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
                loadUser(request,response);
                break;
            case "/SellerList":
                loadSeller(request,response);
                break;
            case "/BidderList":
                loadBidder(request,response);
                break;
            case "/ProductList":
                loadProduct(request,response);
                break;
            case "/EditUser":
                int userId = Integer.parseInt(request.getParameter("id"));
                constant.idUser=userId;
                User id_find_user = UserModel.findById(userId);
                request.setAttribute("user", id_find_user); //Day la đối tượng user sau khi cần edit
                ServletUtils.forward("/views/Home/Edit.jsp", request, response);
                break;
            case "/RemoveUser":
                int userRemove = Integer.parseInt(request.getParameter("id"));
                UserModel.deleteUser(userRemove);
                loadUser(request,response);
                break;
            case "/RemoveProduct":
                int productRemove = Integer.parseInt(request.getParameter("id"));
                //UserModel.deleteUser(userRemove);

                break;
            case "/UserList":
                loadUser(request,response);
                break;
            default:
                ServletUtils.forward("/views/vwAdmin/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Update":
                updateUser(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String strDob = request.getParameter("dob");

        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate dob = LocalDate.parse(strDob, df);

        String address = request.getParameter("address");
        String email = request.getParameter("email");
        int pointId = Integer.parseInt(request.getParameter("point"));
        //System.out.println(pointId);
        int permission = Integer.parseInt(request.getParameter("permission"));
        User c = new User(constant.idUser,"","",name,dob,address,email,pointId,permission);
        UserModel.updateUser(c);

        loadUser(request,response);
    }
    public void loadProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        List<ProductCategoryDTO> productList = ProductModel.paginationProduct(0,6);
        double totalPageProduct = Math.ceil((double) ProductModel.findCategoryAndProduct().size() / 6); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageProduct", totalPageProduct);
        request.setAttribute("products", productList);
        request.setAttribute("pro", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<User> userlistx = UserModel.paginationUser(0, 6);
        double totalPages = Math.ceil((double) UserModel.findAll().size() / 6); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageUser", totalPages);
        request.setAttribute("users", userlistx);
        request.setAttribute("user", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadBidder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<BidderListDTO> bidderlist = UserModel.paginationBidder(0, 6);
        double totalPagesBidder = Math.ceil((double) UserModel.findSellers().size() / 6); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPagesBidder", totalPagesBidder);
        request.setAttribute("bidders", bidderlist);
        request.setAttribute("bid", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadSeller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<SellerListDTO> sellerlist = UserModel.paginationSeller(0, 6);
        request.setAttribute("sellers", sellerlist);
        request.setAttribute("sell", true);
        double totalPagesSeller = Math.ceil((double) UserModel.findSellers().size() / 6); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageSeller", totalPagesSeller);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
}
