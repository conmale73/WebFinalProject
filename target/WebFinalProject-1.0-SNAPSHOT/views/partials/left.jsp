<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Category>"/>

<c:choose>
  <c:when test ="${lev2}"> <%--    neu la Admin--%>
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif;"  href="${pageContext.request.contextPath}/AdminServlet/SellerList" onclick="clickNav()" role="tab"  >Sellers List</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif;" href="${pageContext.request.contextPath}/AdminServlet/BidderList" onclick="clickNav()" role="tab"  >Bidder List</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif;" href="${pageContext.request.contextPath}/AdminServlet/ProductList"onclick="clickNav()" role="tab"  >Product List</a>
      <a class="list-group-item list-group-item-action left-item" style="font-family: 'Oswald', sans-serif;font-family: 'Quicksand', sans-serif;" href="${pageContext.request.contextPath}/AdminServlet/UserList"   onclick="clickNav()" role="tab"  >User List</a>
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
      Danh Mục guest
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
