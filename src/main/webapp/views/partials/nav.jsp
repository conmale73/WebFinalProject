<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.onelineauction.webfinalproject.beans.User" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
  <c:when test="${lev2}">
<%--    <nav class="navbar navbar-expand-lg navbar-light bg-light ">--%>
<%--    <a class="navbar-brand" href="#">Đấu Giá Trực Tuyến Admin</a>--%>
<%--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"--%>
<%--            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--      <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>

<%--    <div class="collapse navbar-collapse " id="navbarSupportedContent">--%>
<%--    <ul class="navbar-nav mr-auto">--%>
<%--      <li class="nav-item active">--%>
<%--        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>--%>
<%--      </li>--%>
<%--      <li class="nav-item">--%>
<%--        <a class="nav-link" href="#">Link</a>--%>
<%--      </li>--%>
<%--      <li class="nav-item dropdown">--%>
<%--        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"--%>
<%--           aria-haspopup="true" aria-expanded="false">--%>
<%--          Dropdown--%>
<%--        </a>--%>
<%--        <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--          <a class="dropdown-item" href="#">Action</a>--%>
<%--          <a class="dropdown-item" href="#">Another action</a>--%>
<%--          <div class="dropdown-divider"></div>--%>
<%--          <a class="dropdown-item" href="#">Something else here</a>--%>
<%--        </div>--%>
<%--      </li>--%>
<%--    </ul>--%>

<%--    <div class="">--%>
<%--      <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/Guest/Home/TimKiem">--%>
<%--        <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">--%>
<%--        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--          &lt;%&ndash;        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>&ndash;%&gt;--%>
<%--      </form>--%>
<%--    </div>--%>

  </c:when>
  <c:when test="${lev1}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/Seller/Home/Index">Đấu Giá Trực Tuyến</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarSupportedContentSeller">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/Seller/Sell">Đăng Bán<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/Seller/Auction">Đấu Giá</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownSeller" role="button" data-toggle="dropdown"
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
      <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/Guest/Home/TimKiem">
        <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
<%--        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
      </form>
    </div>

  </c:when>
  <c:when test="${lev0}">
    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/Bidder/Home/Index">Đấu Giá Trực Tuyến</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarSupportedContentBidder">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/Bidder/Home/Index">Trang Chủ <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/Bidder/Auction/Index">Đấu Giá</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBidder" role="button" data-toggle="dropdown"
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
      <div>
        <form id="formTimKiemBidd" action="/Guest/Home/TimKiem" method="get">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownBidderSearchBidd" role="button" data-toggle="dropdown"
                 aria-haspopup="true" aria-expanded="false">
                Tìm Kiếm
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <input type="hidden" name="actionTimKiem" id="actionTimKiemBidd" value="">
                <input class="dropdown-item" id="btnTimKiemGiamDanBidd" type="submit" role="button" value="Xếp theo ngày kết thúc giảm dần">
                <input class="dropdown-item" id="btnTimKiemTangdanBidd" type="submit" role="button" value="Xếp theo giá tăng dần" >
              </div>
            </li>
          </ul>
        </form>
        </ul>
      </div>

<%--      <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/Guest/Home/TimKiem">--%>

<%--        <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">--%>
<%--        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Xếp theo ngày kết thúc giảm dần</button>--%>
<%--          &lt;%&ndash;        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>&ndash;%&gt;--%>
<%--      </form>--%>
<%--      <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/Guest/Home/TimKiemGia">--%>
<%--        <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">--%>
<%--        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Xếp theo giá tăng dần</button>--%>
<%--          &lt;%&ndash;        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>&ndash;%&gt;--%>
<%--      </form>--%>
    </div>

  </c:when>
</c:choose>
    <c:choose>
      <c:when test="${auth}">
        <div class="row">
<%--          <div class="col-10"></div>--%>
          <div class="col-1">
            <form id="frmLogout" action="${pageContext.request.contextPath}/Account/Logout" method="post"></form>
            <ul class="navbar-nav ">
              <li class="nav-item dropdown " >

                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false" >

                  <i class="fa fa-user-o" aria-hidden="true"></i> Hi <b>${authUser.name}</b>
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Guest/Home/Index">Đấu Giá Trực Tuyến</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " id="navbarSupportedContentGuest">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/Guest/Home/Index">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBidderGuest" role="button" data-toggle="dropdown"
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
        <div>
            <form id="formTimKiem" action="/Guest/Home/TimKiem" method="get">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" id="navbarDropdownBidderSearch" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false">
                    Tìm Kiếm
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <input type="hidden" name="actionTimKiem" id="actionTimKiem" value="">
                    <input class="dropdown-item" id="btnTimKiemGiamDan" type="submit" role="button" value="Xếp theo ngày kết thúc giảm dần">
                    <input class="dropdown-item" id="btnTimKiemTangdan" type="submit" role="button" value="Xếp theo giá tăng dần" >
                  </div>
                </li>
              </ul>
            </form>
          </ul>
        </div>

        <div class=" ml-auto">
          <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/Account/Login">Login</a>
          <a type="button" class="btn btn-danger " href="${pageContext.request.contextPath}/Account/Register">Register</a>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</nav>
<script>
  $('#btnTimKiemGiamDan').click(function(){
    document.getElementById("actionTimKiem").value = "Giảm Dần";
    $('#formTimKiem').submit();
  });
  $('#btnTimKiemTangdan').click(function(){
    document.getElementById("actionTimKiem").value = "Tăng Dần";
    $('#formTimKiem').submit();
  });
  //Bidder
  $('#btnTimKiemGiamDanBidd').click(function(){
    document.getElementById("actionTimKiemBidd").value = "Giảm Dần";
    $('#formTimKiemBidd').submit();
  });
  $('#btnTimKiemTangdanBidd').click(function(){
    document.getElementById("actionTimKiemBidd").value = "Tăng Dần";
    $('#formTimKiemBidd').submit();
  });
</script>




