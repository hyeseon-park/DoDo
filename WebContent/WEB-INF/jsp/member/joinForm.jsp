<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
</head>
<body>
	<form action="joinMember" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		아이디<input type="text" name="mId">
		비밀번호<input type="password" name="mPw">
		<input type="submit" value="가입">
	</form>
</body>
</html>