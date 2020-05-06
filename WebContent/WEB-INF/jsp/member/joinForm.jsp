<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
<script type="text/javascript">
	$(function() {
		$("#mId").on("blur", function() {
			var mId = $("#mId").val();
			
			if (mId == "") {
				$("#mIdCheckSentence").text("아이디를 입력해주세요.");
			} else {
				$.ajax({
					url : "${contextPath}/member/checkDuplication",
					data : {"mId" : mId},
					dataType : "json",
					success : function(result) {
						if (result) {
							$("#mIdCheckSentence").text("이미 사용중인 아이디입니다.");
						} else {
							$("#mIdCheckSentence").text("멋진 아이디네요!");
						}
					}
				})
			}
			return false;
		})
	})
</script>
</head>
<body>
	<form action="joinMember" method="post" id="joinMemberForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		아이디<input type="text" name="mId" id="mId">
		<span id="mIdCheckSentence"></span>
		비밀번호<input type="password" name="mPw">
		<input type="submit" value="가입">
	</form>
</body>
</html>