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
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">회원을 관리하세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section id="table">
                <div class="box-body">
                    <table class="table table-bodered" style="text-align: center">
                        <tr>
                            <th style="text-align: center">UID</th>
                            <th style="text-align: center">성별</th>
                            <th style="text-align: center">닉네임</th>
                            <th style="text-align: center">이메일</th>
                            <th style="text-align: center">지역1</th>
                            <th style="text-align: center">지역2</th>
                            <th style="text-align: center">가입일</th>
                        </tr>
                        <c:forEach var="i" items="${userList}">
                            <tr>
                                <td>${i.userid}</td>
                                <td>${i.gender}</td>
                                <td><a href="${pageContext.request.contextPath}/userPage.do?userid=${i.userid}">${i.nickname}</a></td>
                                <td>${i.email}</td>
                                <td>${i.first_area_name}</td>
                                <td>${i.second_area_name}</td>
                                <td>${i.joindate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </section>
            <section>
                <div class="box-footer">
                    <div class="text-center">
                        <ul class="pagination" style="text-align: center">
                            <!-- 이전prev -->
                            <c:if test="${pm.prev}">
                                <li><a href="${pageContext.request.contextPath}/admin/adminUserManagement.do?page=${pm.startPage-1}">&laquo;</a></li>
                            </c:if>
                            <!-- 페이지블럭 -->
                            <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                                <!-- 삼항연산자를 사용해서 class로 스타일적용  -->
                                <li ${pm.cri.page == idx? 'class=active':''}>
                                    <a href="${pageContext.request.contextPath}/admin/adminUserManagement.do?page=${idx}">${idx}</a>
                                </li>
                            </c:forEach>
                            <!-- 다음next -->
                            <c:if test="${pm.next && pm.endPage > 0}">
                                <li><a href="${pageContext.request.contextPath}/admin/adminUserManagement.do?page=${pm.endPage+1}">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">
    /*
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
            if( '${user.enabled}' == 1 ) {
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
                +'<td>${user.gender}</td>'
                +'<td>${user.email}</td>'
                +'<td>${user.first_area_name}</td>'
                +'<td>${user.second_area_name}</td>'
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
            + '<th style="text-align: center">성별</th>'
            + '<th style="text-align: center">이메일</th>'
            + '<th style="text-align: center">선호지역1</th>'
            + '<th style="text-align: center">선호지역2</th>'
            + '<th style="text-align: center">가입일</th>'
            + '<th style="text-align: center">상태</th>'
            + '</tr>'
        );
    }
    */
</script>
</html>