<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Editorial by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <%--  Sweet Alert2  --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header_new.jsp"/>
<!-- Start Service -->
<c:set var="userInfoBasic" value="${userInfo.userInfoBasic}"></c:set>
<section class="container py-5">
    <div class="pt-5 pb-3 d-lg-flex align-items-center gx-5">
        <div class="col-lg-3">
            <h2 class="h2 py-5 typo-space-line">MyPage</h2>
            <p>&#9989;&nbsp;<c:out value="${userInfoBasic.birth}"/></p>
            <p>&#9989;&nbsp;<c:out value="${userInfoBasic.email}"/></p>
        </div>
        <div class="col-lg-9 row">
            <div class="team-member col-md-4">
                <c:choose>
                    <c:when test="${not empty userInfoBasic.profile_img}">
                        <img class="team-member-img img-fluid rounded-circle p-4"
                             src=src="./upload/profileimg/${userInfoBasic.profile_img}" alt="Card image">
                    </c:when>
                    <c:otherwise>
                        <img class="team-member-img img-fluid rounded-circle p-4" id="preview"
                             src="./assets/img/team-02.jpg" alt="프로필 이미지">
                    </c:otherwise>
                </c:choose>
                <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                    <h2 class="h3 text-center"><c:out value="${userInfoBasic.nickname}"/></h2>
                    <h6 class="h7 text-center"><c:out value="${userInfoBasic.content}"/></h6>
                </ul>
            </div>
            <div class="team-member col-md-4">
            </div>
            <div class="team-member col-md-4">
                <input type="button" style="" id="updateUser"
                       class="btn rounded-pill px-4 btn-outline-primary light-300" value="정보 수정"
                       onclick="location.href='userUpdate.do?userid=${sessionScope.get("userData").userid}'"/>&nbsp;&nbsp;

                <input type="button" class="btn rounded-pill px-4 btn-outline-primary light-300"
                       value="회원 탈퇴" id="delacount">
            </div>
        </div>
    </div>
</section>
<hr>

<div class="row px-lg-3">
    <div class="col-md-4 pb-5 pt-sm-0 mt-5 px-xl-3">
        <div class="pricing-table card h-100 shadow-sm border-0 py-5">
            <div class="pricing-table-body card-body rounded-pill text-center align-self-center p-md-0">
                <i class="pricing-table-icon display-3 bx bx-package text-secondary"></i>
                <h2 class="pricing-table-heading h5 semi-bold-600">선호 지역</h2>
                <hr>
                <br>
                <ul class="pricing-table-body text-start text-dark px-4 list-unstyled light-300">
                    <li class="h6"><c:out value="${userInfoBasic.first_area_name}"/> / <c:out
                            value="${userInfoBasic.second_area_name}"/></li>
                </ul>
            </div>
        </div>
    </div>


    <div class="col-md-4 pb-5 pt-sm-0 mt-5 px-xl-3">
        <div class="pricing-table card h-100 shadow-sm border-0 py-5">
            <div class="pricing-table-body card-body text-center align-self-center p-md-0">
                <i class="pricing-table-icon display-3 bx bx-package text-secondary"></i>
                <h2 class="pricing-table-heading h5 semi-bold-600">관심사</h2>
                <hr>
                <br>
                <ul class="pricing-table-list text-start text-dark px-4 list-unstyled light-300">
                    <c:forEach var="userInterest" items="${userInfo.userInterest}">
                        <li><i class="bx bxs-circle me-2"></i><c:out value="${userInterest.catename}"/></li>
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>


    <div class="col-md-4 pb-5 pt-sm-0 mt-5 px-xl-3">
        <div class="pricing-table card h-100 shadow-sm border-0 py-5">
            <div class="pricing-table-body card-body text-center align-self-center p-md-0">
                <i class="pricing-table-icon display-3 bx bx-package text-secondary"></i>
                <h2 class="pricing-table-heading h5 semi-bold-600">가입한 모임</h2>
                <hr>
                <br>
                <ul class="pricing-table-list text-start text-dark px-4 list-unstyled light-300">
                    <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                        <li><i class="bx bxs-circle me-2"></i><c:out value="${userJoinGroup.group_name}"/></li>
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>
    <hr>
    <!-- End Service -->
    <!-- Start Footer / Script -->
    <jsp:include page="/WEB-INF/views/include/footer_new.jsp"/>
    <!-- End Footer / Script -->
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
                            $("#userid").attr("action", "groupMemberManage.do");
                            $("#userid").submit();
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
                                url: "delAcount.do?=userid" + userid,
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
                                        location.href = "index.do"
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

