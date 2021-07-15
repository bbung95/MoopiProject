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

$(function(){
	//alert("페이지 로드 완료");
	$.ajax( 
			{
				url : "/moim/json/checkMember/${user.userId}/${moim.mmNo}",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					//alert(JSONData.memberRole);
					if(JSONData.memberRole == 1){
						//alert('일반멤버');
						$("#choose").text('승인대기중');
					}else if(JSONData.memberRole == 5){
						$("#choose").text('가입불가(블랙회원)');
					}else if(JSONData.memberRole >= 2 && JSONData.memberRole <= 4){
						$("#choose").text('탈퇴하기');
					}else{
						$("#choose").text('가입하기');
					}
					
				}
		}); //ajax 종료
});


function fncUptMoimView(mmNo){
	alert("모임수정");
	self.location ="/moim/updateMoimView?mmNo="+mmNo
}

function fncApply(mmNo){
	alert("가입하기");
	alert("가입신청이 완료되었습니다.")
	self.location ="/moim/applyMoim?userId=${user.userId}&mmNo="+mmNo
}

function fncApplyList(mmNo){
	alert("가입신청목록보기");
	self.location ="/moim/listMember?status=1&mmNo="+mmNo
}

function fncListMember(mmNo){
	alert("유저목록보기");
	self.location ="/moim/listMember?status=2&mmNo="+mmNo
}

function fncListMeeting(mmNo){
	alert("정모일정보기");
	self.location ="/meeting/listMeeting?userId=${user.userId}&mmNo="+mmNo
}



</script>





</head>
<style>
	body{
		padding-top: 50px;
	}
</style>
<body>

<!-- ToolBar Start ///////////////////////////////////// -->
<jsp:include page="../layout/toolbar.jsp" flush="false"/>
<jsp:include page="../layout/moimToolbar.jsp" flush="false"/>

<!-- ToolBar End /////////////////////////////////////-->
<h3>모임상세페이지입니다...${user.userId}님 오랜만입니다...</h3>


//////////////////////////
<p>모임넘버:${moim.mmNo}</p>
<p>모임명:${moim.mmName}</p>
<p>모임소개글:${moim.mmContent}</p>
<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모임대표썸네일</strong></div>
			<div class="col-xs-8 col-md-4">
			<!--<img src="${pageContext.request.contextPath}/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  -->
			<img src="/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  
			</div>
		</div>
<p>모임가입정원:${moim.mmMaxCount}</p>
<p>모임현재정원:${moim.mmCurrentCount}</p>
<p>모임생성자:${moim.mmConstructor.userId}</p>
<p>모임생성일:${moim.mmRegDate}</p>
<p>모임관심사No:${moim.mmInterest}</p>
<p>모임거주지:${moim.mmAddr}</p>
<p>모임무피상태(1공개2비공개):${moim.mmState}</p>
<p>모임최소가입연령:${moim.mmMinAge}</p>
<p>모임최대가입연령:${moim.mmMaxAge}</p>
<p>모임가입유형(1일반2자유):${moim.mmType}</p>
<c:if test = "${user.userId eq moim.mmConstructor.userId}">
<button type="button" class="btn btn-default" onClick="fncUptMoimView(${moim.mmNo})">소모임정보수정</button>
<button type="button" class="btn btn-default" onClick="fncApplyList(${moim.mmNo})">가입신청목록보기</button>
</c:if>
<jsp:include page="../layout/searchbar.jsp"></jsp:include>

</body>
</html>