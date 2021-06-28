<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Work Sigle -->
<c:set var="userid" value="${sessionScope.get('userData').userid}"/>
<% pageContext.setAttribute("newLine", "\n"); %>

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp"/>
<!-- End Board SideBar -->

<section class="container">
    <%-- 모임 이름 --%>
    <div class="row pt-5">
        <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
            <h2 class="worksingle-heading h3 pb-3 light-300 typo-space-line mb-4">
                <c:choose>
                    <c:when test="${group.group_no == adminGroup.group_no}">
                        <i class="fas fa-crown"></i>&nbsp;<c:out value="${group.group_name}"/>
                    </c:when>
                    <c:otherwise>
                        <i class="fas fa-user"></i></i>&nbsp;<c:out value="${group.group_name}"/>
                    </c:otherwise>
                </c:choose>
            </h2>
        </div>
    </div>

    <%-- 대표 사진, 지역, 관심사--%>
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3">
            <h6 class="objective-heading h6 mb-1 text-end light-300">
                <i class="fas fa-map-marker-alt m-3">&nbsp;<c:out value="${group.area_name}"/></i>
                <i class="fas fa-bookmark m-3">&nbsp;<c:out value="${group.catename}"/></i>
            </h6>
            <div id="templatemo-slide-link-target" class="card mb-3">
                <c:choose>
                    <c:when test="${empty group.group_img}">
                        <img class="img-fluid border rounded"
                             src="./assets/img/work-slide-05.jpg"
                             style="height: 500px;" alt="Card image cap">
                    </c:when>
                    <c:otherwise>
                        <img class="img-fluid border rounded"
                             src="./upload/groupimg/${group.group_img}"
                             style="height: 500px;" alt="Card image cap">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <%-- 회원 수, 소개 글--%>
    <div class="row justify-content-center">
        <div class="col-lg-8 ml-auto mr-auto pt-3 pb-4">
            <h2 class="objective-heading h3 mb-2 mb-sm-4 text-center light-300"><a
                    class="btn btn-outline-primary btn-lg" href="#">회원
                <i class="bx bx-user bx-lg"></i> : <c:out value="${joinUser}"></c:out> 명</a></h2>
            <h5 class="objective-heading h5 mb-3 text-center light-300"><p><i class="fas fa-angle-double-left"></i> 모임
                소개 <i class="fas fa-angle-double-right"></i></p></h5>
            <h6 class="text-center h6">
                ${fn:replace(group.content, newLine, "<br>")}
            </h6>
        </div>
    </div>
    <hr>

    <%-- 권한에 따라 다르게 보여지는 버튼 영역 --%>
    <div id="buttonArea" style="text-align: center">
    </div>
    <br>
    <br>

</section>

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
<script>
    $(function () {
        openNav();

    });

    var buttonArea = $('#buttonArea');
    var userid = '${sessionScope.get("userData").userid}';
    var authority = '';
    $.ajax({
        url: "group/main",
        data: {
            userid: userid,
            group_no: '${group.group_no}'
        },
        type: "get",
        success: function (response) {
            authority = response;

            console.log(response);

            if (response == '1') { //모임장유저
                buttonArea.append("<button onclick='update()' class='banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5' style='margin-right: 10px;'> 수정하기</button>");
                buttonArea.append("<button onclick='out()' class='banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5'>탈퇴하기</button>");
            } else if (response == '2') { //모임원유저
                buttonArea.append("<button onclick='out()' class='banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5'>탈퇴하기</button>");
            } else { //비로그인유저, 모임미가입유저
                buttonArea.append("<button onclick='join()' class='banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5'>가입하기</button>");
            }
        },
        error: function (Http, status, error) {
            console.log("Http : " + Http + ", status : " + status + ", error : " + error);
        }
    });


    function join() {
        if (userid == '') {
            Swal.fire({
                title: "비로그인 유저입니다.",
                text: "로그인 후 가입을 진행해 주세요.",
                icon: "error",
                buttons: '확인',
                confirmButtonColor: '#A0A0FF'
            }).then((value) => {
                if (value) {
                    location.href = 'login';
                }
            });
        } else {
            let json = {"userid": userid, "group_no": '${group.group_no}'}
            $.ajax({
                url: "group/insert",
                dataType: "text",
                type: "POST",
                data: JSON.stringify(json),
                contentType: "application/json; charset=UTF-8",
                success: function (response) {
                    if (response == "success") {
                        Swal.fire({
                            title: "모임 가입신청이 완료되었습니다.",
                            text: "모임장이 신청을 수락할 때까지 기다려주세요!",
                            confirmButtonColor: '#A0A0FF',
                            response
                        });
                    } else if (response == "warning") {
                        Swal.fire({
                            title: "이미 모임 가입신청이 되어있습니다.",
                            text: "모임장이 신청을 수락할 때까지 기다려주세요!",
                            confirmButtonColor: '#A0A0FF',
                            response
                        });
                    }
                },
                error: function (Http, status, error) {
                    console.log("Http : " + Http + ", status : " + status + ", error : " + error);
                    Swal.fire({
                        title: "모임 가입신청에 실패했습니다.",
                        text: "모임 가입신청을 다시 확인해주세요.",
                        confirmButtonColor: '#A0A0FF',
                        error
                    });
                }
            });
        }
    }

    function out() {
        if (authority == '1') {
            Swal.fire({
                title: "모임장 권한을 가지고 있습니다.",
                text: "탈퇴하시려면 모임장 권한을 양도하고 탈퇴해주세요.",
                icon: "error",
                buttons: '확인',
                confirmButtonColor: '#A0A0FF'
            }).then((value) => {
                if (value) {
                    location.href = 'groupMemberManage.do?userid=' + userid;
                }
            });
        } else {
            let json = {"userid": userid, "group_no": '${group.group_no}'}
            $.ajax({
                url: "group/insert",
                dataType: "text",
                type: "DELETE",
                data: JSON.stringify(json),
                contentType: "application/json; charset=UTF-8",
                success: function (response) {
                    Swal.fire({
                        title: "모임에서 탈퇴되었습니다.",
                        text: "모임에 대한 권한이 사라집니다.",
                        icon: response,
                        buttons: '확인',
                        confirmButtonColor: '#A0A0FF'
                    }).then((value) => {
                        if (value) {
                            location.href = 'index.do';
                        }
                    });
                },
                error: function (Http, status, error) {
                    console.log("Http : " + Http + ", status : " + status + ", error : " + error);
                    Swal.fire({
                        title: "모임 탈퇴에 실패했습니다.",
                        text: "다시 확인해 주세요.",
                        confirmButtonColor: '#A0A0FF',
                        error
                    });
                }
            });
        }
    }

    function update() {
        let groupNo = "${group.group_no}";
        location.href = "groupUpdate.do?group_no=" + groupNo;
    }

</script>
</body>
</html>
