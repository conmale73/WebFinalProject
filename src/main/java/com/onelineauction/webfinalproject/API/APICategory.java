package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.ListRequestUserDTO;
import com.onelineauction.webfinalproject.beans.ProductCategoryDTO;
import com.onelineauction.webfinalproject.models.CategoryModel;
import com.onelineauction.webfinalproject.models.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/api-category")
public class APICategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int page_current= Integer.parseInt( request.getParameter("page_exist"));

        List<ProductCategoryDTO> listCategory  = CategoryModel.paginationCategory((page_current-1)*5,5);//Tính tại lúc bắt đầu và các trang tiếp theo
        PrintWriter out = response.getWriter();
        for(ProductCategoryDTO o: listCategory) {
            out.println("<tr class=\"table-success\">\n" +
                    "                                <td>"+o.getTenDanhMuc()+"</td>\n" +
                    "                                <td class=\"text-center\">"+o.getIDDanhMuc()+"</td>\n" +
                    "                                <td class=\"text-center\">"+o.getSoluong()+"</td>\n" +
                    "                                <td>\n" +
                    "\n" +
                    "                                    <button type=\"button\" class=\"btn btn-warning\" data-toggle=\"modal\" data-target=\"#exampleModalCenter"+o.getIDDanhMuc()+"\">\n" +
                    "                                        <i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>\n" +
                    "                                        Edit\n" +
                    "                                    </button>\n" +
                    "                                </td>\n" +
                    "                                <td>\n" +
                    "                                    <form action=\"/Admin/Category/Delete\" method=\"post\" id=\"formRemoveCategory"+o.getIDDanhMuc()+"\">\n" +
                    "                                        <input type=\"text\" value=\"<c:out value='${c.IDDanhMuc}'/>\" name=\"IDCategory\" hidden>\n" +
                    "                                        <a class=\"btn btn-danger\"><i class=\"fa fa-times\" aria-hidden=\"true\"></i>\n" +
                    "                                            <input type=\"button\" onclick=\"removeCategory("+o.getSoluong()+","+o.getIDDanhMuc()+")\"  class=\"btn btn-danger\"  role=\"button\"  id=\"removeDanhMuc\" value=\"Remove\">\n" +
                    "                                        </a>\n" +
                    "                                    </form>\n" +
                    "                                </td>\n" +
                    "                            </tr>\n" +
                    "                            <div class=\"modal fade\" id=\"exampleModalCenter"+o.getIDDanhMuc()+"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\n" +
                    "                                <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n" +
                    "                                    <div class=\"modal-content\">\n" +
                    "                                        <div class=\"modal-header\">\n" +
                    "                                            <h5 class=\"modal-title\" id=\"exampleModalLongTitle"+o.getIDDanhMuc()+"\">Detailed Category</h5>\n" +
                    "                                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
                    "                                                <span aria-hidden=\"true\">&times;</span>\n" +
                    "                                            </button>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"modal-body\">\n" +
                    "                                            <form action=\"/Admin/Category/Update\" method=\"post\">\n" +
                    "                                                <label >Tên Danh Mục</label>\n" +
                    "                                                <input type=\"text\" class=\"form-control\" value=\""+o.getTenDanhMuc()+"\"  name=\"TenDanhMuc\" placeholder=\"\" required>\n" +
                    "                                                <label >ID Danh Mục</label>\n" +
                    "                                                <input type=\"number\" class=\"form-control\" value=\""+o.getIDDanhMuc()+"\" name=\"IDCategory\" readonly>\n" +
                    "                                                <div class=\"modal-footer\">\n" +
                    "                                                    <input type=\"submit\" class=\"btn btn-primary\" value=\"Update\" ></input>\n" +
                    "                                                </div>\n" +
                    "                                            </form>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </div>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
