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
    <!-- DB Object -->
    <c:set var="arealist" value="${requestScope.areaList}" />
    <!-- Social Object -->
    <c:set var="google_photo" value="${pageContext.request.getAttribute('picture')}" />
    <c:set var="kakao_photo" value="${pageContext.request.getAttribute('properties').thumbnail_image}" />
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
            <c:set var="userinfo" value="${userInfo.userInfoBasic}" />
            <div class="content">
                <form method="post" action="" enctype="multipart/form-data">
                    <div id="tableWrap" style="padding: 1%;">
                        <table>
                            <tr>
                                <td style="vertical-align: middle">프로필</td>
                                <td><br>
                                    <c:choose>
                                        <c:when test="${not empty google_photo}">
                                            <img id="preview" src="${google_photo}" width="150" alt="프로필 이미지가 보여지는 영역">
                                        </c:when>
                                        <c:when test="${not empty kakao_photo}">
                                            <img id="preview" src="${kakao_photo}" width="150" alt="프로필 이미지가 보여지는 영역">
                                        </c:when>
                                        <c:otherwise>
                                            <img id="preview" src="https://cdn0.iconfinder.com/data/icons/communication-line-10/24/account_profile_user_contact_person_avatar_placeholder-512.png"
                                                 width="150" alt="프로필 이미지가 보여지는 영역">
                                        </c:otherwise>
                                    </c:choose>
                                    <hr>
                                    <input type="file" id="fileName" name="fileName" class="fileName" accept="image/*">
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
                                                <div class="circle_user_interest">
                                                        ${userInterest.catename}
                                                </div>
                                            </c:forEach>
                                            <input type="button" class="button small" value="추가"
                                                   onclick="window.open('categoryChoice.do', 'categoryChoice', 'width=600, height=600, left=100, top=50');">
                                        </ul>
                                    </ol>

                                </td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle">선호 지역 1</td>
                                <td>
                                    <select id="area1" name="area1" style="width: 30%; float:left;" required>
                                        <option value="" disabled selected> - 선택하세요 - </option>
                                        <c:forEach var="area1" items="${areaList}">
                                            <option value="${area1.code}">${area1.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle">선호 지역 2</td>
                                <td>
                                    <select id="area2" name="area2" style="width: 30%; float:left;">
                                        <option value="" disabled selected> - 선택하세요 - </option>
                                        <c:forEach var="area2" items="${areaList}">
                                            <option value="${area2.code}">${area2.name}</option>
                                        </c:forEach>
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

    $(function () {
        $('#content').change(function () {
            let updateContent = $('#content').val();
            console.log(updateContent);
        })



    });

</script>
</body>
</html>