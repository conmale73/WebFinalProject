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
                    Giá hiện tại:
                    <span class="text-danger font-weight-bold">
                        <fmt:formatNumber value="${product.giaHienTai}" type="number" />
                    </span>
                    <br/>
                    Giá mua ngay:
                    <span class="text-danger font-weight-bold">
                        <fmt:formatNumber value="${product.giaMuaNgay}" type="number" />
                    </span>
                </p>
                <p class="card-text mt-3">${product.chiTiet}</p>
            </div>
            <div class="card-footer text-muted">
                <div class="row">
                    <div class="thumbnail">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu1.jpg" alt="${product.tenSanPham}" style="width:200px">
                        </a>
                    </div>
                    <div class="thumbnail">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu2.jpg" alt="${product.tenSanPham}" style="width:200px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>