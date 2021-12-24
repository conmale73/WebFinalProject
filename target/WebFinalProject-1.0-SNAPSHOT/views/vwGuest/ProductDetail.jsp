<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="product" scope="request" type="com.onelineauction.webfinalproject.beans.Product" />

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                    ${product.tenSanPham}
            </h4>
            <div class="card-body">
                <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhchinh.jpg" alt="${product.tenSanPham}" title="${product.tenSanPham}">
                <p class="card-text mt-3">
                    Giá mua ngay:
                    <span class="text-danger font-weight-bold">
            <fmt:formatNumber value="${product.giaMuaNgay}" type="number" />
          </span>
                </p>
<%--                <p class="card-text">Tồn kho: ${product.quantity}</p>--%>
<%--                <p class="card-text">${product.fullDes}</p>--%>
            </div>
        </div>
    </jsp:body>
</t:main>