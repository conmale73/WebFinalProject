package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.VerifyUtils;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/doRegister")
public class DoRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
//        String password = request.getParameter("password");

        boolean valid = true;
        String errorString = null;

        // Check userName & password
//        if (!"tom".equals(userName) || !"tom001".equals(password)) {
//            valid = false;
//            errorString = "UserName or Password invalid!";
//        }

        if (valid) {

            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

            System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);

            // Verify CAPTCHA.
            valid = VerifyUtils.verify(gRecaptchaResponse);
            if (!valid) {
                errorString = "Captcha invalid!";
            }
        }
        if (!valid) {
            request.setAttribute("errorString", errorString);
//            RequestDispatcher dispatcher = //
//                    request.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
//
//            dispatcher.forward(request, response);
            //ServletUtils.redirect("/views/vwAccount/Register.jsp",request,response);
            return;
        } else {
            request.getSession().setAttribute("loginedUser", userName);
            // Redirect to /userInfo
            //response.sendRedirect(request.getContextPath()+"/userInfo");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
