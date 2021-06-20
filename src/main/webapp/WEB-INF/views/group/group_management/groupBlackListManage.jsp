<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>모임 관리</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- slider -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/groupHeader.jsp" />
            <!-- Banner -->
            <section id="main">
                <h1>블랙리스트 임시페이지입니다</h1>
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

    //Area category DB 연동해서 넣기
    $(document).ready(function(){
        <c:forEach items="${areaList}" var="area">
            (function () {
                $('#areaCategory').append('<option value="${area.area_name}">${area.area_name}</option>');
            })();
        </c:forEach>
    });


    $(function(){
        $('#searchButton').click(function(){
            $.ajax({
                url : "${pageContext.request.contextPath}/searchButton.do",
                dataType : "json",
                data : {
                    category : $('#areaCategory').val(),
                    search : $('#searchValue').val()
                },
                success : function(data){
                    $('.slide').empty();
                    var html = "";
                    var length = 0;
                    data.forEach(group => {
                        html += '<div class="swiper-slide"><a href = "index.do" style="" >' +group.group_name+ '<img src="https://cdn.pixabay.com/photo/2020/09/02/08/19/dinner-5537679_960_720.png"></a></div>';
                        length++;
                    });

                    if(length > 3) {
                        html += '</div>'
                            + '<div class="swiper-button-next"></div>'
                            + '<div class="swiper-button-prev"></div>'
                            + '<div class="swiper-pagination"></div>';
                            + '</div>'
                    }

                    var locationMessage = $('#areaCategory').val()

                    if (locationMessage == "") {
                        locationMessage = "전체지역의 검색결과"
                    } else if (locationMessage == "언택트") {
                        locationMessage = "언택트 검색결과"
                    } else {
                        locationMessage += " 지역의 검색결과"
                    }

                    $('.slide').append(
                           '<h3>'+ locationMessage +'</h3>'
                        + '<div class="swiper-container mySwiper" style="width: 1000px">'
                        + '<div class="swiper-wrapper">'
                        +  html
                         );

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

                },
                error : function(request, status, error) {
                    console.log(error)
                }
            });
        });
    });

</script>
</html>