<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
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
	<div id="tempDiv">
		<p>userid : ${pageContext.request.userPrincipal.name}</p>
	</div>
	<ul class="icons">
		<li>
			<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_GUEST')">
				<a href="${pageContext.request.contextPath}/logout">
					<div class="icon button small">로그아웃</div>
				</a>
			</se:authorize>
			<se:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_GUEST')">
				<a href="${pageContext.request.contextPath}/login">
					<div class="icon button small">로그인</div>
				</a>
			</se:authorize>
		</li>
		<li><a href="#" class="icon brands fa-twitter"><span
				class="label">Twitter</span></a></li>
		<li><a href="#" class="icon brands fa-facebook-f"><span
				class="label">Facebook</span></a></li>
		<li><a href="#" class="icon brands fa-snapchat-ghost"><span
				class="label">Snapchat</span></a></li>
		<li><a href="#" class="icon brands fa-instagram"><span
				class="label">Instagram</span></a></li>
		<li><a href="#" class="icon brands fa-medium-m"><span
				class="label">Medium</span></a></li>
	</ul>
</header>