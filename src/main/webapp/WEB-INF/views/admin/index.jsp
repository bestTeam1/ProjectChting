<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- KakaoMap API -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@properties['kakaoapi.key']"/>&libraries=services&libraries=clusterer"></script>


    <title>관리자</title>


<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <jsp:include page="/WEB-INF/views/include/adminSidebar.jsp"/>
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">대시보드</h1>
                    <a href="${pageContext.request.contextPath}/index.do"
                       class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-arrow-alt-circle-left"></i> chting으로 돌아가기 </a>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            회원
                                        </div>
                                        <div id="totalUser" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            모임
                                        </div>
                                        <div id="totalGroup" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-users fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            모임 이벤트
                                        </div>
                                        <div id="totalEvent" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            가장 인기있는 관심사
                                        </div>
                                        <div id="totalInterest" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Chting 총 가입자 수</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="chartTotalUsers"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">가입 경로</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="joinType"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-github"></i> github
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-google"></i> google
                                        </span>
                                    <span class="mr-2">
                                            <i class="fas fa-circle text-kakao"></i> kakao
                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">회원들의 모임</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">지도 방식</div>
                                        <a class="dropdown-item" onclick="chartSchedule()">마크별로 보기</a>
                                        <a class="dropdown-item" onclick="chartCluster()">클러스터로 보기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body" id="map" style="height: 380px;">
                            </div>
                        </div>
                    </div>

                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">관심사 별 가입자 수</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="chartGroupTypes"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-outdoor"></i> 아웃도어
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-sports"></i> 운동/스포츠
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-book"></i> 인문학/책/글
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-language"></i> 외국/언어
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-culture"></i> 문화/공연/축제
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-music"></i> 음악/악기
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-crafting"></i> 공예/만들기
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-dance"></i> 댄스/무용
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-voluntary"></i> 봉사활동
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-social"></i> 사교/인맥
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-car"></i> 차/오토바이
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-picture"></i> 사진/영상
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-game"></i> 게임/오락
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-cook"></i> 요리/제조
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-pet"></i> 반려동물
                                        </span>
                                    <span class="mr-2">
                                                <i class="fas fa-circle text-etc"></i> 자유주제
                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Chting</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


</body>

</head>

<script>

    $(document).ready(function () {
        // 대시보드 상단 정보
        $.ajax({
            url: "${pageContext.request.contextPath}/dashboardInfo.do",
            dataType: "json",
            data: {
                //null
            },
            success: function (data) {
                $('#totalUser').text(data.totalUser);
                $('#totalGroup').text(data.totalGroup);
                $('#totalEvent').text(data.totalEvent);

                $('#totalInterest').text(data.topInterest);


                // $('#totalUser').val(data.totalUser);
            }
        });


        // 총 유저수
        $.ajax({
            url: "${pageContext.request.contextPath}/chartRecentUser.do",
            dataType: "json",
            data: {
                //null
            },
            success: function (data) {
                var recentDate = Array();
                let today = new Date();
                for (var i = 6; i >= 0; i--) {
                    let year = today.getFullYear(); // 년도
                    let month = today.getMonth() + 1;  // 월
                    let date = today.getDate() - i;  // 날짜

                    recentDate.push(year + '/' + month + '/' + date);
                }


                var ctx = $('#chartTotalUsers');
                var totalUsersChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['2021-06-25','2021-06-26','2021-06-27','2021-06-28','2021-06-29','2021-06-30','2021-07-01'],
                        datasets: [{
                            label: '가입자 수',
                            data: Object.values(data),
                            lineTension: 0.3,
                            backgroundColor: "rgba(78, 115, 223, 0.05)",
                            borderColor: "rgba(78, 115, 223, 1)",
                            pointRadius: 3,
                            pointBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointBorderColor: "rgba(78, 115, 223, 1)",
                            pointHoverRadius: 3,
                            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                            pointHitRadius: 10,
                            pointBorderWidth: 2,
                        }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        layout: {
                            padding: {
                                left: 10,
                                right: 25,
                                top: 25,
                                bottom: 0
                            }
                        },
                        scales: {
                            xAxes: [{
                                time: {
                                    unit: 'date'
                                },
                                gridLines: {
                                    display: false,
                                    drawBorder: false
                                },
                                ticks: {
                                    maxTicksLimit: 7
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    maxTicksLimit: 5,
                                    padding: 10,
                                    // Include a dollar sign in the ticks
                                    callback: function (value, index, values) {
                                        return number_format(value);
                                    }
                                },
                                gridLines: {
                                    color: "rgb(234, 236, 244)",
                                    zeroLineColor: "rgb(234, 236, 244)",
                                    drawBorder: false,
                                    borderDash: [2],
                                    zeroLineBorderDash: [2]
                                }
                            }],
                        },
                        legend: {
                            display: false
                        },
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            titleMarginBottom: 10,
                            titleFontColor: '#6e707e',
                            titleFontSize: 14,
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            intersect: false,
                            mode: 'index',
                            caretPadding: 10,
                            callbacks: {
                                label: function (tooltipItem, chart) {
                                    var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                    return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '명';
                                }
                            }
                        }
                    }
                });
            },
            error: function (request, status, error) {
                console.log(error)
            }
        });
        // 총 유저수
        $.ajax({
            url: "${pageContext.request.contextPath}/chartJoinType.do",
            dataType: "json",
            data: {
                //null
            },
            success: function (data) {
                var ctx = $('#joinType');
                var joinTypeChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: Object.keys(data),
                        datasets: [{
                            data: Object.values(data),
                            backgroundColor: ['#FAE100', '#E13E2A', '#24292E'],  //차트컬러
                            hoverBackgroundColor: ['#FFD400', '#FF0000', '#000000'], //마우스올렸을때 색상변경
                            hoverBorderColor: "rgba(234, 236, 244, 1)",
                        }],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: false
                        },
                        cutoutPercentage: 80,
                    },
                });
            },
            error: function (request, status, error) {
                console.log(error)
            }
        });
        // 총 유저수
        $.ajax({
            url: "${pageContext.request.contextPath}/chartJoinType.do",
            dataType: "json",
            data: {
                //null
            },
            success: function (data) {

                var ctx = $('#joinType');
                var joinTypeChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: Object.keys(data),
                        datasets: [{
                            data: Object.values(data),
                            backgroundColor: ['#FAE100', '#E13E2A', '#24292E'],  //차트컬러
                            hoverBackgroundColor: ['#FFD400', '#FF0000', '#000000'], //마우스올렸을때 색상변경
                            hoverBorderColor: "rgba(234, 236, 244, 1)",
                        }],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: false
                        },
                        cutoutPercentage: 80,
                    },
                });
            },
            error: function (request, status, error) {
                console.log(error)
            }
        });
        //관심사별 가입자수
        $.ajax({
            url: "${pageContext.request.contextPath}/chartGroupTypes.do",
            dataType: "json",
            data: {
                //null
            },
            success: function (data) {

                var ctx = $('#chartGroupTypes');
                var joinTypeChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ["아웃도어/여행", "운동/스포츠", "인문학/책/글", "외국/언어", "문화/공연/축제", "음악/악기", "공예/만들기", "댄스/무용", "봉사활동", "사교/인맥", "차/오토바이", "사진/영상",
                            "게임/오락", "요리/제조", "반려동물", "자유주제"],
                        datasets: [{
                            data: Object.values(data),
                            backgroundColor: ['#68B9C2', '#E13E2A', '#6F452D', '#2DAF5E', 'E6C834', '#6A40FF', '#00FE00', '#E4584D', '#F7F7F7',
                                '#002B68', '#9F0B32', '#F4E18B', '#6D6E75', '#D3A188', '#E5BF95', '#000000'],  //차트컬러
                            hoverBorderColor: "rgba(234, 236, 244, 1)",
                        }],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: false
                        },
                        cutoutPercentage: 80,
                    },
                });
            },
            error: function (request, status, error) {
                console.log(error)
            }
        });
        chartSchedule();

    });
    //카카오맵 모임 클러스터
    function chartCluster() {

        $.ajax({
            url: "${pageContext.request.contextPath}/chartSchedule.do",
            dataType: "json",
            data: {
                //null
            },
            async: false,
            success: function (data) {
                $('#map').empty();


                var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
                    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
                    level : 14 // 지도의 확대 레벨
                });

                var clusterer = new kakao.maps.MarkerClusterer({
                    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
                    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
                    minLevel: 10, // 클러스터 할 최소 지도 레벨
                    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
                });

                var dataPosition = null;


                dataPosition = new kakao.maps.LatLng(data[0].ycoord, data[0].xcoord);

                console.log(dataPosition);


                var markers = $(data).map(function (i) {
                    return new kakao.maps.Marker({
                        position : new kakao.maps.LatLng(data[i].ycoord, data[i].xcoord)
                    });
                });

                clusterer.addMarkers(markers);

                console.log(markers);

                kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

                    // 현재 지도 레벨에서 1레벨 확대한 레벨
                    var level = map.getLevel()-1;

                    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
                    map.setLevel(level, {anchor: cluster.getCenter()});
                });




            },
            error: function (request, status, error) {
                console.log(error)
            }
        });
    }

    //카카오맵 모임 마커
    function chartSchedule() {

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
                level: 14 // 지도의 확대 레벨
            };
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        $.ajax({
            url: "${pageContext.request.contextPath}/chartSchedule.do",
            dataType: "json",
            data: {
                //null
            },
            async : false,
            success: function (data) {
                // 마커 이미지의 이미지 주소입니다
                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                for (var i = 0; i < data.length; i ++) {
                    // 마커 이미지의 이미지 크기 입니다
                    var imageSize = new kakao.maps.Size(20, 34);
                    // 마커 이미지를 생성합니다
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                    var dataPosition = new kakao.maps.LatLng(data[i].ycoord, data[i].xcoord);
                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: dataPosition, // 마커를 표시할 위치
                        title : data[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        image : markerImage // 마커 이미지
                    })
                }
            },
            error: function (request, status, error) {
                console.log(error)
            }
        });
    }

</script>


</html>