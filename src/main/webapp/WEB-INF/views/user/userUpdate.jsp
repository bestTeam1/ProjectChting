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
            <c:set var="userInfoBasic" value="${userInfo.userInfoBasic}"></c:set>
            <c:set var="imgSrc" value="${userInfoBasic.profile_img}"/>
            <div class="content">
                <form id="userUpdateFrm" method="POST" action='userUpdate.do' enctype="multipart/form-data">
                    <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
                    <input type="hidden" name="first_area" value="">
                    <input type="hidden" name="second_area" value="">
                    <input type="hidden" name="profile_img" value="${userInfoBasic.profile_img}">

                    <table>
                        <tr>
                            <td style="vertical-align: middle">프로필</td>
                            <td>
                                <c:choose>
                                    <c:when test="${fn:startsWith(imgSrc, 'http')}">
                                        <img id="preview" name="fileName"
                                             src="${userInfoBasic.profile_img}"
                                             style="width:130px; height:130px; border-radius:70%;" >
                                    </c:when>
                                    <c:otherwise>
                                        <img id="preview" name="fileName"
                                             src="./upload/profileimg/${userInfoBasic.profile_img}"
                                             style="width:130px; height:130px; border-radius:70%;">
                                    </c:otherwise>
                                </c:choose>
                                <br><br>
                                <input type="file" id="fileName" name="fileName" class="fileName"
                                       accept="image/*;capture=camera">
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">자기소개</td>
                            <td><textarea id="content" style="resize: none;" name="content" cols="50" rows="3"
                                          name="content"
                            ><c:out value="${userInfoBasic.content}"/></textarea></td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">관심사</td>
                            <td>
                                <c:forEach var="userInterest" items="${userInfo.userInterest}">
                                    <div class="circle_user_interest">
                                        <c:out value="${userInterest.catename}"/>
                                    </div>
                                </c:forEach>
                                <input type="button" style="top: 20px;" class="button small" value="변경"
                                       onclick="window.open('userCategory.do', '관심사 선택', 'width=600, height=400, left=100, top=50');">
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">선호 지역 1</td>
                            <td>
                                <select id="area1" style="width: 30%; float:left; margin-right: 10px;">
                                    <option selected disabled hidden>=== 선택 ===</option>
                                    <c:forEach var="area" items="${areaList}">
                                        <option
                                                <c:if test="${userInfoBasic.first_area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                                    </c:forEach>
                                </select>
                                <p id="error1"
                                   style="color: red; vertical-align: middle; margin-top: 10px; margin-bottom: 0px;"></p>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">선호 지역 2</td>
                            <td>
                                <select id="area2" style="width: 30%; float:left; margin-right: 10px;">
                                    <option selected disabled hidden>=== 선택 ===</option>
                                    <c:forEach var="area" items="${areaList}">
                                        <option
                                                <c:if test="${userInfoBasic.second_area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                                    </c:forEach>
                                </select>
                                <p id="error2"
                                   style="color: red; vertical-align: middle; margin-top: 10px; margin-bottom: 0px;"></p>
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
                    <input type="button" onclick="confirm()" value="수정 완료"/>
                </form>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">

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

        //선호지역 1,2 같은 지역인지 체크
        $('#area1').change(function () {
            if($('#area1 option:selected').text() === $('#area2 option:selected').text()) {
                Swal.fire('같은 지역을 선택하실 수 없습니다. 다시 선택해 주세요.');
                $("#area1 option:eq(0)").prop("selected", true);
            }
        });
        $('#area2').change(function () {
            if($('#area2 option:selected').text() === $('#area1 option:selected').text()) {
                Swal.fire('같은 지역을 선택하실 수 없습니다. 다시 선택해 주세요.');
                $("#area2 option:eq(0)").prop("selected", true);
            }
        });
    });

    //Form 전송
    function confirm() {
        let area1Arr = $("#area1 option:selected").text().split(" ");
        let area2Arr = $("#area2 option:selected").text().split(" ");
        let area1 = area1Arr[0]; //선호지역1 지역코드
        let area2 = area2Arr[0]; //선호지역2 지역코드
        let def = '==='; //셀렉트박스 디폴트값

        //지역 에러메시지
        if(area1 === def) {
            $('#error1').html('지역을 선택해 주세요!');
            return;
        }else {
            $('#error1').html('');
        }
        if(area2 === def) {
            $('#error2').html('지역을 선택해 주세요!');
            return;
        }else {
            $('#error2').html('');
        }

        //input hidden값으로 보내서 form으로 같이 전송
        $('input[name=first_area]').attr('value', area1);
        $('input[name=second_area]').attr('value', area2);

        Swal.fire({
            title: "수정하시겠습니까?",
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '정보 수정 완료!',
                    text: '마이페이지 메인으로 이동합니다.',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#userUpdateFrm').submit();
                    }
                })
            }
        })
    }

</script>
</body>
</html>