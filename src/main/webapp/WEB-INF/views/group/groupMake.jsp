<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--
  Created by IntelliJ IDEA.
  User: YeongHeo
  Date: 2021/06/08
  Time: 3:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>모임 만들기</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- slider -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

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
${newGroupList}

<h3>모임 정보</h3>
<c:forEach var="group" items="${newGroupList}">
    <ul>
        <li> ${group.group_name}</li>
        <li> ${group.opendate}</li>
    </ul>
</c:forEach>

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
                        <!-- Search -->
                        <section id="search" class="alt">
                            <form method="post" action="#" style="height: 50px; width:70%;">
                                <select id="areaCategory"  style="width: 30%; float:left;">
                                    <option value="전체">전체</option>
                                </select>
                                <input type="text" name="query" id="searchValue" placeholder="Search"  style="width: 50%; float:left; "/>
                                <input type="button" id="searchButton" value="모임찾기" style="float: left"/>
                            </form>
                        </section>
                        <section class="slide">
                        <h3>NEW</h3>
                        <!-- Swiper -->
                        <div class="swiper-container mySwiper" style="width: 1000px">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><a href = "index.do" style="" >모임 1<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                <div class="swiper-slide"><a href = "index.do" >모임 2<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                <div class="swiper-slide"><a href = "index.do" >모임 3<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                <div class="swiper-slide"><a href = "index.do" >모임 4<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-pagination"></div>
                        </div>
                        </section>
                        <section class="slide">
                            <h3>BEST</h3>
                            <!-- Swiper -->
                            <div class="swiper-container mySwiper" style="width: 1000px">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide"><a href = "index.do" >모임 1<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                    <div class="swiper-slide"><a href = "index.do" >모임 2<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                    <div class="swiper-slide"><a href = "index.do" >모임 3<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                    <div class="swiper-slide"><a href = "index.do" >모임 4<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </section>
                    </header>
                </div>
            </section>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">
    /* Swiper slide*/
    var swiper = new Swiper(".mySwiper", {
        slidesPerView : 3, //슬라이드 표시할 사진갯수
        spaceBetween: 30,
        centeredSlides: false,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });


</script>
</html>