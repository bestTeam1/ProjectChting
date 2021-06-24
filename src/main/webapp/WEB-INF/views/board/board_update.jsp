<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>글수정</title>
</head>
<body class="is-preload">

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
                        <form id="form" method="post" enctype="multipart/form-data" action='board_update.do'>
                            <select id="post_catename" name="post_catecode" style="width: 170px; float: right">
                                <option value="A004">자유글</option>
                                <option value="A003">정모후기</option>
                                <option value="A002">가입인사</option>
                                <option value="A001">공지사항</option>
                            </select>
                            <br><br>

                            <div>제목<input type="text" id="subject" name="subject" value="${plist.subject}"></div>
                            <br><br>
                            <div>내용<textarea rows="5" cols="13" id="content" name="content"
                                             style="resize: none">${plist.content}</textarea>
                            </div>
                            <br><br>
                            <div><label class="form-label" for="customFile">첨부파일</label>
                                <!-- file은 기본 value를 줄수가없음. null(파일을 바꾸지않음) 이면 file은 DB업데이트에서 제외? 시키는 로직으로 해야할듯함 -->
                                <input type="file" class="form-control" id="customFile" name="uploadFile"/></div>
                            <br><br>

                            <div style="display: flex; justify-content: center">
                                <button type="button" onclick="confirm()">완료</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="goList()">목록</button>
                            </div>
                            <input type="hidden" name="post_no" value="${plist.post_no}">
                            <input type="hidden" name="userid" value="${plist.userid}">
                        <%--                        <button type="button" onclick="location.href='board_list.do'">목록</button>--%>
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
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
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