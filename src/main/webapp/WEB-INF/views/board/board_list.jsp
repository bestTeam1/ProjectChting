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