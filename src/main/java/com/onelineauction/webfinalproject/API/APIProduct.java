package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.ProductCategoryDTO;
import com.onelineauction.webfinalproject.beans.SellerListDTO;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.models.ProductModel;
import com.onelineauction.webfinalproject.models.UserModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(urlPatterns = "/api-product")
public class APIProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                int page_current = Integer.parseInt(request.getParameter("page_exist"));
                List<ProductCategoryDTO> productList = ProductModel.paginationProduct((page_current - 1) * 6, 6);//Tính tại lúc bắt đầu và các trang tiếp theo

                PrintWriter out = response.getWriter();
                for (ProductCategoryDTO o : productList) {
                    out.println("<tr class=\"table-success\">\n" +
                            "                                <td>"+o.getTenSanPham()+"</td>\n" +
                            "                                <td>"+o.getTenSanPham()+"</td>\n" +
                            "                                <td>"+ formatNumber(o.getGiaHienTai())+"</td>\n" +
                            "                                <td>"+ formatNumber(o.getGiaMuaNgay())+"</td>\n" +
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
