<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="users" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />
<%--<jsp:useBean id="bidders" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />--%>

<t:main>
    <jsp:body>
<%--        User List--%>
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
                        <th>ID</th> <%--Day la id ng mua--%>
                        <th>Name</th>
                        <th>Date Of birth</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Point</th>
                        <th>Permission</th>   <%--GiaHienTai--%>
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


<%--        <c:choose>--%>
<%--            <c:when test="${bidders.size() == 0}">--%>
<%--                <div class="card-body">--%>
<%--                    <p class="card-text">Không có dữ liệu.</p>--%>
<%--                </div>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>

<%--                <table class="table table-hover table-dark">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>ID</th> &lt;%&ndash;Day la id ng mua&ndash;%&gt;--%>
<%--                        <th>Ho va Ten</th>--%>
<%--                        <th>Ten San Pham</th>   &lt;%&ndash;Lay từ IDSanPham suy ra tên sản phẩm &ndash;%&gt;--%>
<%--                        <th>Giá Đang đấu</th>   &lt;%&ndash;GiaHienTai&ndash;%&gt;--%>
<%--                        <th class="text-right">Price</th>--%>
<%--                        <th class="text-right">Quantity</th>--%>
<%--                        <th>&nbsp;</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach items="${bidders}" var="c">--%>
<%--                        <tr>--%>
<%--                            <td>${c.proName}</td>--%>
<%--                            <td>${c.tinyDes}</td>--%>
<%--                            <td class="text-right">--%>
<%--                                <fmt:formatNumber value="${c.price}" type="number" />--%>
<%--                            </td>--%>
<%--                            <td class="text-right">${c.quantity}</td>--%>
<%--                            <td class="text-right">--%>
<%--                                <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${c.proID}" role="button">--%>
<%--                                    <i class="fa fa-pencil" aria-hidden="true"></i>--%>
<%--                                </a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>

<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
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