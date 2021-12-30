<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.onelineauction.webfinalproject.beans.User" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:choose>
  <c:when test="${lev2}">


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

    </ul>

    <div>
<%--      <form id="formTimKiemSell" action="/Guest/Home/TimKiem" method="get">--%>
<%--        <ul class="navbar-nav mr-auto">--%>
<%--          <li class="nav-item">--%>
<%--            <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">--%>
<%--          </li>--%>
<%--          <li class="nav-item dropdown">--%>
<%--            <a class="nav-link dropdown-toggle" id="navbarDropdownBidderSearchSell" role="button" data-toggle="dropdown"--%>
<%--               aria-haspopup="true" aria-expanded="false">--%>
<%--              Tìm Kiếm--%>
<%--            </a>--%>
<%--            <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--              <input type="hidden" name="actionTimKiem" id="actionTimKiemSell" value="">--%>
<%--              <input class="dropdown-item" id="btnTimKiemGiamDanSell" type="submit" role="button" value="Xếp theo ngày kết thúc giảm dần">--%>
<%--              <input class="dropdown-item" id="btnTimKiemTangdanSell" type="submit" role="button" value="Xếp theo giá tăng dần" >--%>
<%--            </div>--%>
<%--          </li>--%>
<%--        </ul>--%>
<%--      --%>
<%--    </ul>--%>
      <div>
        <form id="formTimKiemSell" action="/Guest/Home/TimKiem" method="get">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <input class="form-control mr-sm-2" name="txtTen" type="text" placeholder="Search" aria-label="Search">
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownBidderSearchSell" role="button" data-toggle="dropdown"
                 aria-haspopup="true" aria-expanded="false">
                Tìm Kiếm
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <input type="hidden" name="actionTimKiem" id="actionTimKiemSell" value="">
                <input class="dropdown-item" id="btnTimKiemGiamDanSell" type="submit" role="button" value="Xếp theo ngày kết thúc giảm dần">
                <input class="dropdown-item" id="btnTimKiemTangdanSell" type="submit" role="button" value="Xếp theo giá tăng dần" >
              </div>
            </li>
          </ul>
        </form>

      </div>

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

      </div>
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
                  <c:if test = "${lev0}">
                  <form action="<c:url value="/Account/NangCap"/>" method="get" id="formNangCap">
                    <div style="padding: 0!important;" class="dropdown-item" >
                      <input style="width: 100%" type="button" onclick="appearnav('Nâng Cấp')"  class="btn btn-danger"  role="button"  value="Nâng Cấp">
                    </div>
                  </form>
                  </c:if>
                  <c:if test = "${lev1}">

                  <form action="${pageContext.request.contextPath}/Account/HaCap" method="get" id="formHaCap">
                    <div style="padding: 0!important;" class="dropdown-item" >
                    <input style="width: 100%" type="button" onclick="appearnav('Hạ Cấp')"  class="btn btn-danger"  role="button"  value="Hạ Cấp">
                    </div>
                  </form>
                  </c:if>
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
  //
  $('#btnTimKiemGiamDanSell').click(function(){
    document.getElementById("actionTimKiemSell").value = "Giảm Dần";
    $('#formTimKiemSell').submit();
  });
  $('#btnTimKiemTangdanSell').click(function(){
    document.getElementById("actionTimKiemSell").value = "Tăng Dần";
    $('#formTimKiemSell').submit();
  });
  function appearnav(re)
  {
    let id = '#formNangCap';
    // if(re === "Nangcap")
    // {
    //   let id= '#formNangCap'
    // }
    if(re === "Hạ Cấp")
    {
      id = '#formHaCap'
    }
    Swal.fire({
      title: 'Bạn có chắc muốn '+ re + ' ?',
      text: "Vui Lòng Cân nhắc ",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes'
    }).then((result) => {
      if (result.isConfirmed) {

        $(id).submit();
      }
    })
  }
  <c:if test = "${request_success.equals('Dang Ky')}">
  Swal.fire({
    'title': 'Good job!',
    'text': 'Gửi Yêu Cầu Thành Công',
    'icon': 'success',
    timer: 3000
  })
  </c:if>
</script>




