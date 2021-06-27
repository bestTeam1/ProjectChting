<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

    <title>내가 가입한 모임 - 상세보기</title>
</head>
<body class="is-preload">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp" />
<!-- End Board SideBar -->
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
<%--            <jsp:include page="/WEB-INF/views/include/header.jsp"/>--%>
            <!-- Banner -->
            <section>
                <div class="content">
                    <header id="detailBody">
                        <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                        <h2 id="subject" style="vertical-align: text-bottom; text-align: center">
                            ${plist.subject}
                        </h2>
                        </ul>
                        <c:if test="${!empty plist.file}">
                            <div class="content align-center" style="text-align: center">
                                <img id="preview" src="./upload/boardimg/${plist.file}"
                                     width="300">
                            </div>
                        </c:if>
                        <br>

                        <ul class="team-member-caption list-unstyled text-center pt-4 text-muted light-300">
                           <h6><i class="fas fa-quote-left" aria-hidden="true"></i>&nbsp;${plist.content}&nbsp;<i class="fas fa-quote-right" aria-hidden="true"></i></h6>
                        </ul>

<%--                        <div class="input-group input-group-sm " role="group"--%>
<%--                             style="text-align: left; width: 900px; display: inline-block;" >--%>
<%--                            <table class="table table-striped table-bordered" style="text-align: -webkit-center">--%>
<%--                                <tread>--%>

<%--                                    <tr  style="height: 300px;">--%>
<%--                                        <td> ${plist.content}--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </tread>--%>
<%--                            </table>--%>
<%--                        </div>--%>

                        <%-- 수정, 삭제, 목록 버튼 --%>
                        <div id='buttonArea' style="display: flex; justify-content: center">
                            <input id="back" type="button" class="navbar-btn btn-sm btn-primary"  value="목록"/> &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                        </div>
                        <input type="hidden" name="group_no" value="${group_no}">
                        <br><br>
                        <div style="text-align: center">

                            <jsp:include page="/WEB-INF/views/board/board_post_reply.jsp"/>
                        </div>
                    </header>
                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
</div>
</div>
</body>
<script type="text/javascript">
    let userid = '${sessionScope.get("userData").userid}';
    let writer = "${plist.userid}";
    if (userid == writer) {
        $('#buttonArea').append('<input id="update" class="navbar-btn btn-sm btn-primary"  type="button" value="수정"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input id="delete" class="navbar-btn btn-sm btn-primary"  type="button" value="삭제"/>');
    } else {

    }
    //수정 클릭
    $(document).on("click", "#update", function (e) {
        e.preventDefault();
        window.location.href = "board_update.do?post_no=${plist.post_no}"
    });

    //삭제 클릭
    $(document).on("click", "#delete", function (e) {
        e.preventDefault();

        Swal.fire({
            title: '게시글 삭제',
            text: '게시글을 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#A0A0FF',
            cancelButtonColor: '#aaaaaa',
            confirmButtonText: '네',
            canclButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "board_delete.do",
                    data: {
                        post_no: '${plist.post_no}'
                    },
                    type: "get",
                    success: function (response) {
                        Swal.fire({
                            title: '게시글 삭제',
                            text: '게시글이 삭제되어 목록으로 돌아갑니다'
                        }).then((result) => {
                            window.location.href = "board_list.do?group_no=${plist.group_no}";
                        })
                    },
                    error: function (Http, status, error) {
                        console.log("Http : " + Http + ", status : " + status + ", error : " + error);
                    }
                });
            } else {
                Swal.fire({
                    title: '삭제 취소',
                    text: '삭제를 취소하셨습니다'
                });
            }
        })
    });

    //목록 클릭
    $(document).on("click", "#back", function (e) {
        e.preventDefault();

        window.location.href = "board_list.do?group_no=${plist.group_no}";
    });

</script>
</html>


