<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>모임 관리</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweetalert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/groupHeader.jsp" />
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">모임 가입신청을 관리하세요</h1>
                <h2 style="text-align: center"></h2>
            </section>
            <section id="table">
                <h2>&#60; 가입신청 명단 &#62;</h2>
                <p> 가입신청을 받아주거나 거절할 수 있습니다 </p>
                <table id="joinRequestList" style="text-align: center">

                </table>
                <input id="groupNo" type="hidden" value="${groupNo}">
                <div class="col-6 col-12-small">
                    <ul class="actions stacked">
                        <li><a id="accept"  href="#" class="button fit">가입승인</a></li>
                        <li><a id="refuse"  href="#" class="button primary fit">가입거절</a></li>
                    </ul>
                </div>

            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">

    //Table에 회원정보 넣기
    $(document).ready(function(){
        loadRequest();
    });

    //가입신청 Table
    function loadRequest() {
        $('#joinRequestList').append(
            '<tr style="background-color:' +
            'lightgrey">'
            + '<th style="text-align: center">이름</th>'
            + '<th style="text-align: center">소개</th>'
            + '<th style="text-align: center">성별</th>'
            + '<th style="text-align: center">선택</th>'
            + '</tr>'
        );

        var tableNum = 0;

        <c:forEach items="${groupJoinRequest}" var="joinRequest">
        (function () {
            $('#joinRequestList').append(
                '<tr>'
                +'<td>${joinRequest.nickname}</td>'
                +'<td>${joinRequest.content}</td>'
                +'<td>${joinRequest.gender}</td>'
                +'<td>'
                +'<div class="col-6 col-12-small">'
                +'<input type="checkbox" id="selectAgreement'+ tableNum +'" name="selectAgreement" value="${joinRequest.userid}" >'
                +'<label for="selectAgreement'+ tableNum +'"></label>'
                +'</div>'
                +'</td>'
                +'</tr>'
            );
            tableNum++;
        })();
        </c:forEach>
    }

    $(function(){
        $('#accept').click(function(){
            var requests = [];
            $('input[name=selectAgreement]:checked').each(function(){
                var chk = $(this).val();
                requests.push(chk);
            });
            console.log(requests);
            $.ajax({
                url : "joinAccept.do",
                dataType : "json",
                data : {
                    requestList : requests,
                    groupNo : $('#groupNo').val()
                },
                success : function(data){
                    $('#joinRequestList').children().remove();
                    $('#joinRequestList').append(
                        '<tr style="background-color:lightgrey">'
                        + '<th style="text-align: center">이름</th>'
                        + '<th style="text-align: center">소개</th>'
                        + '<th style="text-align: center">성별</th>'
                        + '<th style="text-align: center">선택</th>'
                        + '</tr>'
                    );

                    console.log(Object.keys(data).length); // json갯수
                    var tableNum = 0;
                    $.each(data, function (index, item) {
                        $('#joinRequestList').append(
                            '<tr>'
                            +'<td>'+ item.nickname +'</td>'
                            +'<td>'+ item.content +'</td>'
                            +'<td>'+ item.gender +'</td>'
                            +'<td>'
                            +'<div class="col-6 col-12-small">'
                            +'<input type="checkbox" id="selectAgreement'+ tableNum +'" name="selectAgreement" value="'+ item.userid +'" >'
                            +'<label for="selectAgreement'+ tableNum +'"></label>'
                            +'</div>'
                            +'</td>'
                            +'</tr>'
                        );
                        tableNum++;
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: '가입이 승인되었습니다',
                            showConfirmButton: false,
                            timer: 2500
                        });
                    });
                    console.log(requests);
                },
                error : function(request, status, error) {
                    console.log(error)
                }
            });
        });
    });

    $(function(){
        $('#refuse').click(function(){
            var requests = [];
            $('input[name=selectAgreement]:checked').each(function(){
                var chk = $(this).val();
                requests.push(chk);
            });
            console.log(requests);
            $.ajax({
                url : "joinDeny.do",
                dataType : "json",
                data : {
                    requestList : requests,
                    groupNo : $('#groupNo').val()
                },
                success : function(data){
                    $('#joinRequestList').children().remove();
                    $('#joinRequestList').append(
                        '<tr style="background-color:lightgrey">'
                        + '<th style="text-align: center">이름</th>'
                        + '<th style="text-align: center">소개</th>'
                        + '<th style="text-align: center">성별</th>'
                        + '<th style="text-align: center">선택</th>'
                        + '</tr>'
                    );

                    var tableNum = 0;
                    $.each(data, function (index, item) {
                        $('#joinRequestList').append(
                            '<tr>'
                            +'<td>'+ item.nickname +'</td>'
                            +'<td>'+ item.content +'</td>'
                            +'<td>'+ item.gender +'</td>'
                            +'<td>'
                            +'<div class="col-6 col-12-small">'
                            +'<input type="checkbox" id="selectAgreement'+ tableNum +'" name="selectAgreement" value="' + item.userid + '" >'
                            +'<label for="selectAgreement'+ tableNum +'"></label>'
                            +'</div>'
                            +'</td>'
                            +'</tr>'
                        );
                        tableNum++;
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            iconColor : 'red',
                            title: '가입이 거절되었습니다',
                            showConfirmButton: false,
                            timer: 2500
                        });
                    });
                },
                error : function(request, status, error) {
                    console.log(error)
                }
            });
        });
    });

</script>
</html>