<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="bidders" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />

<t:admin>
    <jsp:body>
        <c:choose>
            <c:when test="${bidders.size() == 0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:when>
            <c:otherwise>

                    <table class="table table-hover table-dark">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Product</th>
                            <th>Desciption</th>
                            <th class="text-right">Price</th>
                            <th class="text-right">Quantity</th>
                            <th>&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="c">
                            <tr>
                                <td>${c.proID}</td>
                                <td>${c.proName}</td>
                                <td>${c.tinyDes}</td>
                                <td class="text-right">
                                    <fmt:formatNumber value="${c.price}" type="number" />
                                </td>
                                <td class="text-right">${c.quantity}</td>
                                <td class="text-right">
                                    <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${c.proID}" role="button">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:admin>