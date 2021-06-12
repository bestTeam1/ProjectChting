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
<p>${groupMemberList}</p>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/groupHeader.jsp" />
            <!-- Banner -->
            <section id="main">
                <h1 style="text-align: center">멤버탈퇴는 재가입이 가능합니다</h1>
                <table id="memberList" style="text-align: center">

                </table>
                <input id="groupNo" type="hidden" value="${groupNo}">
                <input id="userid" type="hidden" value="${userid}">
                <div class="col-6 col-12-small">
                    <ul class="actions stacked">
                        <li><a id="banish"  href="#" class="button primary fit">모임에서 추방하기</a></li>
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
        memberList();
    });

    //가입신청 Table
    function memberList() {
        $('#memberList').append(
            '<tr style="background-color: lightgrey">'
            + '<th style="text-align: center">직책</th>'
            + '<th style="text-align: center">이름</th>'
            + '<th style="text-align: center">권한</th>'
            + '<th style="text-align: center">강퇴</th>'
            + '</tr>'
        );

        var tableNum = 0;

        <c:forEach items="${groupMemberList}" var="member">
        (function () {
            var position_no = ${member.group_role_no}
            var position = "";
            var succeed = "";
            var checkbox = "";

            if(position_no == 1 ) {
                position = "모임장";
            } else if (position_no == 2) {
                position = "모임원";
                succeed = "<button>모임장위임</button>";
                checkbox ='<div class="col-6 col-12-small">'
                    +'<input type="checkbox" id="selectAgreement'+ tableNum
                    +'" name="selectAgreement" value="${member.userid}" >'
                    + '<label for="selectAgreement'+ tableNum +'"></label>'
                    + '</div>';
            }
            $('#memberList').append(
                '<tr>'
                +'<td>'
                + position
                +'</td>'
                +'<td>${member.nickname}</td>'
                +'<td>' + succeed +'</td>'
                +'<td>'
                + checkbox
                +'</td>'
                +'</tr>'
            );
            tableNum++;
        })();
        </c:forEach>
    }

    $(function(){
        $('#banish').click(function(event){
            event.preventDefault();
            Swal.fire({
                title: '정말입니까??',
                text: "이 결정은 되돌릴 수 없습니다. 정말로 멤버를 강퇴하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네 강퇴하겠습니다',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    var banishes = [];
                    $('input[name=selectAgreement]:checked').each(function(){
                        var chk = $(this).val();
                        banishes.push(chk);
                    });
                    console.log(banishes);
                    $.ajax({
                        url : "banishMember.do",
                        dataType : "json",
                        data : {
                            banishList : banishes,
                            groupNo : $('#groupNo').val(),
                            userid : $('#userid').val()
                        },
                        success : function(data){
                            console.log(data);
                            $('#memberList').children().remove();
                            $('#memberList').append(
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
                                var position_no = item.group_role_no;
                                var position = "";
                                var succeed = "";
                                var checkbox = "";

                                if(position_no == 1 ) {
                                    position = "모임장";
                                } else if (position_no == 2) {
                                    position = "모임원";
                                    succeed = "<button>모임장위임</button>";
                                    checkbox ='<div class="col-6 col-12-small">'
                                        +'<input type="checkbox" id="selectAgreement'
                                        + tableNum
                                        +'" name="selectAgreement" value="' + item.userid + '" >'
                                        + '<label for="selectAgreement'+ tableNum +'"></label>'
                                        + '</div>';
                                }
                                $('#memberList').append(
                                    '<tr>'
                                    +'<td>'
                                    + position
                                    +'</td>'
                                    +'<td>' + item.nickname + '</td>'
                                    +'<td>' + succeed +'</td>'
                                    +'<td>'
                                    + checkbox
                                    +'</td>'
                                    +'</tr>'
                                );
                                tableNum++;
                            });
                        },
                        error : function(request, status, error) {
                            console.log(error)
                        }
                    });
                    Swal.fire(
                        '추방되었습니다',
                        '해당 회원은 다시 가입신청 할 수 있습니다'
                    )
                }
            })
        });
    });
</script>
</html>