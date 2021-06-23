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
            <div class="content">
                <form id="groupUpdateFrm" method="POST" action='groupUpdate.do' enctype="multipart/form-data">
                    <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
                    <input type="hidden" name="catecode" id="catecode" value="${groupInfo.catecode}">
                    <input type="hidden" name="area_code" value="">
                    <input type="hidden" name="group_no" value="${groupInfo.group_no}">
                    <table>
                        <tr>
                            <td style="vertical-align: middle">모임 이름</td>
                            <td>
                                <textarea name="group_name" id="group_name" cols="50" rows="1"
                                          style="resize: none;"
                                          class="form-control"
                                          placeholder="4 ~ 20자 이내로 기입해주세요 :)"
                                          onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '4 ~ 20자 이내로 기입해주세요 :)'">${groupInfo.group_name}</textarea>
                                <h6 id="groupNameKeyUp"></h6>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">모임 소개글</td>
                            <td>
                                <textarea name="content" id="content" cols="50" rows="5"
                                          style="resize: none;"
                                          class="form-control"
                                          placeholder="10 ~ 1000자 이내로 기입해주세요 :)"
                                          onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '10 ~ 1000자 이내로 기입해주세요 :)'">${groupInfo.content}</textarea>
                                <h6 id="contentKeyUp"></h6>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">모임 대표 사진</td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty groupInfo.group_img}">
                                        <img id="preview" name="fileName"
                                             src="./upload/groupimg/default.jpg"
                                             width="130">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="preview" name="fileName"
                                             src="./upload/profileimg/${groupInfo.group_img}"
                                             width="130">
                                    </c:otherwise>
                                </c:choose>
                                <br><br>
                                <input type="file" id="fileName" name="fileName" class="fileName"
                                       accept="image/*;capture=camera">
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">관심사</td>
                            <td>
                                <div style="float:left; margin: 10px;" id="interest" id="interest">
                                    <c:out value="${groupInfo.catename}"/>
                                </div>
                                <input type="button" style="margin: 5px;" id="interestBtn" class="button small"
                                       value="변경"
                                       onclick="window.open('groupCategory.do', '관심사 선택', 'width=600, height=600, left=100, top=50');">
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">지역</td>
                            <td>
                                <select id="area" style="width: 30%; float:left;">
                                    <c:forEach var="area" items="${areaList}">
                                        <option value=""
                                                <c:if test="${groupInfo.area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">정원</td>
                            <td>
                                <ol>
                                    <ul class="a">
                                        <li>모임은 최대 20명만 참여할 수 있습니다.</li>
                                        <li>인원을 늘리고 싶으시면 유료결제를 이용해 주세요. &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="button" class="button small" value="결제하기">
                                        </li>
                                    </ul>
                                </ol>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <input type="button" onclick="confirm()" value="완료"/>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">

    $(function () {

        //모임 대표 이미지 프리뷰
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

        //모임 이름 keyUP
        $('#group_name').keyup(function () {
            let inputLength = $(this).val().length; //입력한 글자 수
            let remain = 20 - inputLength; //20자에서 남은 글자수

            $('#groupNameKeyUp').html(inputLength + '/20');

            if (inputLength >= 1 && inputLength <= 3) {
                $(this).css('color', 'red');
            } else if (inputLength >= 4 && inputLength <= 20) {
                $(this).css('color', 'grey');
            } else if (remain < 1) {
                Swal.fire('모임 이름은 20자 이내로 입력해 주세요 !')
            }
        })

        //모임 소개글 keyUP
        $('#content').keyup(function () {
            let inputLength = $(this).val().length; //입력한 글자 수
            let remain = 1000 - inputLength; //1000자에서 남은 글자수

            $('#contentKeyUp').html(inputLength + '/1000');

            if (inputLength >= 1 && inputLength <= 9) {
                $(this).css('color', 'red');
            } else if (inputLength >= 10 && inputLength <= 1000) {
                $(this).css('color', 'grey');
            } else if (remain < 1) {
                Swal.fire('모임 소개글은 1000자 이내로 입력해 주세요 !')
            }
        })

        //로그인체크 (백단에서 못막았을 경우)
        let check = '${sessionScope.get("userData").userid}';
        if (check == null || check == "" || check == undefined) {
            Swal.fire({
                title: '오류',
                text: '로그인을 해주세요!!'
            }).then(() => {
                history.go(-1);
            })
        }

    });

    //Form 전송
    function confirm() {
        let areaArr = $("#area option:selected").text().split(" ");
        let area = areaArr[0];

        $('input[name=area_code]').attr('value', area);

        Swal.fire({
            title: '모임 정보를 수정하시겠습니까?',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '정보 수정 완료!',
                    text: '모임 메인 페이지로 이동합니다.',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#groupUpdateFrm').submit();
                    }
                })
            }
        })
    }

</script>
</body>
</html>