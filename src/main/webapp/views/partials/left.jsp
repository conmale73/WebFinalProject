<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Category>"/>

<c:choose>
  <c:when test ="${lev2 }"> <%--    neu la Admin--%>

    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif; background-color: ${colorLeftNav[0]}" href="${pageContext.request.contextPath}/AdminServlet/SellerList"  role="tab"  >Sellers List</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif; background-color: ${colorLeftNav[1]}" href="${pageContext.request.contextPath}/AdminServlet/BidderList"  role="tab"  >Bidder List</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif; background-color: ${colorLeftNav[2]}" href="${pageContext.request.contextPath}/AdminServlet/ProductList" role="tab"  >Product List</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif; background-color: ${colorLeftNav[3]}" href="${pageContext.request.contextPath}/AdminServlet/Category"    role="tab"  >Category</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif; background-color: ${colorLeftNav[4]}" href="${pageContext.request.contextPath}/AdminServlet/UserList"    role="tab"  >User List</a>
    </div>
  </c:when>

  <c:when test="${lev1}"> <%--Neu la seller--%>
    <div class="card mt-3">
      <h4 class="card-header">
        Danh Mục seller
      </h4>
      <c:choose>
        <c:when test="${categoriesWithDetails.size()==0}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu</p>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach items="${categoriesWithDetails}" var="c">
            <a href="${pageContext.request.contextPath}/Seller/Product/ByCat?id=${c.IDDanhMuc}" class="list-group-item list-group-item-action">
              <i class="fa fa-caret-right" aria-hidden="true"></i>
                ${c.tenDanhMuc}
            </a>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </c:when>

  <c:when test="${lev0}"> <%--Neu la bidder--%>
    <div class="card mt-3">
      <h4 class="card-header">
        Danh Mục bidder
      </h4>
      <c:choose>
        <c:when test="${categoriesWithDetails.size()==0}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu</p>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach items="${categoriesWithDetails}" var="c">
            <a href="${pageContext.request.contextPath}/Bidder/Product/ByCat?id=${c.IDDanhMuc}&Trang=1" class="list-group-item list-group-item-action">
              <i class="fa fa-caret-right" aria-hidden="true"></i>
                ${c.tenDanhMuc}
            </a>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </c:when>

<c:otherwise>
  <div class="card mt-3">
    <h4 class="card-header">
      <a href="${pageContext.request.contextPath}/Guest/Home/DanhSachSanPham" class="list-group-item list-group-item-action">
        <i class="fa fa-caret-right" aria-hidden="true"></i>
        Danh Mục
      </a>
    </h4>
    <c:choose>
      <c:when test="${categoriesWithDetails.size()==0}">
        <div class="card-body">
          <p class="card-text">Không có dữ liệu</p>
        </div>
      </c:when>
      <c:otherwise>
        <c:forEach items="${categoriesWithDetails}" var="c">
          <a href="${pageContext.request.contextPath}/Guest/Product/ByCat?id=${c.IDDanhMuc}1" class="list-group-item list-group-item-action">
            <i class="fa fa-caret-right" aria-hidden="true"></i>
              ${c.tenDanhMuc}
          </a>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>
</c:otherwise>
</c:choose>
