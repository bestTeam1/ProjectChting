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

                        <%-- 카테고리 셀렉트  --%>
                        <select name="category" style="width: 170px">
                            <option value="">===카테고리===</option>
                            <option value="자유글">자유글</option>
                            <option value="정모후기">정모후기</option>
                            <option value="가입인사">가입인사</option>
                            <option value="공지사항">공지사항</option>
                        </select>
                        <br>

                        <form method="post" action="WriteAct">
                            <table>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="vertical-align: middle">제목</td>
                                                <td><input name="bbs_title" size="50" maxlength="100"type="text"
                                                           class="form-control" name="subject" id="title"
                                                           placeholder="제목을 입력해 주세요" onfocus="this.placeholder = ''"
                                                           onblur="this.placeholder = '제목을 입력해 주세요'"></td>

                                                <td>&nbsp;</td>


                                            </tr>
                                            <tr height="1">
                                                <td colspan="4"></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="vertical-align: middle">내용</td>
                                                <td><textarea cols="50" rows="13" name="content" placeholder="내용을 입력해 주세요"
                                                              onfocus="this.placeholder = ''"
                                                              onblur="this.placeholder = '내용을 입력해 주세요'"></textarea></td>
                                                <td>&nbsp;</td>
                                            </tr>

                                        </table>
                                        <!-- 파일 선택 -->
                                        <label class="form-label" for="customFile">첨부파일</label>
                                        <input type="file" class="form-control" id="customFile" name="filename"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </header>
                </div>
            </section>



            <div style="display: flex; justify-content: center;">
                <form action="board_write.do">
                    <input type="submit" value="등록">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </form>
                <form action="board_list.do">
                    <input type="submit" value="목록">
                </form>
            </div>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>