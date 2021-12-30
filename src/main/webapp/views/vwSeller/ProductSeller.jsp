<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--<jsp:useBean id="productsSeller" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>" />--%>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Sản Phẩm Của Tôi
            </h4>
            <c:if test="${sell == true}">
                <c:choose>
                    <c:when test="${selleritems.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach items="${selleritems}" var="c">
                                    <div class="col-sm-4 mb-3">
                                        <div class="card h-100">
                                            <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.IDSanPham}/anhchinh.jpg" alt="${c.tenSanPham}" title="${c.tenSanPham}" class="card-img-top">
                                            <div class="card-body">
                                                <h5 class="card-title">${c.tenSanPham}</h5>
                                                <h5 class="card-title text-danger">
                                                    <fmt:formatNumber value="${c.giaHienTai}" type="number" />
                                                </h5>
                                                <p class="card-text">
                                                    Chi Tiết:
                                                        ${c.chiTiet}
                                                </p>
                                                <h5 class="card-title">
                                                    Thời Gian Kết Thúc Đấu Giá:
                                                        ${c.thoiGianKetThuc}
                                                </h5>
                                            </div>
                                            <div class="card-footer text-muted">
                                                <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Seller/Product/Detail?id=${c.IDSanPham}" role="button">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                    Chi Tiết
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </jsp:body>
</t:main>