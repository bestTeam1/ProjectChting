<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>통계</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweetalert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- chartjs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/adminHeader.jsp"/>
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">취팅 통계로 취팅을 발전시키세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section id="table">
                <h2>&#60; 통계 차트 &#62;</h2>
                <p>데이터를 활용해보세요</p>
            </section>
            <section>
                <div style="width: 50%; float: left; text-align: center"><h3>성비</h3></div>
                <div style="width: 50%; float: left; text-align: center"><h3>회원수</h3></div>
                <div style="width: 50%; float: left">
                    <canvas id="ratioChart" width="400" height="400"></canvas>
                </div>
                <div style="width: 50%; float: left">
                    <canvas id="recentUser" width="400" height="400"></canvas>
                </div>

            </section>
            <div id="floatForFooter" style="height: 1000px">
            </div>
        <a href="chartRecentUser.do">testchartratio</a>

    </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

</body>
<script type="text/javascript">
    //오늘날짜
    Date.prototype.toDateInputValue = (function () {
        var local = new Date(this);
        local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
        return local.toJSON().slice(0, 10);
    });
    //오늘 날짜
    var varCurrentDate = new Date().toDateInputValue()

    //성비 차트
    $(document).ready(function() {
        $.ajax({
            url : "${pageContext.request.contextPath}/chartRatio.do",
            dataType : "json",
            data : {
                //전송할 데이터 필요없음
            },
            success : function(data){
                var ctx = $('#ratioChart');
                var myChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ['여자', '남자'],
                        datasets: [{
                            label: '회원수',
                            data: Object.values(data),
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                });
            },
            error : function(request, status, error) {
                console.log(error)
            }
        });

        $.ajax({
            url : "${pageContext.request.contextPath}/chartRecentUser.do",
            dataType : "json",
            data : {
                //null
            },
            success : function(data){
                var ctx = $('#recentUser');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: Object.keys(data),
                        datasets: [{
                            label: '회원수',
                            data: Object.values(data),
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            },
            error : function(request, status, error) {
                console.log(error)
            }
        });


    });

    var ctx = document.getElementById('myChart3');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    var ctx = document.getElementById('myChart2');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["남자", "여자"],
            datasets: [{
                label: '# of Votes',
                data: [50, 23],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1
            }]
        },

    });


</script>
</html>

