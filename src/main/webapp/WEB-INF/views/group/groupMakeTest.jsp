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
            <div class="content">
                <form method="POST" action="" enctype="multipart/form-data" id="groupMakeFrm">
                    <input type="hidden" name="userid" value="${pageContext.request.userPrincipal.name}">
                    <table>
                        <tr>
                            <td style="vertical-align: middle">모임 이름</td>
                            <td>
                                <textarea name="group_name" id="group_name" cols="50" rows="1"
                                          style="resize: none;"
                                          class="form-control"
                                          placeholder="4 ~ 20자 이내로 기입해주세요 :)"
                                          onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '4 ~ 20자 이내로 기입해주세요 :)'"></textarea>
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
                                          onblur="this.placeholder = '10 ~ 1000자 이내로 기입해주세요 :)'"></textarea>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">모임 대표 사진</td>
                            <td>
                            <c:choose>
                                <c:when test="${not empty group_img}">
                                    <img id="preview" src="${group_img}" width="130" alt="모임 대표이미지가 보여지는 영역">
                                </c:when>
                                <c:otherwise>
                                    <img id="preview"
                                         src="https://cdn0.iconfinder.com/data/icons/communication-line-10/24/account_profile_user_contact_person_avatar_placeholder-512.png"
                                         width="130" alt="모임 대표 이미지">
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
                                <input type="button" class="button small" value="선택"
                                       onclick="window.open('groupCategory.do', '관심사 선택', 'width=600, height=600, left=100, top=50');">
                                <ol>
                                    <ul class="a">
<%--                                        <c:forEach var="userInterest" items="${userInfo.userInterest}">--%>
<%--                                            <div class="circle_user_interest">--%>
<%--                                                    ${userInterest.catename}--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
                                    </ul>
                                </ol>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">지역</td>
                            <td>
                                <select id="area_code" style="width: 30%; float:left;">
                                    <c:forEach items="${areaList}" var="area">
                                        <option value="">${area.area_code} ${area.area_name}</option>
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
            <input type="button" value="모임 생성" id="done">
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">
    let userid = "${sessionScope.get("userData").userid}";
    console.log(userid);

    let swal = Swal.mixin({
        customClass: {
            confirmButton: 'button',
            cancelButton: 'button'
        },
        buttonsStyling: false
    })

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

        $('#done').click(function () {

            let frm = $('#groupMakeFrm')[0];
            let data = new FormData(frm);
            console.log(data);

            $.ajax({
                type : 'POST',
                enctype : 'multipart/form-data',
                url : 'groupMakeTest.do',
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                timeout : 60000,
                success : function(data) {
                    swal.fire(
                        '모임 생성 완료!',
                        '모임관리 페이지로 이동합니다.',
                        'success'
                    );
                    location.href="groupJoin.do?userid="+userid;
                },
                error : function(e) {
                    swal.fire(
                        '오류 발생 Error',
                        '알 수 없는 오류가 발생되었습니다. 다시 시도 해주세요.',
                        'error'
                    );
                }
            });

        });

    });

</script>
</body>
</html>