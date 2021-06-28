<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->

<!-- Start Service -->
<section class="container my-lg-5">
    <form id="groupUpdateFrm" method="POST" action='groupUpdate.do' enctype="multipart/form-data">
        <% pageContext.setAttribute("newLine", "\n"); %>
        <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
        <input type="hidden" name="catecode" id="catecode" value="${groupInfo.catecode}">
        <input type="hidden" name="area_code" value="">
        <input type="hidden" name="group_no" value="${groupInfo.group_no}">
        <input type="hidden" name="group_img" value="${groupInfo.group_img}">
        <input type="hidden" name="content" value="">

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
                                <c:when test="${not empty groupInfo.group_img}">
                                    <img class="img-fluid border rounded" id="preview"
                                         src="./upload/groupimg/${groupInfo.group_img}"
                                         style="width:300px; height:200px; margin-bottom: 10px;">
                                </c:when>
                                <c:otherwise>
                                    <img class="img-fluid border rounded" id="preview" name="fileName"
                                         src="./assets/img/work-slide-05.jpg"
                                         style="width:300px; height:200px; margin-bottom: 10px;">
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
                                  placeholder="4 ~ 20자 이내로 입력해 주세요."><c:out value="${groupInfo.group_name}"/></textarea>
                            <label for="content">4 ~ 20자 이내로 입력해 주세요.</label>
                            <p align="left" id="groupNameKeyUp"></p>

                        </div>
                    </ul>
                </div>
                <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                </div>
            </div>
        </div>

        <%-- 모임 소개 글 --%>
        <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
            <div class="row p-2">
                <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                    <i class="display-3 bx bx-edit"></i>
                    <p>모임 소개 글</p>
                </div>
                <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                    <ul class="list-unstyled text-center light-300">
                        <div class="form-floating mb-4">
                        <textarea id="content" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 300px; "
                                  placeholder="10 ~ 1000자 이내로 입력해 주세요."><c:out value="${fn:replace(groupInfo.content, '<br>',newLine)}"/>
                        </textarea>
                            <label for="content">10 ~ 1000자 이내로 입력해 주세요</label>
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
                <div class="pricing-list-body col-md-5 align-items-center py-5">

                    <input type="button" style="margin-right: 5px;" id="interestBtn"
                           class="btn rounded-pill px-4 btn-outline-primary light-300" value="변경"
                           onclick="window.open('groupCategory.do', '관심사 선택', 'width=600, height=450, left=100, top=50');"/>
                    <div class="text-left text-secondary text-muted d-inline-flex">
                        <p id="interest" class="align-middle badge bg-primary text-wrap"
                           style="font-size: 14px; padding: 1em;"><c:out value="${groupInfo.catename}"/></p>
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
                <div class="pricing-list-body col-md-5 align-items-center py-5">
                    <select class="form-select" id="area" style="width: 30%; float:left;">
                        <option value="" selected disabled hidden>=== 선택 ===</option>
                        <c:forEach var="area" items="${areaList}">
                            <option value=""
                                    <c:if test="${groupInfo.area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                </div>
            </div>
        </div>

        <%-- 완료 --%>
        <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
            <div class="row p-2">
                <div class="col-md-12 col-12 my-5 text-center">
                    <input type="button" onclick="confirm()" value="완료"
                           class="btn btn-secondary rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">
                </div>
            </div>
        </div>
    </form>
</section>
<!-- End Service -->
<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
<script>

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
                Swal.fire({
                    text: '모임 이름은 20자 이내로 입력해 주세요!',
                    confirmButtonColor: '#A0A0FF'
                });
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
                Swal.fire({
                    text: '모임 소개글은 1000자 이내로 입력해 주세요!',
                    confirmButtonColor: '#A0A0FF'
                });
            }
        })

        //로그인체크 (백단에서 못막았을 경우)
        let check = '${sessionScope.get("userData").userid}';
        if (check == null || check == "" || check == undefined) {
            Swal.fire({
                title: '오류',
                icon: 'warning',
                text: '로그인을 해주세요!!',
                confirmButtonColor: '#A0A0FF'
            }).then(() => {
                history.go(-1);
            })
        }
    });

    //Form 전송
    function confirm() {
        let areaArr = $("#area option:selected").text().split(" ");
        let area = areaArr[0];

        let content = $('#content').val().replace(/(\n|\r\n)/g, '<br>');

        //input hidden값으로 보내서 form으로 같이 전송
        $('input[name=content]').attr('value', content);
        $('input[name=area_code]').attr('value', area);


        Swal.fire({
            title: '모임 정보를 수정하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            confirmButtonColor: '#A0A0FF',
            cancelButtonText: '취소',
            cancelButtonColor: '#aaaaaa'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '정보 수정 완료!',
                    text: '모임 메인 페이지로 이동합니다.',
                    confirmButtonText: '확인',
                    confirmButtonColor: '#A0A0FF'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#groupUpdateFrm').submit();
                    }
                })
            }
        })
    };

</script>
</body>
</html>