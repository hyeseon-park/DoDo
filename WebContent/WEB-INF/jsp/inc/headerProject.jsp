<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="member" value="<%=request.getSession().getAttribute(\"member\")%>" />

<script>

var sock;
var stompClient;
var msgInfo;

$(function(){
	socketConnect();
	getAlarmList();
	
	
}); //onload function end

function socketConnect(){
	sock = new SockJS("/alarm");
	stompClient = Stomp.over(sock);
	stompClient.connect({},function(){
		stompClient.subscribe("/category/invite/"+${member.mNum}, function(alarm){
			alarmInfo = JSON.parse(alarm.body);
		})
	});
}

function getAlarmList(){
	$.ajax({
		url : "${contextPath}/project/showAlarmList",
		data : {"mNum":${member.mNum}},
		dataType : "json",
		success : function(alarmList){
			if(alarmList!=""){
				$.each(alarmList,function(idx,alarm){
					drawAlarmList(alarm);
				});
				
			}else{
				
			}
		},
		error : function(){
			alert("alarmList 불러오기 실패!");
		}
		
	});
}

function drawAlarmList(alarm){
	var alarmArea = $(".alarmArea");
	var alarmInfo = $("<div>");
	var alarmMsg = $("<p>");
	var acceptBtn = $("<button>수락</button>");
	var rejectBtn = $("<button>거절</button>");
	
	
	alarmMsg.text(alarm.mId + "님이 " + alarm.pTitle + "에 초대하셨습니다.");
	alarmInfo.append(alarmMsg);
	
	var acceptBtn = $("<button>수락</button>");
	var rejectBtn = $("<button>거절</button>");
	
	alarmInfo.append(acceptBtn);
	alarmInfo.append(rejectBtn);

	acceptBtn.on("click", function(){
		accectInvite(alarm.aNum, alarm.pNum, alarm.aMemberTo);
	});
	
	
	acceptBtn.on("click", function(){
		rejectInvite(alarm.aNum, alarm.pNum, alarm.aMemberTo);
	});
	
	alarmArea.append(alarmInfo);
		
}

function accectInvite(aNum, pNum, mNum){
	$.ajax({
		url : "${contextPath}/project/acceptInvite",
		data : {"aNum":aNum,"pNum":pNum, "mNum":mNum},
		dataType : "json",
		sucess: function(data){
			alert("수락!");
			$(".alarmArea *").remove();
			getAlarmList();
		
			
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
}

function rejectInvite(){
	$.ajax({
		url : "${contextPath}/project/rejectInvite",
		data : {"aNum":aNum},
		dataType : "json",
		sucess: function(data){
			$(".alarmArea").isEmpty();
			getAlarmList();
		}
	});	
	
}


</script>

<div class="projectHeader">
	<div class="alarmArea">
	
	
	</div>
</div>
