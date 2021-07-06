<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/27
  Time: 3:24 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<div class="container-fluid mb-5" id="loginBody">

    <section class="container text-center my-5 mx-xxl-auto">
        <div class="row text-center px-md-3 py-md-3 my-xxl-auto">
            <div class="col-lg-12 d-flex align-items-center text-center justify-content-center">

                <div class="col-md-2"></div>

                <div class="col-md-8 m-5 border border-1"
                     style="background-color: lavender; border-radius: 25px;">
                    <div class="text-center img-fluid mt-3">
                        <img src="${pageContext.request.contextPath}/upload/chting/groupJoin.jpg"
                             style="margin-top: 50px; width: 50vh;" class="rounded" alt="...">
                    </div>
                    <div class="row d-flex text-center py-5">
                        <h1 class="h2 text-secondary light-300 mt-3">모임에 가입해주세요!</h1>
                    </div>
                    <button type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5"
                            onclick="window.history.back()">돌아가기
                    </button>
                    <div class="social row d-flex align-items-center justify-content-center py-xxl-5 mb-3">
                    </div>
                </div>

                <div class="col-md-2"></div>
            </div>
        </div>
    </section>

</div>
<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- Latest compiled and minified JavaScript -->
</body>
</html>
