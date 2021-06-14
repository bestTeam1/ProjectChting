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
            <div class="content">
                <p>중분류 선택 (최대 5개)</p>

                <c:forEach var="category" items="${interestCategory}" varStatus="status">
                        <div class="circle_user_interest " id="${status.count}">
                            ${category.s_catename}
                        </div>
                </c:forEach>


            </div>
        </div>
    </div>

<script type="text/javascript">
    $(function () {

        $('.circle_user_interest').click(function () {

            let test = $(".circle_user_interest").index(this);
            console.log(test);

            let test2 = $.trim($("#test").text());
            console.log(test2);


        })


    })

</script>
</body>
</html>