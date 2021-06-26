<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" type="text/css" href="//select2.github.io/select2/select2-3.4.1/select2.css"/>
</head>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Service -->
<!-- DB Object -->
<c:set var="arealist" value="${requestScope.areaList}"/>
<c:set var="interestList" value="${requestScope.interestList}"/>
<section class="bg-light w-100">
    <div class="container">
        <div class="row d-flex align-items-center py-lg-2">
            <div class="col-lg-6 text-start">
                <h1 class="h2 py-5 text-primary typo-space-line">Chting 회원가입</h1>
                <p class="light-300">
                    지역과 관심사를 선택하고 마음이 맞는 사람들과 함께 취미 활동을 해보세요 !
                </p>
            </div>
            <div class="col-lg-6 my-lg-2">
                <img src="${pageContext.request.contextPath}/assets/img/welcome.png" class="my-lg-2" style="width: 100%;">
            </div>
        </div>
    </div>
</section>

<section class="container my-lg-5">
    <c:choose>
        <c:when test="${socialData.loginType == 'google'}">
            <div class="row h3 light-300 text-primary">
                <div class="col-1"></div>
                <div class="col-11">
                    <span style="text-decoration-line: underline;">Sign-in with</span> >
                    <div class="p-2 d-inline-flex" style="background-color: whitesmoke; border-radius: 5px; box-shadow: gray;">
                        <i class="fab fa-google" style="color: #4285f4; z-index: 2;"></i>
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${socialData.loginType == 'kakao'}">
            <div class="row h3 light-300 text-primary">
                <div class="col-1"></div>
                <div class="col-11">
                    <span style="text-decoration-line: underline;">Sign-in with</span> >
                    <div class="p-2 d-inline-flex" style="background-color: #FEE500; border-radius: 5px; box-shadow: gray;">
                        <i class="fas fa-comment" style="color: #231111; z-index: 2;"></i>
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${socialData.loginType == 'github'}">
            <div class="row h3 light-300 text-primary">
                <div class="col-1"></div>
                <div class="col-11">
                    <span style="text-decoration-line: underline;">Sign-in with</span> >
                    <div class="p-2 d-inline-flex" style="background-color: black; border-radius: 5px; box-shadow: gray;">
                        <i class="fab fa-github" style="color: white; z-index: 2;"></i>
                    </div>
                </div>
            </div>
        </c:when>
    </c:choose>
    <div class="service-wrapper border border-0">
        <form method="POST" action="" enctype="multipart/form-data" id="signUpFrm">
        <input type="hidden" name="userid" value="${socialData.userid}">
        <input type="hidden" name="profile_img" value="${socialData.profile_img}">
        <input type="hidden" name="logintype" value="${socialData.loginType}">
        <%-- 프로필 사진 --%>
        <div class="pricing-list shadow-sm">
            <div class="row p-4">
                <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                    <i class="display-3 bx bx-image-add mt-3"></i>
                    <p>프로필 사진</p>
                </div>
                <div class="pricing-list-body col-7 align-items-center px-lg-5 border-start border-1">
                    <div class="px-lg-5 my-sm-2">
                        <div class="list-unstyled text-left">
                            <c:choose>
                                <c:when test="${not empty socialData.profile_img}">
                                    <img id="preview" src="${socialData.profile_img}" width="130"
                                         alt="프로필 이미지가 보여지는 영역">
                                </c:when>
                                <c:otherwise>
                                    <img id="preview"
                                         src="https://cdn0.iconfinder.com/data/icons/communication-line-10/24/account_profile_user_contact_person_avatar_placeholder-512.png"
                                         width="130" alt="프로필 이미지가 보여지는 영역">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <hr>
                        <div class="input-group">
                            <input type="file" class="form-control" id="fileName" name="fileName"
                                   aria-describedby="inputGroupFileAddon04" aria-label="Upload"
                                   accept="image/*;capture=camera" style="width: 50%;">
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
        <%-- 프로필 사진 --%>

        <%-- 이름 --%>
            <c:choose>
                <c:when test="${socialData.nickname == 'github'}">
                    <div class="pricing-list shadow-sm">
                        <div class="row p-4">
                            <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                                <i class="display-3 bx bx-image-add mt-3"></i>
                                <p>이름
                                    <i class="fas fa-asterisk"
                                       style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                                </p>
                            </div>
                            <div class="pricing-list-body col-6 align-items-center px-lg-5 border-start border-1">
                                <div class="px-lg-5 py-5 align-items-center">
                                    <input type="text" class="form-control" placeholder="Username" minlength="2"
                                           maxlength="10" required>
                                </div>
                            </div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="nickname" value="${socialData.nickname}">
                </c:otherwise>
            </c:choose>
        <%-- 이름 --%>
            <%-- 생년월일 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 bx bx-calendar-event mt-3"></i>
                        <p>생년월일
                            <i class="fas fa-asterisk"
                               style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-4 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 py-5 align-items-center">
                            <input type="date" name="birth" class="form-control form-control-lg" required>
                        </div>
                    </div>
                    <div class="col-5"></div>
                </div>
            </div>
            <%-- 생년월일 --%>
            <%-- 성별 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 fas fa-venus-mars mt-3"></i>
                        <p>성별
                            <i class="fas fa-asterisk"
                               style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-9 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 py-5 align-items-center">
                            <input type="radio" class="btn-check" id="male" name="gender" value="남성" autocomplete="off">
                            <label class="btn btn-lg btn-outline-primary" for="male">남자</label>
                            &emsp;|&emsp;
                            <input type="radio" class="btn-check" id="female" name="gender" value="여성" autocomplete="off">
                            <label class="btn btn-lg btn-outline-primary" for="female">여자</label>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 성별 --%>
            <%-- 소개글 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 fas fa-feather-alt mt-3"></i>
                        <p>소개글
                            <i class="fas fa-asterisk"
                               style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-9 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 py-2 align-items-center">
                            <textarea name="content" id="contentArea" placeholder="100자 이내로 기입해주세요 :)" maxlength="100" required style="width: 100%; height: 120px;"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 소개글 --%>
            <%-- 관심사 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 bx bx-category-alt"></i>
                        <p>관심사<i class="fas fa-asterisk"
                                 style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-7 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 py-4 align-items-center">
                            <p class="light-300">최대 3개까지 선택 가능합니다.</p>
                            <select id="multi-select" class="select2" multiple="multiple" name="interest" style="min-width: 100%;" required>
                                <c:forEach var="interestList" items="${interestList}">
                                    <option value="${interestList.code}">${interestList.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
            <%-- 관심사 --%>
            <%-- 선호지역 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 bx bx-location-plus"></i>
                        <p>선호 지역<i class="fas fa-asterisk"
                                 style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-9 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-2 py-4 row">
                            <div class="col-md-4 align-items-center px-lg-5">
                                <p class="light-300">선호 지역 1</p>
                                <select id="first_area" name="first_area" class="form-select" required>
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="area1" items="${areaList}">
                                        <option value="${area1.code}">${area1.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4 align-items-center px-lg-5">
                                <p class="light-300">선호 지역 2</p>
                                <select id="second_area" name="second_area" class="form-select" required>
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="area2" items="${areaList}">
                                        <option value="${area2.code}">${area2.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon d-flex justify-content-center text-center text-secondary px-lg-5 py-2 my-4">
                        <div class="col-1 d-flex">
                            <input type="submit" value="시작하기" id="signUpBtn" class="btn btn-lg btn-secondary text-light light-300">
                        </div>
                        <div class="col-1"></div>
                        <div class="col-1 d-flex">
                            <input type="button" value="가입취소" id="signCancel" class="btn btn-lg btn-outline-primary text-primary light-300">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- Latest compiled and minified JavaScript -->
<script src="//select2.github.io/select2/select2-3.4.1/select2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<!-- End Footer / Script -->
<script type="text/javascript">

    $(function () {
        areaOverlapCheck();

        $('.select2').select2({
            placeholder : '',
            maximumSelectionSize: 3
        });

        $('#signUpFrm').validate();

        $.extend($.validator.messages, {
            required: "필수 항목 입니다."
        });

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
                        title: data,
                        text: '다시 로그인을 진행 해주세요!',
                        icon: 'success',
                        timer: 3000
                    }).then(() => {
                        location.href = "${pageContext.request.contextPath}/logout";
                    });
                },
                error: function (e) {
                    Swal.fire({
                        title: '오류 발생 Error',
                        text: '알 수 없는 오류가 발생되었습니다. 다시 시도 해주세요. ' + e.message,
                        icon: 'error',
                        timer: 3000
                    }).then(() => {
                        location.reload();
                    });
                }
            });
        });
    });

    function areaOverlapCheck() {
        $('#first_area').on('change', function (data) {
            if ($('#first_area').val() === $('#second_area').val()) {
                alert('같은 지역을 선택하실 수 없습니다. 다시 선택해주세요.');
                $('#first_area').val("");
            }
        });
        $('#second_area').on('change', function (data) {
            if ($('#second_area').val() === $('#first_area').val()) {
                alert('같은 지역을 선택하실 수 없습니다. 다시 선택해주세요.');
                $('#second_area').val("");
            }
        });
    }

</script>
</body>
</html>
