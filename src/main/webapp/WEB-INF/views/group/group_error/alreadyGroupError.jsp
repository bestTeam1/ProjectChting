<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->

<html lang="ko">
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Banner Hero -->
<div id="work_banner" class="banner-wrapper bg-light w-100 py-5">
    <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
        <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
            <h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">
                이미 모임장으로 속해있는 모임이 있습니다.
            </h1>
            <h4 class="h5 pb-2 regular-400">
                모임장으로는 1개의 모임에서만 활동이 가능합니다.<br>
                모임 생성을 위해서는 모임을 해산하거나 모임장 권한 위임 후에 생성이 가능합니다. </h4>
            <button onclick="location.href='groupJoin.do?userid=${sessionScope.get("userData").userid}'" class="btn rounded-pill btn-secondary text-light px-4 light-300">
                모임 관리 페이지로 이동
            </button>
        </div>
    </div>
</div>
<!-- End Banner Hero -->
<!-- Start Banner Hero -->
<section class="bg-light">

</section>
<!-- End Recent Work -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
<script>

</script>

</html>
