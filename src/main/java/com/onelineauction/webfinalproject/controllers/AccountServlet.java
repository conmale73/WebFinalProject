package com.onelineauction.webfinalproject.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.onelineauction.webfinalproject.beans.SendEmail;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.constant.constant;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;
import javafx.print.Printer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
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
                String message = request.getParameter("message_register");
                //System.out.println(instanceof message);
                if (message != null && message.equals("dang_ky")) {
                    request.setAttribute("message_register", "Dang Ky");
                }
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
            case "/Profile":
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;
            case "/OTP":
                ServletUtils.forward("/views/vwAccount/OTP.jsp", request, response);
                break;
            case "/IsAvailable":
                String username = request.getParameter("user");//username
                String mail = request.getParameter("mail");

                User user = UserModel.findByUsername(username);
                User email = UserModel.findByEmail(mail);
                boolean isAvailable = true;
                System.out.println(user);
                System.out.println(email);
                if(user!=null && email!=null)
                {
                    isAvailable=false;
                }
//                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
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
                sendEmail(request,response);
                //registerUser(request, response);
                break;
            case "/Login":
                login(request, response);
                break;
            case "/Logout":
                logout(request, response);
                break;
            case  "/OTP":
                //Lay cac thong tin va gui Email
                sendEmail(request,response);
                //verify(request, response);
                break;
            case "/Verify":
                verify(request,response);
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


            int permission = 0;
            User c = new User(0, username, password, name, dob, address, email, 90, permission);
            //UserModel.add(c);
            constant.userConstant= c;

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

                boolean ktra_ad = UserModel.findLevelAdmin(username);
                boolean ktra_bidder = UserModel.findLevelBidder(username);
                boolean ktra_seller = UserModel.findLevelSeller(username);

                if(ktra_ad) // Neu la Admin
                {
                    session.setAttribute("lev2",true);
                    ServletUtils.redirect("/AdminServlet", request, response);
                }

                if(ktra_seller) //Neu la Seller
                {
                    session.setAttribute("lev1",true);
                    ServletUtils.redirect("/Seller/Home", request, response);
                }

                if(ktra_bidder) //Neu la Bidder
                {
                    session.setAttribute("lev0",true);
                    ServletUtils.redirect("/Bidder/Home", request, response);
                }
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

        session.setAttribute("lev0",false);
        session.setAttribute("lev1",false);
        session.setAttribute("lev2",false);
//        String url = request.getHeader("referer");
//        if (url == null)
//            url = "/Home";
        ServletUtils.redirect("/Guest/Home",request,response);
    }

    private void sendEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        registerUser(request,response);
        String email = request.getParameter("email");
        SendEmail sm = new SendEmail();
        String otp = sm.getRandom();
        constant.codeOtp = otp;
        boolean test = sm.sendEmail(email,otp); //Gui email cho ngta
        if(test)
        {
            ServletUtils.forward("/views/vwAccount/OTP.jsp", request, response);
            System.out.println("Ra roi");
        }else
            System.out.println("Khong ra");

    }
    private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String otp = request.getParameter("OTP");
        if(otp.equals(constant.codeOtp))    //so sánh chuỗi, 2 đối tượng
        {
            UserModel.add(constant.userConstant);
            //request.setAttribute("yesOTP",constant.codeOtp);
            //request.setAttribute("message_register","Dang Ky");
//            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
//            request.setAttribute("message_register",null);
            response.sendRedirect(request.getContextPath()+"/Account/Login?message_register=dang_ky");
            //response.sendRedirect(request.getContextPath()+"/Account/Login"); // qua bên get của login
        }else{
            ServletUtils.forward("/views/vwAccount/OTP.jsp", request, response);

        }

    }

}
