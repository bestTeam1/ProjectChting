<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
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
            <header>
                <div>
                    <br>
                    <h3>Sign Up</h3>
                    <br>
                    <p style="font-size: smaller">data : ${pageContext.request.getAttribute("data")}</p>
                </div>
            </header>
            <div class="content">
                <form method="post" action="">
                    <div id="tableWrap" style="padding: 1%;">
                        <table>
                            <tr>
                                <td style="vertical-align: middle">프로필</td>
                                <td>
                                    <img src="${pageContext.request.getAttribute("picture")}">
                                    <img src="${pageContext.request.getAttribute("properties").thumbnail_image}">
                                </td>
                            </tr>

                            </tr>
                            <tr>
                                <td style="vertical-align: middle">자기소개</td>
                                <td><textarea style="resize: none;" name="bbs_content" cols="50" rows="5" name="content"
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
                                    <select id="areaCategory" style="width: 30%; float:left;">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    약관동의
                                </td>
                                <td>
                                    aaaaa
                                    <input type="hidden" name="userid" value="">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
            <input type="button" value="시작하기" id="signUp">
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