<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="productAuction" scope="request" type="com.onelineauction.webfinalproject.beans.Product" />


<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Đấu Giá ${productAuction.tenSanPham}
            </h4>
            <div class="row">
                <div class="col-sm-4 mb-3">

                    <div class="card h-100">
                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${productAuction.IDSanPham}/anhchinh.jpg" alt="${productAuction.tenSanPham}" title="${productAuction.tenSanPham}">
                        <div class="card-body">

                        </div>
                        <div class="card-footer text-muted">
                            <div class="row">
                                <div class="thumbnail">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${productAuction.IDSanPham}/anhphu1.jpg" alt="${productAuction.tenSanPham}" style="width:100px">
                                    </a>
                                </div>
                                <div class="thumbnail">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${productAuction.IDSanPham}/anhphu2.jpg" alt="${productAuction.tenSanPham}" style="width:100px">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">${productAuction.tenSanPham}</h3>
                            <h5 class="card-title text-danger">
                                Giá hiện tại:
                                <fmt:formatNumber value="${productAuction.giaHienTai}" type="number" />
                            </h5>
                            <h5 class="card-title text-danger">
                                Chi tiết:
                            </h5>
                            <p class="card-text">${productAuction.chiTiet}</p>
                            <form action="${pageContext.request.contextPath}/Bidder/Product/Detail?id=${productAuction.IDSanPham}" method="post" id="frmAuction">
                                <div class="form-group">
                                    <label for="soTien">Số tiền muốn đặt</label>
                                    <input type="number" class="form-control" id="soTien" placeholder="Nhập số tiền muốn đặt">
                                    <small id="emailHelp" class="form-text text-muted">
                                        Số tiền muốn đặt phải lớn hơn Giá hiện tại ít nhất
                                        <fmt:formatNumber value="${productAuction.buocGia}" type="number" />
                                    </small>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Xác nhận đặt giá</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card">
<%--                    <jsp:useBean id="auction" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.DauGia>" />--%>
                    <h5 class="card-title">Lịch Sử Đặt Giá</h5>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Giá Đặt</th>
                                <th>Người Đặt Giá</th>
                            </tr>
                            </thead>
                            <tbody>

<%--                            <c:choose>--%>
<%--                                <c:when test="${auction.size() == 0}">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <p class="card-text">Không có lịch sử đấu giá</p>--%>
<%--                                    </div>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <c:forEach items="${auction}">--%>
<%--                                        <tr>--%>
<%--                                            <td>${auction.luotDauGia}</td>--%>
<%--                                            <td>${auction.giaDat}</td>--%>
<%--                                            <td>${auction.IDNguoiDatGia}</td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
<script>

</script>