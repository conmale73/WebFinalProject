<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="productAuction" scope="request" type="com.onelineauction.webfinalproject.beans.Product" />
<%--<jsp:useBean id="currentUser" scope="request" type="com.onelineauction.webfinalproject.beans.User" />--%>

<%--<jsp:useBean id="auctionList" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.DauGia>"/>--%>
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
                                <div class="thumbnail">
                                    <a href="">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${productAuction.IDSanPham}/anhphu3.jpg" alt="${productAuction.tenSanPham}" style="width:100px">
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
                            <form action="${pageContext.request.contextPath}/Bidder/Product/SubmitAuction" method="post" id="frmAuction${productAuction.IDSanPham}">
                                <div class="form-group">
                                    <label for="soTien">Số tiền muốn đặt</label>
                                    <input type="number" class="form-control" id="soTien" placeholder="Nhập số tiền muốn đặt" name="soTien" required>

                                    <small id="emailHelp" class="form-text text-muted">
                                        Số tiền hợp lệ nhỏ nhất là
                                        <fmt:formatNumber value="${productAuction.buocGia + productAuction.giaHienTai}" type="number" />
                                    </small>
                                </div>
                                <input type="text" name="id" value="${productAuction.IDSanPham}" hidden>
                                <input type="submit" class="btn btn-outline-primary" value="Submit" id="submitAuct">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <h4 class="card-title d-flex justify-content-center">Lịch Sử Đặt Giá</h4>
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
                            <c:if test="${daugia == true}">
                                <c:choose>
                                    <c:when test="${auctionList.size() == 0}">
                                        <div class="card-body">
                                            <p class="card-text">Không có lịch sử đấu giá.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${auctionList}" var="a">
                                            <tr>
                                                <td>${a.luotDauGia}</td>
                                                <td><fmt:formatNumber value="${a.giaDat}" type="number" /></td>
                                                <td>${a.IDNguoiDatGia}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11">

    function daugia(idSanPham, soTien){
        let idSP = 'frmAuction' + idSanPham;
        Swal.fire({
            title: 'Bạn có chắc muốn đấu giá số tiền '+ soTien + " ?",
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, submit it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $(idSP).submit();
            }
        })
        return;
    }

</script>