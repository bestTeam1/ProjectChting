<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/28
  Time: 6:54 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->


    <!-- Start Banner Hero -->
    <section class="bg-light w-100">
        <div class="container">
            <div class="row d-flex align-items-center py-3">
                <div class="col-lg-6 text-start">
                    <h1 class="h2 py-5 text-primary typo-space-line">소개 합니다!</h1>
                    <p class="light-300">
                        저희 Chting사이트는 서로의 <a rel="nofollow" target="_blank">취미를 공유하고 만남을 가지며</a><br>
                        지루한 일상속에서 뜻깊은 생활을 보내는 사이트입니다.
                    </p>
                </div>
                <div class="col-lg-6">
                    <img src="./assets/img/banner-img-02.svg">
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Hero -->

    <!-- Start Team Member -->
    <section class="container py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-8">
                <h2 class="h2 py-5 typo-space-line">팀 소개</h2>
                <p class="text-muted light-300">
                    저희 팀을 소개합니다.
                </p>
            </div>
        </div>

        <div class="pt-5 pb-3 d-lg-flex justify-content-lg-center gx-5">
            <div class="row col-lg-10">
                <div class="team-member col-md-4">
                    <img class="team-member-img img-fluid rounded-circle p-4" src="./assets/img/team-01.jpg"
                         alt="Card image">
                    <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <li><strong>김수연</strong></li>
                        <i class="fas fa-quote-left"></i> 자신을 소개해주세요 <i class="fas fa-quote-right"></i>
                    </ul>
                    <div class="creative-progress col-md-auto pt-5 px-3">
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Development</h4>
                            </div>
                            <div class="col-6 text-right">66%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Design</h4>
                            </div>
                            <div class="col-6 text-right">90%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Marketing</h4>
                            </div>
                            <div class="col-6 text-right">74%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="team-member col-md-4">
                    <img class="team-member-img img-fluid rounded-circle p-4" src="./assets/img/team-02.jpg"
                         alt="Card image">
                    <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <li><strong>박주현</strong></li>
                        <i class="fas fa-quote-left"></i> 자신을 소개해주세요 <i class="fas fa-quote-right"></i>
                    </ul>
                    <div class="creative-progress col-md-auto pt-5 px-3">
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Development</h4>
                            </div>
                            <div class="col-6 text-right">66%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Design</h4>
                            </div>
                            <div class="col-6 text-right">90%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Marketing</h4>
                            </div>
                            <div class="col-6 text-right">74%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="team-member col-md-4">
                    <img class="team-member-img img-fluid rounded-circle p-4" src="./assets/img/team-03.jpg"
                         alt="Card image">
                    <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <li><strong>이승준</strong></li>
                        <i class="fas fa-quote-left"></i> 자신을 소개해주세요 <i class="fas fa-quote-right"></i>
                    </ul>
                    <div class="creative-progress col-md-auto pt-5 px-3">
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Development</h4>
                            </div>
                            <div class="col-6 text-right">66%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Design</h4>
                            </div>
                            <div class="col-6 text-right">90%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Marketing</h4>
                            </div>
                            <div class="col-6 text-right">74%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 py-3"></div>

        <div class="pt-5 pb-3 d-lg-flex justify-content-lg-center gx-5">
            <div class="row col-lg-10">
                <div class="team-member col-md-4">
                    <img class="team-member-img img-fluid rounded-circle p-4" src="./assets/img/1111.jpg"
                         alt="Card image">
                    <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <li><strong>현상진</strong></li>
                        <i class="fas fa-quote-left"></i> 좋은사람들과 작업하니 너무 행복합니다<i class="fas fa-quote-right"></i>
                    </ul>

                    <div class="creative-progress col-md-auto pt-5 px-3">
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">
                                    Development</h4>
                            </div>
                            <div class="col-6 text-right">50%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Design</h4>
                            </div>
                            <div class="col-6 text-right">70%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Marketing</h4>
                            </div>
                            <div class="col-6 text-right">74%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>

                </div>
                <div class="team-member col-md-4">
                    <img class="team-member-img img-fluid rounded-circle p-4" src="./assets/img/team-02.jpg"
                         alt="Card image">
                    <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <li><strong>김영허</strong></li>
                        <i class="fas fa-quote-left"></i> 자신을 소개해주세요 <i class="fas fa-quote-right"></i>
                    </ul>
                    <div class="creative-progress col-md-auto pt-5 px-3">
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Development</h4>
                            </div>
                            <div class="col-6 text-right">66%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Design</h4>
                            </div>
                            <div class="col-6 text-right">90%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Marketing</h4>
                            </div>
                            <div class="col-6 text-right">74%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="team-member col-md-4">
                    <img class="team-member-img img-fluid rounded-circle p-4" src="./assets/img/team-03.jpg"
                         alt="Card image">
                    <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <li><strong>김명환</strong></li>
                        <i class="fas fa-quote-left"></i> 자신을 소개해주세요 <i class="fas fa-quote-right"></i>
                    </ul>
                    <div class="creative-progress col-md-auto pt-5 px-3">
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Development</h4>
                            </div>
                            <div class="col-6 text-right">66%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Design</h4>
                            </div>
                            <div class="col-6 text-right">90%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="row mt-4 mt-sm-2">
                            <div class="col-6">
                                <h4 class="h5">Marketing</h4>
                            </div>
                            <div class="col-6 text-right">74%</div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 74%" aria-valuenow="74" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- End Team Member -->
<div class="w-100 py-3"></div>



    <!-- Start Our Partner -->
    <section class="bg-light py-3">
        <div class="container py-5">
            <h2 class="h2 text-primary light-300 text-center py-5">stack & tool</h2>

            <div class="row text-center pt-2">
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_spring.png" alt="stack_logo">
                        <div class="stack">spring framework 5.3.7</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_mariaDB.png" alt="stack_logo">
                        <div class="stack">MariaDB 10.5.10</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_oracleCloud.png" alt="stack_logo">
                        <div class="stack">Oracle Cloud VM</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_bootstrap.png" alt="stack_logo">
                        <div class="stack">Bootstrap 5</div>
                    </div>
                </div>
            </div>
            <div class="row text-center pt-2">
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_apacheTomcat.png" alt="stack_logo">
                        <div class="stack">Apache Tomcat 9.0.43</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_security.png" alt="stack_logo">
                        <div class="stack">Spring Security OAuth2 Client 5.3.7</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_intelliJ.png" alt="stack_logo">
                        <div class="stack">IntelliJ IDEA Ultimate Edition</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_github.png" alt="stack_logo">
                        <div class="stack small">
                            <a style="color: gray;" href="https://github.com/bestTeam1/ProjectChting">github.com/bestTeam1/ProjectChting</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center pt-2">
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_jquery.png" alt="stack_logo">
                        <div class="stack">jQuery 3.4.1</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_sockJS.png" alt="stack_logo">
                        <div class="stack">Sock JS</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_kakaoMap.png" alt="stack_logo">
                        <div class="stack">Kakao Maps API</div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_chartJS.png" alt="stack_logo">
                        <div class="stack">Chart JS</div>
                    </div>
                </div>
            </div>
            <div class="row text-center pt-2">
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_slack.png" alt="stack_logo">
                        <div class="stack pe-4">
                            <ul style="list-style: none;">
                                <li>Team Collaboration Tool</li>
                                <li style="font-size: small;">- Communication -</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_googleDrive.png" alt="stack_logo">
                        <div class="stack pe-4">
                            <ul style="list-style: none;">
                                <li>Team Collaboration Tool</li>
                                <li style="font-size: small;">- Technical Documentation -</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_trello.png" alt="stack_logo">
                        <div class="stack pe-4">
                            <ul style="list-style: none;">
                                <li>Team Collaboration Tool</li>
                                <li style="font-size: small;">- Project management -</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card partner-wap px-4 py-3 d-flex flex-column justify-content-lg-between">
                        <img src="${pageContext.request.contextPath}/assets/img/stack_discord.png" alt="stack_logo">
                        <div class="stack pe-4">
                            <ul style="list-style: none;">
                                <li>Team Collaboration Tool</li>
                                <li style="font-size: small;">- Online Coworking Space -</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--End Our Partner-->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
</body>
</html>
