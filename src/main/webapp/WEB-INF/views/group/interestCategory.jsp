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
                <p>중분류 선택 (1개)</p>
                <c:forEach var="category" items="${interestCategory}" varStatus="status">
                    <div class="m_cate_choice" id="${category.catecode}">
                        <c:out value="${category.catename}"/>
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
            let userid = "${sessionScope.get("userData").userid}";

            $('.m_cate_choice').click(function () {
                let mCount = $('.selected').length;
                console.log(mCount);

                $(this).toggleClass('selected');

                if (mCount > 0) {
                    alert("1개의 중분류만 선택 가능합니다.");
                    $(this).removeClass('selected');
                }
            })

            $('#next').click(function () {

                let mCateArr = [];
                $('.selected').each(function () {
                    mCateArr.push($(this).attr("id"));
                });
                //console.log(cateArr);

                if (mCateArr.length == 0) {
                    location.href = "groupCategory.do"
                    alert("중분류를 선택해야 합니다.");

                }

                $.ajax({
                    url: "groupCategory.do",
                    traditional: true,
                    data: {
                        catelist: mCateArr
                    },
                    success: function (data) {
                        console.log("ajax 성공");
                        $('#content').html(data);
                        $("p").text("소분류 선택 (1개)");
                        $(".m_cate_choice").attr('class', 'cate_choice');
                        $("#next").remove();
                        $(".btnBox").append('<input type="button" class="button" value="선택 완료" id="done">');
                    },
                    error: function (request, status, error) {
                        console.log(error);
                    }

                })
            })

            $('.cate_choice').click(function () {
                let sCount = $('.selected').length;
                console.log(sCount);

                $(this).toggleClass('selected');

                if (sCount > 0) {
                    alert("1개의 카테고리만 선택 가능합니다.");
                    $(this).removeClass('selected');
                }
            })

            $('#done').click(function () {
                let sCateCode = [];
                let sCateName;

                $('.selected').each(function () {
                    sCateCode.push($(this).attr("id"));
                    sCateName = $(this).text().trim();
                });
                console.log(sCateCode);
                console.log(sCateName);

                if (sCateCode.length == 0) {
                    alert("1개의 카테고리를 반드시 선택해야 합니다.");
                }

                $.ajax({
                    url: "groupMake.do?userid=" + userid,
                    traditional: true,
                    data: {
                        catelist: sCateCode
                    },
                    success: function (data) {
                        console.log("ajax 성공");
                        alert("관심사 선택이 완료되었습니다 ");
                        close();
                        $("#interest", opener.document).html(sCateName);
                        $("#interest", opener.document).css('margin','10px');
                        $("#interestBtn", opener.document).val('변경');
                        $("#interestBtn", opener.document).css('margin','5px');
                        $("#catecode", opener.document).val(sCateCode);
                    },
                    error: function (request, status, error) {
                        console.log(error);
                    }

                });
            });
        });

    </script>
</body>
</html>