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

        List<ListRequestUserDTO> listdashboard  = UserModel.paginationDashBoard((page_current-1)*5,5);//Tính tại lúc bắt đầu và các trang tiếp theo

        PrintWriter out = response.getWriter();
        for(ListRequestUserDTO o: listdashboard) {
            out.println("<tr class=\"table-success\">\n" +
                    "                        <td>"+o.getId()+"</td>\n" +
                    "                        <td>"+o.getHoTen()+"</td>\n" +
                    "                        <td>\n" +checkpermission(o.getRequest())+ "</td>\n" +
                    "                        <td>"+o.getThoiGian()+"</td>\n" +
                    "                        <td>\n" +checkStatus(o.getXacnhan())+"</td>\n" +
                    "                        <td>\n" +
                    "                            <form action=\"${pageContext.request.contextPath}/AdminServlet/AcceptRequest\" method=\"post\">\n" +
                    "\n" +
                    "                                <input type=\"text\" class=\"form-control\"  value=\""+o.getId()+"\" name=\"id\" placeholder=\"\" hidden >\n" +
                    "\n" +
                    "                                <input type=\"text\" class=\"form-control\"value=\""+o.getRequest()+"\" name=\"request\" placeholder=\"\"hidden >\n" +
                    "\n" +
                                                    checkAccept(o.getXacnhan())+
                    "                            </form>\n" +
                    "                        </td>\n" +
                    "                    </tr>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public String checkpermission(int request)
    {
        String html="";
        if(request==0)
            html="<strong> Bidder</strong>";
        else
            html="<strong> Seller</strong>";
        return html;
    }
    public String checkStatus(int request)
    {
        String html="";
        if(request==0)
            html="<strong> Chưa Duyệt</strong>";
        else
            html="<strong> Đã Duyệt</strong>";
        return html;
    }
    public String checkAccept(int request)
    {
        String html="";
        if(request==0)
            html="<input type=\"submit\" class=\"btn btn-danger\" value=\"Accept\" >";
        return html;
    }
}
