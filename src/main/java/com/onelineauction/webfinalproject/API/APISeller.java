package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.SellerListDTO;
import com.onelineauction.webfinalproject.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = "/api-seller")
public class APISeller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int page_current = Integer.parseInt(request.getParameter("page_exist"));
        List<SellerListDTO> sellerList = UserModel.paginationSeller((page_current - 1) * 6, 6);//Tính tại lúc bắt đầu và các trang tiếp theo

        PrintWriter out = response.getWriter();
        for (SellerListDTO o : sellerList) {
            out.println("<tr class=\"table-success\">\n" +
                    "                            <td>" + o.getUsername() + "</td>\n" +
                    "                            <td>" + o.getIDSanPham() + "</td>\n" +
                    "                            <td>" + o.getTenSanPham() + " </td>\n" +
                    "                            <td>"+ formatNumber(o.getGiaHienTai())+"</td>\n" +
                    "                            <td>"+ formatNumber(o.getGiaMuaNgay())+"</td>\n" +
                    "                            <td>" + o.getBuocGia() + "</td>\n" +
                    "                            <td>" + o.getThoiGianDangBan() + "</td>\n" +
                    "                            <td>" + o.getThoiGianKetThuc() + "</td>\n" +
                    "                        </tr>");
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
//    public String formatDate(DateTimeFormatter time)
//    {
//        DateTimeFormatter formatter = time.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String formattedDate = time. format(DateTimeFormatter. ofPattern("dd-MMM-yy"));
//        return formattedDate;
//    }
}
