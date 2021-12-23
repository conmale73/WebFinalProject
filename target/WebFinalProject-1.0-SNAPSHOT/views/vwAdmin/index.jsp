<%@ page import="com.onelineauction.webfinalproject.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="users" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />
<%--<jsp:useBean id="bidders" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.BidderListDTO>" />--%>
<%--<jsp:useBean id="sellers" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.SellerListDTO>" />--%>
<%--<jsp:useBean id="products" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.ProductCategoryDTO>" />--%>

<t:main>
    <jsp:attribute name="css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">
    <style>
        body {
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
                        <th>Email</th>
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

                                <a class="btn btn-warning"  role="button" href="${pageContext.request.contextPath}/AdminServlet/EditUser?id=${c.id}">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    Edit
                                </a>

                            </td>
                            <td>
                                <a onclick="appearRemove(${c.id})" class="btn btn-danger"  role="button"  id="remove" >
                                    <i class="fa fa-times" aria-hidden="true"></i>
                                    Remove
                                </a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <ul class="pagination">
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
                        <th>ID User</th>
                        <th>ID Sản Phẩm</th> <%--Day la id ng mua--%>
                        <th>Tên Sản Phẩm</th>
                        <th>Giá Hiện tại</th>
                        <th>Giá mua ngay</th>
                        <th>Bước Giá</th>
                        <th>Thời Gian đăng bán</th>
                        <th>Thời Gian kết thúc</th>   <%--GiaHienTai--%>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sellers}" var="s">
                        <tr class="table-success">
                            <td>${s.IDNguoiBan}</td>
                            <td>${s.IDSanPham}</td>
                            <td>${s.tenSanPham }</td>
                            <td><fmt:formatNumber value="${s.giaHienTai}" type="number" /></td>
                            <td><fmt:formatNumber value="${s.giaMuaNgay}" type="number" /></td>
<%--                            <td>${s.giaHienTai}</td>--%>
<%--                            <td>${s.giaMuaNgay}</td>--%>
                            <td>${s.buocGia}</td>
                            <td>${s.thoiGianDangBan}</td>
                            <td>${s.thoiGianKetThuc}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

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
                            <th>ID User</th>
                            <th>Tên Người Đấu Giá</th>
                            <th>ID Sản Phẩm</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Giá Đặt</th>
                            <th>Lượt đặt giá </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${bidders}" var="b">
                            <tr class="table-success">
                                <td>${b.IDNguoiDatGia}</td>
                                <td>${b.hoTen}</td>
                                <td>${b.IDSanPham}</td>
                                <td>${b.tenSanPham}</td>
                                <td><fmt:formatNumber value="${b.giaDat}" type="number" /></td>
                                <td>${b.luotDauGia}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

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
                            <th>Tên Danh Mục</th>
                            <th>Giá ban đầu</th>
                            <th>Giá Mua Ngay</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="p">
                            <tr class="table-success">
                                <td>${p.tenSanPham}</td>
                                <td>${p.tenDanhMuc}</td>
                                <td><fmt:formatNumber value="${p.giaHienTai}" type="number" /></td>
                                <td><fmt:formatNumber value="${p.giaMuaNgay}" type="number" /></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

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

    $(document).ready(function () {
        $(".left-item").hover(function () {
                $(this).css("background-color", "lightblue");
                $(this).css("color", "black");
                $(this).css("background-color", "");

            // $(this).css("font-weight", 800);

            },


        );
    });
    function clickNav()
    {
        $('.left-item').removeClass("active");
        $('.left-item').css("background-color", "");
        $(this).css("background-color", "lightblue");
        $(this).addClass("active");

    }
    function appearRemove(idUser)
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
                console.log("/AdminServlet/RemoveUser?id=" + idUser);
                window.location.href = "${pageContext.request.contextPath}/AdminServlet/RemoveUser?id="+ idUser ;
            }
        })
    }


</script>