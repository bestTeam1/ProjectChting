<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 상세보기</title>
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        a {
            text-decoration: none !important
        }

        a:hover {
            text-decoration: none !important
        }


    </style>
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
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- Banner -->
            <section>
                <div class="content">
                    <header id="detailBody">
                        <h2 id="subject" style="vertical-align: text-bottom;">
<%--                            <img src="http://drive.google.com/uc?export=view&id=1rNujOwPH73iMFcEA-gEQoWKlwPhXPGVz"--%>
<%--                                 width="50px" height="50px"--%>
<%--                                 style="display: inline-block; box-sizing: border-box;--%>
<%--                                       margin-bottom:10px; margin-right: 10px; border-radius: 50%; vertical-align: middle;">--%>
                            </span>
                            ${plist.subject}
                        </h2>
                        <table>
                            <tr>
                                <td colspan="4" class="text-left" valign="top" height=200>
                                    ${plist.content}
                                </td>
                            </tr>
                        </table>
                        <div style="display: flex; justify-content: center">
                            <input id="update" type="button" value="수정"/> &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <input id="delete" type="button" value="삭제"/> &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <input id="back" type="button" value="목록"/>
                        </div>
                        <input type="hidden" name="group_no" value="${group_no}">
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

    //수정 클릭
    $(document).on("click", "#update", function (e) {
        e.preventDefault();

        Swal.fire({
            title: '게시글 수정',
            text: '게시글을 수정하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href="board_update.do?post_no=${plist.post_no}"
            }
        })
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
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '게시글 삭제',
                    text : '게시글이 삭제되어 목록으로 돌아갑니다'
                }).then((result) => {
                    window.location.href= "board_delete.do?post_no=${plist.post_no}";
                })

            } else {
                swal.fire({
                    title: '삭제 취소',
                    text : '삭제를 취소하셨습니다'
                })
            }
        })
    });
    //목록 클릭
    $(document).on("click", "#back", function (e) {
        e.preventDefault();

        window.location.href= "board_list.do?group_no=${plist.group_no}";
    });
</script>
</html>



