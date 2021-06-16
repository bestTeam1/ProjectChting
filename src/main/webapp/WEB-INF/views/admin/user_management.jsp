<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>회원 관리</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweetalert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
            <p>${userList}</p>
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">회원을 관리하세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section id="table">
                <table id="userList" style="text-align: center">

                </table>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">
    //Table에 회원정보 넣기
    $(document).ready(function(){
        memberList();
    });

    //모임원 Table
    function memberList() {
        var tableNum = 0;

        <c:forEach items="${userList}" var="user">
        (function () {
            var userStatus ="";
            if(${user.enabled} == 1 ) {
                userStatus = "활동중";
            } else {
                userStatus = "활동정지";
            }

            checkbox ='<div class="col-6 col-12-small">'
                +'<input type="checkbox" id="selectAgreement'+ tableNum
                +'" name="selectAgreement" value="${member.userid}" >'
                + '<label for="selectAgreement'+ tableNum +'"></label>' + '</div>';

            $('#userList').append(
                '<tr>'
                +'<td>${user.userid}</td>'
                +'<td>${user.nickname}</td>'
                +'<td>${user.email}</td>'
                +'<td>${user.catename}</td>'
                +'<td>${user.joindate}</td>'
                +'<td>'+ userStatus +'</td>'
                +'</tr>'
            );
            tableNum++;
        })();
        </c:forEach>

        $('#userList').prepend(
            '<tr style="background-color: lightgrey">'
            + '<th style="text-align: center">UID</th>'
            + '<th style="text-align: center">닉네임</th>'
            + '<th style="text-align: center">이메일</th>'
            + '<th style="text-align: center">지역</th>'
            + '<th style="text-align: center">가입일</th>'
            + '<th style="text-align: center">상태</th>'
            + '</tr>'
        );
    }
</script>
</html>