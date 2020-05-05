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
	
	$("#keyword").on("keydown", function() {
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
		<input type="text" name="keyword" id="keyword">
		<input type="submit" value="submit">
	</form>
	<ul class="memberlist">
	</ul>
</body>
</html>