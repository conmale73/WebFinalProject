package com.onelineauction.webfinalproject.controllers;

import com.onelineauction.webfinalproject.beans.Category;
import com.onelineauction.webfinalproject.beans.ProductCategoryDTO;
import com.onelineauction.webfinalproject.models.CategoryModel;
import com.onelineauction.webfinalproject.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet", value = "/Admin/Category/*")

public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Category> list = CategoryModel.findAll();
                request.setAttribute("category", list);
                ServletUtils.forward("/views/vwAdmin/IndexCategory.jsp", request, response);
                break;

            case "/Add":
//                ServletUtils.forward("/views/vwAdmin/AddCategory.jsp", request, response);
                break;

            case "/Edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Category c = CategoryModel.findById(id);
                if (c != null) {
                    request.setAttribute("category", c);
                    ServletUtils.forward("/views/vwEditCategory/Edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Category", request, response);
                    // ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/vwAdmin/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/Add":
                addCategory(request, response);
                break;

            case "/Delete":
                deleteCategory(request, response);
                break;

            case "/Update":
                updateCategory(request, response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("TenDanhMuc");
        int id_danhmuc = Integer.parseInt(request.getParameter("IDCategory"));
        Category c = new Category(id_danhmuc,name);
        CategoryModel.add(c);
        loadCategory(request,response);
        request.setAttribute("message_delete",null);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("TenDanhMuc");
        int id_danhmuc = Integer.parseInt(request.getParameter("IDCategory"));
        System.out.println(name);
        System.out.println(id_danhmuc);
        Category c = new Category(id_danhmuc, name);
        CategoryModel.update(c);
        request.setAttribute("message_update","Update Thanh Cong");
        loadCategory(request,response);
        request.setAttribute("message_update",null);
        //ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_danhmuc = Integer.parseInt(request.getParameter("IDCategory"));
        CategoryModel.delete(id_danhmuc);
        request.setAttribute("message_delete","Xoa Thanh Cong");
        loadCategory(request,response);
        request.setAttribute("message_delete",null);
    }
    public void loadCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        List<ProductCategoryDTO> categoryList = CategoryModel.paginationCategory(0,6);
        double totalPageProduct = Math.ceil((double) CategoryModel.findCategoryByID().size() / 6); // trả ra 6 sản phẩm mỗi trang
        request.setAttribute("totalPageProduct", totalPageProduct);
        request.setAttribute("categories", categoryList);
        request.setAttribute("category", true);
        ServletUtils.forward("/views/vwAdmin/index.jsp", request, response);

    }
}
