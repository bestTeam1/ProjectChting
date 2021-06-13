<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>내가 가입한 모임 - 메인</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- slider -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <%--icon--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">



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
            text-align: -webkit-center;
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
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>

                        <!-- Swiper -->
                        <div class="swiper-container mySwiper" style="width: 900px">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <a href = "#" style="" >${group.group_name}<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>
                            </div>

                        </div>

                    </header>
                </div>
            </section>

            <%-- 회원리스트 아이콘 --%>
            <div style="text-align: center">
                <p>
            회원 : <i class="fa fa-user" aria-hidden="true"></i> ${group.join_user} 명
                </p>
            </div>
            <br>
            <br>


            <div class="content" align="center">

                <p>조선 제1조 모임 - 소개글</p>

                <table>
                    <tr>
                        <td style="text-align: center">${group.content}</td>
                    </tr>
                </table>
            </div>
            <br>
            <br>

            <div style="text-align: center">
                <form>
                    <input id="" type="button" value="탈퇴하기">
                </form>
           </div>
            <br>
            <br>



            <div class="content" align="center">

                <p>🚨주의사항🚨</p>

                <table>
                    <tr>
                        <td style="text-align: center">저희 조선 제1조 모임에서 이것만 지켜주세요 :)</td>
                    </tr>
                </table>
            </div>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>