<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <title>모임 관심사 선택하기</title>
    <%--  J Query  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="assets/css/main.css"/>
</head>

<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <div class="content" id="content">
                <br><p>관심사를 선택하세요. 모임의 관심사는 1개 선택 가능합니다.</p>
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
                }else {
                    alert("관심사 선택이 완료되었습니다 ");
                    close();
                    $("#interest", opener.document).html(cateName);
                    $("#interest", opener.document).css('margin','10px');
                    $("#interestBtn", opener.document).val('변경');
                    $("#interestBtn", opener.document).css('margin','5px');
                    $("#catecode", opener.document).val(cateCode);
                }

            });
        });

    </script>
</body>
</html>