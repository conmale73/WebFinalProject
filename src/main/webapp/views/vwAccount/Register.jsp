
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dau Gia</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            height: 100vh;
            background-color: #92a8d1;
        }
    </style>
</head>
<body>

<div class="container-fluid mt-4">
    <a class="btn btn-lg btn-outline-danger " href="${pageContext.request.contextPath}/Home/Index" role="button">
        <i class="fa fa-home" aria-hidden="true"></i>
        Home
    </a>
    <div class="row">

        <div class="col-sm-11 ">
<%--            <jsp:body>--%>
            <form action="" method="post" id="frmRegister">
                <form class="dropdown-menu p-4 "  action="">
                    <div class="form-group ">
                        <label for="txtUsername">Username</label>
                        <input type="text" class="form-control w-100" id="txtUsername" name="username" placeholder="">
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
                        <label for="txtDOB">Date Of Birth</label>
                        <input type="text" class="form-control" id="txtDOB"  name="dob" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <input type="text" class="form-control" id="txtAddress"  name="address" placeholder="">
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="form-group ">
                                <label for="txtEmail">Email</label>
                                <input type="email" class="form-control" id="txtEmail"  name="email" placeholder="">
                            </div>
                        </div>
                        <div class="col-4">
                            <form class="form-inline">
                                <form id="frmSend" action="${pageContext.request.contextPath}/Account/SendEmail" method="post"></form>

                                <a type="submit" class="btn btn-primary mt-5 " href="javascript: $('#frmSend').onsubmit()">
                                    Send
                                </a>
                            </form>
                        </div>
                    </div>

                    <div class="form-group ">
                        <label for="inputCity">OTP sending</label>
                        <form class="form-inline">
                        <input type="text" class="form-control" id="inputCity" name="otp">
                            <a type="submit" class="btn btn-primary ml-2" >
                                Verify
                            </a>
                            <form id="frmVerify" action="${pageContext.request.contextPath}/Account/SendEmail" method="post"></form>

                        </form>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                    <a type="button" class="btn btn-danger" href="${pageContext.request.contextPath}/Account/Login">Login</a>

                </form>
            </form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<%--<jsp:invoke fragment="js"/>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $('#frmRegister').on('submit',function (e)
    {
        e.preventDefault();
        const username = $('#txtUsername').val();   // Kiem tra username có rỗng hay không
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
</body>
</html>