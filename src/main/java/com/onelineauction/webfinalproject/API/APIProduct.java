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
                List<ProductCategoryDTO> productList = ProductModel.paginationProduct((page_current - 1) * 5, 5);//Tính tại lúc bắt đầu và các trang tiếp theo

                PrintWriter out = response.getWriter();
                for (ProductCategoryDTO o : productList) {

                    out.println("<tr class=\"table-success\">\n" +
                            "                                <td>"+o.getTenSanPham()+"</td>\n" +
                            "                                <td>"+o.getIDSanPham()+"</td>\n" +
                            "                                <td>"+o.getTenDanhMuc()+"</td>\n"+
                            "                                <td>"+ formatNumber(o.getGiaHienTai())+"</td>\n" +
                            "                                <td>"+ formatNumber(o.getGiaMuaNgay())+"</td>\n" +
                            "<td>\n" +
                            "                                    <button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#exampleModalCenter"+o.getIDSanPham()+"\" >\n" +
                            "                                        Details\n" +
                            "                                    </button>\n" +
                            "                                </td>\n" +
                            "                                <td>\n" +
                            "                                    <a onclick=\"appearRemoveProduct('"+o.getIDSanPham()+"')\" class=\"btn btn-danger\"  role=\"button\"  id=\"removeProduct\" >\n" +
                            "                                        <i class=\"fa fa-times\" aria-hidden=\"true\"></i>\n" +
                            "                                        Remove\n" +
                            "                                    </a>\n" +
                            "                                </td>"+
                            "                            </tr>"+
                            "<!-- Modal -->\n" +
                            "                            <div class=\"modal fade\" id=\"exampleModalCenter"+o.getIDSanPham()+"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\n" +
                            "                                <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n" +
                            "                                    <div class=\"modal-content\">\n" +
                            "                                        <div class=\"modal-header\">\n" +
                            "                                            <h5 class=\"modal-title\" id=\"exampleModalLongTitle"+o.getIDSanPham()+"\">Detailed Product</h5>\n" +
                            "                                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
                            "                                                <span aria-hidden=\"true\">&times;</span>\n" +
                            "                                            </button>\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"modal-body \" style=\"margin: 0 auto\" >\n" +
                            "                                            <div class=\"card\" style=\"width: 18rem;\">\n" +
                            "                                                <img width=\"285px\" height=\"190px\" src=\"/public/imgs/sp/"+o.getIDSanPham()+"/anhchinh.jpg\" alt=\""+o.getTenSanPham()+"\" title=\""+o.getTenSanPham()+"\" class=\"card-img-top\">\n" +
                            "                                                <div class=\"card-body\">\n" +
                            "                                                    <p class=\"card-text\">"+o.getChiTiet()+"</p>\n" +
                            "                                                </div>\n" +
                            "                                            </div>\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"modal-footer\">\n" +
                            "                                            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\n" +
                            "\n" +
                            "                                        </div>\n" +
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
