<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- Close Header / <head> -->
<!-- Start Banner Hero -->
<div class="banner-wrapper bg-light">
    <div id="index_banner" class="banner-vertical-center-index container-fluid pt-5 my-lg-3">
        <div id="main_inner">
            <div id="main_item" class="my-lg-5">
                <div class="py-5 row d-flex align-items-center">
                    <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left py-5 pb-5">
                        <h1 class="banner-heading h1 text-secondary display-3 mb-0 pb-5 mx-0 px-0 light-300 typo-space-line">
                            다양한 취미로
                            <br>새로운 사람들과
                            <br><strong>Chting</strong> 에서 만나보세요!
                        </h1>
                        <br>
                        <p class="banner-body text-muted py-3 mx-0 px-0">
                            취미 + Meeting = Chting
                            <br>관심사에 맞는 모임을 찾고, 새로운 사람들과 만나보세요!<br>
                            <br>모임 멤버들만의 공간에서
                            <br>모임 일정을 통해 만남을 만들 수 있고,
                            <br>모임 채팅방을 통해 개인 정보 없이 활동하실 수 있습니다. :)
                        </p>
                        <br>
                        <a class="banner-button btn rounded-pill btn-outline-primary btn-lg px-4" href="${pageContext.request.contextPath}/login" role="button">Chting 시작하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Banner Hero -->

<!-- Start Pricing Horizontal Section -->
<section class="bg-light pt-sm-0 py-3">
    <div class="container-fluid py-4">
        <h1 class="h2 semi-bold-600 text-center my-lg-5">Chting 이벤트! &#127881;</h1>

        <!-- Start slider -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <c:forEach varStatus="status" items="${eventList}">
                    <c:choose>
                        <c:when test="${status.index eq 0}">
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                        </c:when>
                        <c:otherwise>
                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}"></li>
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
            <h1 class="carousel-control-prev h1 text-primary text-decoration-none" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                <i class='bx bx-lg bx-chevron-left px-5'></i>
                <span class="visually-hidden">Previous</span>
            </h1>
            <h1 class="carousel-control-next h1 text-primary text-decoration-none" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                <i class='bx bx-lg bx-chevron-right'></i>
                <span class="visually-hidden">Next</span>
            </h1>
        </div>
    </div>
</section>

<!-- Start Choice -->
<section class="why-us banner-bg bg-light py-lg-3 my-xxl-5">
    <div class="container my-4">
        <div class="row">
            <div class="banner-img col-lg-5">
                <img src="./assets/img/hero_right.png" class="img" style="height: 526px;" alt="">
            </div>
            <div class="banner-content col-lg-7 mt-3 align-self-end">
                <h2 class="h2 mt-5" style="text-shadow: 2px 2px 4px gray">Chting! 다양한 취미, 새로운 사람들</h2>
                <p class="text-muted pb-4 light-300">
                <h3 style="color: #6266ea">당신의 취미를 공유해보세요.</h3>
                <strong style="color: #acabfe">나의 취미를, 당신의 취미를</strong>
                <p><strong>모임장</strong>이 되어서 당신의 취미를 공유하고 한층 더 즐거운 당신의 취미를 즐기세요<br>
                    <strong>모임원</strong>이 되어서 다른사람들의 취미를 함께 배워보면서 소통해보아요</p>

                </p>
            </div>
        </div>
    </div>
</section>
<!-- End Choice -->

<!-- Start Aim -->
<section class="banner-bg bg-white py-5">
    <div class="container my-4">
        <div class="row text-center">

            <div class="objective col-lg-4">
                <div class="objective-icon card m-auto py-4 mb-2 mb-sm-4 bg-secondary shadow-lg">
                    <i class="far fa-handshake text-light fa-4x"></i>
                </div>
                <h2 class="objective-heading h3 mb-2 mb-sm-4 light-300">우리 함께!</h2>
                <p class="light-300">
                    친구, 가족, 동료 등 함께 하 싶은 사람과<br>
                    우리만의 공간을 만들어요.
                </p>
            </div>

            <div class="objective col-lg-4 mt-sm-0 mt-4">
                <div class="objective-icon card m-auto py-4 mb-2 mb-sm-4 bg-secondary shadow-lg">
                    <i class="fas fa-users text-light fa-4x"></i>
                </div>
                <h2 class="objective-heading h3 mb-2 mb-sm-4 light-300">우리 모임!</h2>
                <p class="light-300">
                    일정으로 모임장소를 정하고, 게시판과 채팅으로<br>
                    다양한 이야기들도 공유해요.
                </p>
            </div>

            <div class="objective col-lg-4 mt-sm-0 mt-4">
                <div class="objective-icon card m-auto py-4 mb-2 mb-sm-4 bg-secondary shadow-lg">
                    <i class="display-4 bx bxs-select-multiple text-light"></i>
                </div>
                <h2 class="objective-heading h3 mb-2 mb-sm-4 light-300">우리 목표!</h2>
                <p class="light-300">
                    지루하고 뻔한 일상에서, 새롭고 낯선 사람들과<br>
                    좋은 추억과 알찬 시간을 보내요.
                </p>
            </div>

        </div>
    </div>
</section>
<!-- End Aim -->

<!-- Start Feature Work -->
<section class="bg-light py-5">
    <div class="feature-work container my-4">
        <div class="row d-flex d-flex align-items-center">
            <div class="col-lg-5">
                <h3 class="feature-work-title h4 text-muted light-300">함께 만나 취미를 공유해요</h3>
                <h1 class="feature-work-heading h2 py-3 semi-bold-600">Chting = 취미 + Meeting</h1>
                <p class="feature-work-body text-muted light-300">
                    자신이 <strong>모임장</strong>이 되어서 취미를 공유하고<br>
                    모임 일정을 통해 즐거운 만남과, 모임 게시판, 모임 채팅을 활용하여<br>
                    다양한 이야기와 자신의 취미를 이야기해보세요.
                </p>
                <p class="feature-work-footer text-muted light-300">
                    취미가 없고 지루한 일상이 더이상 싫다면 <strong>모임원</strong>이 되어서<br>
                    다른 사람들의 취미를 배우고, 흥미를 붙여서 지루한 일상을 모임원들과 함꼐<br>
                    날리도록 하세요.
                </p>
            </div>

            <div class="col-lg-6 offset-lg-1 mb-lg-5 align-left">
                <div class="row">
                    <a class="col" data-type="image" data-fslightbox="gallery">
                        <img class="img-fluid" src="https://cdn.notefolio.net/img/c1/0a/c10a946a80c5f3107b6f8b51ee4d7bb5a21b2daf1ac66e3764b5aef8a2197498_v1.jpg">
                    </a>
                    <a class="col" data-type="image" data-fslightbox="gallery">
                        <img class="img-fluid" src="https://cdn.notefolio.net/img/b8/6a/b86a75339b92f85854dc6afcad80dc79289f3a8e58caf8ea73de7a2ab7b862b5_v1.jpg">
                    </a>
                </div>
                <div class="row pt-4">
                    <a class="col" data-type="image" data-fslightbox="gallery">
                        <img class="img-fluid" src="https://cdn.notefolio.net/img/ba/8c/ba8c11b761d1852ba89fc14a2109454cee52ae7f8612ac7935788f6585a20511_v1.jpg">
                    </a>
                    <a class="col" data-type="image" data-fslightbox="gallery">
                        <img class="img-fluid" src="https://cdn.notefolio.net/img/6c/97/6c97a0c6dd8da0cef7cf1ef605bbf2c4a9722f65f39bbf31bb571d33ee29f9bc_v1.jpg">
                    </a>
                </div>
            </div>
            <!-- 공유하기 -->
            <div class="col-lg-8 col-12 m-lg-auto text-center">
                <input type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 mt-lg-5" id="shareBtn" value="Chting 공유하기">
            </div>
        </div>
    </div>
</section>
<!-- End Feature Work -->

<!-- Start Service -->
<section class="service-wrapper py-3">
    <div class="container-fluid pb-3">
        <div class="row">
            <h2 class="h2 text-center col-12 py-5 semi-bold-600">Chting 모임</h2>
            <div class="service-header col-2 col-lg-3 text-end light-300">
                <i class='bx bx-gift h3 mt-1'></i>
            </div>
            <div class="service-heading col-10 col-lg-9 text-start float-end light-300">
                <h2 class="h3 pb-4 typo-space-line">Chting에는 다양한 모임들이 준비되어 있습니다</h2>
            </div>
        </div>
        <p class="service-footer col-10 offset-2 col-lg-9 offset-lg-3 text-start pb-3 text-muted px-2">
            주로 활동하는 지역과 취미활동을 찾아보세요! <br>Chting에서 자기와 맞는 모임에서 좋은 취미와, 사람들을 만나보세요!
        </p>
    </div>

    <div class="service-tag py-5 bg-secondary">
        <div class="col-md-12">
            <ul class="nav d-flex justify-content-center">
                <li class="nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary active shadow rounded-pill text-light px-4 light-300" href="#" data-filter=".project">ALL</a>
                </li>
                <li class="filter-btn nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="#" data-filter=".new">New</a>
                </li>
                <li class="filter-btn nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="#" data-filter=".best">Best</a>
                </li>
            </ul>
        </div>
    </div>
</section>

<section class="container overflow-hidden py-5">
    <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">
        <c:forEach var="i" items="${bestGroupList}">
            <div class="col-xl-3 col-md-4 col-sm-6 all best project">
                <a href="board_main.do?group_no=${i.group_no}" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                    <img class="service card-img" src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}" alt="Card image">
                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="service-work-content text-left text-light">
                            <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> ${i.area_name} | ${i.catename} </span>
                            <p class="card-text">${i.group_name}<br><hr>${i.content}
                            </p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
        <c:forEach var="i" items="${newGroupList}">
            <div class="col-xl-3 col-md-4 col-sm-6 all new project">
                <a href="board_main.do?group_no=${i.group_no}" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                    <img class="service card-img" src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}" alt="Card image">
                    <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="service-work-content text-left text-light">
                            <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> ${i.area_name} | ${i.catename} </span>
                            <p class="card-text">${i.group_name}<br><hr>${i.content}
                            </p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</section>
<!-- End Service -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- End Footer / Script -->
</body>

</html>
