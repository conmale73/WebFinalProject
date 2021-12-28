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
                    <input type="text"  class="form-control" id="txtDOB" name="dob" required>
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
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                    <i class="fa fa-spinner" aria-hidden="true"></i>
                    Reset Password
                </button>
                <div class="d-flex justify-content-center">

                    <button type="submit" class="btn btn-primary" id="btnSave" onclick="clickSave()">
                        <i class="fa fa-hand-o-up" aria-hidden="true"></i>
                        Save</button>
                </div>
            </form>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Reset</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/AdminServlet/Reset" method="post">
                                <label >Reset Password</label>
                                <input type="text" class="form-control" name="rawpwd" placeholder="" required>
                                <label >Send to Email :</label>
                                <input type="text" class="form-control" name="email" value="<c:out value='${user.email}'/>" placeholder="" readonly>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-primary" value="Reset" ></input>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

    </jsp:body>
</t:main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
        const dob = '${dob}';

        dobFormatter = (dob) => {
            const temp = new Date(dob);
            let month = temp.getMonth() + 1;
            let dateFormat = temp.getDate() + "/" + month + "/" + temp.getFullYear();
            // console.log(dateFormat)
            // console.log(typeof dateFormat)
            return dateFormat;
        }

        $('#txtDOB').datetimepicker(
        {
            format: 'd/m/Y',
            timepicker: false,
            mask: true,
            value: dobFormatter(dob)
        }
    );

    // $( "#btnSave" ).click(function() {
    //     Swal.fire('Update successfully')
    // });
    function clickSave()
    {
        Swal.fire({
            title: 'Do you want to save the changes?',
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: 'Save',
            denyButtonText: `Don't save`,
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                Swal.fire('Saved!', '', 'success')
            } else if (result.isDenied) {
                Swal.fire('Changes are not saved', '', 'info')
            }
        })
    }
        function updateSuccess()
        {
            Swal.fire(
                'Update Successfully!',
                'Your record has been updated',
                'success'
            )
        }

</script>