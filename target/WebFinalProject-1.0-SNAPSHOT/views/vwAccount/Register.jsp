
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dau Gia</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
    <style>
        body {
            height: 100vh;
            background-color: #92a8d1;
        }

    </style>

    <script type="text/css">
        .valid {
            border: 1px solid green
        }

        .error {
            color: red
        }
        .spinner {
            color: green;
            border: 1px solid;
            position: fixed;
            z-index: 1;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 50 50'%3E%3Cpath d='M28.43 6.378C18.27 4.586 8.58 11.37 6.788 21.533c-1.791 10.161 4.994 19.851 15.155 21.643l.707-4.006C14.7 37.768 9.392 30.189 10.794 22.24c1.401-7.95 8.981-13.258 16.93-11.856l.707-4.006z'%3E%3CanimateTransform attributeType='xml' attributeName='transform' type='rotate' from='0 25 25' to='360 25 25' dur='0.6s' repeatCount='indefinite'/%3E%3C/path%3E%3C/svg%3E") center / 50px no-repeat;
        }
    </script>

</head>
<body>

<div class="container-fluid mt-4">
    <a class="btn btn-lg btn-outline-danger " href="${pageContext.request.contextPath}/Guest/Home/Index" role="button">
        <i class="fa fa-home" aria-hidden="true"></i>
        Home
    </a>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-sm-6 ">
            <div class="row justify-content-md-center">
                <div class="col col-lg-2">
                </div>
                <div class="col-md-auto">
                    <div class="p-3 mb-2 bg-success text-white text-center mx-sm-3 rounded ">Registration Form</div>
                </div>
                <div class="col col-lg-2">
                </div>
            </div>
            <%--            <div class="p-3 mb-2 bg-success text-white text-center mx-sm-3">Registration Form</div>--%>
            <form action="${pageContext.request.contextPath}/Account/OTP" method="post" id="frmRegister">
                <form class="dropdown-menu p-4 " action="">
                    <div class="form-group ">
                        <label for="txtUsername">Username</label>
                        <input type="text" class="form-control w-100" id="txtUsername" name="username" placeholder=""
                               required>
                    </div>
                    <div id="mess1"></div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <input type="password" class="form-control" id="txtPassword" name="rawpwd" required
                               placeholder="Password">
                    </div>
                    <span id="pass_alert" style="color: red"></span>
                    <div class="form-group">
                        <label for="txtConfirm">Confirm</label>
                        <input type="password" class="form-control" id="txtConfirm" name="confirmPassWord"
                               placeholder="Password" required>
                    </div>

                    <div class="form-group">
                        <label for="txtName">Name</label>
                        <input type="text" class="form-control" id="txtName" name="name" placeholder="" required>
                    </div>
                    <div class="form-group">
                        <label for="txtDOB">Date Of Birth</label>
                        <input type="text" class="form-control" id="txtDOB" name="dob" placeholder="" required>
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <input type="text" class="form-control" id="txtAddress" name="address" placeholder="" required>
                    </div>
                    <div class="form-group ">
                        <label for="txtEmail">Email</label>
                        <input type="email" class="form-control" id="txtEmail" name="email" placeholder="" required>
                    </div>
                    <span id="email_alert" style="color: red"></span>

                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary" id="register">Register</button>
                    </div>

                </form>
            </form>

        </div>
    </div>

</div>




<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<%--<jsp:invoke fragment="js"/>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

    $('#txtDOB').datetimepicker(
        {
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        }
    );
    $('#txtUsername').select(); //auto focus

    <%--$('#frmRegister').on('submit', function (e) {--%>
    <%--    e.preventDefault();--%>

    <%--    const username = $('#txtUsername').val();   // Kiem tra username có rỗng hay không--%>
    <%--    $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?user=' + username, function (data) {--%>
    <%--        if (data === true) {--%>
    <%--            $('#frmRegister').off('submit').submit();--%>
    <%--        }--%>
    <%--        else {--%>
    <%--            $('#register').click(function ()--%>
    <%--            {--%>
    <%--                Swal.fire({--%>
    <%--                    icon: 'error',--%>
    <%--                    title: 'Oops...',--%>
    <%--                    text: 'Invalid User!',--%>
    <%--                })--%>
    <%--            })--%>
    <%--        }--%>
    <%--    });--%>

    <%--    // $('#frmRegister').off('submit').submit();--%>

    <%--})--%>

    
    $(document).ready(function () {
        $('#frmRegister').validate({
            rules: {
                username: {
                    required: true,
                    minlength: 6
                },
                email: {
                    required: true,
                    email: true
                },
                rawpwd: {
                    required: true,
                    minlength: 6

                },
                confirmPassWord: {
                    required: true,
                    equalTo: "#txtPassword"
                }

            },
            messages: {
                username: {
                    required: "Name is required",
                    color: red
                },
                confirmPassWord:
                    {
                        equalTo: "PassWords do not match",
                        required: "This is required"
                    }
            }

        });


    });
    // $(document).ready(function(){
    //     const pass = $('#txtPassword').val();
    //     const confirm = $('#txtConfirm').val();
    //     $("#txtPassword").on('input',function(e){
    //         if(pass.length < 7) {
    //             $("#mess1").innerHTML = ("<b>Password must have at least 6 characters</b>");
    //             //alert("Password must have at least 6 characters")
    //             e.preventDefault();
    //
    //         }
    //         });
    //     $("#txtConfirm").on("input", function(){
    //         console.log(confirm);
    //         if (pass === confirm) {
    //             $('#txtPassword').css("border-style", "solid");
    //             $('#txtPassword').css("border-color", "green");
    //
    //             $('#txtConfirm').css("border-style", "solid");
    //             $('#txtConfirm').css("border-color", "green");
    //         }
    //         else {
    //
    //             $('#txtPassword').css("border-style", "solid");
    //             $('#txtPassword').css("border-color", "red");
    //
    //             $('#txtConfirm').css("border-style", "solid");
    //             $('#txtConfirm').css("border-color", "red");
    //         }
    //     });
    // });


</script>

</body>
</html>