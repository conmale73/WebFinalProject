<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        Laptop
      </h4>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
          The current link item (edited)
        </a>
        <a href="#" class="list-group-item list-group-item-action">Lenovo</a>
        <a href="#" class="list-group-item list-group-item-action">Apple</a>
        <a href="#" class="list-group-item list-group-item-action">Razer</a>
        <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">A disabled link item</a>
      </div>
    </div>
    <div class="card mt-3">
      <h4 class="card-header">
        Phone
      </h4>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
          The current link item (edited)
        </a>
        <a href="#" class="list-group-item list-group-item-action">Oppo</a>
        <a href="#" class="list-group-item list-group-item-action">Samsung</a>
        <a href="#" class="list-group-item list-group-item-action">Apple</a>
        <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">A disabled link item</a>
      </div>
    </div>
  </c:otherwise>
</c:choose>
