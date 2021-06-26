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
    <form id="userUpdateFrm" method="POST" action='userUpdate.do' enctype="multipart/form-data">
        <c:set var="userInfoBasic" value="${userInfo.userInfoBasic}"></c:set>
        <c:set var="imgSrc" value="${userInfoBasic.profile_img}"/>
        <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
        <input type="hidden" name="first_area" value="">
        <input type="hidden" name="second_area" value="">
        <input type="hidden" name="profile_img" value="${userInfoBasic.profile_img}">

        <div class="service-wrapper py-3">
            <%-- 프로필 사진 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-image-add"></i>
                        <p>프로필 사진</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                                <c:choose>
                                    <c:when test="${fn:startsWith(imgSrc, 'http')}">
                                        <img id="preview" name="fileName"
                                             src="${userInfoBasic.profile_img}"
                                             style="width:200px; height:200px; border-radius:70%; margin-bottom: 10px;">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="preview" name="fileName"
                                             src="./upload/profileimg/${userInfoBasic.profile_img}"
                                             style="width:200px; height:200px; border-radius:70%; margin-bottom: 10px;">
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

            <%-- 자기소개 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-edit"></i>
                        <p>자기소개</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                        <textarea name="content" id="content" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 100px; "
                                  placeholder="100자 이내로 입력해 주세요."><c:out value="${userInfoBasic.content}"/></textarea>
                                <label for="content">100자 이내로 입력해 주세요.</label>
                                <p align="left" id="groupNameKeyUp"></p>

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
                               onclick="window.open('userCategory.do', '관심사 선택', 'width=600, height=600, left=100, top=50');"/>
                        <div class="text-left text-secondary text-muted d-inline-flex">
                            <c:forEach var="userInterest" items="${userInfo.userInterest}">
                                <p id="interest" class="align-middle badge bg-primary text-wrap"
                                   style="font-size: 14px; padding: 1em; margin-right: 10px;">
                                    <c:out value="${userInterest.catename}"/></p>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 선호지역 1 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-location-plus"></i>
                        <p>첫 번째 선호지역</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center py-5">
                        <select id="area1" class="form-select" style="width: 30%; float:left; margin-right: 10px;">
                            <option selected disabled hidden>=== 선택 ===</option>
                            <c:forEach var="area" items="${areaList}">
                                <option
                                        <c:if test="${userInfoBasic.first_area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                            </c:forEach>
                        </select>
                        <p id="error1"
                           style="color: orangered; vertical-align: middle; margin-top: 10px; margin-bottom: 0px;"></p>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 선호지역 2 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-location-plus"></i>
                        <p>두 번째 선호지역</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center py-5">
                        <select id="area2" class="form-select" style="width: 30%; float:left; margin-right: 10px;">
                            <option selected disabled hidden>=== 선택 ===</option>
                            <c:forEach var="area" items="${areaList}">
                                <option
                                        <c:if test="${userInfoBasic.second_area_name == area.area_name}">selected</c:if>>${area.area_code} ${area.area_name}</option>
                            </c:forEach>
                        </select>
                        <p id="error2"
                           style="color: orangered; vertical-align: middle; margin-top: 10px; margin-bottom: 0px;"></p>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 가입한 모임 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bxs-group"></i>
                        <p>가입한 모임</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center py-5" style="padding-left: 0em;">
                        <ul class="pricing-table-list text-start text-dark px-3 list-unstyled light-300">
                            <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                                <i class="fas fa-check"></i>&nbsp;&nbsp;
                                <a href="board_main.do?group_no=${userJoinGroup.group_no}">
                                    <c:out value="${userJoinGroup.group_name}"/></a><br>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 완료 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="col-md-12 col-12 my-5 text-center">
                        <input type="button" onclick="confirm()" value="수정 완료"
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
<script>
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
            if ($('#area1 option:selected').text() === $('#area2 option:selected').text()) {
                Swal.fire({text : '같은 지역을 선택하실 수 없습니다. 다시 선택해 주세요.'});
                $("#area1 option:eq(0)").prop("selected", true);
            }
        });
        $('#area2').change(function () {
            if ($('#area2 option:selected').text() === $('#area1 option:selected').text()) {
                Swal.fire({text : '같은 지역을 선택하실 수 없습니다. 다시 선택해 주세요.'});
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
        if (area1 === def) {
            $('#error1').html('지역을 선택해 주세요!');
            return;
        } else {
            $('#error1').html('');
        }
        if (area2 === def) {
            $('#error2').html('지역을 선택해 주세요!');
            return;
        } else {
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