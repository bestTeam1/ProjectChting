<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">

    <title>글쓰기</title>
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
                        <!-- form -->
                        <form id="form" enctype="multipart/form-data" method="post" action='${pageContext.request.contextPath}/admin/adminEventModifyOk.do'>
                            <div>제목<input type="text" id="subject" name="subject" value="${event.subject}"></div>
                            <br>이벤트기간
                            <input type="date" id="startdate" name="startdate" value="${event.startdate}"> -
                            <input type="date" id="enddate" name="enddate" value="${event.enddate}">
                            <br>
                            <div>내용<textarea rows="5" cols="13" id="content" name="content"
                                             style="resize: none">${event.content}</textarea>
                            </div>
                            <br><br>
                            <div><label class="form-label" for="customFile">첨부파일</label>
                                <!-- file은 기본 value를 줄수가없음. null(파일을 바꾸지않음) 이면 file은 DB업데이트에서 제외? 시키는 로직으로 해야할듯함 -->
                                <input type="file" class="form-control" id="customFile" name="uploadFile"/></div>
                            <br><br>

                            <div style="display: flex; justify-content: center">
                            </div>
                            <div>
                            <input type="hidden" value="${event.event_no}" name="event_no" >
                            <input type="hidden" id="currentDate" name="currentDate">
                            <input type="hidden" value="${page}" name="page" >
                            </div>

                            <div style="display: flex; justify-content: center">
                                <input id="modify" type="submit" value="수정"/> &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <input id="back" type="button" value="돌아가기"/>
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
    //오늘날짜
    Date.prototype.toDateInputValue = (function () {
        var local = new Date(this);
        local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
        return local.toJSON().slice(0, 10);
    });

    //오늘날짜
    $(document).ready(function () {
        $('#currentDate').val(new Date().toDateInputValue());
        $('#enddate').attr("min",$('#startdate').val());
    });

    $('#back').click(()=>{
        window.location.href='${pageContext.request.contextPath}/admin/adminEvent.do?page=${page}';
    });
</script>
</html>