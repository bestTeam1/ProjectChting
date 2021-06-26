<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/21
  Time: 11:43 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<!-- Close Header / <head> -->
<!-- Start Work Sigle -->
<c:set var="userid" value="${sessionScope.get('userData').userid}" />

<!-- Start Board SideBar -->
<jsp:include page="board_include/board_sidebar.jsp" />
<!-- End Board SideBar -->

<section class="container">
    <div class="row justify-content-center pb-4">
        <div class="col-lg-8 mt-3">
            <div id="templatemo-slide-link-target" class="card mb-3">
                <img class="img-fluid border rounded" src="./assets/img/work-slide-04.jpg" alt="Card image cap">
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-8 ml-auto mr-auto pt-3 pb-4">
            <h2 class="objective-heading h3 mb-2 mb-sm-4 light-300"><a class="btn btn-outline-primary btn-lg" href="#">회원 <i class="bx bx-user bx-lg"></i> : ${group.join_user} 명</a></h2>
            <h5 class="objective-heading h5 mb-1 light-300"><p>👉 ${group.group_name} - 소개글 👈</p></h5>
            <p class="light-300">
                ${group.content}
            </p>
        </div>
    </div>
    <hr>
    <div class="row justify-content-center">
        <div class="col-lg-8 ml-auto mr-auto pt-3 pb-4">
            <!-- 가입하기 -->
            <div class="col-lg-8 col-12 m-lg-auto text-center">
                <input type="button" class="banner-button btn rounded-pill btn-primary btn-lg px-4 my-lg-5" id="shareBtn" value="가입하기">
            </div>
        </div>
    </div>

</section>



<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- End Footer / Script -->
<script>
    $(function(){
        openNav();
    });
</script>
</body>
</html>
