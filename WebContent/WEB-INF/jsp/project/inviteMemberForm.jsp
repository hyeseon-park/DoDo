<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/head.jsp" %>
<title>Insert title here</title>
<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
%>
<script type="text/javascript">
$(function(){
	
	$("#keyword").on("keyup", function() {
		$(".memberlist li").remove();
		var keyword = $("#keyword").val();
		if (keyword == "") {
		}else{
			$.ajax({
				url : "${contextPath}/project/searchMemberList",
				data : {"keyword":keyword},
				type : "get",
				dataType : "json",
				success : function(mList){
					if(mList.length>0){
						for(var i in mList){
							var li = $("<li>");	
							li.text(mList[i].mId);
							(function(m) {
								li.on("click", function(){
									$("#keyword").val(mList[m].mId);
									$(".inviteMemberTo").val(mList[m].mNum);
								});
							})(i)
							$(".memberlist").append(li);
						}
					}else{
						var li = $("<li>");						
						li.text("no result");
						$(".memberlist").append(li);

					}
					
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});//end ajax
			
		}
		
	});
	
});

</script>
</head>
<body>
	<form action="inviteMember" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="aMemberFrom" value="${member.mNum}">
		<input type="hidden" name="aMemberTo" class="inviteMemberTo">
		<input type="hidden" name="pNum" value="${projectNum}">
		<input type="text" id="keyword">
		<input type="submit" value="submit">
	</form>
	<ul class="memberlist">
	</ul>
</body>
</html>