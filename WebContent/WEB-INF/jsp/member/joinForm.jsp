<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>joinForm</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/member.css"/>
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
<body>
	<div class="container">
		<div class="join_container">
			<div class="member_logo"><img src="${contextPath}/img/logo.png" height="40px"></div>
			<form action="joinMember" method="post" id="joinMemberForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="member_id">
					<p>ID</p>
					<input type="text" name="mId" id="mId">
					<span id="mIdCheckSentence"></span>
				</div>
				<div class="member_pw">
					<p>PASSWORD</p>
					<input type="password" name="mPw">
				</div>
				<div class="member_btn_div">
					<input type="submit" value="SIGN UP">
				</div>
			</form>
		</div>
	</div>
</body>
</html>