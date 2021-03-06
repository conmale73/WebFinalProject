<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="productsAuction" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>" />
<%--<jsp:useBean id="auctions" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>" />--%>

<t:main>
  <jsp:body>
    <div class="card">
      <h4 class="card-header">
        Sản Phẩm Đang Tham Gia Đấu Giá
      </h4>
      <c:choose>
        <c:when test="${productsAuction.size() == 0}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="card-body">
            <div class="row">
              <c:forEach items="${productsAuction}" var="c">
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
                      <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Bidder/Product/Detail?id=${c.IDSanPham}" role="button">
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
    </div>
<%--    <a href="${pageContext.request.contextPath}/Product/ByCat?id=${c.IDDanhMuc}" class="list-group-item list-group-item-action">--%>
<%--      <i class="fa fa-caret-right" aria-hidden="true">Trang 1</i>--%>
<%--    </a>--%>
<%--    <a href="${pageContext.request.contextPath}/Product/ByCat_Trang2?id=1" class="list-group-item list-group-item-action">--%>
<%--      <i class="fa fa-caret-right" aria-hidden="true">Trang 2</i>--%>
<%--    </a>--%>
  </jsp:body>
</t:main>