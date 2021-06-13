<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Editorial by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <%--  Sweet Alert2  --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <%--  J Query  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
                <div class="content">
                    <header>
                        <form method="post" action="">
                            <table>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="vertical-align: middle">프로필</td>
                                                <td>
                                                    프로필 사진 불러와야 함
                                                </td>
                                            </tr>

                                            </tr>
                                            <tr>
                                                <td style="vertical-align: middle">자기소개</td>
                                                <td><textarea style="resize: none;" name="bbs_content" cols="50" rows="5"name="content"
                                                              placeholder="100자 이내로 기입해주세요 :)"
                                                              onfocus="this.placeholder = ''"
                                                              onblur="this.placeholder = '100자 이내로 기입해주세요 :)'"></textarea></td>
                                            </tr>

                                            <tr>
                                                <td style="vertical-align: middle">관심사</td>
                                                <td>
                                                    <ol>
                                                        <ul class="a">
                                                            <c:forEach var="userInterest" items="${userInfo.userInterest}">
                                                                <div class="circle_interest">
                                                                        ${userInterest.s_catename}
                                                                </div>
                                                            </c:forEach>
                                                            <input type="button" class="button small" value="추가">

                                                        </ul>
                                                    </ol>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="vertical-align: middle">지역</td>
                                                <td>
                                                    <select id="areaCategory"  style="width: 30%; float:left;">
                                                        <option value="">선택</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="vertical-align: middle">가입한 모임</td>
                                                <td>
                                                    <ol>
                                                        <ul class="a">
                                                            <c:forEach var="userJoinGroup" items="${userInfo.userJoinGroup}">
                                                            <li>
                                                                ${userJoinGroup.group_name}
                                                            </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </ol>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="vertical-align: middle">결제</td>
                                                <td>
                                                    <ol>
                                                        <ul class="a">
                                                            <li>최대 3개의 모임에만 참여 가능합니다.</li>
                                                            <li>참여 개수를 늘리고 싶으시면 유료결제를 이용해 주세요. &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <input type="button" class="button small" value="결제하기">
                                                            </li>
                                                        </ul>
                                                    </ol>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </header>
                </div>
            <input type="button" value="수정 완료" id="userUpdate">
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

<script type="text/javascript">

    $().ready(function () {
        <c:forEach items="${areaList}" var="area">
        (function () {
            $('#areaCategory').append('<option value="${area.area_name}">${area.area_name}</option>');
        })();
        </c:forEach>
    });

</script>
</body>
</html>