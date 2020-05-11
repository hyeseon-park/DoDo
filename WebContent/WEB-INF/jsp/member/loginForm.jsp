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
					<p>ID</p>
					<input type="text" name="mId">
				</div>
				<div class="member_pw">
					<p>PASSWORD</p>
					<input type="password" name="mPw">
				</div>
				<div class="member_btn_div">
					<input type="submit" value="SIGN IN">
					<input type="button" value="SIGN UP" onclick="location.href='join'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>