<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

    <title>내가 가입한 모임 - 상세보기</title>
</head>
<body class="is-preload">
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Work Sigle -->
<%--<c:set var="userid" value="${sessionScope.get('userData').userid}"/>--%>

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp"/>
<!-- End Board SideBar -->

<!-- Start Service -->
<section class="container my-lg-5">
    <form id="form" method="post" action='${pageContext.request.contextPath}/board_update.do'
          enctype="multipart/form-data">
        <input type="hidden" name="post_no" value="${plist.post_no}">
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
                        <select name="post_catecode" id="post_catename" class="form-select"
                                style="width: 30%; float:left;">
                            <option value="A004">자유글</option>
                            --%>
                            <option value="A003">정모후기</option>
                            <option value="A002">가입인사</option>
                            <option value="A001">공지사항</option>
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
                                  placeholder="2 ~ 20자 이내로 입력해 주세요.">${plist.subject}</textarea>
                                <label for="subject"></label>
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
                                  placeholder="2 ~ 2000자 이내로 입력해 주세요.">${plist.content}</textarea>
                                <label for="content"></label>
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
        <input type="submit" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5"
               style="margin-right: 10px;"
               id="submit" onclick="confirm()" value="완료"/>
        <button type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5"
                onclick="goList()">목록
        </button>
    </div>
</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
<script type="text/javascript">
    $('#post_catename').val('${plist.post_catecode}');

    function confirm() {
        // e.preventDefault

        var subject = $("#subject").val().trim();
        var content = $("#content").val().trim();
        var file = $("#customFile")

        if (subject == "") {
            Swal.fire({
                text: '제목을 입력해주세요.',
                icon: 'warning',
            });
            return;
        } else if (!(1 < subject.length <= 20)) {
            Swal.fire({
                text: '제목은 2~20 자로 입력해주세요.',
                icon: 'warning',
            });
            return;
        } else if (content == "") {
            Swal.fire({
                text: '내용을 입력해주세요.',
                icon: 'warning',
            });
            return;
        } else if (!(1 < content.length <= 2000)) {
            Swal.fire({
                text: '내용은 2~2000 자로 입력해주세요.',
                icon: 'warning',
            });
            return;
        }

        $('#form').submit();
    }

    function goList() {
        Swal.fire({
            title: '게시글 수정',
            text: '게시글 수정을 취소하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#A0A0FF',
            cancelButtonColor: '#aaaaaa',
            confirmButtonText: '네',
            canclButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                location.href = 'board_list.do?group_no=${plist.group_no}';
            } else {

            }
        });
    }
</script>
</html>

