<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:main>

    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $('#frmRegister').on('submit',function (e)
        {
            e.preventDefault();
            const username = $('#txtUsername').val();
            if(username.length===0)
            {
                alert('Invalid username');
                return;
            }
            $('#frmRegister').off('submit').submit();
        });
        $('#txtDOB').datetimepicker(
            {
                format : 'd/m/Y',
                timepicker:false,
                mask:true
            }
        );
        $('#txtUsername').select(); //auto focus
    </script>
    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="frmRegister">
        <form class="dropdown-menu p-4" action="">
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <input type="text" class="form-control" id="txtUsername" name="username" placeholder="">
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <input type="password" class="form-control" id="txtPassword" name="rawpwd" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="txtConfirm">Confirm</label>
                <input type="password" class="form-control" id="txtConfirm"  placeholder="Password">
            </div>
            <div class="form-group">
                <label for="txtName">Name</label>
                <input type="text" class="form-control" id="txtName"  name="name" placeholder="">
            </div>
            <div class="form-group">
                <label for="txtAddress">Address</label>
                <input type="text" class="form-control" id="txtAddress"  name="address" placeholder="">
            </div>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <input type="email" class="form-control" id="txtEmail"  name="email" placeholder="">
            </div>
            <div class="form-group">
                <label for="txtDOB">Date Of Birth</label>
                <input type="text" class="form-control" id="txtDOB"  name="dob" placeholder="">
            </div>

            <button type="submit" class="btn btn-primary">
                Register
            </button>

        </form>
        </form>
    </jsp:body>
</t:main>