<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>"/>

<t:main>
    <jsp:body>
        <h4 class="card-header">
            Sản Phẩm
        </h4>
        <c:choose>
            <c:when test="${products.size()==0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-body">
                    <div></div>
                    <div class="row">

                        <c:forEach items="${products}" var="c">
                            <div class="col-sm-4 mb-3">
                                <div class="card h-100">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.IDSanPham}/anhchinh.jpg" alt="${c.tenSanPham}" title="${c.tenSanPham}" class="card-img-top h-50">
                                    <div class="card-body">
                                        <h6 class="card-title">${c.tenSanPham}</h6>
                                        <h5 class="card-title text-danger">
                                            Giá hiện tại:
                                            <fmt:formatNumber value="${c.giaHienTai}" type="number" />
                                        </h5>
                                        <p class="card-text">${c.chiTiet}</p>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Seller/Product/Detail?id=${c.IDSanPham}" role="button">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                            Chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <a href="http://localhost:8080/WebFinalProject/Home/DanhGia" class="list-group-item list-group-item-action">
            Top 5 sản phẩm có nhiều lượt ra giá nhất
        </a>
        <a href="http://localhost:8080/WebFinalProject/Home/GiaCao" class="list-group-item list-group-item-action">
            Top 5 sản phẩm có giá cao nhất
        </a>
    </jsp:body>
</t:main>