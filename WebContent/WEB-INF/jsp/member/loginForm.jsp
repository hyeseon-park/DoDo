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
					<input type="text" name="mId" class="id">
					<span class="id_sentence"></span>
				</div>
				<div class="member_pw">
					<p>PASSWORD</p>
					<input type="password" name="mPw" class="pw">
					<span class="pw_sentence"></span>
				</div>
				<div class="member_btn_div">
					<input type="submit" value="SIGN IN" class="sign_in_btn">
					<input type="button" value="SIGN UP" onclick="location.href='join'">
				</div>
				
				<script type="text/javascript">
					$(".id").on("blur", function() {
						var id = $(".id").val();
						
						if (id == "") {
							$(".id_sentence").text("Please enter your ID.");
							$(".sign_in_btn").prop('disabled', true);
						} else {
							$(".id_sentence").empty();
							$(".sign_in_btn").prop('disabled', false);
						}
						return false;
					})
					$(".pw").on("blur", function() {
						var pw = $(".pw").val();
						
						if (pw == "") {
							$(".pw_sentence").text("Please enter your password.");
							$(".sign_in_btn").prop('disabled', true);
						} else {
							$(".pw_sentence").empty();
							$(".sign_in_btn").prop('disabled', false);
						}
						return false;
					})
				</script>
			</form>
		</div>
	</div>
</body>
</html>