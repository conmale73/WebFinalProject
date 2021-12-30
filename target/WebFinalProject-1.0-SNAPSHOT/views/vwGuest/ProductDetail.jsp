<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.ProductForFindID>"/>

<t:main>
    <jsp:body>
        <h4 class="card-header">
            Chi tiết sản phẩm
        </h4>
        <c:choose>
            <c:when test="${products.size()==0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-body">
                    <div class="row">
                        <c:forEach items="${products}" var="product">
                        <div>
                            <div>
                                <div class="card h-100">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhchinh.jpg"
                                         alt="${product.tenSanPham}" title="${product.tenSanPham}"
                                         class="card-img-top h-50">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu1.jpg"
                                         alt="${product.tenSanPham}" title="${product.tenSanPham}">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu2.jpg"
                                         alt="${product.tenSanPham}" title="${product.tenSanPham}">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu3.jpg"
                                         alt="${product.tenSanPham}" title="${product.tenSanPham}">
                                    <div class="card-body">
                                        <h3 class="card-title">${product.tenSanPham}</h3>
                                        <h5 class="card-text mt-3">
                                            Giá hiện tại:
                                            <span class="text-danger font-weight-bold">
                                                <fmt:formatNumber value="${product.giaHienTai}" type="number"/>
                                            </span>
                                        </h5>
                                        <h5 class="card-text mt-3">
                                            Giá mua ngay:
                                            <span class="text-danger font-weight-bold">
                                                <fmt:formatNumber value="${product.giaMuaNgay}" type="number"/>
                                            </span>
                                        </h5>
                                        <h5 class="card-text">Mã số người bán: ${product.IDNguoiBan}</h5>
                                        <h5 class="card-text">Mã số người đặt giá cao nhất hiện
                                            tại: ${product.IDNguoiGiuGiaHienTai}</h5>
                                        <h5>
                                            Ngày đăng:
                                            <fmt:formatDate value="${product.thoiGianDangBan}" type="date"/>
                                        </h5>
                                        <h5>
                                            Ngày kết thúc:
                                            <fmt:formatDate value="${product.thoiGianKetThuc}" type="date"/>
                                        </h5>
                                        <div></div>
                                        <p>Chi tiết: ${product.chiTiet}</p>
                                    </div>
                                </div>
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

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>

<%--<jsp:useBean id="product" scope="request" type="com.onelineauction.webfinalproject.beans.ProductForFindID" />--%>

<%--<t:main>--%>
<%--    <jsp:body>--%>
<%--        <c:choose>--%>
<%--        <c:when test="${product.size()==0}">--%>
<%--            <div class="card-body">--%>
<%--                <p class="card-text">Không có dữ liệu</p>--%>
<%--            </div>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--        <div class="card-body">--%>
<%--        <div></div>--%>
<%--        <div class="row">--%>

<%--        <c:forEach items="${product}" var="c">--%>
<%--        <div class="card">--%>
<%--            <h4 class="card-header">--%>
<%--                    ${product.tenSanPham}--%>
<%--            </h4>--%>
<%--            <div class="card-body">--%>
<%--                <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhchinh.jpg" alt="${product.tenSanPham}" title="${product.tenSanPham}">--%>
<%--                <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu1.jpg" alt="${product.tenSanPham}" title="${product.tenSanPham}">--%>
<%--                <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu2.jpg" alt="${product.tenSanPham}" title="${product.tenSanPham}">--%>
<%--                <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.IDSanPham}/anhphu3.jpg" alt="${product.tenSanPham}" title="${product.tenSanPham}">--%>
<%--                <p class="card-text mt-3">--%>
<%--                    Giá hiện tại:--%>
<%--                    <span class="text-danger font-weight-bold">--%>
<%--            <fmt:formatNumber value="${product.giaHienTai}" type="number" />--%>
<%--          </span>--%>
<%--                </p>--%>
<%--                <p class="card-text mt-3">--%>
<%--                    Giá mua ngay:--%>
<%--                    <span class="text-danger font-weight-bold">--%>
<%--            <fmt:formatNumber value="${product.giaMuaNgay}" type="number" />--%>
<%--          </span>--%>
<%--                <h5 class="card-text">Mã số người bán: ${product.tenSanPham}</h5>--%>
<%--                <h5 class="card-text">Mã số người đặt giá cao nhất hiện tại: ${product.tenSanPham}</h5>--%>
<%--                <h5>--%>
<%--                    Ngày đăng:--%>
<%--                    <fmt:formatDate value="${product.thoiGianDangBan}" type="date" />--%>
<%--                </h5>--%>
<%--                <h5>--%>
<%--                    Ngày kết thúc:--%>
<%--                    <fmt:formatDate value="${product.thoiGianDangBan}" type="date" />--%>
<%--                </h5>--%>
<%--                <p>Chi tiết: ${product.chiTiet}</p>--%>
<%--&lt;%&ndash;                <p class="card-text">Tồn kho: ${product.quantity}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <p class="card-text">${product.fullDes}</p>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        </c:forEach>--%>
<%--        </div>--%>
<%--        </div>--%>
<%--        </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </jsp:body>--%>
<%--</t:main>--%>