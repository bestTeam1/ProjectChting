<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/21
  Time: 11:45 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Start Board SideBar -->
<jsp:include page="/WEB-INF/views/board/board_include/board_sidebar.jsp"/>
<!-- End Board SideBar -->
<section class="container pt-4">
    <div class="row d-flex justify-content-center text-center align-content-center border border-primary border-3 rounded-3 mx-xl-auto my-md-4">
        <ul class="col-md-8 text-center d-flex justify-content-between align-content-center mx-lg-3 px-lg-5 mt-sm-3">
            <li class="btn btn-lg btn-primary">
                <a class="text-decoration-none text-white"
                   href="${pageContext.request.contextPath}/groupJoin.do?userid=${sessionScope.get("userData").userid}">가입신청관리</a>
            </li>
            <li class="btn btn-lg btn-primary">
                <a class="text-decoration-none text-white"
                   href="${pageContext.request.contextPath}/groupMemberManage.do?userid=${sessionScope.get("userData").userid}">멤버관리</a>
            </li>
            <li class="btn btn-lg btn-primary">
                <a class="text-decoration-none text-white"
                   href="${pageContext.request.contextPath}/groupDisband.do?userid=${sessionScope.get("userData").userid}">모임해산</a>
            </li>
        </ul>
    </div>
</section>

