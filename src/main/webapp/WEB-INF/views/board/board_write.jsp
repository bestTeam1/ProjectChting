<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
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
                        <h2>쿠키런킹덤 - 글쓰기</h2>
                        <form method="post" action="WriteAct">
                            <table>
                                <tr>
                                    <td>
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td>글쓰기</td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td align="center">제목</td>
                                                <td><input name="bbs_title" size="50" maxlength="100"></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr height="1">
                                                <td colspan="4"></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td align="center">내용</td>
                                                <td><textarea name="bbs_content" cols="50" rows="13"></textarea></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr height="1">
                                                <td colspan="4"></td>
                                            </tr>
                                            <tr height="1">
                                                <td colspan="4"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>&nbsp;</td>
                                                <td colspan="2"><input type=button value="등록">
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </header>
                </div>
            </section>

            <div style="text-align: center">
                <button>완료</button>
            </div>

            <div>
                <button type="button" onclick="location.href='board_list.jsp'">돌아가기</button>
            </div>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>