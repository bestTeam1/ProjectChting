<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
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
    <!-- DB Object -->
    <c:set var="arealist" value="${requestScope.areaList}"/>
    <c:set var="interestList" value="${requestScope.interestList}"/>
    <!-- Social Object -->
    <c:set var="loginType" value="${requestScope.loginType}"/>

    <c:choose>
        <c:when test="${loginType.trim().equals('google-login')}">
            <c:set var="profile_img" value="${pageContext.request.getAttribute('picture')}"/>
            <c:set var="nickname" value="${pageContext.request.getAttribute('name')}" />
            <c:set var="email" value="${pageContext.request.getAttribute('email')}"/>
        </c:when>
        <c:when test="${loginType.trim().equals('kakao-login')}">
            <c:set var="profile_img" value="${pageContext.request.getAttribute('properties').thumbnail_image}"/>
            <c:set var="nickname" value="${pageContext.request.getAttribute('properties').nickname}" />
            <c:set var="email" value="${pageContext.request.getAttribute('kakao_account').email}"/>
        </c:when>
    </c:choose>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <header>
                <div>
                    <br>
                    <h2>&emsp; Sign Up</h2>
                </div>
            </header>

            <div class="content">
                <form method="POST" action="" enctype="multipart/form-data" id="signUpFrm">
                    <table>
                        <tr>
                            <td style="vertical-align: middle">프로필
                                <span style="color: red;"> *</span></td>
                            <td>
                                <input type="hidden" name="userid" value="${pageContext.request.userPrincipal.name}">
                                <input type="hidden" name="nickname" value="${nickname}">
                                <input type="hidden" name="email" value="${email}">
                                <input type="hidden" name="profile_img" value="${profile_img}">
                                <br>
                                <c:choose>
                                    <c:when test="${not empty profile_img}">
                                        <img id="preview" src="${profile_img}" width="130" alt="프로필 이미지가 보여지는 영역">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="preview"
                                             src="https://cdn0.iconfinder.com/data/icons/communication-line-10/24/account_profile_user_contact_person_avatar_placeholder-512.png"
                                             width="130" alt="프로필 이미지가 보여지는 영역">
                                    </c:otherwise>
                                </c:choose>
                                <hr>
                                <input type="file" id="fileName" name="fileName" class="fileName"
                                       accept="image/*;capture=camera">
                                <br><br>
                            </td>
                        </tr>

                        </tr>
                        <tr>
                            <td style="vertical-align: middle">생년월일
                                <span style="color: red;"> *</span></td>
                            <td><br>
                                <a style="font-size: xx-large; vertical-align: middle;"><i class="far fa-calendar-alt"></i></a>&nbsp;
                                <input type="date" name="birth"><br><br>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">성별
                                <span style="color: red;"> *</span></td>
                            <td>
                                <br>
                                <input type="radio" id="male" name="gender" value="male">
                                <label for="male">남자</label>
                                <input type="radio" id="female" name="gender" value="female">
                                <label for="female">여자</label>

                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">소개글
                                <span style="color: red;"> *</span></td>
                            <td><textarea style="resize: none;" cols="50" rows="5" name="content"
                                          placeholder="100자 이내로 기입해주세요 :)"
                                          onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '100자 이내로 기입해주세요 :)'"></textarea></td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">관심사
                                <span style="color: red;"> *</span></td>
                            <td>
                                <%--                                    <ol>--%>
                                <%--                                        <ul class="a">--%>
                                <%--                                            <c:forEach var="userInterest" items="${userInfo.userInterest}">--%>
                                <%--                                                <div class="circle_user_interest">--%>
                                <%--                                                        ${userInterest.catename}--%>
                                <%--                                                </div>--%>
                                <%--                                            </c:forEach>--%>
                                <%--                                            <input type="button" class="button small" value="추가"--%>
                                <%--                                                   onclick="window.open('categoryChoice.do', 'categoryChoice', 'width=600, height=600, left=100, top=50');">--%>
                                <%--                                        </ul>--%>
                                <%--                                    </ol>--%>


                                <select id="interest" name="interest" style="width: 30%; float:left;" required>
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="interestList" items="${interestList}" begin="0" end="107"
                                               step="1">
                                        <option value="${interestList.code}">${interestList.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">선호 지역 1
                                <span style="color: red;"> *</span></td>
                            <td>
                                <select id="first_area" name="first_area" style="width: 30%; float:left;" required>
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="area1" items="${areaList}">
                                        <option value="${area1.code}">${area1.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td style="vertical-align: middle">선호 지역 2</td>
                            <td>
                                <select id="second_area" name="second_area" style="width: 30%; float:left;">
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="area2" items="${areaList}">
                                        <option value="${area2.code}">${area2.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle">약관동의
                                <span style="color: red;"> *</span></td>
                            <td>
                                <div style="border-color: rebeccapurple; border-block-style: solid; margin: 5px; padding: 10px; width: 400px; height: 50px;">
                                    대충 약관내용이라는 내용
                                </div>
                                <input type="checkbox" id="siterule" name="siterule" value="agree">
                                <label for="siterule"> 약관동의 체크 </label><br>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="시작하기" id="signUpBtn">
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
        var file = document.querySelector('#fileName');
        file.onchange = function () {
            var fileList = file.files;
            // 읽기
            var reader = new FileReader();
            reader.readAsDataURL(fileList[0]);
            //로드 한 후
            reader.onload = function () {
                document.querySelector('#preview').src = reader.result;
            };
        };

        $('#signUpBtn').on('click', (event)=>{
            event.preventDefault();

            var frm = $('#signUpFrm')[0];
            var data = new FormData(frm);

            $('#signUpBtn').prop('disabled', true);

            $.ajax({
                type : 'POST',
                enctype : 'multipart/form-data',
                url : 'signUp.do',
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                timeout : 60000,
                success : function(data) {
                    Swal.fire(
                        '회원가입 완료!',
                        '다시 로그인을 진행 해주세요!',
                        'success'
                    );
                    location.href="${pageContext.request.contextPath}/logout";
                },
                error : function(e) {
                    Swal.fire(
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