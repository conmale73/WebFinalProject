<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 24-Dec-21
  Time: 5:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.ProductForNew>"/>

<t:main>
    <jsp:body>
        <h4 class="card-header">
            Thời gian kết thúc giảm dần
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
                                    <div class="card-body" style="background-color: burlywood">
                                        <c:if test="${c.neworold<30}">
                                            <h6 class="card-title">${c.tenSanPham} (NEW PRODUCT)</h6>
                                        </c:if>
                                        <c:if test="${c.neworold>30}">
                                            <h6 class="card-title">${c.tenSanPham}</h6>
                                        </c:if>
                                        <h5 class="card-title text-danger">
                                            Giá hiện tại:
                                            <fmt:formatNumber value="${c.giaHienTai}" type="number" />
                                        </h5>
                                        <p class="card-text">${c.chiTiet}</p>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Guest/Product/Detail?id=${c.IDSanPham}" role="button">
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
    </jsp:body>
</t:main>
