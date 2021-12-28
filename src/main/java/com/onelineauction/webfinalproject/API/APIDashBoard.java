package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.ListRequestUserDTO;
import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.models.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/api-dashboard")
public class APIDashBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int page_current= Integer.parseInt( request.getParameter("page_exist"));

        List<ListRequestUserDTO> listdashboard  = UserModel.paginationDashBoard((page_current-1)*6,6);//Tính tại lúc bắt đầu và các trang tiếp theo

        PrintWriter out = response.getWriter();
        for(ListRequestUserDTO o: listdashboard) {
            out.println("<tr class=\"table-success\">\n" +
                    "                        <td>"+o.getId()+"</td>\n" +
                    "                        <td>"+o.getHoTen()+"</td>\n" +
                    "                        <td>\n" +
                    "                            <c:if test=\""+o.getXacnhan()+"\">\n" +
                    "                                <strong> Bidder</strong>\n" +
                    "                            </c:if>\n" +
                    "                            <c:if test=\""+o.getXacnhan()+"\">\n" +
                    "                                <strong> Seller</strong>\n" +
                    "                            </c:if>\n" +
                    "                        </td>\n" +
                    "                        <td>"+o.getThoiGian()+"</td>\n" +
                    "                        <td>\n" +
                    "                            <c:if test=\""+o.getXacnhan()+"\">\n" +
                    "                            <strong> Chưa Duyệt</strong>\n" +
                    "                        </c:if>\n" +
                    "                            <c:if test=\"${d.xacnhan==1}\">\n" +
                    "                                <strong> Đã Duyệt</strong>\n" +
                    "                            </c:if>\n" +
                    "                        </td>\n" +
                    "                        <td>\n" +
                    "                            <form action=\"${pageContext.request.contextPath}/AdminServlet/AcceptRequest\" method=\"post\">\n" +
                    "\n" +
                    "                                <input type=\"text\" class=\"form-control\"  value=\"<c:out value='${d.id}'/>\" name=\"id\" placeholder=\"\" hidden >\n" +
                    "\n" +
                    "                                <input type=\"text\" class=\"form-control\"value=\"<c:out value='${d.request}'/>\" name=\"request\" placeholder=\"\"hidden >\n" +
                    "\n" +
                    "                                    <c:if test=\"${d.xacnhan==0}\">\n" +
                    "                                        <input type=\"submit\" class=\"btn btn-danger\" value=\"Accept\" >\n" +
                    "                                    </c:if>\n" +
                    "                            </form>\n" +
                    "                        </td>\n" +
                    "                    </tr>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
