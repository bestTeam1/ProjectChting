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

<script type="text/javascript">
    function confirm() {
        // e.preventDefault
        var post_catename = $("#post_catename").val();
        var subject = $("#subject").val().trim();
        var content = $("#content").val().trim();


        if (post_catename == "default") {
            Swal.fire({
                text: '카테고리를 선택해주세요.',
                icon: 'warning',
            });
            return;
        } else if (subject == "") {
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
        var form = document.createElement("form")

        $('#form').submit();
    }

</script>

<section class="container" style="min-height: 700px;">
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3">
            <form id="form" method="post" action='${pageContext.request.contextPath}/board_writeOk.do' enctype="multipart/form-data">
                <%-- 카테고리 셀렉트  --%>
                <select id="post_catename" name="post_catecode" style="width: 170px; float: right">
                    <option value="default" selected hidden>==카테고리==</option>
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
                                                               class="form-control" placeholder="2~20자 이내로 입력해주세요 :)"
                                                               onfocus="this.placeholder = ''"
                                                               onblur="this.placeholder = '2~20자 이내로 입력해주세요 :)'">
                    </div>
                    <br><br>
                    <div class="mb-3">
                        <label for="content">내용</label> <textarea rows="5" cols="60" class="form-control" id="content" name="content" style="resize: none"
                                                                  placeholder="2~2000자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                                                                  onblur="this.placeholder = '2~2000자 이내로 입력해주세요 :)'"></textarea>
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
                    <button type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5"
                            onclick="location.href='board_list.do?group_no=${group_no}'">목록
                    </button>

                </div>

                <input type="hidden" name="group_no" value="${group_no}">
                <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}">
            </form>


        </div>
    </div>
</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
</html>

