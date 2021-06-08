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
	<!-- logo -->
	<div class="logo" style="height: 70px;">

		<div id="logo-left" style="min-width: 50%; max-height: inherit; float: left;">
			<a href="${pageContext.request.contextPath}/index.do">
				<img src="${pageContext.request.contextPath}/images/chting_logo.png" alt=""
					 id="chtingLogo" width="27%" style="padding: 2% 0 2% 0">
			</a>
		</div>
		<div id="logo-right" style="min-width: 50%; max-height: inherit; text-align: right; float: left;">
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
	}

	function loginListener() {
		$('#loginModal').modal({
			escapeClose: false,
			clickClose: false,
			//showClose: false,
			closeExisting: false
		});
	}
</script>