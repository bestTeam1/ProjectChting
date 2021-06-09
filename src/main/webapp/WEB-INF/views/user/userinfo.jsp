<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: joohyun
  Date: 2021/06/07
  Time: 3:21 오후
  To change this template use File | Settings | File Templates.
--%>
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

</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
        <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <h3>MyPage</h3>
                <article>
                    <div class="content align-center">
                                <c:forEach var="userinfo" items="${userInfoBasic}">
                                    <h3>${userinfo.nickname}</h3>
                                    <p>${userinfo.first_area_name} ${userinfo.second_area_name}</p>
                                    <hr>
                                    <h3>자기소개</h3>
                                    <p>${userinfo.content}</p>

                                    <hr>
                                </c:forEach>
                    </div>
                </article>

                <article>
                    <div class="content align-center">
                        <h3>관심사</h3>
                            <c:forEach var="userInterest" items="${userInterest}">

                                <div class="circle">
                                        ${userInterest.s_catename}
                                </div>
                            </c:forEach>
                        <hr>
                    </div>
                </article>

                <article>
                    <div class="content align-center">
                        <h3>가입한 모임</h3>
                            <c:forEach var="userJoinGroup" items="${userJoinGroup}">
                                ${userJoinGroup.group_name}
                            </c:forEach>
                    </div>
                </article>
            <input type="button" value="회원 정보 수정">
            <input type="button" value="회원 탈퇴" id="delacount">
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">
    $().ready(function () {
        $("#delacount").click(function (){

            Swal.fire({
                title: "정말 탈퇴하시겠습니까?",
                text: "계정 복구가 불가합니다.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '네, 탈퇴할게요!',
                cancelButtonText: '취소',
                confirmButtonColor: '#3085d6',
                reverseButtons: true
            }).then((result) => {
                if(result.isConfirmed) {
                    Swal.fire(
                        '탈퇴 성공',
                        '메인 페이지로 이동합니다.',
                        'success'
                    )
                }
            })
        });
    });
</script>
</body>
</html>