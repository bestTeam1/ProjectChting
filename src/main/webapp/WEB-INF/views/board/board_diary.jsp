<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 일정</title>
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }
        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .swiper-slide img {
            display: block;
            width: 100%;
            height: 50%;
            object-fit: cover;
        }
        a { text-decoration:none !important }
        a:hover { text-decoration:none !important }
    </style>
</head>
<body class="is-preload">




<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>
                        <h2>쿠키런킹덤 - 일정표</h2>
                    </header>
                </div>
            </section>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>