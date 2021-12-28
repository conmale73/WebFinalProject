package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.Product;
import com.onelineauction.webfinalproject.beans.ProductCategoryDTO;
import com.onelineauction.webfinalproject.models.CategoryModel;
import com.onelineauction.webfinalproject.models.ProductModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(urlPatterns = "/api-productFE")
public class APIProductFE extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page_current= Integer.parseInt( request.getParameter("page_exist"));

        List<Product> listproduct  = ProductModel.paginationProductFE((page_current-1)*6,6);//Tính tại lúc bắt đầu và các trang tiếp theo
        PrintWriter out = response.getWriter();
        for(Product o: listproduct) {
            out.println("<div class=\"col-sm-4 mb-3\">\n" +
                    "                                <div class=\"card h-100\">\n" +
                    "                                    <img src=\"/public/imgs/sp/"+o.getIDSanPham()+"/anhchinh.jpg\" alt=\""+o.getIDSanPham()+"\" title=\""+o.getTenSanPham()+"\" class=\"card-img-top h-50\">\n" +
                    "                                    <div class=\"card-body\">\n" +
                    "                                        <h6 class=\"card-title\">"+o.getTenSanPham()+"</h6>\n" +
                    "                                        <h5 class=\"card-title text-danger\">\n" +
                    "                                            Giá hiện tại:\n" + formatNumber(o.getGiaHienTai()) +
                    "                                        </h5>\n" +
                    "                                        <p class=\"card-text\">"+o.getChiTiet()+"</p>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"card-footer text-muted\">\n" +
                    "                                        <a class=\"btn btn-sm btn-outline-primary\" href=\"/Guest/Product/Detail?id="+o.getIDSanPham()+"\" role=\"button\">\n" +
                    "                                            <i class=\"fa fa-eye\" aria-hidden=\"true\"></i>\n" +
                    "                                            Chi tiết\n" +
                    "                                        </a>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </div>");
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
