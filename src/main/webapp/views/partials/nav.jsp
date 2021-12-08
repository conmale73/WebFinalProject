<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.onelineauction.webfinalproject.beans.User" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
  <c:when test="${lev2}">

  </c:when>
  <c:otherwise>
    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>

    <div class="">
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </c:otherwise>
</c:choose>
    <c:choose>
      <c:when test="${auth}">
        <div class="row">
          <div class="col-10"></div>
          <div class="col-2">
            <form id="frmLogout" action="${pageContext.request.contextPath}/Account/Logout" method="post"></form>
            <ul class="navbar-nav ">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                  Hi <b>${authUser.name}</b>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Profile">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    Profile
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                    <i class=" fa fa-sign-out" aria-hidden="true"></i>
                    Sign out
                  </a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </c:when>
      <c:otherwise>
        <div class=" ml-auto">
          <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/Account/Login">Login</a>
          <a type="button" class="btn btn-danger " href="${pageContext.request.contextPath}/Account/Register">Register</a>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</nav>




