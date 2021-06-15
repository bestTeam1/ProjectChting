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
                                <img src="http://drive.google.com/uc?export=view&id=1rNujOwPH73iMFcEA-gEQoWKlwPhXPGVz"
                                     width="50px" height="50px"
                                     style="display: inline-block; box-sizing: border-box;
                                       margin-bottom:10px; margin-right: 10px; border-radius: 50%; vertical-align: middle;"></span>
                                ${detail.subject}
                            </h2>
                            <table>
                                <tr>
                                    <td colspan="4" class="text-left" valign="top" height=200>
                                        ${detail.content}
                                    </td>
                                </tr>
                            </table>

                            <div style="display: flex; justify-content: center">
                                <input id="modify" type="button" value="수정"/> &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <input type="button" value="삭제"/> &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <input type="button" value="목록"/>
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

    //수정 클릭
    $(document).on("click", "#modify", function (e) {
        e.preventDefault();
        var height = $('#subject').css('height');
        var originWidth = $('#subject').css('width');
        var width  = originWidth.split(".")[0] - 61 + "px";

        Swal.fire({
            title: '공지사항 수정',
            text: '공지사항을 수정하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                $('#detailBody').children().remove();
                $('#detailBody').append(
                     '<h1 itemprop="headline" style="vertical-align: text-bottom;">'
                    +'<img src="http://drive.google.com/uc?export=view&id=1rNujOwPH73iMFcEA-gEQoWKlwPhXPGVz"'
                    + 'width="50px"' + 'height="50px"'
                    + ' style="display: inline-block; box-sizing: border-box;'
                    + 'margin-bottom:10px; margin-right: 10px; border-radius: 50%; vertical-align: middle;"></span>'
                    + '<input style="width: 80%; height: '+ height +'; padding-top : 2%; border: none; font-size : 28px;" value = "'+ "${detail.subject}" +'"/>'
                    + '</h1> <table> <tr> <td colspan="4" class="text-left" valign="top" height=200>'
                    + '${detail.content}'
                    + '</td> </tr> </table> <div style="display: flex; justify-content: center">'
                    + '<input id="modify" type="button" value="수정"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'
                    + '<input type="button" value="삭제"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'
                    + '<input type="button" value="목록"/> </div>'
                )
            }
        })

        /*
                    if (result.isConfirmed) {
                $.ajax({
                    url: "modifyAdminNoitce.do",
                    dataType: "json",
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
        */
    });
</script>
</html>



