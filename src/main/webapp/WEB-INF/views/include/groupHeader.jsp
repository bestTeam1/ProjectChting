<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	body, div, table, section, nav, li, header, input{
		font-family: 'Jua', sans-serif;
	}
</style>
<!-- css -->
<link rel="stylesheet" href="assets/css/main.css" />

<!-- Header -->
<header id="header">
	<ul class="icons">
		<li><a id="groupJoin" href="#"><span class="label">가입신청관리</span></a></li>
		<li><a id="groupMemberManage" href="#"><span class="label">멤버관리</span></a></li>
		<li><a id="groupBlackListManage" href="#"><span class="label">블랙리스트</span></a></li>
		<li><a id="groupDisband" href="#"><span class="label">모임해산</span></a></li>
	</ul>

	<form style="display: none" action="" method="POST" id="userid">
		<input type="hidden" name="userid" value="${sessionScope.get("userData").userid}"/>
	</form>
</header>
<script type="text/javascript">

	//클릭버튼에따라서 action 속성 부여후 POST 전송

	$(document).on("click", "#groupJoin", function () {
		$("#userid").attr("action", "groupJoin.do");
		$("#userid").submit();
	});

	$(document).on("click", "#groupMemberManage", function () {
		$("#userid").attr("action", "groupMemberManage.do");
		$("#userid").submit();
	});

	$(document).on("click", "#groupBlackListManage", function () {
		$("#userid").attr("action", "groupBlackListManage.do");
		$("#userid").submit();
	});

	$(document).on("click", "#groupDisband", function () {
		$("#userid").attr("action", "groupDisband.do");
		$("#userid").submit();
	});

</script>