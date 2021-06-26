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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.min.css" integrity="sha512-S1RkECuolGdQWD0oCmmxBDhSy412eTVKms9ZscfHjBT3TiVYz70oD1AgNM/FylUqZ0U/9tDp/XuV1FjZoUoVCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">
    <!-- DB Object -->
    <c:set var="arealist" value="${requestScope.areaList}"/>
    <c:set var="interestList" value="${requestScope.interestList}"/>
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
                                <input type="hidden" name="userid" value="${socialData.userid}">
                                <input type="hidden" name="profile_img" value="${socialData.profile_img}">
                                <input type="hidden" name="logintype" value="${socialData.loginType}">
                                <br>
                                <c:choose>
                                    <c:when test="${not empty socialData.profile_img}">
                                        <img id="preview" src="${socialData.profile_img}" width="130" alt="프로필 이미지가 보여지는 영역">
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
                        <c:choose>
                            <c:when test="${socialData.nickname == 'github'}">
                                <tr>
                                    <td style="vertical-align: middle">이름
                                        <span style="color: red;"> *</span></td>
                                    <td>
                                        <input type="text" name="nickname" minlength="2" maxlength="10" required>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="nickname" value="${socialData.nickname}">
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <td style="vertical-align: middle">생년월일
                                <span style="color: red;"> *</span></td>
                            <td><br>
                                <a style="font-size: xx-large; vertical-align: middle;"><i
                                        class="far fa-calendar-alt"></i></a>&nbsp;
                                <input type="date" name="birth" required><br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle">성별
                                <span style="color: red;"> *</span></td>
                            <td>
                                <br>
                                <input type="radio" id="male" name="gender" value="남성">
                                <label for="male">남자</label>
                                <input type="radio" id="female" name="gender" value="여성">
                                <label for="female">여자</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle">소개글
                                <span style="color: red;"> *</span></td>
                            <td><textarea style="resize: none;" cols="50" rows="5" name="content"
                                          placeholder="100자 이내로 기입해주세요 :)"
                                          onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '100자 이내로 기입해주세요 :)'" required></textarea></td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle">관심사
                                <span style="color: red;"> *</span></td>
                            <td>
                                <select class="js-example-basic-multiple-limit" multiple="multiple" name="interest" style="width: 30%; float: left;" required>
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
                            <td style="vertical-align: middle">선호 지역 2
                                <span style="color: red;"> *</span></td>
                            <td>
                                <select id="second_area" name="second_area" style="width: 30%; float:left;" required>
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="area2" items="${areaList}">
                                        <option value="${area2.code}">${area2.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <c:choose>
                            <c:when test="${socialData.email == 'github'}">
                                <tr>
                                    <td style="vertical-align: middle">이메일
                                        <span style="color: red;"> *</span></td>
                                    <td>
                                        <input type="email" name="email" required>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="email" value="${socialData.email}">
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <td style="vertical-align: middle">약관동의
                                <span style="color: red;"> *</span></td>
                            <td>
                                <div style="border-color: rebeccapurple; border-block-style: solid; margin: 5px; padding: 10px; width: 400px; height: 50px;">
                                    대충 약관내용이라는 내용
                                </div>
                                <input type="checkbox" id="siterule" name="siterule" value="agree" required>
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
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.full.min.js" integrity="sha512-a7XpBrwW2cJN4EE8L4Gsy9II/KNLsXHr4LhDoYC39Whrz1LWzYMNZYph4rp9XwsLXUTpPWJ1oy8HkFxHATrERA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function () {
        areaOverlapCheck();
        $(".js-example-basic-multiple-limit").select2({
            maximumSelectionLength: 3
        });

        $('#signUpFrm').validate();

        $.extend($.validate.message, {
            required : "필수 항목 입니다."
        })

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

        $('#signUpBtn').on('click', (event) => {
            event.preventDefault();

            var frm = $('#signUpFrm')[0];
            var data = new FormData(frm);

            $('#signUpBtn').prop('disabled', true);

            $.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                url: 'signUp.do',
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 60000,
                success: function (data) {
                    Swal.fire({
                        title : data,
                        text : '다시 로그인을 진행 해주세요!',
                        icon : 'success',
                        timer : 2000
                    }).then(() => {
                        location.href = "${pageContext.request.contextPath}/logout";
                    });
                },
                error: function (e) {
                    Swal.fire({
                        title : '오류 발생 Error',
                        text : '알 수 없는 오류가 발생되었습니다. 다시 시도 해주세요.' + e.message,
                        icon : 'error',
                        timer : 2000
                    });
                }
            });
        });
    });

    function areaOverlapCheck(){
        $('#first_area').on('change', function (data){
            if($('#first_area').val() === $('#second_area').val()){
                alert('같은 지역을 선택하실 수 없습니다. 다시 선택해주세요.');
                $('#first_area').val("");
            }
        });
        $('#second_area').on('change', function(data){
            if($('#second_area').val() === $('#first_area').val()){
                alert('같은 지역을 선택하실 수 없습니다. 다시 선택해주세요.');
                $('#second_area').val("");
            }
        });
    }

</script>
</body>
</html>