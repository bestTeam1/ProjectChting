<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>이벤트 - 상세보기</title>
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
                        <section>
                            <h2 id="subject" style="vertical-align: text-bottom;">
                                <img src="http://drive.google.com/uc?export=view&id=1rNujOwPH73iMFcEA-gEQoWKlwPhXPGVz"
                                     width="50px" height="50px"
                                     style="display: inline-block; box-sizing: border-box;
                                       margin-bottom:10px; margin-right: 10px; border-radius: 50%; vertical-align: middle;"></span>
                                <c:choose>
                                    <c:when test="${event.enabled eq 1}">
                                        <td>(진행중)</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>(종료)</td>
                                    </c:otherwise>
                                </c:choose>
                                ${event.subject}
                            </h2>
                        </section>
                        <section>
                            <p>이벤트 시작일 : <c:out value="${event.startdate}"/></p>
                            <p>이벤트 종료일 : <c:out value="${event.enddate}"/></p>
                        </section>
                        <c:if test="${!empty event.file}">
                            <div class="content align-center">
                                <img id="preview" src="../upload/event/${event.file}"
                                     width="300">
                            </div>
                        </c:if>
                        <section>
                            <table>
                                <tr>
                                    <td colspan="4" class="text-left" valign="top" height=200>
                                        ${event.content}
                                    </td>
                                </tr>
                            </table>
                            <div style="display: flex; justify-content: center">
                                <input id="back" type="button" value="목록"/>
                            </div>
                        </section>
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

    //목록 클릭
    $(document).on("click", "#back", function (e) {
        e.preventDefault();

        window.location.href = "${pageContext.request.contextPath}/evnent/adminEvent.do?page=${page}";
    });
</script>
</html>



