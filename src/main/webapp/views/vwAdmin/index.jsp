<%@ page import="com.onelineauction.webfinalproject.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<jsp:useBean id="users" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />--%>
<%--<jsp:useBean id="bidders" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.BidderListDTO>" />--%>
<%--<jsp:useBean id="sellers" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.SellerListDTO>" />--%>
<%--<jsp:useBean id="products" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.ProductCategoryDTO>" />--%>
<%--<jsp:useBean id="categories" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.ProductCategoryDTO>" />--%>
<%--<jsp:useBean id="dash" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.ListRequestUserDTO>"/>--%>

<t:main>
    <jsp:attribute name="css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&family=Quicksand:wght@500&display=swap" rel="stylesheet">
        <style>
        body {
            height: 100vh;
            background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20201009/pngtree-soft-purple-and-pink-watercolor-paint-background-image_402197.jpg);
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
        .admin-b
        {
            height: 100vh;
            background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20201009/pngtree-soft-purple-and-pink-watercolor-paint-background-image_402197.jpg);
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
    </style>
    </jsp:attribute>

    <jsp:body>

<%--        User List--%>
        <c:if test = "${user==true}">
            <nav class="rounded-top navbar navbar-light " style="background-color: rgb(255, 127, 80);">
                <span class="navbar-brand mb-0 h1 ">User List</span>
            </nav>
        <c:choose>
            <c:when test="${users.size() == 0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-striped">
                    <thead class="thead-dark">
                    <tr >
                        <th>ID</th>
                        <th>Name</th>
                        <th>Date Of birth</th>
                        <th>Address</th>
                        <th class="text-center">Email</th>
                        <th>Point</th>
                        <th>Permission</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="content-user">
                    <c:forEach items="${users}" var="c">
                        <tr class="table-success">
                            <td>${c.id}</td>
                            <td>${c.name}</td>
                            <td>${c.dob}</td>
                            <td>${c.address}</td>
                            <td>${c.email}</td>
                            <td>${c.diemUyTin}</td>
                            <td>
                                <c:if test="${c.level==0}">
                                    <strong> Bidder</strong>
                                </c:if>
                                <c:if test="${c.level== 1}">
                                    <strong> Seller</strong>
                                </c:if>
                                <c:if test="${c.level== 2}">
                                    <strong> Admin</strong>
                                </c:if>
                            </td>
                            <td>
                                <a class="btn btn-warning"  role="button" href="${pageContext.request.contextPath}/AdminServlet/EditUser?id=${c.id}" id="editUser" >
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    Edit
                                </a>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/AdminServlet/RemoveUser" method="post" id="formRemoveUser${c.id}">

                                    <input type="text" value="<c:out value='${c.id}'/>" name="iduser" hidden>
                                    <input type="button" onclick="removeUserXD(${c.id},'${c.name}')"  class="btn btn-danger"  role="button"  id="removeUser" value="Remove">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-center">
                <ul class="pagination ">
                    <c:set var = "i" scope = "session" value = "${1}"/>
                    <c:forEach var="tolUser " begin ='1' end = '${totalPageUser}'>
                        <li class="page-item list-group" id="list-tab" role="tablist">
                            <a class="page-link list-group-item list-group-item-action" role="tab" data-toggle="list" href="#" onclick="clickUser(${i})">
                            <div  class="text-dark" style="font-weight: bold;"><c:out value = "${i}"/></div>
                            <c:set var = "i" scope = "session" value = "${i+1}"/>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
                </div>
            </c:otherwise>
        </c:choose>
        </c:if>

        <c:if test = "${sell==true}">
            <nav class="rounded-top navbar navbar-light " style="background-color: rgb(255, 127, 80);">
                <span class="navbar-brand mb-0 h1">Seller List</span>
            </nav>
        <c:choose>
            <c:when test="${sellers.size() == 0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:when>
            <c:otherwise>

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <tr >
                        <th>User Name</th>
                        <th>ID Sản Phẩm</th> <%--Day la id ng mua--%>
                        <th>Tên Sản Phẩm</th>
                        <th>Giá Hiện tại</th>
                        <th>Giá mua ngay</th>
                        <th>Bước Giá</th>
                        <th>Thời Gian đăng bán</th>
                        <th>Thời Gian kết thúc</th>   <%--GiaHienTai--%>

                    </tr>
                    </thead>
                    <tbody id="content-seller">
                    <c:forEach items="${sellers}" var="s">
                        <tr class="table-success">
                            <td>${s.username}</td>
                            <td>${s.IDSanPham}</td>
                            <td>${s.tenSanPham }</td>
                            <td><fmt:formatNumber value="${s.giaHienTai}" type="number" /></td>
                            <td><fmt:formatNumber value="${s.giaMuaNgay}" type="number" /></td>
                            <td>${s.buocGia}</td>
                            <td>${s.thoiGianDangBan}</td>
                            <td>${s.thoiGianKetThuc}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-center">
                    <ul class="pagination ">
                        <c:set var = "i" scope = "session" value = "${1}"/>
                        <c:forEach var="tolSeller " begin ='1' end = '${totalPageSeller}'>
                            <li class="page-item list-group" id="list-tab" role="tablist">
                                <a class="page-link list-group-item list-group-item-action" role="tab" data-toggle="list" href="#" onclick="clickSeller(${i})">
                                    <div  class="text-dark" style="font-weight: bold;"><c:out value = "${i}"/></div>
                                    <c:set var = "i" scope = "session" value = "${i+1}"/>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
        </c:if>
<%--        Bidder--%>
        <c:if test = "${bid==true}">
            <nav class="rounded-top navbar navbar-light " style="background-color: rgb(255, 127, 80);">
            <span class="navbar-brand mb-0 h1">Bidder List</span>
            </nav>
            <c:choose>
                <c:when test="${bidders.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>

                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr >
<%--                            <th>ID User</th>--%>
                            <th>Tên Người Đấu Giá</th>
                            <th>ID Sản Phẩm</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Giá Đặt</th>
                            <th>Lượt đặt giá </th>
                        </tr>
                        </thead>
                        <tbody id="content-bidder">
                        <c:forEach items="${bidders}" var="b">
                            <tr class="table-success">
<%--                                <td>${b.IDNguoiDatGia}</td>--%>
                                <td>${b.hoTen}</td>
                                <td>${b.IDSanPham}</td>
                                <td>${b.tenSanPham}</td>
                                <td><fmt:formatNumber value="${b.giaDat}" type="number" /></td>
                                <td>${b.luotDauGia}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        <ul class="pagination ">
                            <c:set var = "i" scope = "session" value = "${1}"/>
                            <c:forEach var="tolBidder " begin ='1' end = '${totalPagesBidder}'>
                                <li class="page-item list-group" id="list-tab" role="tablist">
                                    <a class="page-link list-group-item list-group-item-action" role="tab" data-toggle="list" href="#" onclick="clickBidder(${i})">
                                        <div  class="text-dark" style="font-weight: bold;"><c:out value = "${i}"/></div>
                                        <c:set var = "i" scope = "session" value = "${i+1}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:if>
<%--        Product--%>
        <c:if test = "${pro==true}">
            <nav class="rounded-top navbar navbar-light " style="background-color: rgb(255, 127, 80);">
            <span class="navbar-brand mb-0 h1">Product List</span>
            </nav>
            <c:choose>
                <c:when test="${products.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>

                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr >
                            <th>Tên Sản Phẩm</th>
                            <th>ID Sản Phẩm</th>
                            <th>Tên Danh Mục</th>
                            <th>Giá ban đầu</th>
                            <th>Giá Mua Ngay</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="content-product">
                        <c:forEach items="${products}" var="p">
                            <tr class="table-success">
                                <td>${p.tenSanPham}</td>
                                <td>${p.IDSanPham}</td>
                                <td>${p.tenDanhMuc}</td>
                                <td><fmt:formatNumber value="${p.giaHienTai}" type="number" /></td>
                                <td><fmt:formatNumber value="${p.giaMuaNgay}" type="number" /></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${p.IDSanPham}" >
                                        Details
                                    </button>
                                </td>
                                <td>
                                    <a onclick="appearRemoveProduct('${p.IDSanPham}')" class="btn btn-danger"  role="button"  id="removeProduct" >
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                        Remove
                                    </a>
                                </td>
                            </tr>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter${p.IDSanPham}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle${p.IDSanPham}">Detailed Product</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body " style="margin: 0 auto">
                                            <div class="card" style="width: 18rem;">
                                                <img width="285px" height="190px" src="${pageContext.request.contextPath}/public/imgs/sp/${p.IDSanPham}/anhchinh.jpg" alt="${p.tenSanPham}" title="${p.tenSanPham}" class="card-img-top">
                                                <div class="card-body">
                                                    <p class="card-text">${p.chiTiet}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        <ul class="pagination ">
                            <c:set var = "i" scope = "session" value = "${1}"/>
                            <c:forEach var="tolProduct " begin ='1' end = '${totalPageProduct}'>
                                <li class="page-item list-group" id="list-tab" role="tablist">
                                    <a class="page-link list-group-item list-group-item-action" role="tab" data-toggle="list" href="#" onclick="clickProduct(${i})">
                                        <div  class="text-dark" style="font-weight: bold;"><c:out value = "${i}"/></div>
                                        <c:set var = "i" scope = "session" value = "${i+1}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test = "${category==true}">
            <nav class="rounded-top navbar navbar-light " style="background-color: rgb(255, 127, 80);">
                <span class="navbar-brand mb-0 h1">Category</span>

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    <i class="fa fa-plus-circle" aria-hidden="true"></i>
                    Add Category
                </button>
            </nav>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/Admin/Category/Add" method="post">
                                <label >Tên Danh Mục</label>
                                <input type="text" class="form-control"  name="TenDanhMuc" placeholder="" required>
                                <label >ID danh mục</label>
                                <input type="text" class="form-control" name="IDCategory" placeholder="" required>
                                <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="Add" ></input>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <c:choose>
                <c:when test="${categories.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>

                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr >
                            <th>Tên Danh Mục</th>
                            <th class="text-center">ID Danh Mục</th>
                            <th class="text-center">Số Lượng</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="content-category">
                        <c:forEach items="${categories}" var="c">
                            <tr class="table-success">
                                <td>${c.tenDanhMuc}</td>
                                <td class="text-center">${c.IDDanhMuc}</td>
                                <td class="text-center">${c.soluong}</td>
                                <td>

                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModalCenter${c.IDDanhMuc}">
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                        Edit
                                    </button>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Admin/Category/Delete" method="post" id="formRemoveCategory${c.IDDanhMuc}">
                                        <input type="text" value="<c:out value='${c.IDDanhMuc}'/>" name="IDCategory" hidden>
                                        <a class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i>
                                            <input type="button" onclick="removeCategory(${c.soluong},${c.IDDanhMuc})"  class="btn btn-danger"  role="button"  id="removeDanhMuc" value="Remove">
                                        </a>
                                    </form>
                                </td>
                            </tr>
                            <div class="modal fade" id="exampleModalCenter${c.IDDanhMuc}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle${c.IDDanhMuc}">Detailed Category</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="${pageContext.request.contextPath}/Admin/Category/Update" method="post">
                                                <label >Tên Danh Mục</label>
                                                <input type="text" class="form-control" value="<c:out value='${c.tenDanhMuc}'/>"  name="TenDanhMuc" placeholder="" required>
                                                <label >ID Danh Mục</label>
                                                <input type="number" class="form-control" value="<c:out value='${c.IDDanhMuc}'/>" name="IDCategory" readonly>
                                                <div class="modal-footer">
                                                    <input type="submit" class="btn btn-primary" value="Update" ></input>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        <ul class="pagination ">
                            <c:set var = "i" scope = "session" value = "${1}"/>
                            <c:forEach var="tolCategory " begin ='1' end = '${totalPageCategory}'>
                                <li class="page-item list-group" id="list-tab" role="tablist">
                                    <a class="page-link list-group-item list-group-item-action" role="tab" data-toggle="list" href="#" onclick="clickCategory(${i})">
                                        <div class="text-dark" style="font-weight: bold;"><c:out value="${i}"/></div>
                                        <c:set var="i" scope="session" value="${i+1}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test="${dash==true}">
            <nav class="rounded-top navbar navbar-light " style="background-color: rgb(255, 127, 80);">
                <span class="navbar-brand mb-0 h1">DashBoard</span>
            </nav>
            <c:choose>
                <c:when test="${dashboard.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>

                    <table class="table table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID user</th>
                        <th>Tên</th>
                        <th>Permission</th>
                        <th>Thời Gian</th>
                        <th>Trạng Thái</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="content-dashboard">
                    <c:forEach items="${dashboard}" var="d">
                    <tr class="table-success">
                        <td>${d.id}</td>
                        <td>${d.hoTen}</td>
                        <td>
                            <c:if test="${d.request==0}">
                                <strong> Bidder</strong>
                            </c:if>
                            <c:if test="${d.request==1}">
                                <strong> Seller</strong>
                            </c:if>
                        </td>
                        <td>${d.thoiGian}</td>
                        <td>
                            <c:if test="${d.xacnhan==0}">
                            <strong> Chưa Duyệt</strong>
                        </c:if>
                            <c:if test="${d.xacnhan==1}">
                                <strong> Đã Duyệt</strong>
                            </c:if>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/AdminServlet/AcceptRequest" method="post">

                                <input type="text" class="form-control"  value="<c:out value='${d.id}'/>" name="id" placeholder="" hidden >

                                <input type="text" class="form-control"value="<c:out value='${d.request}'/>" name="request" placeholder=""hidden >

                                    <c:if test="${d.xacnhan==0}">
                                        <input type="submit" class="btn btn-danger" value="Accept" >
                                    </c:if>
                            </form>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                        <div class="d-flex justify-content-center">
                            <ul class="pagination ">
                                <c:set var = "i" scope = "session" value = "${1}"/>
                                <c:forEach var="tolDashboard " begin ='1' end = '${totalDashBoard}'>
                                    <li class="page-item list-group" id="list-tab" role="tablist">
                                        <a class="page-link list-group-item list-group-item-action" role="tab" data-toggle="list" href="#" onclick="clickDashboard(${i})">
                                            <div  class="text-dark" style="font-weight: bold;"><c:out value = "${i}"/></div>
                                            <c:set var = "i" scope = "session" value = "${i+1}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>


                </c:otherwise>
            </c:choose>
        </c:if>
    </jsp:body>
</t:main>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

    function clickUser(page)
    {
        $('.page-link').removeClass("active");
        $(this).addClass("active");
        <%--"<c:url value="/api-user" />"--%>
        event.preventDefault();
        $.ajax({
            url: "<c:url value="/api-user" />",
            type: "get",
            data:{
                page_exist:page
            },
            success: function (response) {
                document.getElementById("content-user").innerHTML = response;

                // $('#content-user').innerHTML=response
            },
            error: function (xhr) {
                alert("Loading data not success. Please comeback later <3")
            }
        })
    }
    function clickSeller(page)
    {
        $('.page-link').removeClass("active");
        $(this).addClass("active");
        <%--"<c:url value="/api-user" />"--%>
        event.preventDefault();
        $.ajax({
            url: "<c:url value="/api-seller" />",
            type: "get",
            data:{
                page_exist:page
            },
            success: function (response) {
                document.getElementById("content-seller").innerHTML = response;

                // $('#content-user').innerHTML=response $(selector).html(content)
            },
            error: function (xhr) {
                alert("Loading data not success. Please comeback later <3")
            }
        })
    }
    function clickBidder(page)
    {
        $('.page-link').removeClass("active");
        $(this).addClass("active");
        <%--"<c:url value="/api-user" />"--%>
        event.preventDefault();
        $.ajax({
            url: "<c:url value="/api-bidder" />",
            type: "get",
            data:{
                page_exist:page
            },
            success: function (response) {
                document.getElementById("content-bidder").innerHTML = response;

                // $('#content-user').innerHTML=response $(selector).html(content)
            },
            error: function (xhr) {
                alert("Loading data not success. Please comeback later <3")
            }
        })
    }
    function clickProduct(page)
    {
        $('.page-link').removeClass("active");
        $(this).addClass("active");
        event.preventDefault();
        $.ajax({
            url: "<c:url value="/api-product" />",
            type: "get",
            data:{
                page_exist:page
            },
            success: function (response) {
                document.getElementById("content-product").innerHTML = response;

                // $('#content-user').innerHTML=response $(selector).html(content)
            },
            error: function (xhr) {
                alert("Loading data not success. Please comeback later <3")
            }
        })
    }
    function clickDashboard(page)
    {
        $('.page-link').removeClass("active");
        $(this).addClass("active");

        event.preventDefault();
        $.ajax({
            url: "<c:url value="/api-dashboard" />",
            type: "get",
            data:{
                page_exist:page
            },
            success: function (response) {
                document.getElementById("content-dashboard").innerHTML = response;

                // $('#content-user').innerHTML=response
            },
            error: function (xhr) {
                alert("Loading data not success. Please comeback later <3")
            }
        })
    }
    function clickCategory(page)
    {
        $('.page-link').removeClass("active");
        $(this).addClass("active");

        event.preventDefault();
        $.ajax({
            url: "<c:url value="/api-category" />",
            type: "get",
            data:{
                page_exist:page
            },
            success: function (response) {
                document.getElementById("content-category").innerHTML = response;

                // $('#content-user').innerHTML=response
            },
            error: function (xhr) {
                alert("Loading data not success. Please comeback later <3")
            }
        })
    }
    function removeUserXD(iduser,name)
    {
        let id= '#formRemoveUser'+iduser;
            Swal.fire({
                title: 'Do you want to delete '+ name + " ?",
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $(id).submit();
                }
            })
        return;
    }

    function removeCategory(soluong,idDanhmuc)
    {
        // event.preventDefault();
        let id= '#formRemoveCategory'+idDanhmuc;

        if(soluong!=0)
        {
            
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Không Thế Xóa Danh Mục',
                footer: '<a href="">Why do I have this issue?</a>'
            })
            return;
        }
        else
        {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {

                    $(id).submit();
                }
            })
            return;
        }
    }

    function deleteSuccess()
    {
        Swal.fire(
            'Delete Successfully!',
            'Your record has been deleted',
            'success'
        )
    }
    function updateSuccess()
    {
        Swal.fire(
            'Update Successfully!',
            'Your record has been updated',
            'success'
        )
    }

    function appearRemoveProduct(idProduct)
    {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {

                Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                )
                <%--console.log("/AdminServlet/RemoveProduct?id=" + idProduct);--%>
                <%--window.location.href = "${pageContext.request.contextPath}/AdminServlet/RemoveProduct?id="+ idProduct ;--%>
            }
        })
    }

</script>