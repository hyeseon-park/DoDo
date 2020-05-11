<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>loginForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/member.css"/>
<body>
	<div class="container">
		<div class="login_container">
			<div class="member_logo"><img src="${contextPath}/img/logo.png" height="40px"></div>
			
			<form action="login" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="member_id">
					<p>아이디</p>
					<input type="text" name="mId">
				</div>
				<div class="member_pw">
					<p>비밀번호</p>
					<input type="password" name="mPw">
				</div>
				<div class="member_btn_div">
					<input type="submit" value="로그인">
					<input type="button" value="가입" onclick="location.href='join'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>