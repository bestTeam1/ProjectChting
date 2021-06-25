<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/19
  Time: 4:44 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->

<!-- Start Banner Hero -->
<div id="work_banner" class="banner-wrapper bg-light w-100 py-0">
    <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
        <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
            <h1 class="banner-heading h2 display-3 pb-1 semi-bold-600">Search</h1>
            <c:choose>
                <c:when test="${not empty search_keyword}">
                    <c:choose>
                        <c:when test="${not empty search_category}">
                            <h3 class="h4 pb-0 regular-400">"${search_category}"지역의 "${search_keyword}"검색 결과 입니다.</h3>
                        </c:when>
                        <c:otherwise>
                            <h3 class="h4 pb-0 regular-400">"전체"지역의 "${search_keyword}"검색 결과 입니다.</h3>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${not empty search_category}">
                            <h3 class="h4 pb-0 regular-400">"${search_category}"지역의 "전체"검색 결과 입니다.</h3>
                        </c:when>
                        <c:otherwise>
                            <h3 class="h4 pb-0 regular-400">"전체"지역의 "전체"검색 결과 입니다.</h3>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!-- End Banner Hero -->

<!-- Start Our Work -->
<section class="container py-5">
    <br>
    <div class="row projects gx-lg-5" id="resultList" style="min-height: min-content;">
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
<!-- End Our Work -->


<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
<script type="text/javascript">
    var groupURL = 'http://localhost:8090/chting_war_exploded/board_main.do?group_no=';
    $(function () {
        let resultData = '${search_result}';
        let resultList = JSON.parse(resultData);
        console.log(resultList);

        resultList.forEach(result => {
            let groupimg = "${pageContext.request.contextPath}" + "/upload/groupimg/" + result.groupimg;
            $.ajax({
                url : groupimg,
                async : false,
                success : function(){
                    print(result, groupimg);
                },
                error : function(){
                    groupimg = 'https://wiki.dave.eu/images/4/47/Placeholder.png';
                    print(result, groupimg);
                }
            });
        });

        if(resultList.length > 3) {
            $('#resultList').css({
                "min-height": "1200px"
            });
        } else if(resultList.length < 4 && resultList.length != 0) {
            $('#resultList').css({
                "min-height": "600px"
            });
        } else {
            $('#resultList').css({
                "min-height": "600px"
            });
            let templat = `<div class="banner-heading h3 m-lg-auto text-center">` + `<p style="font-size: 300%">&#128546;</p>` + "검색 결과가 없습니다." + `</div>`
            $('#resultList').append(templat);
        }

    });

    function print(result, groupimg) {
        var groupURL = 'http://localhost:8090/chting_war_exploded/board_main.do?group_no=';
        var placeholderContent = '소개글이 없습니다.';

        if (result.content == null) {
            result.content = placeholderContent;
        }
        let template = `<a href="` + groupURL + result.group_no + `" class="col-sm-6 col-lg-4 text-decoration-none project">
            <div class="service-work overflow-hidden card mx-5 mx-sm-0 mb-5">
                <img class="card-img-top" src="` + groupimg + `" alt="...">
                <div class="card-body">
                    <h5 class="card-title light-300 text-dark">` + result.group_name + `</h5>
                    <p class="card-text light-300 text-dark">` + result.content + `</p>
                    <span class="text-decoration-none text-primary light-300">
                              구경하기 <i class='bx bxs-hand-right ms-1'></i>
                          </span>
                </div>
            </div>
        </a>`
        $('#resultList').append(template);
    }

</script>
</html>