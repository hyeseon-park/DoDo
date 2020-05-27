<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>DoDo</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main.css"/>
<body>
	<div class="container">
		<div class="main_container">
			<div class="main_logo">
				<img src="${contextPath}/img/logo.png">
			</div>
			<p class="main_sentence">가볍고 간편하고 손쉬운 할 일 관리, DoDo와 함께 하세요!</p>
			<div>
				<input type="button" value="SIGN IN" class="sign_in_btn" onclick="location.href='member/login'">
				<input type="button" value="SIGN UP" class="sign_up_btn" onclick="location.href='member/join'">
			</div>
			
		</div>
	</div>
</body>