package com.onelineauction.webfinalproject.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.ServerSocket;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();


        switch (path) {
            case "/Register":
                ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);
                break;
            case "/Login":
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
            case "/Profile":
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();


        switch (path) {
            case "/Register":
                registerUser(request, response);
                break;
            case "/Login":
                login(request, response);
                break;
            case "/Logout":
                logout(request, response);
                break;
      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
        }
    }
    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawpwd = request.getParameter("rawpwd");
        String password = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());//Ma hoa bCript

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        String strDob = request.getParameter("dob");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate dob = LocalDate.parse(strDob, df);


        int permission =0;
        User c = new User(0,username,password,name,dob,address,email,90, permission);
        UserModel.add(c);
        ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);

    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");//lấy
        String password = request.getParameter("password");
        User user = UserModel.findByUsername(username);

        if(user !=null)
        {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if(result.verified)
            {
                HttpSession session = request.getSession();// lay request cua 1 phien lam viec cua ng dung
                session.setAttribute("auth",true);
                session.setAttribute("authUser",user);
                //Kiem tra xem vao co pphai la admin hay ko
                boolean ktra_ad = UserModel.findLevel(username);
                if(ktra_ad)
                    request.setAttribute("lev2",true);
                //String url = "/Home/Index";
                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/Home";
                ServletUtils.redirect(url,request,response);
            }
            else
            {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        }
        else
        {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }

    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();// lay request cua 1 phien lam viec cua ng dung
        session.setAttribute("auth",false);
        session.setAttribute("authUser",new User());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/Home";
        ServletUtils.redirect(url,request,response);



    }

}
