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
            <c:set var="userinfo" value="${userInfo.userInfoBasic}"></c:set>
            <div class="content">
                <table>
                    <form id="profileImg" method="POST" action='userUpdate.do' enctype="multipart/form-data">
                    <tr>
                        <td style="vertical-align: middle">프로필</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty profile_img}">
                                    <img id="preview" src="${profile_img}" width="130">
                                </c:when>
                                <c:otherwise>
                                    <img id="preview"
                                         src="https://cdn0.iconfinder.com/data/icons/communication-line-10/24/account_profile_user_contact_person_avatar_placeholder-512.png"
                                         width="130" alt="프로필 이미지">
                                </c:otherwise>
                            </c:choose>
                            <br><br>
                            <input type="file" id="fileName" name="fileName" class="fileName"
                                   accept="image/*;capture=camera">
                        </td>
                    </tr>
                    </form>

                    <tr>
                        <td style="vertical-align: middle">자기소개</td>
                        <td><textarea id="content" style="resize: none;" name="content" cols="50" rows="3"
                                      name="content"
                        ><c:out value="${userinfo.content}"/></textarea></td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle">관심사</td>
                        <td>
                            <ol>
                                <ul class="a">
                                    <c:forEach var="userInterest" items="${userInfo.userInterest}">
                                        <div class="circle_user_interest">
                                            <c:out value="${userInterest.catename}"/>
                                        </div>
                                    </c:forEach>
                                    <input type="button" class="button small" value="변경"
                                           onclick="window.open('userCategory.do', '관심사 선택', 'width=600, height=600, left=100, top=50');">
                                </ul>
                            </ol>
                        </td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle">선호 지역 1</td>
                        <td>
                            <select name="first_area" id="area1" style="width: 30%; float:left;">
                                <c:forEach var="area" items="${areaList}">
                                    <option value=""
                                            <c:if test="${userinfo.first_area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle">선호 지역 2</td>
                        <td>
                            <select name="second_area" id="area2" style="width: 30%; float:left;">
                                <c:forEach var="area" items="${areaList}">
                                    <option value=""
                                            <c:if test="${userinfo.first_area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle">가입한 모임</td>
                        <td>
                            <ol>
                                <ul class="a">
                                    <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                                        <li>
                                            <c:out value="${userJoinGroup.group_name}"/>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </ol>
                        </td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle">결제</td>
                        <td>
                            <ol>
                                <ul class="a">
                                    <li>최대 3개의 모임에만 참여 가능합니다.</li>
                                    <li>참여 개수를 늘리고 싶으시면 유료결제를 이용해 주세요. &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="button" class="button small" value="결제하기">
                                    </li>
                                </ul>
                            </ol>
                        </td>
                    </tr>
                </table>
            </div>
            <input type="button" value="수정 완료" id="userUpdate">
        </form>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">

    let swal = Swal.mixin({
        customClass: {
            confirmButton: 'button',
            cancelButton: 'button'
        },
        buttonsStyling: false
    });

    $(function () {
        //프로필 이미지 프리뷰
        let file = document.querySelector('#fileName');

        file.onchange = function () {
            let fileList = file.files;
            // 읽기
            let reader = new FileReader();
            reader.readAsDataURL(fileList[0]);
            //로드 한 후
            reader.onload = function () {
                document.querySelector('#preview').src = reader.result;
            };
        };

        $('#userUpdate').click(function () {
            let area1Arr = $("#area1 option:selected").text().split(" ");
            let area2Arr = $("#area2 option:selected").text().split(" ");
            let area1 = area1Arr[0];
            let area2 = area2Arr[0];
            let updateContent = $('#content').val();

            let param = {
                "userid": userid,
                "first_area": area1,
                "second_area": area2,
                "content": updateContent
            }

            swal.fire({
                title: "수정하시겠습니까?",
                icon: 'info',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "userUpdate.do?userid=" + userid,
                        dataType: "text",
                        type: "POST",
                        data: JSON.stringify(param),
                        contentType: "application/json; charset=UTF-8",
                        success: function (data) {
                            swal.fire(
                                '수정이 완료되었습니다.',
                                'success', {
                                    buttons: {
                                        confirm: {
                                            text: '확인',
                                            value: true,
                                            className: 'button'
                                        }
                                    }
                                }).then((result) => {
                                //location.href = "userUpdate.do?userid=" + userid
                                $('#profileImg').submit();
                            })
                        },
                        error: function (request, status, error) {
                            console.log(error);
                        }
                    })
                }
            })

        })

    });

</script>
</body>
</html>