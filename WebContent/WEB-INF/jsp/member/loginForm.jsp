<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>loginForm</title>
</head>
<body>
	<form action="login" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		아이디<input type="text" name="mId">
		비밀번호<input type="password" name="mPw">
		<input type="submit" value="로그인">
		<input type="button" value="가입" onclick="location.href='join'">
	</form>
</body>
</html>