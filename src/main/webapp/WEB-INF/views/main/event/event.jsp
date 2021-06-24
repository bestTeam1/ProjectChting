<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>이벤트 목록</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">이벤트를 관리하세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section id="table">
                <div class="box-body">
                    <table class="table table-bodered" style="text-align: center">
                        <tr>
                            <th style="text-align: center">No.</th>
                            <th style="text-align: center">제목</th>
                            <th style="text-align: center">시작일</th>
                            <th style="text-align: center">종료일</th>
                            <th style="text-align: center">작성일</th>
                        </tr>
                        <c:forEach var="i" items="${eventList}">
                            <tr>
                                <td>${i.event_no}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${i.enabled eq 1}">
                                            (진행중)
                                        </c:when>
                                        <c:otherwise>
                                            (종료)
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="${pageContext.request.contextPath}/eventList.do?eventNo=${i.event_no}&page=${pm.cri.page}">${i.subject}</a>
                                </td>
                                <td>${i.startdate}</td>
                                <td>${i.enddate}</td>
                                <td>${i.writedate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </section>
            <section>
                <div class="box-footer">
                    <div class="text-center">
                        <ul class="pagination" style="text-align: center">
                            <!-- 이전prev -->
                            <c:if test="${pm.prev}">+
                                <li><a href="${pageContext.request.contextPath}/eventList.do?page=${pm.startPage-1}">&laquo;</a></li>
                            </c:if>
                            <!-- 페이지블럭 -->
                            <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                                <!-- 삼항연산자를 사용해서 class로 스타일적용  -->
                                <li ${pm.cri.page == idx? 'class=active':''}>
                                    <a href="${pageContext.request.contextPath}/eventList.do?page=${idx}">${idx}</a>
                                </li>
                            </c:forEach>
                            <!-- 다음next -->
                            <c:if test="${pm.next && pm.endPage > 0}">
                                <li><a href="${pageContext.request.contextPath}/eventList.do.do?page=${pm.endPage+1}">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div style="display: flex; justify-content: center">
                    <input id="Write" type="button" onclick="window.location.href='${pageContext.request.contextPath}/admin/write.do?type=event'" value="글쓰기"/>
                </div>
            </section>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>

</html>