package com.onelineauction.webfinalproject.controllers;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.onelineauction.webfinalproject.beans.*;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.*;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.attribute.UserPrincipal;
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
            path = "/DashBoard";
        }
        String[] color = {"white","white","white","white","white","white"};
        switch (path) {
            case "/DashBoard":
                color[0] = "lightblue";
                request.setAttribute("colorLeftNav",color);
                loadDashboard(request,response);
                break;
            case "/SellerList":
                color[1] = "lightblue";
                request.setAttribute("colorLeftNav",color);
                loadSeller(request,response);
                break;
            case "/BidderList":
                color[2] = "lightblue";
                request.setAttribute("colorLeftNav",color);
                loadBidder(request,response);
                break;
            case "/ProductList":
                color[3] = "lightblue";
                request.setAttribute("colorLeftNav",color);
                loadProduct(request,response);
                break;
            case "/Category":
                color[4] = "lightblue";
                request.setAttribute("colorLeftNav",color);
                loadCategory(request,response);
                break;
            case "/EditUser":
                editUser(request,response);

                break;
            case "/RemoveUser":

                int userRemove = Integer.parseInt(request.getParameter("iduser"));
                UserModel.deleteUser(userRemove);
                request.setAttribute("message_delete","Xoa Thanh Cong");
                loadUser(request,response);
                request.setAttribute("message_delete",null);
                break;
            case "/RemoveProduct":
                String productRemove = request.getParameter("id");
                ProductModel.deleteProduct(productRemove);
                DauGiaModel.deleteSanPhamDauGia(productRemove);
                loadProduct(request,response);
                break;
            case "/UserList":
                color[5] = "lightblue";
                request.setAttribute("colorLeftNav",color);
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
            case "/Reset":
                resetPassword(request,response);
                break;
            case "/RemoveUser":
                int userRemove = Integer.parseInt(request.getParameter("id"));
                UserModel.deleteUser(userRemove);
                request.setAttribute("message_delete","Xoa Thanh Cong");
                loadUser(request,response);
                request.setAttribute("message_delete",null);
                break;
            case "/AcceptRequest":
                int iduser = Integer.parseInt(request.getParameter("id"));
                int requestaccept = Integer.parseInt(request.getParameter("request"));
                ListRequestModel.acceptRequest(iduser,requestaccept);
                request.setAttribute("message_update","Update Thanh Cong");
                loadDashboard(request,response);
                request.setAttribute("message_update",null);
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
        //request.setAttribute("success", true);
        request.setAttribute("message_update","Update Thanh Cong");
        loadUser(request,response);
        //response.sendRedirect("/AdminServlet/EditUser?id=" + constant.idUser);
        request.setAttribute("message_update",null);
    }
    public void resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawpwd = request.getParameter("rawpwd");
        String password = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        //Gui email
        String email = request.getParameter("email");
        SendEmail sm = new SendEmail();
        UserModel.resetPassword(constant.idUser,password);
        boolean test = sm.sendReset(email,rawpwd); //Gui email cho ngta
        //request.setAttribute("success", true);
        request.setAttribute("message_update","Update Thanh Cong");
        loadUser(request,response);
        request.setAttribute("message_update",null);
    }
    public void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        constant.idUser=userId;
        User id_find_user = UserModel.findById(userId);
        LocalDate localDate = id_find_user.getDob();
        request.setAttribute("user", id_find_user); //Day la đối tượng user sau khi cần edit
        request.setAttribute("dob", localDate);
        System.out.println(localDate);
        ServletUtils.forward("/views/Home/Edit.jsp", request, response);

    }
    public void loadProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        List<ProductCategoryDTO> productList = ProductModel.paginationProduct(0,5);
        double totalPageProduct = Math.ceil((double) ProductModel.findCategoryAndProduct().size() / 5); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageProduct", totalPageProduct);
        request.setAttribute("products", productList);
        request.setAttribute("pro", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        List<ProductCategoryDTO> categoryList = CategoryModel.paginationCategory(0,5);
        double totalPageCategory = Math.ceil((double) CategoryModel.findCategoryByID().size() / 5); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageCategory", totalPageCategory);
        request.setAttribute("categories", categoryList);
        request.setAttribute("category", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<User> userlistx = UserModel.paginationUser(0, 5);
        double totalPages = Math.ceil((double) UserModel.findAll().size() / 5); // trả ra 5 sản phẩm mỗi trang
        request.setAttribute("totalPageUser", totalPages);
        request.setAttribute("users", userlistx);
        request.setAttribute("user", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<ListRequestUserDTO> listdashboard = UserModel.paginationDashBoard(0, 5);
        double totalDashBoard = Math.ceil((double) ListRequestModel.findAllRequest().size() / 5); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalDashBoard", totalDashBoard);
        request.setAttribute("dashboard", listdashboard);
        request.setAttribute("dash", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadBidder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<BidderListDTO> bidderlist = UserModel.paginationBidder(0, 5);
        double totalPagesBidder = Math.ceil((double) UserModel.findSellers().size() / 5); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPagesBidder", totalPagesBidder);
        request.setAttribute("bidders", bidderlist);
        request.setAttribute("bid", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
    public void loadSeller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<SellerListDTO> sellerlist = UserModel.paginationSeller(0, 5);
        request.setAttribute("sellers", sellerlist);
        request.setAttribute("sell", true);
        double totalPagesSeller = Math.ceil((double) UserModel.findSellers().size() / 5); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageSeller", totalPagesSeller);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);
    }
}
