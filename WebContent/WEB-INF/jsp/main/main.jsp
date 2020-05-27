<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>DoDo</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main.css"/>
<body>
	<div class="container">
		<img src="${contextPath}/img/logo.png" height="40px">
		<input type="button" value="SIGN IN" onclick="location.href='member/login'">
		<input type="button" value="SIGN UP" onclick="location.href='member/join'">
	</div>
</body>