<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- css -->
<link rel="stylesheet" href="assets/css/main.css" />
<style>
	#modalWrap {
		width: 57%;
		height: 300px;
		margin: 0 auto;
		padding: 50px 0 20px 0;
		flex-wrap: wrap;
		align-content: center;
	}

	#modalBody {
		width: 70%;
		padding: 20px 0 0 0;
		margin: auto;
	}

</style>

<!-- Header -->
<header id="header">
	<jsp:include page="login_modal.jsp"/>
	<div class="logo" style="width: 100%;">
		<div id="logo-left" style="min-width: 50%; min-height: inherit; float: left; display: block;">
			<a href="${pageContext.request.contextPath}/index.do">
				<img src="${pageContext.request.contextPath}/images/chting_logo.png" alt=""
					 id="chtingLogo" width="27%" style="padding: 2% 0 2% 0">
			</a>
		</div>
		<div id="logo-right" style="min-width: 50%; min-height: inherit; float: left; text-align: right; display: block;">
			<a href="#" id="loginBtn">
				<div class="button" style="margin: 3% 0 3% 0; ">Login</div>
			</a>
		</div>
	</div>

</header>
<script>
	window.onload = function () {
		let login = document.getElementById('loginBtn');
		login.addEventListener('click', loginListener);

		$("#kakaoLoginBtn").click(function(){
			$.ajax({
				url: https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b74ea6ac4d206b99a1c236e0f732f202&redirect_uri=http://localhost:8090/chting_war_exploded/index.do&prompt=none,

			});
		});

	}

	function loginListener() {
		$('#loginModal').modal({
			escapeClose: false,
			clickClose: false,
			//showClose: false,
			closeExisting: false
		});
	}

	function kakaoLogin(){
		$("#kakaoLoginBtn").click(function(){
			console.log('kakaoclick');
		});
	}
</script>