package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.BidderListDTO;
import com.onelineauction.webfinalproject.beans.SellerListDTO;
import com.onelineauction.webfinalproject.models.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(urlPatterns = "/api-bidder")
public class APIBidder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int page_current = Integer.parseInt(request.getParameter("page_exist"));
        List<BidderListDTO> bidderList = UserModel.paginationBidder((page_current - 1) * 5, 5);//Tính tại lúc bắt đầu và các trang tiếp theo

        PrintWriter out = response.getWriter();
        for (BidderListDTO o : bidderList) {
                                            out.println("<tr class=\"table-success\">\n" +
                    "                                <td>"+o.getHoTen()+"</td>\n" +
                    "                                <td>"+o.getIDSanPham()+"</td>\n" +
                    "                                <td>"+o.getTenSanPham()+"</td>\n" +
                    "                                <td>"+formatNumber( o.getGiaDat() )+"</td>\n" +
                    "                                <td>"+o.getBuocGia()+"</td>\n" +
                    "                            </tr>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public String formatNumber(double number)
    {
        String pattern = "###,###.###";
        DecimalFormat decimalFormat = new DecimalFormat(pattern);

        String format = decimalFormat.format(number);
        return format;
    }
}
