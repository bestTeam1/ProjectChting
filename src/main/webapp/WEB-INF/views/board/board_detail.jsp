<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp"/>
<!-- End Board SideBar -->

<!-- Start Service -->
<input type="hidden" name="group_no" value="${group_no}">
<section class="container">
    <div class="service-wrapper py-3">
        <h6 class="text-muted text-end">[${plist.post_catename}]</h6>
        <div class="card text-center" style="margin-bottom: 10px;">
            <div class="card-header">
                <h5>${plist.subject}</h5>
            </div>
            <div class="card-body text-muted">
                <h6>${plist.content}</h6>
                <c:if test="${!empty plist.file}">
                    <img id="preview" class="rounded" src="./upload/boardimg/${plist.file}"
                         width="300">
                </c:if>
            </div>
        </div>

        <%-- 수정, 삭제, 목록 버튼 --%>
        <div id='buttonArea' style="display: flex; justify-content: center; float: right;">
            <input id="back" type="button" class=" navbar-btn btn-sm btn-primary" style="margin-right: 10px;"
                   value="목록"/>
        </div>

        <%-- 댓글 --%>
        <div style="text-align: center">
            <jsp:include page="/WEB-INF/views/board/board_post_reply.jsp"/>
        </div>
    </div>
</section>
<!-- End Service -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

<!-- End Footer / Script -->
<script>

    let userid = '${sessionScope.get("userData").userid}';
    let writer = "${plist.userid}";
    if (userid == writer) {
        $('#buttonArea').append('<input id="update" class="navbar-btn btn-sm btn-primary" style="margin-right: 10px;" type="button" value="수정"/>' +
            '<input id="delete" class="navbar-btn btn-sm btn-primary" type="button" value="삭제"/>');
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


