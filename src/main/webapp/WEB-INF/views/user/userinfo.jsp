<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <c:set var="userInfoBasic" value="${userInfo.userInfoBasic}"></c:set>
            <c:set var="imgSrc" value="${userInfoBasic.profile_img}"/>
            <div class="content align-center">
                <h3><c:out value="${userInfoBasic.nickname}"/></h3>
                <c:choose>
                    <c:when test="${fn:startsWith(imgSrc, 'http')}">
                        <img id="preview" src="${userInfoBasic.profile_img}"
                             style="width:130px; height:130px; border-radius:70%;">
                    </c:when>
                    <c:otherwise>
                        <img id="preview" src="./upload/profileimg/${userInfoBasic.profile_img}"
                             style="width:130px; height:130px; border-radius:70%;">
                    </c:otherwise>
                </c:choose>
                <br><br>
                <p><c:out value="${userInfoBasic.first_area_name}"/> <c:out
                        value="${userInfoBasic.second_area_name}"/></p>
                <hr>
                <h3>자기소개</h3>
                <p><c:out value="${userInfoBasic.content}"/></p>
                <hr>
            </div>

            <div class="content align-center">
                <h3>관심사</h3>
                <c:forEach var="userInterest" items="${userInfo.userInterest}">
                    <div class="circle_user_interest">
                        <c:out value="${userInterest.catename}"/>
                    </div>
                </c:forEach>
                <hr>
            </div>
            ${userInfo.userJoinGroup}
            <div class="content align-center">
                <h3>가입한 모임</h3>
                <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                    <a href="board_main.do?group_no=${userJoinGroup.group_no}"><c:out value="${userJoinGroup.group_name}"/></a>
                </c:forEach>
            </div>

            <input type="button" value="회원 정보 수정" id="updateUser"
                   onclick="location.href='userUpdate.do'">
            <input type="button" value="회원 탈퇴" id="delacount">
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">
    //값이 1이면 모임장 권한을 가진 모임이 있음
    let userGroupRole = "${userInfo.userInfoBasic.cnt}";

    $(function () {
        $("#delacount").click(function () {

            if (userGroupRole == '1') {
                Swal.fire({
                    text: "모임장 권한을 가지고 있는 모임이 있어 권한 위임 또는 모임 해산 후 탈퇴가 가능합니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '모임 관리 페이지로 이동',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "groupMemberManage.do"
                    }
                })
            } else {
                Swal.fire({
                    title: "정말 탈퇴하시겠습니까?",
                    text: "계정 복구가 불가합니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '네, 탈퇴할게요!',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "delAcount.do",
                            dataType: "text",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                Swal.fire(
                                    '탈퇴 완료되었습니다.',
                                    '메인 페이지로 이동합니다.',
                                    'success', {
                                        buttons: {
                                            confirm: {
                                                text: '확인',
                                                value: true,
                                                className: 'button'
                                            }
                                        }
                                    }).then((result) => {
                                    location.href = "${pageContext.request.contextPath}/logout";
                                })
                            },
                            error: function (request, status, error) {
                                console.log(error);
                            }
                        })
                    }
                })
            }
        });
    });
</script>
</body>
</html>