<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html lang="ko">
<!-- Header / <head> -->
<head>
    <title>모임 관심사 선택</title>
    <!-- Load Require CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/boxicon.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
    <%--  J Query  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%--  Font, Selected CSS  --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

        body, div, table, section, nav, li, header, input {
            font-family: 'Jua', sans-serif;
        }

        .selected {
            color: snow;
            background: #4232c2;
            display: inline-block;
            overflow: hidden;
            display: inline-block;
            position: relative;
        }
    </style>
</head>
<!-- Close Header / <head> -->
<body class="is-preload">
<!-- Start Service -->
<div id="main">
    <div class="inner">
        <div class="content" id="content">
            <br>
            <p style="color: #9fa3a6;">관심사를 선택하세요. 모임의 관심사는 1개 선택 가능합니다. <i class="far fa-grin"></i></p>
            <c:set var="i" value="0"/>
            <c:set var="j" value="4"/>
            <c:forEach var="category" items="${interestCategory}" varStatus="status">
                <c:if test="${i%j == 0}">
                    <br>
                </c:if>
                <div class="content cate_choice btn rounded-pill btn-outline-primary btn-sm"
                     style="width: 135px; vertical-align:middle;"
                     id="${category.catecode}">
                    <c:out value="${category.catename}"/>
                </div>
                <c:if test="${i%j == j-1}">
                    <br>
                </c:if>
                <c:set var="i" value="${i+1}"/>
            </c:forEach>
            <br><input type="button"
                       class="btn btn-secondary rounded-pill px-4 radius-0 text-light"
                       style="float: right; margin-right: 20px;"
                       value="선택 완료" id="done">
        </div>
    </div>
</div>
<!-- End Service -->
<!-- Script -->
<script>
    $(function () {
        let userid = "${sessionScope.get("userData").userid}";

        $('.cate_choice').click(function () {
            let count = $('.selected').length;
            console.log(count);

            $(this).toggleClass('selected');

            if (count > 0) {
                alert("모임의 관심사는 1개만 선택 가능합니다.");
                $(this).removeClass('selected');
            }
        })

        $('#done').click(function () {
            let cateCode;
            let cateName;

            $('.selected').each(function () {
                cateCode = $(this).attr("id");
                cateName = $(this).text().trim();
            });

            if (cateCode.length == 0) {
                alert("1개의 관심사를 반드시 선택해야 합니다.");
            } else {
                alert("관심사 선택이 완료되었습니다 ");
                close();
                $("#interest", opener.document).html(cateName);
                $("#interest", opener.document).css('margin', '10px');
                $("#interestBtn", opener.document).val('변경');
                $("#interestBtn", opener.document).css('margin', '5px');
                $("#catecode", opener.document).val(cateCode);
            }
        });
    });
</script>
</body>
</html>