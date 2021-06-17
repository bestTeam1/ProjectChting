<%--
  Created by IntelliJ IDEA.
  User: YeongHeo
  Date: 2021-06-13(011)
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${groupInterest}
<html>
<head>
    <title>모임관심사 선택</title>
</head>
<body>
    <div>
        <form method="get" action="">
            <table>
                <tr>
                    <td>관심사 선택</td>
                    <td>
                        <select id="groupCategory" style="width: 30%; float:left;">
                            <option value="">선택</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
<script>
    /*지역카테고리 체크 시*/
/*    $(document).ready(function () {
        <c:forEach items="${groupInterest}" var="interest">
        (function () {
            $('#groupCategory').append('<option value="${interest.catename}">${interest.catename}</option>');
        })();
        </c:forEach>
    });*/
</script>
</html>
