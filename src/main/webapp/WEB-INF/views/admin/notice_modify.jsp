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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset=UTF-8">

    <title>글쓰기</title>

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

                        <form id="form" method="post" action='adminNoticeModify.do'>
                            <div>제목<input type="text" id="subject" name="subject" value="${detail.subject}"></div>
                            <br><br>
                            <div>내용<textarea rows="5" cols="13" id="content" name="content"
                                             style="resize: none">${detail.content}</textarea>
                            </div>
                            <br><br>
                            <div><label class="form-label" for="customFile">첨부파일</label>
                                <!-- file은 기본 value를 줄수가없음. null(파일을 바꾸지않음) 이면 file은 DB업데이트에서 제외? 시키는 로직으로 해야할듯함 -->
                                <input type="file" class="form-control" id="customFile" name="file"/></div>
                            <br><br>

                            <div style="display: flex; justify-content: center">
                                <input type="submit" value="완료"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="location.href='board_list.do'">목록</button>
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
<script type="text/javascript">

</script>

</html>