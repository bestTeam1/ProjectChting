<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>모임 관리</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweetalert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                <h1 style="text-align: center">모임을 관리하세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section id="table">
                <div class="box-body">
                    <table class="table table-bodered" style="text-align: center">
                        <tr>
                            <th style="text-align: center">모임이름</th>
                            <th style="text-align: center">모임참여자수</th>
                            <th style="text-align: center">모임지역</th>
                            <th style="text-align: center">카테고리</th>
                            <th style="text-align: center">활동상태</th>
                            <th style="text-align: center">개설일</th>
                        </tr>
                        <c:forEach var="i" items="${groupList}">
                            <tr>
                                <td><a href="${pageContext.request.contextPath}/board_main.do?group_no=${i.group_no}">${i.group_name}</a></td>
                                <td>${i.join_user}</td>
                                <td>${i.area_name}</td>
                                <td>${i.catename}</td>
                                <c:choose>
                                    <c:when test="${i.enabled eq 1}"><td>활동중</td></c:when>
                                    <c:otherwise><td>활동정지</td></c:otherwise>
                                </c:choose>
                                <td>${i.opendate}</td>
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
                            <c:if test="${pm.prev}">
                                <li><a href="${pageContext.request.contextPath}/admin/adminGroupManagement.do?page=${pm.startPage-1}">&laquo;</a></li>
                            </c:if>
                            <!-- 페이지블럭 -->
                            <c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
                                <!-- 삼항연산자를 사용해서 class로 스타일적용  -->
                                <li ${pm.cri.page == idx? 'class=active':''}>
                                    <a href="${pageContext.request.contextPath}/admin/adminGroupManagement.do?page=${idx}">${idx}</a>
                                </li>
                            </c:forEach>
                            <!-- 다음next -->
                            <c:if test="${pm.next && pm.endPage > 0}">
                                <li><a href="${pageContext.request.contextPath}/admin/adminGroupManagement.do?page=${pm.endPage+1}">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">

</script>
</html>