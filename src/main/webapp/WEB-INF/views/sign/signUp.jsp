<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Service -->
<!-- DB Object -->
<c:set var="arealist" value="${requestScope.areaList}"/>
<c:set var="interestList" value="${requestScope.interestList}"/>
<section class="bg-light">
    <div class="container">
        <div class="row d-flex align-items-center py-4">
            <div class="col-md-6 text-start">
                <h1 class="h2 py-5 text-primary typo-space-line">Chting 회원가입</h1>
                <p>
                    환영합니다 :D<br> Chting 의 여러 회원님들이 <strong>${socialData.nickname}</strong>님을 기다리고 있어요 !
                </p>
            </div>
            <div class="col-md-6 my-3 py-3 col-12">
                <img src="${pageContext.request.contextPath}/assets/img/welcome.png"
                     style="object-fit: fill; width: 95%;" alt="welcome">
            </div>
        </div>
    </div>
</section>

<section class="container my-5">
    <c:choose>
        <c:when test="${socialData.loginType == 'google'}">
            <div class="row h3 light-300 text-primary py-3">
                <div class="col-1"></div>
                <div class="col-11">
                    <span style="text-decoration-line: underline;">Sign-in with</span> >
                    <div class="p-2 d-inline-flex"
                         style="background-color: whitesmoke; border-radius: 5px; box-shadow: gray;">
                        <i class="fab fa-google" style="color: #4285f4; z-index: 2;"></i>
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${socialData.loginType == 'kakao'}">
            <div class="row h3 light-300 text-primary py-3">
                <div class="col-1"></div>
                <div class="col-11">
                    <span style="text-decoration-line: underline;">Sign-in with</span> >
                    <div class="p-2 d-inline-flex"
                         style="background-color: #FEE500; border-radius: 5px; box-shadow: gray;">
                        <i class="fas fa-comment" style="color: #231111; z-index: 2;"></i>
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${socialData.loginType == 'github'}">
            <div class="row h3 light-300 text-primary py-3">
                <div class="col-1"></div>
                <div class="col-11 my-md-3">
                    <span style="text-decoration-line: underline;">Sign-in with</span> >
                    <div class="p-2 d-inline-flex"
                         style="background-color: black; border-radius: 5px; box-shadow: gray;">
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
                    <div class="pricing-list-body col-md-5 col-9 align-items-center px-lg-5 border-start border-1">
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
                <c:when test="${socialData.nickname == 'emptyData'}">
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
                                    <input type="text" name="nickname" class="form-control" placeholder="Username"
                                           minlength="2"
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
                    <div class="pricing-list-body col-md-4 col-7 align-items-center px-lg-5 border-start border-1">
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
                            <input type="radio" class="btn-check" id="female" name="gender" value="여성"
                                   autocomplete="off" required>
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
                    <div class="pricing-list-body col-md-7 col-8 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 py-2 align-items-center">
                            <textarea name="content" id="contentArea" placeholder="100자 이내로 기입해주세요 :)" maxlength="100"
                                      required style="width: 100%; height: 120px; resize: none"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 소개글 --%>
            <%-- 관심사 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 bx bx-category-alt mt-3"></i>
                        <p>관심사<i class="fas fa-asterisk"
                                 style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-7 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 py-4 align-items-center">
                            <p class="light-300">최대 3개까지 선택 가능합니다.</p>
                            <select id="multi-select" class="select2" multiple="multiple" name="interest"
                                    style="min-width: 100%;" required>
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
                        <i class="display-3 bx bx-location-plus mt-3"></i>
                        <p>선호 지역<i class="fas fa-asterisk"
                                   style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-9 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-2 py-4 row">
                            <div class="col-md-4 align-items-center px-lg-5">
                                <p class="light-300">선호 지역 1</p>
                                <select id="first_area" name="first_area" class="form-control form-select" required>
                                    <option value="" disabled selected> - 선택하세요 -</option>
                                    <c:forEach var="area1" items="${areaList}">
                                        <option value="${area1.code}">${area1.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4 align-items-center px-lg-5">
                                <p class="light-300">선호 지역 2</p>
                                <select id="second_area" name="second_area" class="form-control form-select" required>
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
            <%-- 선호지역 --%>
            <%-- 이메일 --%>
            <c:choose>
                <c:when test="${socialData.email == 'emptyData'}">
                    <div class="pricing-list shadow-sm">
                        <div class="row p-4">
                            <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                                <i class="display-3 fas fa-at mt-3"></i>
                                <p>이메일
                                    <i class="fas fa-asterisk"
                                       style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                                </p>
                            </div>
                            <div class="pricing-list-body col-6 align-items-center px-lg-5 border-start border-1">
                                <div class="px-lg-5 py-5 align-items-center">
                                    <input type="email" class="form-control" name="email" required>
                                </div>
                            </div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="email" value="${socialData.email}">
                </c:otherwise>
            </c:choose>
            <%-- 이메일 --%>
            <%-- 약관동의 --%>
            <div class="pricing-list shadow-sm">
                <div class="row p-4">
                    <div class="pricing-list-icon col-3 d-flex flex-column justify-content-center text-center text-secondary px-lg-5 py-2">
                        <i class="display-3 far fa-check-square mt-3"></i>
                        <p>약관 동의<i class="fas fa-asterisk"
                                   style="vertical-align: text-top; font-size: 7px; color: red;"></i>
                        </p>
                    </div>
                    <div class="pricing-list-body col-md-7 col-9 align-items-center px-lg-5 border-start border-1">
                        <div class="px-lg-5 px-2 py-5 align-items-center">
                            <div class="border border-primary p-4"
                                 style="overflow: scroll; width: inherit; height: 200px;">
                                여러분을 환영합니다.<br>
                                다양한 Chting 서비스를 즐겨보세요.<br>
                                회원으로 가입하시면 Chting 서비스를 보다 편리하게 이용할 수 있습니다.<br>
                                여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.<br>
                                여러분의 개인정보를 소중히 보호합니다.<br>
                                타인의 권리를 존중해 주세요.<br>
                                Chting 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.<br>
                                Chting에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.<br>
                                부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.<br>
                                Chting의 잘못은 네이버가 책임집니다.<br>
                                언제든지 Chting 서비스 이용계약을 해지하실 수 있습니다.<br>
                                주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.<br>
                                여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.<br>
                                <br>
                                <strong>[부칙]</strong><br>
                                ① 본 약관은 2021. 06. 30. 부터 적용합니다.<br>
                                - 본 약관에 대한 저작권은 Chting에 귀속하며 무단 복제, 배포, 전송, 기타 저작권 침해행위를 엄금합니다.<br>
                                위의 약관에 동의합니다.
                            </div>
                            <br>
                            <input type="checkbox" class="form-check-input" id="siterule" name="siterule" value="agree"
                                   required>
                            <label for="siterule"> 약관동의 체크 </label>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 약관동의 --%>

            <div class="pricing-list shadow-sm">
                <div class="row py-5">
                    <div class="pricing-list-body d-flex justify-content-center flex-md-row flex-column text-center text-secondary px-5 my-md-3 py-3">
                        <div class="col-md-4 col-6 py-3 mx-auto ms-md-5 me-md-0">
                            <input type="submit" value="시작하기" id="signUpBtn"
                                   class="btn btn-lg btn-secondary rounded-pill px-5 text-light light-300">
                        </div>
                        <div class="col-md-4 col-6 py-3 mx-auto me-md-5 ms-md-0">
                            <input type="button" value="가입취소" id="signCancel"
                                   class="btn btn-lg btn-outline-primary rounded-pill px-5 text-primary light-300">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<div class="w-100 py-3 my-md-5"></div>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- Latest compiled and minified JavaScript -->

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- End Footer / Script -->
<script type="text/javascript">
    import('https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js');
    $(function () {
        areaOverlapCheck();
        $('.select2').select2({
            placeholder: '',
            maximumSelectionSize: 3,
            addClass: 'input-large',
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
        $('#signCancel').click(function () {
            Swal.fire({
                title: '회원가입을 취소합니다',
                text: '다음에 다시 만나요ㅠ',
                icon: 'info',
                timer: 5000,
            }).then(() => {
                location.href = '${pageContext.request.contextPath}/logout';
            })
        });
        $('#signUpFrm').validate({
            submitHandler: function () {
                $('#contentArea').val($('#contentArea').val().replace(/(\n|\r\n)/g, '<br>'));
                var frm = $('#signUpFrm')[0];
                var data = new FormData(frm);
                $('#signUpBtn').prop('disabled', true);
                $.ajax({
                    type: 'POST',
                    enctype: 'multipart/form-data',
                    url: '${pageContext.request.contextPath}/signUp.do',
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 60000,
                    success: function () {
                        Swal.fire({
                            title: '회원가입이 완료 되었습니다 :D',
                            text: '다시 로그인을 진행 해주세요!',
                            icon: 'success',
                            timer: 5000
                        }).then(() => {
                            location.href = "${pageContext.request.contextPath}/logout";
                        })
                    },
                    error: function () {
                        Swal.fire({
                            title: '오류 발생 Error',
                            text: '알 수 없는 오류가 발생되었습니다. 다시 시도 해주세요.',
                            icon: 'error',
                            timer: 3000
                        }).then(() => {
                            location.reload();
                        })
                    }
                });
            }
        });
    });

    function areaOverlapCheck() {
        $('#first_area').on('change', function () {
            if ($('#first_area').val() === $('#second_area').val()) {
                alert('같은 지역을 선택하실 수 없습니다. 다시 선택해주세요.');
                $('#first_area').val("");
            }
        });
        $('#second_area').on('change', function () {
            if ($('#second_area').val() === $('#first_area').val()) {
                alert('같은 지역을 선택하실 수 없습니다. 다시 선택해주세요.');
                $('#second_area').val("");
            }
        });
    }
</script>
</body>
</html>