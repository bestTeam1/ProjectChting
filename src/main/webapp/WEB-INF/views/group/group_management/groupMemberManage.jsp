<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<style>
    td {
        text-align: center;
        vertical-align: middle;
    }

    img {
        width: 50%;
        height: 50%;
        text-align: center;
    }
</style>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->

<jsp:include page="/WEB-INF/views/group/group_management/groupAdminNavbar.jsp"/>
<!-- Close Header / <head> -->
<section class="bg-light py-5 ">
    <table class="table w-75 text-center m-auto">
        <thead class="table-primary">
        <tr>
            <th>직책</th>
            <th>이름</th>
            <th>소개</th>
            <th>성별</th>
            <th>권한</th>
            <th>강퇴</th>
        </tr>
        </thead>
        <tbody id="memberList">

        </tbody>
    </table>
</section>

<input id="groupNo" type="hidden" value="${groupNo}">
<input id="userid" type="hidden" value="${userid}">

<div class="col-lg-8 col-12 m-lg-auto text-center">
    <input type="button" class="banner-button btn rounded-pill btn-apeach text-white btn-lg px-4 mt-lg-5 "
           id="banish" value="추방하기">
</div>
<!-- End Feature Work -->
<div id="footerDiv" style="height: 300px"></div>
<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
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
        memberList();
    });

    //모임원 Table
    function memberList() {
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
                succeed = "<button class ='btn btn-primary text-white' id='succeed' value='${member.userid}'>모임장위임</button>";
                checkbox ='<div>'
                    +'<input type="checkbox" id="selectAgreement'+ tableNum
                    +'" name="selectAgreement" value="${member.userid}" >'
                    + '<label for="selectAgreement'+ tableNum +'"></label>' + '</div>';
            }
            if(position_no == 1) {
                $('#memberList').prepend(
                    '<tr>'
                    +'<td>' + position +'</td>'
                    +'<td>${member.nickname}</td>'
                    +'<td>${member.content}</td>'
                    +'<td>${member.gender}</td>'
                    +'<td>' + succeed +'</td>'
                    +'<td>' + checkbox +'</td>'
                    +'</tr>'
                );
            } else if (position_no == 2) {
                $('#memberList').append(
                    '<tr>'
                    +'<td>' + position +'</td>'
                    +'<td>${member.nickname}</td>'
                    +'<td>${member.content}</td>'
                    +'<td>${member.gender}</td>'
                    +'<td>' + succeed +'</td>'
                    +'<td>' + checkbox +'</td>'
                    +'</tr>'
                );
            }
            tableNum++;
        })();
        </c:forEach>
    }
    //모임장 위임 클릭
    $(document).on("click", "#succeed", function (e) {
        e.preventDefault();
        Swal.fire({
            title: '정말입니까??',
            text: "이 결정은 되돌릴 수 없습니다. 정말로 모임장을 넘기시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#A0A0FF',
            cancelButtonColor: '#aaaaaa',
            confirmButtonText: '네 모임장 권한을 넘기겠습니다',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/groupadmin/succeedGroupAdmin.do",
                    dataType: "text",
                    data: {
                        adminUserid: $('#userid').val(),
                        requestUserid: $(this).val(),
                        groupNo: $('#groupNo').val()
                    },
                    success: function (data) {
                        if (data == "false") {
                            Swal.fire({
                                icon: 'error',
                                title: '모임장 위임을 할 수 없습니다..',
                                text: '해당 유저는 이미 모임장으로 속해있는 모임이 있습니다',
                                footer: '<a href="#">Why do I have this issue?</a>'
                            })
                        } else {
                            Swal.fire({
                                title: '모임장 위임성공',
                                text : '모임장 권한을 위임하여 모임관리 페이지에서 나가집니다'
                            }).then((result) => {
                                window.location.href = data;
                            })
                        }

                    },
                    error: function (request, status, error) {
                        console.log(error)
                    }
                });
            }
        })
    });

    $(function(){
        //모임 강퇴 클릭
        $('#banish').click(function(event){
            event.preventDefault();
            Swal.fire({
                title: '정말입니까??',
                text: "이 결정은 되돌릴 수 없습니다. 정말로 멤버를 강퇴하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#A0A0FF',
                cancelButtonColor: '#aaaaaa',
                confirmButtonText: '네 추방하겠습니다',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    var banishes = [];
                    $('input[name=selectAgreement]:checked').each(function(){
                        var chk = $(this).val();
                        banishes.push(chk);
                    });
                    $.ajax({
                        url : "${pageContext.request.contextPath}/groupadmin/banishMember.do",
                        dataType : "json",
                        data : {
                            banishList : banishes,
                            groupNo : $('#groupNo').val(),
                            userid : $('#userid').val()
                        },
                        success : function(data){
                            $('#memberList').children().remove();
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
                                    succeed = "<button class ='btn btn-primary' value=" + item.userid +">모임장위임</button>";
                                    checkbox ='<div>'
                                        +'<input type="checkbox" id="selectAgreement'
                                        + tableNum
                                        +'" name="selectAgreement" value="' + item.userid + '" >'
                                        + '<label for="selectAgreement'+ tableNum +'"></label>'
                                        + '</div>';
                                }
                                if(position_no == 1) {
                                    $('#memberList').prepend(
                                        '<tr>'
                                        +'<td>' + position +'</td>'
                                        +'<td>' + item.nickname + '</td>'
                                        +'<td>' + item.content + '</td>'
                                        +'<td>' + item.gender + '</td>'
                                        +'<td>' + succeed +'</td>'
                                        +'<td>' + checkbox +'</td>'
                                        +'</tr>'
                                    );
                                } else if (position_no == 2) {
                                    $('#memberList').append(
                                        '<tr>'
                                        +'<td>' + position +'</td>'
                                        +'<td>' + item.nickname + '</td>'
                                        +'<td>' + item.content + '</td>'
                                        +'<td>' + item.gender + '</td>'
                                        +'<td>' + succeed +'</td>'
                                        +'<td>' + checkbox +'</td>'
                                        +'</tr>'
                                    );
                                }
                                tableNum++;
                            });
                        },
                        error : function(request, status, error) {
                            console.log(error)
                        }
                    });
                    Swal.fire(
                        '추방되었습니다'
                    )
                }
            })
        });
    });
</script>
</html>
