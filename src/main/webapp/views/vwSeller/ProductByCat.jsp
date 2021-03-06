<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="productsByCat" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>" />

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Products
            </h4>
            <c:choose>
                <c:when test="${productsByCat.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${productsByCat}" var="c">
                                <div class="col-sm-4 mb-3">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.IDSanPham}/anhchinh.jpg" alt="${c.tenSanPham}" title="${c.tenSanPham}" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title">${c.tenSanPham}</h6>
                                            <h5 class="card-title text-danger">
                                                <fmt:formatNumber value="${c.giaHienTai}" type="number" />
                                            </h5>
                                            <p class="card-text">${c.chiTiet}</p>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Seller/Product/Detail?id=${c.IDSanPham}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Chi Tiết
                                            </a>
                                            <a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/Seller/Product/Auction?id=${c.IDSanPham}" role="button">
                                                <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                Đấu Giá
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:main>