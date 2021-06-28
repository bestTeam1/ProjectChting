<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        .redStyle {
            color: red;
        }
    </style>
</head>
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
                <input type="button" onclick="newGroup()" value="내 모임 만들러 가기"
                       class="btn btn-primary rounded-pill btn-block shadow px-4 py-2">

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
                            <a href="board_main.do?group_no=${i.group_no}"
                               class="recent-work card border-0 shadow-lg overflow-hidden">
                                <img class="recent-work-img card-img img-responsive"
                                <c:choose>
                                <c:when test="${empty i.group_img}">
                                     src="./assets/img/work-slide-05-small.jpg"
                                </c:when>
                                <c:otherwise>
                                     src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                </c:otherwise>
                                </c:choose>
                                     alt="Card image">
                                <div class="recent-work-vertical card-img-overlay d-flex">
                                    <c:if test="${i.group_no == adminGroup.group_no}">
                                        <i class="fas fa-crown"></i>
                                        <div style="margin-left : 270px" id="icon-${i.group_no}"></div>
                                    </c:if>
                                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                            <h3 class="card-title light-300">${i.group_name}</h3>
                                            <p class="card-text">
                                                <c:choose>
                                                <c:when test="${fn:length(i.content) gt 31}">
                                                    <c:out value="${fn:substring(i.content, 0, 30)}"/>....<br>
                                                <i class="fas fa-angle-double-right">read more</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="${i.content}"/>
                                                </c:otherwise>
                                                </c:choose>
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
            <p>회원님의 지역과 관심사에 맞는 모임</p>
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
                                    <c:choose>
                                        <c:when test="${fn:length(i.content) gt 30}">
                                            <c:out value="${fn:substring(i.content, 0, 29)}"/>....<br>
                                            <i class="fas fa-angle-double-right">read more</i>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${i.content}"/></p>
                                        </c:otherwise>
                                    </c:choose>
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
                                    <c:choose>
                                        <c:when test="${fn:length(i.content) gt 30}">
                                            <c:out value="${fn:substring(i.content, 0, 29)}"/>....<br>
                                            <i class="fas fa-angle-double-right">read more</i>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${i.content}"/></p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </section>
        <section class="bg-light pt-sm-0 py-3">
            <div class="container-fluid py-4">
                <h1 class="h2 semi-bold-600 text-center my-lg-5">Chting 이벤트! &#127881;</h1>

                <!-- Start slider -->
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <ol class="carousel-indicators">
                        <c:forEach varStatus="status" items="${eventList}">
                            <c:choose>
                                <c:when test="${status.index eq 0}">
                                    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                        class="active"></li>
                                </c:when>
                                <c:otherwise>
                                    <li data-bs-target="#carouselExampleIndicators"
                                        data-bs-slide-to="${status.index}"></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ol>
                    <div class="carousel-inner">
                        <c:forEach var="i" varStatus="status" items="${eventList}">
                        <c:choose>
                        <c:when test="${status.index eq 0}">
                        <div class="carousel-item active">
                            </c:when>
                            <c:otherwise>
                            <div class="carousel-item">
                                </c:otherwise>
                                </c:choose>
                                <!-- Start Pricing Horizontal -->
                                <div class="pricing-horizontal row col-10 m-auto d-flex shadow-sm rounded overflow-hidden bg-white">
                                    <div class="pricing-horizontal-icon col-md-12 text-center bg-secondary text-light py-4">
                                        <i class="display-1 bx bx-package pt-4"></i>
                                        <h5 class="h5 semi-bold-600 pb-4 light-300">${i.subject}</h5>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <h1 class="carousel-control-prev h1 text-primary text-decoration-none"
                                href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                                <i class='bx bx-lg bx-chevron-left px-5'></i>
                                <span class="visually-hidden">Previous</span>
                            </h1>
                            <h1 class="carousel-control-next h1 text-primary text-decoration-none"
                                href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                                <i class='bx bx-lg bx-chevron-right'></i>
                                <span class="visually-hidden">Next</span>
                            </h1>
                        </div>
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
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
    //모임 가입 전체 개수
    var length = ${length};
    //모임장으로 있는 모임 번호
    var adminGroupNo = "${adminGroup.group_no}";


    var html = '<div class="col-md-4 mb-3">'
        + '<a href="${pageContext.request.contextPath}/search.do?category=&search=" class="recent-work card border-0 shadow-lg overflow-hidden">'
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
    });

    $.ajax({
        url: "side/groupList/" + "${sessionScope.get("userData").userid}",
        data: {},
        dataType: "json",
        type: "get",
        success: function (response) {
            response.forEach(group => {
                var sock = new SockJS('http://localhost:8090/chting_war_exploded/chatting?group_no=' + group.group_no);
                sock.onmessage = onMessage;
                sock.onclose = onClose;
                sock.onopen = onOpen;

                function onMessage(msg) {
                    var data = msg.data;
                    var json = JSON.parse(data);
                    let sessionId = json.userid;
                    let group_no = json.group_no;
                    console.log(sessionId);
                    console.log(group_no);
                    if ($('#icon-' + group_no).html() == "" && group.group_no == group_no) {
                        $('#icon-' + group_no).append("<img src='./upload/chting/chatting_alarm.png'>");
                    }
                }

                function onClose(evt) {

                }

                function onOpen(evt) {

                }

                function sendMessage() {

                }
            })
        },
        error: function (htx, status, error) {
            console.log(htx + "," + status + "," + error);
        }
    });

    function newGroup() {
        console.log(adminGroupNo);
        console.log(length);

        if(adminGroupNo != "") { //모임장인 모임이 있다면
            location.href="groupMake.do"; //groupMake.do에서 체크해서 에러페이지 이동
        }else { //모임장인 모임이 없다면
            if(length >= 3) { //모임 가입 개수 체크
                Swal.fire({
                    title : "모임 가입 개수는 3개로 제한됩니다.",
                    text : "가입한 모임 탈퇴 후 새로운 모임을 만들 수 있습니다.",
                    confirmButtonText: '마이페이지로 이동',
                    confirmButtonColor: '#A0A0FF',
                    showCancelButton: true,
                    cancelButtonText: '취소',
                    cancelButtonColor: '#aaaaaa'
                }).then((result) => {
                    if(result.isConfirmed) {
                        location.href="myPage.do";
                    }
                })
            }else {
                location.href="groupMake.do";
            }
        }
    };

</script>

</html>
