<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="product" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.Product>"/>

<t:main>
    <jsp:body>
        <h4 class="card-header">
            Product
        </h4>
        <c:choose>
            <c:when test="${product()==0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-body">
                    <table class="table table-hover">
                        <thread>
                            <tr>
                                <th>#</th>
                                <th>product</th>
                                <th>&nbsp</th>
                            </tr>
                        </thread>
                        <tbody>
                        <c:forEach items="${product}" var="c">
                            <tr>
                                <td>${c.IDSanPham}</td>
                                <td class="text-right">
                                    <a class="btn btn-outline-primaryprimary" href="#" role="button">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:main>