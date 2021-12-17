
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
            <form action="${pageContext.request.contextPath}/Account/Verify" method="post" id="">
                    <div class="form-group ">
                        <label for="txtOTP">Enter OTP</label>
                        <input type="text" class="form-control w-100" id="txtOTP" name="OTP" placeholder="">
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary "  onclick="onVerify()">VeriFy</button>
                    </div>
            </form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<%--<jsp:invoke fragment="js"/>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function onVerify() {
            Swal.fire({
                'title': 'Good job!',
                'text': 'Register succesfully',
                'icon': 'success',
                timer: 5000
            })
    }
</script>
</body>
</html>