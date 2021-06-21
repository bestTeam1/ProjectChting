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


<!-- Start Recent Work -->
<section class="py-5 mb-5">
    <div class="container">
        <div class="recent-work-header row text-center pb-5">
            <h2 class="col-md-6 m-auto h2 semi-bold-600 py-5">내 모임</h2>
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
                <img class="service card-img" src="./assets/img/services-01.jpg" alt="Card image">
                <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                    <div class="service-work-content text-left text-light">
                        <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300">UI/UX design</span>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing</p>
                    </div>
                </div>
            </a>
        </div><!-- End Recent Work -->

        <!-- Start Recent Work -->
        <div class="col-xl-3 col-md-4 col-sm-6 project ui graphic">
            <a href="#" class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                <img class="card-img" src="./assets/img/services-02.jpg" alt="Card image">
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

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer_new.jsp" />
<!-- End Footer / Script -->

</body>

</html>
