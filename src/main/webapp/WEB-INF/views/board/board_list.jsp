<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Work Sigle -->
<c:set var="userid" value="${sessionScope.get('userData').userid}"/>

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp"/>
<!-- End Board SideBar -->

<section class="container mt-3" style="min-height: 65vh;">
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3 ">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead class="table-secondary">
                <tr>
                    <th class="text-center">No.</th>
                    <th class="text-center">카테고리</th>
                    <th class="text-center">제목</th>
                    <th class="text-center">작성자</th>
                    <th class="text-center">작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="plist" items="${plist}">
                    <tr>
                        <td class="text-center">${plist.post_no}</td>
                        <td class="text-center">${plist.post_catename}</td>
                        <c:choose>
                            <c:when test="${plist.post_catecode == 'A001'}">
                                <td class="text-center">
                                    <a style="color: blueviolet; text-decoration:none;"
                                       href='<c:url value='board_detail.do?post_no=${plist.post_no}'/>'>${plist.subject}</a>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td class="text-center text-secondary">
                                    <a style="text-decoration:none;"
                                       href='<c:url value='board_detail.do?post_no=${plist.post_no}'/>'>${plist.subject}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <td class="text-center">${plist.nickname}</td>
                        <td class="text-center">${plist.writedate}</td>
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
                                onclick="location.href='${pageContext.request.contextPath}/board_list.do?page=${pm.cri.page-1}&group_no=${group_no}'">
                            Previous
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- 이전 버튼 -->

            <!-- 페이지 버튼 -->
            <!-- 시작숫자 종료숫자 조건 -->
            <c:choose>
                <c:when test="${pm.endPage <= pm.displayPageNum}">
                    <c:set var="pageStartNumber" value="${pm.startPage}"/>
                    <c:set var="pageEndNumber" value="${pm.endPage}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="pageStartNumber" value="${(pm.cri.page / pm.displayPageNum) + 1}"/>
                    <c:choose>
                        <c:when test="${pm.endPage < ((pm.cri.page / pm.displayPageNum) + 10)}">
                            <c:set var="pageEndNumber" value="${pm.endPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="pageEndNumber" value="${((pm.cri.page / pm.displayPageNum) + 10)}"/>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>

            <c:forEach var="i" begin="${pageStartNumber}" end="${pageEndNumber}" varStatus="status">
                <c:choose>
                    <c:when test="${pm.cri.page != i}">
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-secondary text-white"
                                    onclick="location.href='${pageContext.request.contextPath}/board_list.do?page=${i}&group_no=${group_no}'">${i}</button>
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
                                onclick="location.href='${pageContext.request.contextPath}/board_list.do?page=${pm.cri.page+1}&group_no=${group_no}'">
                            Next
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

    <br>
    <div class="mb-5" style="text-align: center">
        <input type="button" onclick="location.href = 'board_write.do?group_no=${group_no}'"
               class="btn btn-primary rounded-pill btn-block shadow px-4 py-2" value="글쓰기">
    </div>
</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->

</body>
</html>
