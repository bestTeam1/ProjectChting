<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 게시판</title>
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

                        <div>
                        <table>
                            <tr style="background-color: lavender; text-align: center">
                                <td>No.</td>
                                <td>이름</td>
                                <td>카테고리</td>
                                <td>제목</td>
                                <td>작성일</td>
                            </tr>

                            <c:forEach var="plist" items="${plist}">
                                <tr style="text-align: center">
<%--                                    <c:out value="${plist.post_no}"/>--%>
<%--                                    <c:out value="${plist.post_no}"/>--%>
<%--                                    <c:out value="${plist.post_no}"/>--%>
<%--                                    <c:out value="${plist.post_no}"/>--%>
<%--                                    <c:out value="${plist.post_no}"/>--%>
                                    <td>${plist.post_no}</td>
                                    <td>${plist.nickname}</td>
                                    <td>${plist.post_catename}</td>
                                    <td><a href="<c:url value='board_detail.do?post_no=${plist.post_no}&userid=${sessionScope.get("userData").userid}'/>">${plist.subject}</a></td>
                                    <td>${plist.writedate}</td>
                                </tr>
                            </c:forEach>

                        </table>
                        </div>

                        <div class="box-footer">
                            <div class="text-center">
                                <ul class="pagination" style="text-align: center">
                                    <!-- 이전prev -->
                                    <c:if test="${pm.prev}">
                                        <li><a href="board_list.do?group_no=${group_no}&page=${pm.startPage-1}">&laquo;</a></li>
                                    </c:if>
                                    <!-- 페이지블럭 -->
                                    <c:forEach var="idx" begin="${pm.startPage}" end="${pm.endPage}">
                                        <!-- 삼항연산자를 사용해서 class로 스타일적용  -->
                                        <li ${pm.cri.page == idx? 'class=active':''}>
                                            <a href="board_list.do?group_no=${group_no}&page=${idx }">${idx}</a>
                                        </li>
                                    </c:forEach>
                                    <!-- 다음next -->
                                    <c:if test="${pm.next && pm.endPage > 0}">
                                        <li><a href="board_list.do?group_no=${group_no}&page=${pm.endPage+1}">&raquo;</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>

                    </header>
                </div>
            </section>

            <div style="text-align: center">
                <button onclick="location.href='board_write.do?group_no=${group_no}'">글쓰기</button>
            </div>
            <br>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

</body>

</html>