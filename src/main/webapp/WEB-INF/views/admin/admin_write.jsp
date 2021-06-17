<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset=UTF-8">

    <title>글쓰기</title>

    <title>내가 가입한 모임 - 게시판</title>
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        a {
            text-decoration: none !important
        }

        a:hover {
            text-decoration: none !important
        }
    </style>

</head>
<body class="is-preload">
<script type="text/javascript">
    // swal("Here's the title!", "...and here's the text!");
    function confirm() {
        //e.preventDefault

        var subject = $("#subject").val().trim();
        var content = $("#content").val().trim();
        var post_catename = $("#post_catename").val().trim();

        if (subject == "") {
            swal("제목을 입력해주세요.");
            return;
        } else if (content == "") {
            swal("내용을 선택해주세요.");
            return;
        }

        var form = document.createElement("form")


        $('#form').submit();
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
                        <form id="form" method="post" action='adminWriteOk.do' enctype="multipart/form-data">
                            <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}" >
                            <%-- 카테고리 셀렉트  --%>
                            <select id="post_catename" name="category" style="width: 170px; float: right">
                                <c:choose>
                                    <c:when test="${type eq 'notice'}">
                                        <option selected value="notice">공지사항</option>
                                        <option value="event">이벤트</option>
                                    </c:when>
                                    <c:when test="${type eq 'event'}">
                                        <option value="notice">공지사항</option>
                                        <option value selected="event">이벤트</option>
                                    </c:when>
                                </c:choose>
                            </select>
                            <br><br>

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
                                <button type="button" onclick="location.href='adminNotice.do'">목록</button>
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