<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->

<!-- Start Banner Hero -->
<section class="bg-light">
    <div class="container py-4">
        <div class="row align-items-center justify-content-between">
            <div class="contact-header col-lg-4">
                <h1 class="h2 pb-3 text-primary">Chting</h1>
                <h3 class="h4 regular-400">다양한 모임들을 둘러보고 가입하세요 !</h3>
                <p class="light-300">
                    마음에 드는 모임이 없다면 모임을 만들어보세요 :)
                </p>
            </div>
            <div class="col-lg-3 col-12 pt-4">
                <a href="groupMake.do" class="btn btn-primary rounded-pill btn-block shadow px-4 py-2">내 모임 만들러 가기</a>
            </div>
        </div>
    </div>
</section>
<!-- End Banner Hero -->
<section class="py-5 mb-5">
    <div class="container">
        <%-- 가입한 모임 --%>
        <div class="row gy-5 g-lg-5 mb-4" id="joinGroupContainer">
            <h4 class="h4 typo-space-line"><i class="bx bx-user-check"></i>&nbsp;가입한 모임</h4>
            <c:forEach var="i" items="${groupListAll}">
                <c:choose>
                    <c:when test="${not empty i.group_name}">
                        <div class="col-md-4 mb-3">
                            <a href="board_main.do?group_no=${i.group_no}" class="recent-work card border-0 shadow-lg overflow-hidden">
                                <img class="recent-work-img card-img img-responsive"
                                <c:choose>
                                <c:when test="${empty i.group_img}">
                                     src="./assets/img/recent-work-03.jpg"
                                </c:when>
                                <c:otherwise>
                                     src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                </c:otherwise>
                                </c:choose>
                                     alt="Card image">
                                <div class="recent-work-vertical card-img-overlay d-flex">
                                    <c:if test="${i.group_no == adminGroup.group_no}">
                                        <i class="fas fa-crown"></i>
                                    </c:if>
                                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                            <h3 class="card-title light-300">${i.group_name}</h3>
                                            <p class="card-text">${i.content}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
        <div class="col-lg-3">
            <h4 class="h4 py-5 typo-space-line"><i class="bx bxs-group"></i>&nbsp;추천 모임</h4>
        </div>
        <div class="service-tag py-5 bg-secondary">
            <div class="col-md-12">
                <ul class="nav d-flex justify-content-center">
                    <li class="nav-item mx-lg-4">
                        <a class="filter-btn nav-link btn-outline-primary active shadow rounded-pill text-light px-4 light-300"
                           href="#" data-filter=".project">ALL</a>
                    </li>
                    <li class="filter-btn nav-item mx-lg-4">
                        <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
                           href="#" data-filter=".new">New</a>
                    </li>
                    <li class="filter-btn nav-item mx-lg-4">
                        <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
                           href="#" data-filter=".best">Best</a>
                    </li>
                </ul>
            </div>
        </div>

        <section class="container overflow-hidden py-5">
            <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">

                <c:forEach var="i" items="${bestGroupList}">
                    <div class="col-xl-3 col-md-4 col-sm-6 all best project">
                        <a href="board_main.do?group_no=${i.group_no}"
                           class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                            <img class="service card-img"
                                 src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                 alt="Card image">
                            <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                                <div class="service-work-content text-left text-light">
                                    <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> ${i.area_name} | ${i.catename} </span>
                                    <p class="card-text">${i.group_name}<br>
                                    <hr>
                                        ${i.content}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <c:forEach var="i" items="${newGroupList}">
                    <div class="col-xl-3 col-md-4 col-sm-6 all new project">
                        <a href="board_main.do?group_no=${i.group_no}"
                           class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                            <img class="service card-img"
                                 src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                 alt="Card image">
                            <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                                <div class="service-work-content text-left text-light">
                                    <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> ${i.area_name} | ${i.catename} </span>
                                    <p class="card-text">${i.group_name}<br>
                                    <hr>
                                        ${i.content}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </section>
        <!-- End Service -->
    </div>
</section>
<!-- End Recent Work -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
<script>
    var length = ${length};
    var html = '<div class="col-md-4 mb-3">'
        + '<a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">'
        + '<img class="recent-work-img card-img" src="./assets/img/recent-work-02.jpg" alt="Card image">'
        + '<div class="recent-work-vertical card-img-overlay d-flex align-items-end">'
        + '<div class="recent-work-content text-start mb-3 ml-3 text-dark">'
        + '<h3 class="card-title light-300">모임에 가입해 보세요 !</h3>'
        + '<p class="card-text">모임은 3개까지 가입 가능합니다.</p></div></div></a></div>';

    $(function () {
        if (length == 2) {
            $('#joinGroupContainer').append(
                html
            );
        } else if (length == 1) {
            $('#joinGroupContainer').append(
                html + html
            );
        } else if (length == 0) {
            $('#joinGroupContainer').append(
                html + html + html
            );
        }
    })

</script>

</html>
