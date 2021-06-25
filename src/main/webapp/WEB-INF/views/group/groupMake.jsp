<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Service -->
<section class="bg-light w-100">
    <div class="container">
        <div class="row d-flex align-items-center py-5">
            <div class="col-lg-6 text-start">
                <h1 class="h2 py-5 text-primary typo-space-line">Chting 모임 만들기</h1>
                <p class="light-300">
                    지역과 관심사를 선택하고 마음이 맞는 사람들과 함께 취미 활동을 해보세요 !
                </p>
            </div>
            <div class="col-lg-6">
                <img src="./assets/img/banner-img-02.svg">
            </div>
        </div>
    </div>
</section>
<section class="container my-lg-5">
    <form id="groupMakeFrm" method="POST" action='groupMake.do' enctype="multipart/form-data">
        <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
        <input type="hidden" name="catecode" id="catecode" value="">
        <input type="hidden" name="groupNo" value="${groupNo}">

        <div class="service-wrapper py-3">
            <%-- 모임 대표 사진 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-image-add"></i>
                        <p>대표 사진</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                                <c:choose>
                                    <c:when test="${not empty group_img}">
                                        <img id="preview" src="${group_img}" width="130" alt="모임 대표이미지가 보여지는 영역">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="preview"
                                             width="200" style="float: left; margin-bottom: 20px;">
                                    </c:otherwise>
                                </c:choose>
                                <div class="input-group">
                                    <input type="file" class="form-control" id="fileName" name="fileName"
                                           aria-describedby="inputGroupFileAddon04"
                                           aria-label="Upload" accept="image/*;capture=camera">
                                </div>
                            </div>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 모임 이름 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-edit"></i>
                        <p>모임 이름</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                        <textarea name="group_name" id="group_name" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 100px; "
                                  placeholder="4 ~ 20자 이내로 입력해 주세요."></textarea>
                                <label for="group_name">4 ~ 20자 이내로 입력해 주세요.</label>
                                <p align="left" id="groupNameKeyUp"></p>

                            </div>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 모임 소개글 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-edit"></i>
                        <p>모임 소개</p>
                    </div>

                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                        <textarea name="content" id="content" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 200px;"
                                  placeholder="10 ~ 1000자 이내로 입력해 주세요."></textarea>
                                <label for="content">10 ~ 1000자 이내로 입력해 주세요.</label>
                                <p align="left" id="contentKeyUp"></p>
                            </div>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 관심사 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-category-alt"></i>
                        <p>관심사</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <input type="button" style="" id="interestBtn"
                               class="btn rounded-pill px-4 btn-outline-primary light-300" value="관심사 선택"
                               onclick="window.open('groupCategory.do', '관심사 선택', 'width=600, height=600, left=100, top=50');"/>
                        <div class="text-left text-secondary text-muted">
                            <p id="interest"></p>
                        </div>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 지역 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-location-plus"></i>
                        <p>지역</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <select name="area_code" id="area_code" style="width: 30%; float:left;">
                            <option value="" selected disabled hidden>=== 선택 ===</option>
                            <c:forEach items="${areaList}" var="area">
                                <option value="${area.area_code}">${area.area_code} ${area.area_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="col-md-12 col-12 my-5 text-center">
                        <input type="button" onclick="confirm()" value="완료"
                               class="btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>
<!-- End Service -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

<!-- End Footer / Script -->
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
        console.log($('#interest').val());

        if ($('#group_name').val().trim() == '') {
            Swal.fire('모임 이름을 입력해 주세요 !')
            return;
        } else if ($('#group_name').val().length < 4) {
            Swal.fire('모임 이름을 최소 4자 이상 입력해 주세요 !')
            return;
        } else if ($('#content').val().trim() == '') {
            Swal.fire('모임 소개글을 입력해 주세요 !')
            return;
        } else if ($('#content').val().length < 10) {
            Swal.fire('모임 소개글을 최소 10자 이상 입력해 주세요 !')
            return;
        } else if ($('#area_code').val() == null) {
            Swal.fire('지역을 선택해 주세요 !')
            return;
        } else if ($('#catecode').val() == '') {
            Swal.fire('관심사를 선택해 주세요 !')
            return;
        }

        Swal.fire({
            title: '모임을 생성하시겠습니까?',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '모임 생성 완료!',
                    text: '모임 관리 페이지로 이동합니다.',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#groupMakeFrm').submit();
                    }
                })
            }
        })
    }

</script>
</body>
</html>
