<%@ page import="com.onelineauction.webfinalproject.beans.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<jsp:useBean id="users" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />--%>
<%--<jsp:useBean id="bidders" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>" />--%>
<%--<jsp:useBean id="sellers" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>" />--%>
<t:main>
    <jsp:body>
<%--        User List--%>
        <c:if test = "${user==true}">
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
                    </tr>
                    </thead>
                    <tbody>
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
                                <a class="btn btn-warning"  role="button" href="${pageContext.request.contextPath}/AdminServlet/Edit?id=${c.id}">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    Edit
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </c:otherwise>
        </c:choose>
        </c:if>

        <c:if test = "${sell==true}">
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
                        <th>ID</th>
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
                            <td>${s.tenSanPham}</td>
                            <td>${s.giaHienTai}</td>
                            <td>${s.giaMuaNgay}</td>
                            <td>${s.buocGia}</td>
                            <td>${s.thoiGianDangBan}</td>
                            <td>${s.thoiGianKetThuc}</td>
<%--                            <td>--%>
<%--                                <a class="btn btn-warning"  role="button" href="${pageContext.request.contextPath}/AdminServlet/Edit?id=${c.id}">--%>
<%--                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>--%>
<%--                                    Edit--%>
<%--                                </a>--%>
<%--                            </td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </c:otherwise>
        </c:choose>
        </c:if>

    </jsp:body>
</t:main>
<script>

    $(document).ready(function () {
        $(".list-group-item").hover(function () {
                $(this).css("background-color", "yellow");
                $(this).css("color", "black");
                $(this).css("font-weight", 800);

            }, function () {
                $(this).css("background-color", "white");
                $(this).css("color", "black");
                $(this).css("font-weight", 200);
            }
        );
    });
</script>