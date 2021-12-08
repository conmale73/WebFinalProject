<%@ tag pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dau Gia</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<jsp:include page="../../views/partials/nav.jsp"/>
<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-sm-3">
            <div class="list-group" id="list-tab" role="tablist">
                <a class="list-group-item list-group-item-action" data-toggle="list" href="${pageContext.request.contextPath}/AdminServlet/SellerList"  aria-controls="home"role="button" >Sellers List</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="${pageContext.request.contextPath}/AdminServlet/BidderList"  aria-controls="profile"role="button">Bidder List</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="" role="tab" aria-controls="messages">Product List</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="" role="tab" aria-controls="settings">Details</a>
            </div>

        </div>
        <div class="col-sm-9">
            <jsp:doBody/>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script>
    $(".list-group-item").hover(function(){

        $(this).css("background-color", "blue");
    });
</script>
</body>
</html>