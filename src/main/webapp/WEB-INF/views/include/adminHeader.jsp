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
	<%--
	만든이 이승준
	나중에 /admin/Notice.do 이런식으로 url패턴 변경고려중
	--%>
	<ul class="icons">
		<li><a href="adminIndex.do"><span class="label">통계</span></a></li>
		<li><a href="adminNotice.do"><span class="label">공지사항</span></a></li>
		<li><a href="adminEvent.do"><span class="label">이벤트</span></a></li>
		<li><a href="adminUserManagement.do"><span class="label">회원관리</span></a></li>
		<li><a href="adminGroupManagement.do"><span class="label">모임관리</span></a></li>
	</ul>
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