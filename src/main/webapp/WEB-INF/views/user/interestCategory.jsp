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
    <link rel="stylesheet" href="assets/css/main.css"/>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

        body, div, table, section, nav, li, header, input {
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
                <br><p>관심사를 선택하세요. 3개까지 선택 가능합니다.</p>
                <c:forEach var="category" items="${interestCategory}" varStatus="status">
                    <div class="cate_choice" id="${category.catecode}">
                        <c:out value="${category.catename}"/>
                    </div>
                </c:forEach>
                    <br><br><input type="button" class="button" value="선택 완료" id="done">
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            let userid = "${sessionScope.get("userData").userid}";

            $('.cate_choice').click(function () {
                let count = $('.selected').length;
                console.log(count);

                $(this).toggleClass('selected');

                if (count > 2) {
                    alert("관심사는 최대 3개까지 선택 가능합니다.");
                    $(this).removeClass('selected');
                }
            })


            $('#done').click(function () {
                let cateArr = [];

                $('.selected').each(function () {
                    cateArr.push($(this).attr("id"));
                });
                console.log(cateArr);

                if (cateArr.length == 0) {
                    alert("관심사는 최소 1개 이상을 선택해야 합니다.");
                }

                $.ajax({
                    url: "userCategory.do",
                    traditional: true,
                    type: "POST",
                    data: {
                        userid: userid,
                        catelist: cateArr
                    },
                    success: function (data) {
                        alert("관심사 선택이 완료되었습니다 ");
                        close();
                        opener.location.reload("userUpdate.do?userid=" + userid);
                    },
                    error: function (request, status, error) {
                        console.log(error);
                    }

                })
            })
        })

    </script>
</body>
</html>