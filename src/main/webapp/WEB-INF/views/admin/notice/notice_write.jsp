<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">

    <title>글쓰기</title>

    <title>내가 가입한 모임 - 게시판</title>

</head>
<body class="is-preload">
<script type="text/javascript">
    function confirm() {

        var subject = $("#subject").val().trim();
        var content = $("#content").val().trim();

        if (subject == "") {
            swal("제목을 입력해주세요.");
            return;
        } else if (content == "") {
            swal("내용을 입력해주세요.");
            return;
        }

        Swal.fire({
            title: '공지사항 작성',
            text: "공지사항을 등록하시겠습니까?",
            icon: '확인',
            showCancelButton: true,
            confirmButtonColor: '#A0A0FF',
            cancelButtonColor: '#aaaaaa',
            cancelButtonText : '취소',
            confirmButtonText: '공지사항을 등록합니다'
        }).then ((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '등록 성공!',
                    text : '공지사항을 등록했습니다!'
                }).then((result) => {
                    $('#form').submit();
                })
            }
        })
    }

</script>
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>
                        <%--action='<c:url value='/board/board_insert.do'/>'--%>
                        <form id="form" method="post" action='${pageContext.request.contextPath}/admin/noticeWriteOk.do' enctype="multipart/form-data">
                            <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}" >
                            <input type="hidden" name="notice_no" value="${noticeNo}">
                        <%-- 카테고리 셀렉트  --%>
                            <br><br>
                            <h1>공지사항</h1>
                            <div>제목<input type="text" id="subject" name="subject"
                                          placeholder="2~20자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '2~20자 이내로 입력해주세요 :)'"></div>
                            <br><br>
                            <div>내용<textarea rows="5" cols="13" id="content" name="content" style="resize: none"
                                             placeholder="2~2000자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                                             onblur="this.placeholder = '2~2000자 이내로 입력해주세요 :)'"></textarea>
                            </div>
                            <br><br>
                            <br><br>
                                <input type="file" id="fileName" name="uploadFile" class="fileName">
                            <div style="display: flex; justify-content: center">

                            <input type="button" onclick="confirm()" value="완료"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/adminNotice.do'">목록</button>
                            </div>
                        </form>

                    </header>
                </div>
            </section>


        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

</body>

</html>