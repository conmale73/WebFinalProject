<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
     <jsp:attribute name="css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&family=Quicksand:wght@500&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />


         <style>
             <c:if test = "${lev2}">

             body {
                height: 100vh;
                background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20201009/pngtree-soft-purple-and-pink-watercolor-paint-background-image_402197.jpg);
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
             </c:if>

             .profile-b
            {
                height: 100vh;
                background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20201009/pngtree-soft-purple-and-pink-watercolor-paint-background-image_402197.jpg);
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
    <h4 class="card-header">
        Profile
    </h4>
        <form action="${pageContext.request.contextPath}/Account/Update" method="post" id="frmUpdateUser">
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
                       name="point" placeholder="" required readonly>
            </div>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                <i class="fa fa-spinner" aria-hidden="true"></i>
                Change PassWord
            </button>
            <div class="d-flex justify-content-center">

                <button type="submit" class="btn btn-primary" id="btnSave" >
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
                        <form action="${pageContext.request.contextPath}/Account/ChangePass" method="post">
                            <label >Old PassWord</label>
                            <input type="password" class="form-control" name="oldpassword" placeholder="" required>
                            <label >New PassWord</label>
                            <input type="password" class="form-control" name="newpassword"  placeholder="" required>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="ChangePassword" ></input>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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

    function updateSuccess()
    {
        Swal.fire(
            'Update Successfully!',
            'Your record has been updated',
            'success'
        )
    }
    function updateFail()
    {
        Swal.fire({
            icon: 'error',
            title: 'Error...',
            text: 'Your Password is not correct',
            footer: '<a href="">Check your Password</a>'
        })
    }
    function requestSuccess()
    {
        Swal.fire(
            'Update Successfully!',
            'Your record has been updated',
            'success'
        )
    }
</script>