<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/21
  Time: 11:43 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header_new.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Work Sigle -->
<c:set var="userid" value="${sessionScope.get('userData').userid}" />

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp" />
<!-- End Board SideBar -->

<section class="container" style="min-height: 700px;">
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3">
            <table class="table table-hover">
                <thead class="table-right">
                    <tr>
                        <th>No.</th>
                        <th>이름</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="plist" items="${postList}">
                        <tr>
                            <td>${plist.post_no}</td>
                            <td>${plist.nickname}</td>
                            <td>${plist.post_catename}</td>
                            <td><a href='<c:url value='board_detail.do?post_no=${plist.post_no}'/>'>${plist.subject}</a></td>
                            <td>${plist.writedate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 페이징 처리 -->
    <div class="row">
        <div class="btn-toolbar justify-content-center pb-4" role="toolbar" aria-label="Toolbar with button groups">
            <!-- 이전 버튼 -->
            <c:choose>
                <c:when test="${pm.cri.page == pm.startPage}">
                    <div class="btn-group me-2" role="group" aria-label="First group">
                        <button type="button" class="btn btn-secondary text-white disabled">Previous</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="btn-group me-2" role="group" aria-label="First group">
                        <button type="button" class="btn btn-secondary text-white"
                                onclick="location.href='${search_link}'+'&page=${pm.cri.page-1}'">Previous
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- 이전 버튼 -->

            <!-- 페이지 버튼 -->
            <!-- 시작숫자 종료숫자 조건 -->
            <c:choose>
                <c:when test="${pm.endPage <= pm.displayPageNum}">
                    <c:set var="pageStartNumber" value="${pm.startPage}" />
                    <c:set var="pageEndNumber" value="${pm.endPage}" />
                </c:when>
                <c:otherwise>
                    <c:set var="pageStartNumber" value="${(pm.cri.page / pm.displayPageNum) + 1}" />
                    <c:choose>
                        <c:when test="${pm.endPage < ((pm.cri.page / pm.displayPageNum) + 10)}">
                            <c:set var="pageEndNumber" value="${pm.endPage}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="pageEndNumber" value="${((pm.cri.page / pm.displayPageNum) + 10)}" />
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>

            <c:forEach var="i" begin="${pageStartNumber}" end="${pageEndNumber}" varStatus="status">
                <c:choose>
                    <c:when test="${pm.cri.page != i}">
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-secondary text-white"
                                    onclick="location.href='${search_link}'+'&page=${i}'">${i}</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-light" disabled>${i}</button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pm.endPage == 0}">
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-light" disabled>&#9825;</button>
                </div>
            </c:if>
            <!-- 페이지 버튼 -->

            <!-- 다음 버튼 -->
            <c:choose>
                <c:when test="${pm.cri.page < pm.endPage}">
                    <div class="btn-group" role="group" aria-label="Third group">
                        <button type="button" class="btn btn-secondary text-white"
                                onclick="location.href='${search_link}'+'&page=${pm.cri.page+1}'">Next
                        </button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="btn-group" role="group" aria-label="Third group">
                        <button type="button" class="btn btn-secondary text-white" disabled>Next</button>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- 다음 버튼 -->
        </div>
    </div>

</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer_new.jsp"/>
<!-- End Footer / Script -->

</body>
</html>
