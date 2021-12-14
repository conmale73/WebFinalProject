<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Category>"/>

<c:choose>
  <c:when test ="${lev2}"> <%--    neu la Admin--%>
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action"  href="${pageContext.request.contextPath}/AdminServlet/SellerList" aria-controls="home" >Sellers List</a>
      <a class="list-group-item list-group-item-action"  href="${pageContext.request.contextPath}/AdminServlet/BidderList" aria-controls="profile" >Bidder List</a>
      <a class="list-group-item list-group-item-action"  href="" role="tab" aria-controls="messages">Product List</a>
      <a class="list-group-item list-group-item-action"  href="" role="tab" aria-controls="settings">Details</a>
    </div>

  </c:when>
  <c:otherwise>
    <div class="card mt-3">
      <h4 class="card-header">
        Danh Mục
      </h4>
      <c:choose>
        <c:when test="${categoriesWithDetails.size()==0}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu</p>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach items="${categoriesWithDetails}" var="c">
            <a href="${pageContext.request.contextPath}/Product/ByCat?id=${c.IDDanhMuc}" class="list-group-item list-group-item-action">
              <i class="fa fa-caret-right" aria-hidden="true"></i>
                ${c.tenDanhMuc}
            </a>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </c:otherwise>
</c:choose>
