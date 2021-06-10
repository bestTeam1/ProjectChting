<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Chting(취팅)</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
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
            width: 50%;
            height: 100%;
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
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- EventBanner -->
            <section id="banner">
					<div class="content">
                        <!-- Swiper -->
                        <div class="swiper-container mySwiper" style="width: 900px">
                            <div class="swiper-wrapper" id="slider">
                                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></div>

                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-pagination"></div>
                        </div>
					</div>
            </section>

            <!-- 공지사항 -->
            <section>
                <header class="major">
                    <h2>공지사항</h2>
                </header>
                <div class="features">
                    <ul id="noticeList">

                    </ul>
                </div>
            </section>

            <!-- 추천모임 -->
            <!-- 비회원 -> 랜덤모임 10개 -->
            <!-- 회원 -> 지역 5개, 관심사 5개 -->
            <section id="recommandGroup">
                <header class="major">
                    <h2>추천모임</h2>
                </header>
                <div id="title1"></div>
                <div class="posts">

                </div>
                <div id="title2"></div>
            </section>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>
</body>
<script type="text/javascript">
    //이벤트 슬라이드
    let slider = $('#slider');
    $.ajax({
        url : "main/event",
        data : {},
        dataType:"json",
        type:"get",
        success : function(response) {
            response.forEach(event => {
                console.log(event);
                slider.append("<div class='swiper-slide'><a href='eventDetail.do?event_no=" + event.event_no + "'><img src='" + event.event_img + "'></a></div>");
            });
            var swiper = new Swiper(".mySwiper", {
                slidesPerView : 1, //슬라이드 표시할 사진갯수
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
        }
    });

    //공지사항
    let noticeList = $('#noticeList');
    $.ajax({
       url : "main/notice",
       data : {},
       dataType:"json",
       type:"get",
       success : function(response) {
           response.forEach(notice => {
              noticeList.append("<a href='noticeDetail.do?notice_no='" + notice.notice_no + "'><li>" + notice.subject + "</li></a>");
           });
       }
    });


    //추천모임
    //로그인상태검사
    let posts = $('.posts');
    if(${empty pageContext.request.userPrincipal}) {
        console.log("비로그인상태");
        $.ajax({
           url : "main/nologin",
           data : {},
           dataType : "json",
           type : "get",
           success : function(response){
               response.forEach(group => {
                    posts.append("<article><a class='image'><img src='" + group.group_img + "' alt=''/></a><h3>" + group.group_name + "</h3><p>" + group.content + "</p><ul class='actions'><li><a href='groupDetail.do?group_no=" + group.group_no + "' class='button'>상세보기</a></li> </ul> </article>")
               });
           },
           error : function(Http, status, error) {
               console.log("Http : " + Http + ", status : " + status + ", error : " + error);
           }
        });
    } else {
        console.log("로그인상태");
        $('#title1').html("같은 지역 추천모임");
        $('#title2').html("같은 관심사 추천모임");

        $.ajax({
            url : "main/loginedArea",
            data : {},
            dataType : "json",
            type : "get",
            success : function(response){
                response.forEach(group => {
                    posts.append("<article><a class='image'><img src='" + group.group_img + "' alt=''/></a><h3>" + group.group_name + "</h3><p>" + group.content + "</p><ul class='actions'><li><a href='groupDetail.do?group_no=" + group.group_no + "' class='button'>상세보기</a></li> </ul> </article>")
                });
            },
            error : function(Http, status, error) {
                console.log("Http : " + Http + ", status : " + status + ", error : " + error);
            }
        });
        $('#recommandGroup').append("<div class='posts' id='posts'></div>");
        let posts2 = $('#posts');
        $.ajax({
            url : "main/loginedCatecode",
            data : {},
            dataType : "json",
            type : "get",
            success : function(response){
                response.forEach(group => {
                    posts2.append("<article><a class='image'><img src='" + group.group_img + "' alt=''/></a><h3>" + group.group_name + "</h3><p>" + group.content + "</p><ul class='actions'><li><a href='groupDetail.do?group_no=" + group.group_no + "' class='button'>상세보기</a></li> </ul> </article>")
                });
            },
            error : function(Http, status, error) {
                console.log("Http : " + Http + ", status : " + status + ", error : " + error);
            }
        });
    }
</script>
</html>