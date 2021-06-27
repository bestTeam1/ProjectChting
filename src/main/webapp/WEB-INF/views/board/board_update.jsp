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

<section class="container" style="min-height: 700px;">
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3">
            <form id="form" method="post" action='${pageContext.request.contextPath}/board_update.do' enctype="multipart/form-data">
                <%-- 카테고리 셀렉트  --%>
                    <select id="post_catename" name="post_catecode" style="width: 170px; float: right">
                        <option value="A004">자유글</option>
                        <option value="A003">정모후기</option>
                        <option value="A002">가입인사</option>
                        <option value="A001">공지사항</option>
                    </select>
                <br><br><br><br>

                <table>
                    <%--  <div>작성자<input type="text" name="writer" value="${modifyId}" readonly="readonly"></div>--%>
                    <div class="mb-3">
                        <label for="subject">제목</label> <input type="text" id="subject" name="subject"
                                                               class="form-control" value="${plist.subject}">
                    </div>
                    <br><br>
                    <div class="mb-3">
                        <label for="content">내용</label> <textarea rows="5" cols="60" class="form-control" id="content"
                                                                  name="content" style="resize: none">${plist.content}</textarea>
                    </div>
                </table>
                <br><br>
                <%--                            <div><label class="form-label" for="customFile">첨부파일</label>--%>
                <%--                                <input type="file" class="form-control" id="customFile" name="file"/></div>--%>

                <!-- 파일 선택 -->
                <label class="form-label" for="fileName">첨부파일</label>
                <input type="file" class="form-control" id="fileName" name="uploadFile"/>

                <%--                <input type="file" id="fileName" name="uploadFile" class="fileName">--%>
                <br><br>

                <div style="display: flex; justify-content: center">
                    <input type="submit" class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5"
                           onclick="confirm()" value="완료"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" onclick="goList()" class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5">목록</button>

                </div>

                <input type="hidden" name="post_no" value="${plist.post_no}">
                <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
            </form>


        </div>
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

