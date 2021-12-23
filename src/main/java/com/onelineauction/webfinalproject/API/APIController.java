package com.onelineauction.webfinalproject.API;

import com.onelineauction.webfinalproject.beans.User;
import com.onelineauction.webfinalproject.models.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet( urlPatterns = "/api-user")
public class APIController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    int page_current= Integer.parseInt( request.getParameter("page_exist"));

    List<User> userlistx = UserModel.paginationUser((page_current-1)*6,6);//Tính tại lúc bắt đầu và các trang tiếp theo

    PrintWriter out = response.getWriter();
    for(User o: userlistx)
    {
        out.println(
                "<tr class=\"table-success\">\n" +
                "                            <td>"+o.getId()+"</td>\n" +
                "                            <td>"+o.getName()+"</td>\n" +
                "                            <td>"+o.getDob()+"</td>\n" +
                "                            <td>"+o.getAddress()+"</td>\n" +
                "                            <td>"+o.getEmail()+"</td>\n" +
                "                            <td>"+o.getDiemUyTin()+"</td>\n" +
                "                            <td>\n" +
                                                this.setTemplateByLevel(o.getLevel()) +
                "                            </td>\n" +
                "                            <td>\n" +
                "\n" +
                "                                <a class=\"btn btn-warning\"  role=\"button\" href=\"${pageContext.request.contextPath}/AdminServlet/EditUser?id="+o.getId()+"\">\n" +
                "                                    <i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>\n" +
                "                                    Edit\n" +
                "                                </a>\n" +
                "\n" +
                "                            </td>\n" +
                "                            <td>\n" +
                "                                <a onclick=\"appearRemove("+o.getId()+")\" class=\"btn btn-danger\"  role=\"button\"  id=\"remove\" >\n" +
                "                                    <i class=\"fa fa-times\" aria-hidden=\"true\"></i>\n" +
                "                                    Remove\n" +
                "                                </a>\n" +
                "\n" +
                "                            </td>\n" +
                "                        </tr>"
        );
    }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private String setTemplateByLevel(int level) {
        String html = "";
        if (level == 0) {
            html = "<strong> Bidder</strong>";
        }
        else if (level == 1) {
            html = "<strong> Seller</strong>";
        }
        else {
            html = "<strong> Admin</strong>";
        }
        return html;
    }
}
