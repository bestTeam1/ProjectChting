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
    <section class="container text-center px-md-5 py-md-3 my-xxl-5 mx-xxl-auto">
    </section>

    <section class="container text-center my-md-5 mx-xxl-auto">
        <div class="row text-center px-md-3 py-md-3 my-xxl-auto">
            <div class="col-lg-12 d-flex align-items-center text-center justify-content-center">

                <div class="col-md-3"></div>

                <div class="col-10 col-md-6 m-5 border border-1"
                     style="background-color: lavender; border-radius: 25px;">
                    <div class="row d-flex text-center mt-3 py-5">
                        <h2 class="h2 text-secondary light-300 mt-3">Social Login</h2>
                    </div>
                    <div class="social row d-flex align-items-center justify-content-center py-md-5 py-3 mb-3 gy-5">
                        <a href="${pageContext.request.contextPath}/oauth2/authorization/google-login"
                           class="link google" target="_parent"><span class="fa fa-google"></span></a>
                        <a href="${pageContext.request.contextPath}/oauth2/authorization/kakao-login" class="link kakao"
                           target="_parent"><span class="fas fa-comment"></span></a>
                        <a href="${pageContext.request.contextPath}/oauth2/authorization/github-login"
                           class="link github" target="_parent"><span class="fa fa-github"></span></a>
                    </div>
                </div>

                <div class="col-md-3"></div>
            </div>
        </div>
    </section>

    <section class="container text-center px-md-5 py-md-3 my-xxl-5 mx-xxl-auto">
    </section>
</div>
<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- Latest compiled and minified JavaScript -->
</body>
</html>
