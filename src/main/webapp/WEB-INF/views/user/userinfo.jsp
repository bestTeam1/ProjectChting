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
                        <h3>${userInfo.userInfoBasic.nickname}</h3>
                        <p>${userInfo.userInfoBasic.first_area_name} ${userInfo.userInfoBasic.second_area_name}</p>
                        <hr>
                        <h3>자기소개</h3>
                        <p>${userInfo.userInfoBasic.content}</p>
                        <hr>
                    </div>
                </article>

                <article>
                    <div class="content align-center">
                        <h3>관심사</h3>
                            <c:forEach var="userInterest" items="${userInfo.userInterest}">
                                <div class="circle_interest">
                                        ${userInterest.s_catename}
                                </div>
                            </c:forEach>
                        <hr>
                    </div>
                </article>

                <article>
                    <div class="content align-center">
                        <h3>가입한 모임</h3>
                            <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                                ${userJoinGroup.group_name}
                            </c:forEach>
                    </div>
                </article>
            <input type="button" value="회원 정보 수정" id="edituserinfo" onclick="location.href='userUpdate.do'">
            <input type="button" value="회원 탈퇴" id="delacount">

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">
    const userid = "${userInfo.userInfoBasic.userid}";
    const userGroupRole = "${userInfo.userInfoBasic.cnt}";

    const swal = Swal.mixin({
        customClass: {
            confirmButton: 'button',
            cancelButton: 'button'
        },
        buttonsStyling: false
    })

    console.log(userid);
    console.log(userGroupRole); //값이 1이면 모임장 권한을 가진 모임이 있음

    $().ready(function () {
        $("#delacount").click(function (){
            console.log(userGroupRole);

            if (userGroupRole == '1') {
                swal.fire ({
                    text: "모임장 권한을 가지고 있는 모임이 있어 권한 위임 후 탈퇴가 가능합니다.",
                    icon : 'warning',
                    showCancelButton: true,
                    confirmButtonText: '모임 관리 페이지로 이동',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if(result.isConfirmed) {
                        location.href="groupJoin.do"
                    }
                })
            }else {
                swal.fire({
                    title: "정말 탈퇴하시겠습니까?",
                    text: "계정 복구가 불가합니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '네, 탈퇴할게요!',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if(result.isConfirmed) {
                        $.ajax({
                            url : "delAcount.do",
                            dataType : "text",
                            data : {
                                userid : userid
                            },
                            success : function(data){
                                swal.fire(
                                    '탈퇴 완료되었습니다.',
                                    '메인 페이지로 이동합니다.',
                                    'success', {
                                        buttons : {
                                            confirm : {
                                                text : '확인',
                                                value : true,
                                                className : 'button'
                                            }
                                        }
                                    }).then((result) => {
                                    location.href="index.do"
                                })
                            },
                            error : function(request, status, error) {
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