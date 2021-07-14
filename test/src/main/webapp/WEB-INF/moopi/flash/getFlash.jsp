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

function fncApplyList(flashNo){
	alert("번개신청목록");
	self.location ="/flash/addFlashView?userId=user01"
}

</script>



</head>
<body>

<!-- ToolBar Start ///////////////////////////////////// -->
<jsp:include page="../layout/toolbar.jsp" flush="false"/>
<jsp:include page="../layout/flashToolbar.jsp" flush="false"/>

<!-- ToolBar End /////////////////////////////////////-->
<h3>번개무피 상세 페이지!</h3>


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
<button type="button" class="btn btn-default" onClick="fncAddFlashView(${flash.flashNo})">번개참여신청목록보기</button>

</body>
</html>