<%--
  Created by IntelliJ IDEA.
  User: ssyy
  Date: 2021/06/05
  Time: 7:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="loginModal" class="modal">
    <div id="modalWrap">
        <div id="modalTitle">
            <img src="${pageContext.request.contextPath}/images/chting_logo.png" alt="" id="loginLogo">
            <hr>
            <div id="modalBody">
                <a href="${pageContext.request.contextPath}/auth/KAKAO" id="kakaoLoginBtn">
                    <img src="${pageContext.request.contextPath}/images/btn_img/kakao_login_medium_narrow.png" alt="">
                </a>

            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function(){
        let kakaoLogin = document.getElementById('kakaoLoginBtn');
        kakaoLogin.addEventListener("click", kakaoLoginFunc);
    }

    function kakaoLoginFunc(){
        window.open("${pageContext.request.contextPath}/auth/KAKAO","카카오 로그인","width=700,height=800");
    }
</script>
