<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">

    <title>글쓰기</title>

    <title>내가 가입한 모임 - 게시판</title>

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
                    <header>
                        <%--action='<c:url value='/board/board_insert.do'/>'--%>
                        <form id="form" method="post" action='${pageContext.request.contextPath}/admin/eventWriteOk.do' enctype="multipart/form-data">
                            <!-- userid와 eventNo 들고감 -->
                            <input type="hidden" name="userid" value="${sessionScope.get("userData").userid}" >
                            <input type="hidden" name="event_no" value="${eventNo}">
                            <%-- 카테고리 셀렉트  --%>
                            <br><br>
                            <h1>이벤트</h1>
                            <div>제목<input type="text" id="subject" name="subject"
                                          placeholder="2~20자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = '2~20자 이내로 입력해주세요 :)'"></div>
                            <br><br>
                            <h3>이벤트 기간</h3>
                            <input type="date" id="startdate" name="startdate"> ~
                            <input type="date" id="enddate"   name="enddate">
                            <br><br>
                            <div>내용<textarea rows="5" cols="13" id="content" name="content" style="resize: none"
                                             placeholder="2~2000자 이내로 입력해주세요 :)" onfocus="this.placeholder = ''"
                                             onblur="this.placeholder = '2~2000자 이내로 입력해주세요 :)'"></textarea>
                            </div>
                            <br><br>
                            <br><br>
                            <input type="file" id="fileName" name="uploadFile" class="fileName">
                            <div style="display: flex; justify-content: center">

                                <input type="button" onclick="confirm()" value="완료"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/adminEvent.do'">목록</button>
                            </div>
                        </form>

                    </header>
                </div>
            </section>


        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

</body>
<script type="text/javascript">

    function confirm() {

        var subject = $("#subject").val().trim();
        var content = $("#content").val().trim();
        var startdate = $("#startdate").val();
        var enddate = $("#enddate").val();

        console.log(startdate);
        console.log(enddate);

        if (subject == "") {
            Swal.fire('제목을 입력해주세요')
            return;
        } else if (content == "") {
            Swal.fire('내용을 입력해주세요')
            return;
        } else if (startdate == "") {
            Swal.fire('이벤트 시작날짜를 입력해주세요')
            return;
        } else if (enddate == "") {
            Swal.fire('이벤트 종료날짜를 입력해주세요')
            return;
        } else if (startdate >= enddate) {
            Swal.fire('이벤트 날짜를 확인해주세요! 이벤트 종료일이 시작일보다 빠릅니다')
            return;
        }

        Swal.fire({
            title: '이벤트 작성',
            text: "이벤트를 등록하시겠습니까?",
            icon: '확인',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '취소',
            confirmButtonText: '이벤트를 등록합니다'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '등록 성공!',
                    text: '이벤트를 등록했습니다!'
                }).then((result) => {
                    $('#form').submit();
                })
            }
        })
    }

    //이벤트 시작일 default 현재날짜로 넣어두기
    Date.prototype.toDateInputValue = (function () {
        var local = new Date(this);
        local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
        return local.toJSON().slice(0, 10);
    });

    //이벤트 시작일 default 현재날짜로 넣어두기
    $(document).ready(function () {
        $('#startdate').val(new Date().toDateInputValue());
        $('#enddate').attr("min",$('#startdate').val());
    });

</script>
</html>