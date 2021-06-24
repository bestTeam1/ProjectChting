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
		<li><a id="groupJoin" href="groupJoin.do?userid=${sessionScope.get("userData").userid}"><span class="label">가입신청관리</span></a></li>
		<li><a id="groupMemberManage" href="groupMemberManage.do?userid=${sessionScope.get("userData").userid}"><span class="label">멤버관리</span></a></li>
		<li><a id="groupDisband" href="groupDisband.do?userid=${sessionScope.get("userData").userid}"><span class="label">모임해산</span></a></li>
	</ul>

	<form style="display: none" action="" method="POST" id="userid">
		<input type="hidden" name="userid" value="${sessionScope.get("userData").userid}"/>
	</form>
</header>
<script type="text/javascript">

	//로그인체크 (백단에서 못막았을 경우)
	$(function(){
		var check = '${sessionScope.get("userData").userid}';
		if( check == null || check =="" || check == undefined ) {
			Swal.fire({
				title: '오류',
				text : '로그인을 해주세요!!'
			}).then(() => {
				history.go(-1);
			})
		}
	});


</script>