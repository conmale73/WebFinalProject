<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="user" scope="request" type="com.onelineauction.webfinalproject.beans.User"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<jsp:useBean id="bidders" scope="request" type="java.util.List<com.onelineauction.webfinalproject.beans.User>" />--%>

<t:main>
<jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <%--    Nếu là Admin--%>
        <c:if test="${lev2}">
            <form action="${pageContext.request.contextPath}/AdminServlet/Update" method="post" id="frmUpdateUser">
                <div class="form-group">
                    <label for="txtName">Name</label>
                    <input type="text" value="<c:out value='${user.name}'/>" class="form-control" id="txtName"
                           name="name"
                           placeholder="" required>
                </div>
                <div class="form-group">
                    <label for="txtDOB">Date Of Birth</label>
<%--                    value="<c:out value='${user.dob}'/>"--%>
                    <input type="text" value="${dob}" class="form-control" id="txtDOB" name="dob" required>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <input type="text" value="${user.address}" class="form-control" id="txtAddress"
                           name="address" placeholder="" required>
                </div>
                <div class="form-group ">
                    <label for="txtEmail">Email</label>
                    <input type="email" value="<c:out value='${user.email}'/>" class="form-control" id="txtEmail"
                           name="email" placeholder="" required>
                </div>
                <div class="form-group ">
                    <label for="txtPoint">Point</label>
                    <input type="text" value="<c:out value='${user.diemUyTin}'/>" class="form-control" id="txtPoint"
                           name="point" placeholder="" required>
                </div>
                <div class="form-group ">
                    <label for="txtPermission">Permission</label>
                    <select class="form-control" id="txtPermission" name="permission">
                        <option value="0">Bidder</option>
                        <option value="1">Seller</option>
                    </select>
                </div>
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary" id="btnSave">Save</button>
                </div>
            </form>

        </c:if>

    </jsp:body>
</t:main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $('#txtDOB').datetimepicker(
        {
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        }
    );
    $( "#btnSave" ).click(function() {
        Swal.fire('Update successfully')
    });
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