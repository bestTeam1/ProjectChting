<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: YeongHeo
  Date: 2021/06/08
  Time: 3:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>모임 만들기</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- slider -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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

        .button {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }

        .tdcenter {
            vertical-align: middle;
            margin: auto;
            text-align: center;
        }

    </style>
</head>
<body class="is-preload">
${newGroupList}

<h3>모임 만들기</h3>
<c:forEach var="group" items="${newGroupList}">
    <ul>
        <li> ${group.group_name}</li>
        <li> ${group.opendate}</li>
    </ul>
</c:forEach>

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
<%--                        <form action="">--%>
<%--                            <input type="button" id="backButton" value="돌아가기" style="float: right"/>--%>
<%--                        </form>--%>

                        <form method="post" action="">
                            <div style="text-align: right">
                            <input type="submit" id="okButton" value="완료"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" id="backButton" value="돌아가기" onClick="location.href='index.do'"/>
                            </div>
                            <br>

                            <table>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td class="tdcenter">모임 이름</td>
                                                <td><input name="title" size="50" maxlength="100" type="text"
                                                           class="form-control" name="subject" id="title"
                                                           placeholder="4 ~ 20자 이내로 기입해주세요 :)"
                                                           onfocus="this.placeholder = ''"
                                                           onblur="this.placeholder = '4 ~ 20자 이내로 기입해주세요 :)'"></td>
                                            </tr>

                                            </tr>
                                            <tr>
                                                <td class="tdcenter">모임 소개글</td>
                                                <td><textarea name="content" cols="50" rows="13"
                                                              placeholder="10 ~ 1000자 이내로 기입해주세요 :)"
                                                              onfocus="this.placeholder = ''"
                                                              onblur="this.placeholder = '10 ~ 1000자 이내로 기입해주세요 :)'"></textarea>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="tdcenter">모임 배경사진</td>
                                                <td><input type="file" class="form-control" id="customFile"
                                                           name="filename"/></td>
                                            </tr>

                                            <tr>
                                                <td class="tdcenter">지역</td>
                                                <td>
                                                    <select id="areaCategory" style="width: 30%; float:left;">
                                                        <option value="">선택</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="tdcenter">정원</td>
                                                <td>
                                                    <ul>
                                                        <br>
                                                        <li>최대 20명 모임원을 받을 수 있습니다.</li>
                                                        <li>20명 초과를 원하시면 유료결제를 이용해 주세요.</li>
                                                        <input type="button" id="payButton" value="유료결제" style="float: right" />
                                                    </ul>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdcenter">모임 관심사</td>
                                                <td align="center"><input type="button" id="interestButton"
                                                                          value="+추가" onclick="popUp()"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
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

    /*지역카테고리 체크 시*/
    $(document).ready(function () {
        <c:forEach items="${areaList}" var="area">
        (function () {
            $('#areaCategory').append('<option value="${area.area_name}">${area.area_name}</option>');
        })();
        </c:forEach>
    });

    /*완료 버튼 누를 시*/
    $(document).ready(function () {
        $("#okButton").click(function () {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: '모임 만들기에 성공하였습니다.',
                showConfirmButton: false,
                timer: 1500
            })
        });
    });


    /*돌아가기 버튼 누를 시*/
    $(document).ready(function () {
        $("#backButton").click(function () {

        });
    });

    /*유료결제 클릭 시*/
    $().ready(function () {
        $("#payButton").click(function (){

            Swal.fire({
                title: '유료결제를 진행하시겠습니까?',
                text: "",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네',
                cancelButtonText: '취소',
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: '결제페이지로 이동합니다.',
                        showConfirmButton: false,
                        timer: 1500
                    })
                }
            })
        });
    });

    function popUp(){
        let mywindow = window.open("groupMake_Popup.do","팝업창","width=1000,height=500");
    }
</script>
</html>