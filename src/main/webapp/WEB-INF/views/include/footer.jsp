<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    @font-face {
        font-family: 'nanum';
        src: url("${pageContext.request.contextPath}/assets/fonts/NanumbarunGothic.otf")format('opentype');
    }
</style>
<!-- Start Footer -->
<footer class="bg-secondary pt-4">
    <div class="container">
        <div class="row py-4">

            <div class="col-lg-3 col-12 align-left">
                <a class="navbar-brand" href="index.html">
                    <p class="text-light h3 text-wrap">Chting</p>
                </a>
                <p class="text-light my-lg-4 my-2">

                </p>
                <ul class="list-inline footer-icons light-300">
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="http://facebook.com/">
                            <i class='bx bxl-facebook-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.linkedin.com/">
                            <i class='bx bxl-linkedin-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.whatsapp.com/">
                            <i class='bx bxl-whatsapp-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.flickr.com/">
                            <i class='bx bxl-flickr-square bx-md'></i>
                        </a>
                    </li>
                    <li class="list-inline-item m-0">
                        <a class="text-light" target="_blank" href="https://www.medium.com/">
                            <i class='bx bxl-medium-square bx-md'></i>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                <h2 class="h4 pb-lg-3 text-light light-300">Our Company</h2>
                <ul class="list-unstyled text-light light-300">
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light"
                                                                           href="index.do">Home</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1"
                                                                           href="team.do">Team</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1"
                                                                           href="search.do?category=&search=">Contact</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                <h2 class="h4 pb-lg-3 text-light light-300">Our Works</h2>
                <ul class="list-unstyled text-light light-300">
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1"
                                                                           href="#">개인정보처리방침</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1"
                                                                           href="#">이메일무단수집거부</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bxs-chevron-right bx-xs'></i><a class="text-decoration-none text-light py-1"
                                                                           href="#">책임의 한계와 법적고지</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                <h2 class="h4 pb-lg-3 text-light light-300">For Client</h2>
                <ul class="list-unstyled text-light light-300">
                    <li class="pb-2">
                        <i class='fa fa-github fa-xs'></i> <a class="text-decoration-none text-light py-1"
                                                                      href="https://github.com/bestTeam1/ProjectChting">github/bestTeam1/ProjectChting</a>
                    </li>
                    <li class="pb-2">
                        <i class='bx-fw bx bx-mail-send bx-xs'></i><a class="text-decoration-none text-light py-1"
                                                                      href="mailto:info@company.com">team1bit196@gmail.com</a>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <div class="w-100 bg-primary py-3">
        <div class="container">
            <div class="row pt-2">
                <div class="col-lg-6 col-sm-12">
                    <p class="text-lg-start text-center text-light light-300">
                        © Copyright 2021 Chting. All Rights Reserved.
                    </p>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <p class="text-lg-end text-center text-light light-300">
                        조선제1조 <a rel="sponsored" class="text-decoration-none text-light"
                                       href="index.do" target="_blank"><strong></strong></a>
                    </p>
                </div>
            </div>
        </div>
    </div>


</footer>
<!-- End Footer -->

<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<!-- Load jQuery require for isotope -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!-- Isotope -->
<script src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.js"></script>
<!-- Templatemo -->
<script src="${pageContext.request.contextPath}/assets/js/templatemo.js"></script>
<!-- Custom -->
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<!-- Select2 JS -->
<script src="${pageContext.request.contextPath}/assets/js/select2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script>
<!-- underscore.js -->
<script src="https://cdn.jsdelivr.net/npm/underscore@1.13.1/underscore-umd-min.js"></script>
<%--  Sweet Alert2  --%>
<script src="${pageContext.request.contextPath}/assets/js/sweetalert2.js"></script>
<%--  Font awesome  --%>
<script src="https://kit.fontawesome.com/c5fd5902bb.js" crossorigin="anonymous"></script>

<!-- Page Script -->
<script>
    //window.load
    $(function () {
        $('#searchSelect').niceSelect();
        // init Isotope
        var $projects = $('.projects').isotope({
            itemSelector: '.project',
            layoutMode: 'fitRows'
        });
        $(".filter-btn").click(function () {
            var data_filter = $(this).attr("data-filter");
            $projects.isotope({
                filter: data_filter
            });
            $(".filter-btn").removeClass("active");
            $(".filter-btn").removeClass("shadow");
            $(this).addClass("active");
            $(this).addClass("shadow");
            return false;
        });

    });
</script>
