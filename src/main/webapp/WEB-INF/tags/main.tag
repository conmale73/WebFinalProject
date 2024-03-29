<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dau Gia</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%--  danh cho footer--%>
<%--  <link rel="stylesheet" src="<c:url value="../../css/abc.css"/>">--%>
  <jsp:invoke fragment="css"/>
  <script>

  </script>
</head>
<c:if test = "${message_delete == 'Xoa Thanh Cong'}">
  <body onload="deleteSuccess()">
</c:if>
<c:if test = "${message_update == 'Update Thanh Cong'}">
<body onload="updateSuccess()">
</c:if>
<c:if test = "${message_update == 'Update That Bai'}">
<body onload="updateFail()">
</c:if>
<c:if test = "${message_category == null}">
<body>
</c:if>
  <jsp:include page="../../views/partials/nav.jsp"/>
  <div class="container-fluid mt-4">
    <div class="row admin-b profile-b">
      <div class="col-sm-2">
        <jsp:include page="../../views/partials/left.jsp"/>
      </div>
      <div class="col-sm-10">
        <jsp:doBody/>
      </div>
    </div>
  </div>

  <jsp:include page="../../views/partials/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

  <jsp:invoke fragment="js"/>
</body>
</html>
<script>

  let lev2 = ${empty lev2}
  if (!lev2) {
    $('.row').removeClass('profile-b')
  }
</script>