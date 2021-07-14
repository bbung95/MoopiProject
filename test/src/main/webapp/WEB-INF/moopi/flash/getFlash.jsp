<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="/images/uploadFiles" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script>
function fncUpdateFlashView(flashNo){
	alert("모임수정");
	self.location ="/flash/updateFlashView?flashNo="+flashNo
}

function fncJoinFlash(flashNo){
	alert("번개참여");
	alert("번개참여완료!");
	self.location ="/flash/joinFlash?userId=user02&flashNo="+flashNo
}


function fncGetJoinFlashList(flashNo){
	
		
	$.ajax(
			{
				url : "/flash/json/getJoinFlashList/"+flashNo ,
				method : "GET" ,
				type : "text" ,
				//headers : {
				//	"Accept" : "application/json",
				//	"Content-Type" : "application/json"
				//}
				success : function(JSONData , status) {
					//Debug...
					alert("로딩중..");
					//Debug...
					console.log(JSONData.list[0].meflId.userId);
					
					var displayValue = "<h3>"
										+"유저아이디	: "+JSONData.list[0].meflId.userId+"<br/>"
										+"닉네임 		: "+JSONData.list[0].meflId.nickname+"<br/>"
										+"주소 		: "+JSONData.list[0].meflId.addr+"<br/>"
										+"프로필이미지 : "+JSONData.list[0].meflId.profileImage+"<br/>"
										+"뱃지   	   : "+JSONData.list[0].meflId.badge+"<br/>"
										+"타겟넘버   : "+JSONData.list[0].targetNo+"<br/>"
										+"참여일자   : "+JSONData.list[0].joinRegDate+"<br/>"
										+"조인상태   : "+JSONData.list[0].joinState+"<br/>"
										+"</h3>";
										
					//Debug...	
					//alert(displayValue);
					$("h3").remove();
					$( ".cal" ).append(displayValue);
					
				}	
		
	  });
	
	
};


</script>



</head>
<body>

<!-- ToolBar Start ///////////////////////////////////// -->
<jsp:include page="../layout/toolbar.jsp" flush="false"/>
<jsp:include page="../layout/flashToolbar.jsp" flush="false"/> 

<!-- ToolBar End /////////////////////////////////////-->
<h3>번개무피 상세 페이지!</h3>
<div class="cal">

</div>

//////////////////////////
<p>번개넘버:${flash.flashNo}</p>
<p>번개무피명:${flash.flashName}</p>
<p>번개소개글:${flash.flashContent}</p>
<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>번개무피 썸네일</strong></div>
			<div class="col-xs-8 col-md-4">
			<!--<img src="${pageContext.request.contextPath}/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  -->
			<img src="/images/uploadFiles/${flash.flashFile}" width="200" height="200 "/>  
			</div>
		</div>
<p>번개정원:${flash.flashMaxCount}</p>
<p>번개현재인원:${flash.flashCurrentCount}</p>
<p>모임생성자:${flash.flashConstructor.userId}</p>
<p>번개생성일:${flash.flashRegdate}</p>
<p>모임관심사No:${flash.flashInterest}</p>
<p>번개장소:${flash.flashAddr}</p>
<p>번개무피상태(1모집중2모집완료):${flash.flashState}</p>
<p>번개무피 만남시간:${flash.flashTime}</p>

<button type="button" class="btn btn-default" onClick="fncUpdateFlashView(${flash.flashNo})">번개정보수정</button>
<button type="button" class="btn btn-default" onClick="fncGetJoinFlashList(${flash.flashNo})">번개참여신청목록보기</button>
<button type="button" class="btn btn-default" onClick="fncJoinFlash(${flash.flashNo})">번개참여하기</button>

</body>
</html>