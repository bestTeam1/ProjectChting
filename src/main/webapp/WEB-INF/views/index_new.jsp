<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/18
  Time: 4:32 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header_new.jsp" />
<!-- Close Header / <head> -->
<h1>${newGroupList}</h1>
<!-- Start Banner Hero -->
<div class="banner-wrapper bg-light">
    <div id="index_banner" class="banner-vertical-center-index container-fluid pt-5">
        <div id="main_inner">
            <div id="main_item">
                <div class="py-5 row d-flex align-items-center">
                    <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left py-5 pb-5">
                        <h1 class="banner-heading h1 text-secondary display-3 mb-0 pb-5 mx-0 px-0 light-300 typo-space-line">
                            다양한 취미로
                            <br>새로운 사람들과
                            <br><strong>Chting</strong> 에서 만나보세요!
                        </h1>
                        <p class="banner-body text-muted py-3 mx-0 px-0">
                            취미 + Meeting = Chting
                            <br>관심사에 맞는 모임을 찾고, 새로운 사람들과 만나보세요!<br>
                            <br>모임 멤버들만의 공간에서
                            <br>모임 일정을 통해 만남을 만들 수 있고,
                            <br>모임 채팅방을 통해 개인 정보 없이 활동하실 수 있습니다. :)
                        </p>
                        <br>
                        <a class="banner-button btn rounded-pill btn-outline-primary btn-lg px-4" href="#" role="button">Chting 시작하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Banner Hero -->



<!-- Start Service -->
<section class="service-wrapper py-3">
    <div class="container-fluid pb-3">
        <div class="row">
            <h2 class="h2 text-center col-12 py-5 semi-bold-600">Services</h2>
            <div class="service-header col-2 col-lg-3 text-end light-300">
                <i class='bx bx-gift h3 mt-1'></i>
            </div>
            <div class="service-heading col-10 col-lg-9 text-start float-end light-300">
                <h2 class="h3 pb-4 typo-space-line">Make Success for future</h2>
            </div>
        </div>
        <p class="service-footer col-10 offset-2 col-lg-9 offset-lg-3 text-start pb-3 text-muted px-2">
            You are free to use this template for your commercial or business websites. You are not allowed to re-distribute this template ZIP file on any template collection websites. It is too easy to illegally copy and repost this template.
        </p>
    </div>

    <div class="service-tag py-5 bg-secondary">
        <div class="col-md-12">
            <ul class="nav d-flex justify-content-center">
                <li class="nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary active shadow rounded-pill text-light px-4 light-300" href="#" data-filter=".project">All</a>
                </li>
                <li class="nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="#" data-filter=".graphic">Graphics</a>
                </li>
                <li class="filter-btn nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="#" data-filter=".ui">UI/UX</a>
                </li>
                <li class="nav-item mx-lg-4">
                    <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300" href="#" data-filter=".branding">Branding</a>
                </li>
            </ul>
        </div>
    </div>

</section>

<section class="container overflow-hidden py-5">
    <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project ui branding">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="service card-img" src="./assets/img/400400.png" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> 경기 / 반려동물 </span>
                        <p class="card-text">반려동물을사랑하는사람들의모임</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/testgif.gif" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Social Media</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project branding">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-03.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Marketing</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-04.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Graphic</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-05.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Digtal Marketing</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project branding">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-06.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Market Research</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project branding">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-07.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Business</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project ui graphic branding">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-08.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">Branding</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

    </div>
</section>
<!-- End Service -->


<!-- Start View Work -->
<section class="bg-secondary">
    <div class="container py-5">
        <div class="row d-flex justify-content-center text-center">
            <div class="col-lg-2 col-12 text-light align-items-center">
                <i class='display-1 bx bxs-box bx-lg'></i>
            </div>
            <div class="col-lg-7 col-12 text-light pt-2">
                <h3 class="h4 light-300">Great transformations successful</h3>
                <p class="light-300">Quis ipsum suspendisse ultrices gravida.</p>
            </div>
            <div class="col-lg-3 col-12 pt-4">
                <a href="#" class="btn btn-primary rounded-pill btn-block shadow px-4 py-2">View Our Work</a>
            </div>
        </div>
    </div>
</section>
<!-- End View Work -->

<!-- Start Recent Work -->
<section class="py-5 mb-5">
    <div class="container">
        <div class="recent-work-header row text-center pb-5">
            <h2 class="col-md-6 m-auto h2 semi-bold-600 py-5">Recent Works</h2>
        </div>
        <div class="row gy-5 g-lg-5 mb-4">

            <!-- Start Recent Work -->
            <div class="col-md-4 mb-3">
                <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                    <img class="recent-work-img card-img" src="./assets/img/recent-work-01.jpg" alt="Card image">
                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            <h3 class="card-title light-300">Social Media</h3>
                            <p class="card-text">Ullamco laboris nisi ut aliquip ex</p>
                        </div>
                    </div>
                </a>
            </div><!-- End Recent Work -->

            <!-- Start Recent Work -->
            <div class="col-md-4 mb-3">
                <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                    <img class="recent-work-img card-img" src="./assets/img/recent-work-02.jpg" alt="Card image">
                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            <h3 class="card-title light-300">Web Marketing</h3>
                            <p class="card-text">Psum officia anim id est laborum.</p>
                        </div>
                    </div>
                </a>
            </div><!-- End Recent Work -->

            <!-- Start Recent Work -->
            <div class="col-md-4 mb-3">
                <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                    <img class="recent-work-img card-img" src="./assets/img/recent-work-03.jpg" alt="Card image">
                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            <h3 class="card-title light-300">R & D</h3>
                            <p class="card-text">Sum dolor sit consencutur</p>
                        </div>
                    </div>
                </a>
            </div><!-- End Recent Work -->

            <!-- Start Recent Work -->
            <div class="col-md-4 mb-3">
                <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                    <img class="recent-work-img card-img" src="./assets/img/recent-work-04.jpg" alt="Card image">
                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            <h3 class="card-title light-300">Public Relation</h3>
                            <p class="card-text">Lorem ipsum dolor sit amet</p>
                        </div>
                    </div>
                </a>
            </div><!-- End Recent Work -->

            <!-- Start Recent Work -->
            <div class="col-md-4 mb-3">
                <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                    <img class="recent-work-img card-img" src="./assets/img/recent-work-05.jpg" alt="Card image">
                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            <h3 class="card-title light-300">Branding</h3>
                            <p class="card-text">Put enim ad minim veniam</p>
                        </div>
                    </div>
                </a>
            </div><!-- End Recent Work -->

            <!-- Start Recent Work -->
            <div class="col-md-4 mb-3">
                <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                    <img class="recent-work-img card-img" src="./assets/img/recent-work-06.jpg" alt="Card image">
                    <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                        <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            <h3 class="card-title light-300">Creative Design</h3>
                            <p class="card-text">Mollit anim id est laborum.</p>
                        </div>
                    </div>
                </a>
            </div><!-- End Recent Work -->

        </div>
    </div>
</section>
<!-- End Recent Work -->

<!-- Start Feature Work -->
<section class="bg-light py-5">
    <div class="feature-work container my-4">
        <div class="row d-flex d-flex align-items-center">
            <div class="col-lg-5">
                <h3 class="feature-work-title h4 text-muted light-300">Featured Work</h3>
                <h1 class="feature-work-heading h2 py-3 semi-bold-600">Transform with us</h1>
                <p class="feature-work-body text-muted light-300">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse
                    ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.
                </p>
                <p class="feature-work-footer text-muted light-300">Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur.</p>
            </div>
            <div class="col-lg-6 offset-lg-1 align-left">
                <div class="row">
                    <a class="col" data-type="image" data-fslightbox="gallery" href="./assets/img/feature-work-1-large.jpg">
                        <img class="img-fluid" src="./assets/img/feature-work-1.jpg">
                    </a>
                    <a class="col" data-type="image" data-fslightbox="gallery" href="./assets/img/feature-work-2-large.jpg">
                        <img class="img-fluid" src="./assets/img/feature-work-2.jpg">
                    </a>
                </div>
                <div class="row pt-4">
                    <a class="col" data-type="image" data-fslightbox="gallery" href="./assets/img/feature-work-3-large.jpg">
                        <img class="img-fluid" src="./assets/img/feature-work-3.jpg">
                    </a>
                    <a class="col" data-type="image" data-fslightbox="gallery" href="./assets/img/feature-work-4-large.jpg">
                        <img class="img-fluid" src="./assets/img/feature-work-4.jpg">
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Feature Work -->


<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer_new.jsp" />
<!-- End Footer / Script -->

</body>

</html>
