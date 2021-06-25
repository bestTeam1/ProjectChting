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
    //로그인체크 (백단에서 못막았을 경우)
    $(function(){
        var check = '${sessionScope.get("userData").userid}';
        if( check == null || check =="" || check == undefined ) {
            Swal.fire({
                title: '오류',
                text : '로그인을 해주세요!!'
            }).then(() => {
                history.go(-1);
            })
        }
    });

    //Table에 회원정보 넣기
    $(document).ready(function(){
        loadRequest();
    });

    //가입신청 Table 생성
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

    //체크 후 가입승인 클릭 이벤트
    $(function(){
        $('#accept').click(function(event){
            event.preventDefault();
            var requests = [];
            $('input[name=selectAgreement]:checked').each(function(){ //체크한 정보 담기
                var chk = $(this).val();
                requests.push(chk);
            });
            console.log(requests);

            Swal.fire({
                title: '가입 승인',
                text: "가입을 승인하시겠습니까?",
                icon: '경고',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '가입을 승인합니다'
            }).then (() => {
                $.ajax({
                    url : "${pageContext.request.contextPath}/groupadmin/joinAccept.do",
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
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: '가입이 승인되었습니다',
                            showConfirmButton: false,
                            timer: 2500
                        });
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
                            tableNum++; //테이블 NUM으로 테이블 구분

                        });
                        console.log(requests);
                    },
                    error : function(request, status, error) {
                        console.log(error)
                    }
                })
            });
        });
    });

    //체크 후 가입거절절 클릭이벤트, 가입승인 이벤트와 로직은 동일
    $(function(){
        $('#refuse').click(function(event){
            event.preventDefault();
            var requests = [];
            $('input[name=selectAgreement]:checked').each(function(){
                var chk = $(this).val();
                requests.push(chk);
            });
            console.log(requests);

            Swal.fire({
                title: '가입 거절',
                text: "가입을 거절하시겠습니까?",
                icon: '경고',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '가입을 거절합니다'
            }).then (() => {
                $.ajax({
                    url: "${pageContext.request.contextPath}/groupadmin/joinDeny.do",
                    dataType: "json",
                    data: {
                        requestList: requests,
                        groupNo: $('#groupNo').val()
                    },
                    success: function (data) {
                        $('#joinRequestList').children().remove();
                        $('#joinRequestList').append(
                            '<tr style="background-color:lightgrey">'
                            + '<th style="text-align: center">이름</th>'
                            + '<th style="text-align: center">소개</th>'
                            + '<th style="text-align: center">성별</th>'
                            + '<th style="text-align: center">선택</th>'
                            + '</tr>'
                        );

                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            iconColor: 'red',
                            title: '가입이 거절되었습니다',
                            showConfirmButton: false,
                            timer: 2500
                        });

                        var tableNum = 0;
                        $.each(data, function (index, item) {
                            $('#joinRequestList').append(
                                '<tr>'
                                + '<td>' + item.nickname + '</td>'
                                + '<td>' + item.content + '</td>'
                                + '<td>' + item.gender + '</td>'
                                + '<td>'
                                + '<div class="col-6 col-12-small">'
                                + '<input type="checkbox" id="selectAgreement'
                                + tableNum
                                + '" name="selectAgreement" value="' + item.userid + '" >'
                                + '<label for="selectAgreement' + tableNum + '"></label>'
                                + '</div>'
                                + '</td>'
                                + '</tr>'
                            );
                            tableNum++;
                        });
                    },
                    error: function (request, status, error) {
                        console.log(error)
                    }
                })
            })
        });
    });

</script>
</html>