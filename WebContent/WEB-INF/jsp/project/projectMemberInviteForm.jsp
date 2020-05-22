<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath }/css/header.css" />
<link rel="stylesheet" type="text/css" href="${contextPath }/css/projectForm.css" />
<title>DoDo</title>

<script type="text/javascript">
$(function(){
	$(".invite_member_btn").attr("disabled", true);
	
	$(".reset_btn").on("click",function(){
		$(".search_member_id").val("");
		$(".reset_btn").hide();
		$(".invite_member_btn").attr("disabled", true);
	});
	
	$(".search_member_id").on("keyup", function() {
		var keyword = $(".search_member_id").val();
		var pNum = $(".pNum").val();
		if (keyword == "") {
		}else{
			$.ajax({
				url : "${contextPath}/project/searchMemberList",
				data : {"keyword":keyword,"pNum":pNum},
				type : "get",
				dataType : "json",
				success : function(mList){
					$(".search_member_list_container li").remove();
					$(".search_member_list_container").show();
					if(mList.length>0){
						for(var i in mList){
							var li = $("<li class='search_member_list'>");	
							li.text(mList[i].mId);
							(function(m) {
								li.on("click", function(){
									$(".search_member_id").val(mList[m].mId);
									$(".inviteMemberTo").val(mList[m].mNum);
									$(".search_member_list_container").hide();
									$(".invite_member_btn").attr("disabled", false);
									$(".reset_btn").show();
								});
							})(i)
							$(".search_member_list_container").append(li);
						}
					}else{
						var li = $("<li class='no_search_member_list'>");						
						li.text("no result");
						$(".search_member_list_container").append(li);
					}
				}
			});
		}
	});
	

});

</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header.jsp"%>
	<div class="container">
		<div class="form_container project_member_invite_container">
			<h5><i class="far fa-envelope form_container_icon"></i><br><span class="form_container_msg">Invite a collaborator to Project!</span></h5>
			<form action="inviteProjectMember" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="aMemberFrom" value="${member.mNum}">
				<input type="hidden" name="aMemberTo" class="inviteMemberTo">
				<input class="pNum" type="hidden" name="pNum" value="${projectNum}">
				<input class="search_member_id" autocomplete="off" type="text" placeholder="Find a collaborator!">
				<div class="reset_btn"><i class="far fa-times-circle"></i></div>
				<ul class="search_member_list_container"></ul>
				<input class="invite_member_btn" type="submit" value="invite">
			</form>
		
		</div>
			
	</div>
	
</body>
</html>