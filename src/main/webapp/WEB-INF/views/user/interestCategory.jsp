<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Editorial by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <%--  Sweet Alert2  --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <%--  J Query  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="assets/css/main.css" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
        body, div, table, section, nav, li, header, input{
            font-family: 'Jua', sans-serif;
        }
    </style>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <div class="content" id="content">
                <p>중분류 선택 (최대 5개)</p>

                <c:forEach var="category" items="${interestCategory}" varStatus="status">
                        <div class="m_cate_choice" id="${category.catecode}">
                            ${category.catename}
                        </div>
                </c:forEach>

                <div class="btnBox">
                    <input type="button" class="button" value="다음" id="next">
                </div>
            </div>

        </div>
    </div>

<script type="text/javascript">
    $(function () {

        $('.m_cate_choice').click(function () {
            let mCount = $('.selected').length;
            console.log(mCount);

            $(this).toggleClass('selected');

            if(mCount > 4) {
                alert("중분류는 최대 5개까지 선택 가능합니다.");
                $(this).removeClass('selected');
            }
        })

        $('#next').click(function () {
            let cateArr = [];

            $('.selected').each(function () {
                cateArr.push($(this).attr("id"));
            });
            console.log(cateArr);

            $.ajax ({
                url : "categoryChoice.do",
                traditional : true,
                data : {
                    catelist : cateArr
                },
                success : function(data) {
                    console.log("ajax 성공");
                    $('#content').html(data);
                    $("p").text("소분류 선택 (최대 7개)");
                    $(".m_cate_choice").attr('class','s_cate_choice');
                    $("#next").remove();
                    $(".btnBox").append('<input type="button" class="button" value="선택 완료" id="done">');
                },
                error : function(request, status, error) {
                    console.log(error);
                }

            })
        })

        $('.s_cate_choice').click(function () {
            let sCount = $('.selected').length;
            console.log(sCount);

            $(this).toggleClass('selected');

            if(sCount > 6) {
                alert("중분류는 최대 7개까지 선택 가능합니다.");
                $(this).removeClass('selected');
            }
        })

        $('#done').click(function () {
            alert("관심사 선택이 완료되었습니다 ");
            close();
        })


    })

</script>
</body>
</html>