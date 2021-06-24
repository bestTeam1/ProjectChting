<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 상세보기</title>
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- Banner -->
            <section>
                <div class="content">
                    <header id="detailBody">
                        <h2 id="subject" style="vertical-align: text-bottom; text-align: center">
                            ${plist.subject}
                        </h2>
                        <c:if test="${!empty plist.file}">
                            <div class="content align-center">
                                <img id="preview" src="./upload/boardimg/${plist.file}"
                                     width="300">
                            </div>
                        </c:if>
                        <table>
                            <tr>
                                <td colspan="4" class="text-left" valign="top" height=200>
                                    ${plist.content}
                                </td>
                            </tr>
                        </table>

                        <%-- 수정, 삭제, 목록 버튼 --%>
                        <div id='buttonArea' style="display: flex; justify-content: center">
                            <input id="back" type="button" value="목록"/> &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                        </div>
                        <input type="hidden" name="group_no" value="${group_no}">
                        <br><br>
                        <div>
                            <jsp:include page="/WEB-INF/views/board/board_post_reply.jsp"/>
                        </div>
                    </header>
                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>
</div>
</body>
<script type="text/javascript">
    let writer = "${plist.userid}";
    if (userid == writer) {
        $('#buttonArea').append('<input id="update" type="button" value="수정"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input id="delete" type="button" value="삭제"/>');
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
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
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



