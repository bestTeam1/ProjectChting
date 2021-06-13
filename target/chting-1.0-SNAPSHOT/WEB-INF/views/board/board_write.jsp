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
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .swiper-slide img {
            display: block;
            width: 100%;
            height: 50%;
            object-fit: cover;
        }
        a { text-decoration:none !important }
        a:hover { text-decoration:none !important }



    </style>

</head>
<body class="is-preload">
<script type="text/javascript">
    // swal("Here's the title!", "...and here's the text!");
    function confirm() {
        //e.preventDefault

        var subject = $("#subject").val().trim();
        var content =  $("#content").val().trim();
        var post_catename = $("#post_catename").val().trim();

        if(post_catename == "") {
            swal("카테고리를 선택해주세요.");
            return;
        } else if(subject == "") {
            swal("제목을 입력해주세요.");
            return;
        } else if(content == ""){
            swal("내용을 선택해주세요.");
            return;
        }

        $('#form').submit();
    }

</script>
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>

<%--action='<c:url value='/board/board_insert.do'/>'--%>
    <form id="form" method="post" action='board_write.do'>
                                <%-- 카테고리 셀렉트  --%>
                                <select id="post_catename" name="post_catename" style="width: 170px; float: right">
                                    <option value="">===카테고리===</option>
                                    <option value="자유글">자유글</option>
                                    <option value="정모후기">정모후기</option>
                                    <option value="가입인사">가입인사</option>
                                    <option value="공지사항">공지사항</option>
                                </select>
                                    <br><br>

<%--  <div>작성자<input type="text" name="writer" value="${modifyId}" readonly="readonly"></div>--%>
        <div>제목<input type="text" id="subject" name="subject"
                      placeholder="2~20자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                      onblur="this.placeholder = '2~20자 이내로 입력해주세요 :)'"></div>
    <br><br>
        <div>내용<textarea rows="5" cols="13" id="content" name="content" style="resize: none"
                         placeholder="2~2000자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                         onblur="this.placeholder = '2~2000자 이내로 입력해주세요 :)'"></textarea>
        </div>
    <br><br>
    <div><label class="form-label" for="customFile">첨부파일</label>
        <input type="file" class="form-control" id="customFile" name="file"/></div>
    <br><br>

    <div style="display: flex; justify-content: center">
        <input type="button" onclick="confirm()" value="완료"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="location.href='board_list.do'">목록</button>
    </div>
    </form>

                    </header>
                </div>
            </section>


        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>