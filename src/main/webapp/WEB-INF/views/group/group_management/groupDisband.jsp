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
                <h1 style="text-align: center"> ${groupName} 모임을 해산하시겠습니까? </h1>
                <h2 style="text-align: center"> !!! 한번 해산하면 되돌릴 수 없습니다 !!!</h2>
            </section>
            <div style="display: flex; justify-content: center;">
                <ul class="actions" style="text-align: center">
                    <li><a id="disband" href="#" class="button primary">해산하기</a></li>
                    <%--
                                        groupDisbandOk.do?userid=${userid}--%>
                </ul>
            </div>
            <section>

            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>

</body>
<script type="text/javascript">
    //모임 해산 클릭이벤트
    $(document).on("click", "#disband", function (e) {
        e.preventDefault();
        Swal.fire({
            title: '정말로 모임을 해산하시겠습니까??',
            text: "이 결정은 되돌릴 수 없습니다!",
            icon: '경고',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '모임을 해산하겠습니다'
        }).then ((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '모임 해산',
                    text : '모임이 해산되었습니다!'
                }).then((result) => {
                    window.location.href = "groupDisbandOk.do?userid=${userid}";
                })
            }
        })
    });
</script>
</html>

