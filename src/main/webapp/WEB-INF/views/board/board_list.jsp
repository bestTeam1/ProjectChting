<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<table>
    <tr style="background-color: lavender; text-align: center">
    <td>No.</td>
    <td>이름</td>
    <td>카테고리</td>
    <td>제목</td>
    <td>작성일</td>
    </tr>

    <c:forEach var="plist" items="${postList}">
        <tr style="text-align: center">
            <td>${plist.post_no}</td>
            <td>${plist.nickname}</td>
            <td>${plist.post_catename}</td>
            <td><a href='<c:url value='board_detail.do?post_no=${plist.post_no}'/>'>${plist.subject}</a></td>
            <td>${plist.writedate}</td>
        </tr>
    </c:forEach>



</table>


<%--                        <tr>--%>
<%--                            <!--페이징 처리 가운데 정렬  -->--%>
<%--                            <td colspan="9" align="center">--%>

<%--                                <!--이전 링크 -->--%>
<%--                                <c:if test="${cpage > 1}">--%>
<%--                        &lt;%&ndash; <a href="boardList.sj?type=humor_board&cp=${cpage-1}&ps=${pagesize}">이전</a>&ndash;%&gt;--%>
<%--                                    <a href="board_list.do?"></a>--%>
<%--                                </c:if>--%>



<%--                                <!-- page 목록 나열하기 -->--%>
<%--                                <c:forEach var="i" begin="1"--%>
<%--                                           end="${pagecount}" step="1">--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${cpage==i}">--%>
<%--                                            <font color="red">[${i}]</font>--%>
<%--                                        </c:when>--%>
<%--                                        <c:otherwise>--%>
<%--                                            <a href="boardList.sj?type=humor_board&cp=${i}&ps=${pagesize}">[${i}]</a>--%>
<%--                                        </c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                </c:forEach>--%>


<%--                                <!--다음 링크 -->--%>
<%--                                <c:if test="${cpage < pagecount}">--%>
<%--                                    <a href="boardList.sj?type=humor_board&cp=${cpage+1}&ps=${pagesize}">다음</a>--%>
<%--                                </c:if>--%>
<%--                            </td>--%>
<%--                        </tr>--%>

                    </header>
                </div>
            </section>

            <div style="text-align: center">
                <form action="board_write.do">
                    <input type="submit" value="글쓰기">
                </form>
            </div>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>