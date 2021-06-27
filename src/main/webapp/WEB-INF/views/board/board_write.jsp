<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp"/>
<!-- End Board SideBar -->

<!-- Start Service -->
<section class="container my-lg-5">
    <form id="write" method="post" action='board_writeOk.do' enctype="multipart/form-data">
        <input type="hidden" name="group_no" value="${group_no}">
        <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
        <div class="service-wrapper py-3">

            <%-- 카테고리 선택 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-category"></i>
                        <p>카테고리</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center py-5">
                        <select name="post_catecode" id="post_catecode" class="form-select"
                                style="width: 30%; float:left;">
                            <option value="" selected disabled hidden>=== 선택 ===</option>
                            <c:forEach items="${postCategory}" var="category">
                                <option value="${category.post_catecode}">${category.post_catename}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 제목 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-edit"></i>
                        <p>제목</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                        <textarea name="subject" id="subject" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 80px; "
                                  placeholder="2 ~ 20자 이내로 입력해 주세요."></textarea>
                                <label for="subject">2 ~ 20자 이내로 입력해 주세요.</label>
                                <p align="left" id="subjectKeyUp"></p>

                            </div>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 내용 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-edit"></i>
                        <p>내용</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                        <textarea name="content" id="content" class="form-control form-control-lg light-300"
                                  style="resize: none; width: 800px; height: 300px; "
                                  placeholder="2 ~ 2000자 이내로 입력해 주세요."></textarea>
                                <label for="content">2 ~ 2000자 이내로 입력해 주세요.</label>
                                <p align="left" id="contentKeyUp"></p>

                            </div>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>

            <%-- 첨부 파일 --%>
            <div class="pricing-list shadow-sm rounded-top rounded-3 py-sm-0 py-5">
                <div class="row p-2">
                    <div class="pricing-list-icon col-3 text-center m-auto text-secondary ml-5 py-2">
                        <i class="display-3 bx bx-image-add"></i>
                        <p>첨부 파일</p>
                    </div>
                    <div class="pricing-list-body col-md-5 align-items-center pl-3 pt-2">
                        <ul class="list-unstyled text-center light-300">
                            <div class="form-floating mb-4">
                                <div class="input-group">
                                    <input type="file" class="form-control" id="fileName" name="uploadFile"/>
                                </div>
                            </div>
                        </ul>
                    </div>
                    <div class="pricing-list-footer col-4 text-center m-auto align-items-center">
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div style="display: flex; justify-content: center">
        <input type="submit" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5" style="margin-right: 10px;"
               id="submit" value="완료"/>
        <button type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5"
                onclick="location.href='board_list.do?group_no=${group_no}'">목록
        </button>
    </div>
</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
<script type="text/javascript">

    $(function () {

        //글 제목 keyUP
        $('#subject').keyup(function () {
            let inputLength = $(this).val().length; //입력한 글자 수
            let remain = 20 - inputLength; //20자에서 남은 글자수

            $('#subjectKeyUp').html(inputLength + '/20');

            if (inputLength >= 1 && inputLength <= 2) {
                $(this).css('color', 'red');
            } else if (inputLength >= 3 && inputLength <= 20) {
                $(this).css('color', 'grey');
            } else if (remain < 1) {
                Swal.fire({
                    text: '게시글 제목은 20자 이내로 입력해 주세요!',
                    confirmButtonColor: '#A0A0FF'
                });
            };
        });

        //글 내용 keyUP
        $('#content').keyup(function () {
            let inputLength = $(this).val().length; //입력한 글자 수
            let remain = 2000 - inputLength; //2000자에서 남은 글자수

            $('#contentKeyUp').html(inputLength + '/2000');

            if (inputLength >= 1 && inputLength <= 2) {
                $(this).css('color', 'red');
            } else if (inputLength >= 3 && inputLength <= 2000) {
                $(this).css('color', 'grey');
            } else if (remain < 1) {
                Swal.fire({
                    text: '글 내용은 2000자 이내로 입력해 주세요!',
                    confirmButtonColor: '#A0A0FF'
                });
            };
        });

    });

    $('#submit').on('click', (event) => {
        event.preventDefault();

        var post_catename = $("#post_catename").val();
        var subject = $("#subject").val().trim();
        var content = $("#content").val().trim();

        if (post_catename == "default") {
            Swal.fire({
                text: '카테고리를 선택해주세요.',
                icon: 'warning',
                confirmButtonColor: '#A0A0FF'
            });
            return;
        } else if (subject == "") {
            Swal.fire({
                text: '제목을 입력해주세요.',
                icon: 'warning',
                confirmButtonColor: '#A0A0FF'
            });
            return;
        } else if (!(1 < subject.length <= 20)) {
            Swal.fire({
                text: '제목은 2~20 자로 입력해주세요.',
                icon: 'warning',
                confirmButtonColor: '#A0A0FF'
            });
            return;
        } else if (content == "") {
            Swal.fire({
                text: '내용을 입력해주세요.',
                icon: 'warning',
                confirmButtonColor: '#A0A0FF'
            });
            return;
        } else if (!(1 < content.length <= 2000)) {
            Swal.fire({
                text: '내용은 2~2000 자로 입력해주세요.',
                icon: 'warning',
                confirmButtonColor: '#A0A0FF'
            });
            return;
        } else {
            $('#write').submit();
        }
    });

</script>
</html>

