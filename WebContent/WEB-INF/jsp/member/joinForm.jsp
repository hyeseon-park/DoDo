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
				$("#mIdCheckSentence").text("Please enter your ID.");
			} else {
				$.ajax({
					url : "${contextPath}/member/checkDuplication",
					data : {"mId" : mId},
					dataType : "json",
					success : function(result) {
						if (result) {
							$("#mIdCheckSentence").text("This ID is already in use.");
							$(".member_btn_div input").prop('disabled', true);
						} else {
							$("#mIdCheckSentence").text("That's a great ID!");
							$(".member_btn_div input").prop('disabled', false);
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
					<input type="password" name="mPw" class="pw">
				</div>
				<div class="member_pw_check">
					<p>PASSWORD CHECK</p>
					<input type="password" name="mPwCheck" class="pw_check">
					<span class="pw_check_sentence"></span>
				</div>
				
				<script type="text/javascript">
					$(".pw_check").on("blur", function() {
						var pw = $(".pw").val();
						var pwCheck = $(".pw_check").val();
						
						if (pw != pwCheck) {
							$(".pw_check_sentence").text("Passwords do not match.");
							$(".member_btn_div input").prop('disabled', true);
						} else {
							$(".pw_check_sentence").text("Passwords match.");
							$(".member_btn_div input").prop('disabled', false);
						}
						return false;
					})
				</script>
				
				<div class="member_btn_div">
					<input type="submit" value="SIGN UP">
				</div>
			</form>
		</div>
	</div>
</body>
</html>