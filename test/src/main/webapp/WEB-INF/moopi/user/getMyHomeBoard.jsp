<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 마이홈보기 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>


	
<!---[프로필수정으로 이동하는 단순 컨트롤러 실행]----------------------------------------------------------------------------------------------------------------------->	

	function moveProfile(){		
		var dbUser=$('input[name=userId]').val();
		alert("id : "+id);
		location.href = "/user/updateProfile?userId="+dbUser
	}     

<!-------------------------------------------------------------------------------------------------------------------------->

</script>		
    <style>
	body{
	padding-top: 50px;
	}
	</style>
</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> 마이홈보기 </h3>
	
<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">마이홈</h1>

<!-- FORM START ---------------------------------------------------------------------------------------------------------------->
	
	<form class="form-horizontal">
	
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" name="updateProfile" class="btn btn-default" onClick="moveProfile()">프로필수정이동</button>			
		</div>
	</div>
			  
	<!-- 아이디 : hidden -->
	<input type="hidden" class="form-control" id="userId" name="userId" value="${dbUser.userId}">
			  
	<div class="form-group">
		<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">대표썸네일</label>
		<div class="col-sm-4">
		</div>
	</div>
		  
	<!-- 프로필이미지 -->
	<div class="form-group">
		<label for="profileImage" class="col-sm-offset-1 col-sm-3 control-label">프로필이미지</label>
		<div class="col-sm-4">
		<button type="text" class="form-control" id="uploadFile" name="uploadFile" placeholder="프로필이미지" readonly>${dbUser.profileImage}</button>
		</div>
	</div>
	
	<!-- 닉네임 -->
	<div class="form-group">
		<label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="nickname" name="nickname" value="${dbUser.nickname}" readonly>
		</div>
	</div>
	
	<!-- 뱃지 -->
	<div class="hidden">
		<label for="badge" class="col-sm-offset-1 col-sm-3 control-label">뱃지</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="badge" name="badge" value="${dbUser.badge}" readonly>
		</div>
	</div>
	
	<!-- 코인 : 마우스를 댈 시 잔여코인출력, 마우스를 클릭 시 결제구 -->
	<div class="form-group">
		<label for="coin" class="col-sm-offset-1 col-sm-3 control-label">코인</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="coin" name="coin" value="${dbUser.coin}" readonly>
		</div>
	</div>
	
	<!-- 프로필소개 -->
	<div class="form-group">
		<label for="profileContent" class="col-sm-offset-1 col-sm-3 control-label">프로필소개</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="profileContent" name="profileContent" value="${dbUser.profileContent}" readonly>
		</div>
	</div>
	
	<!-- 가입한 모임무피 -->
	<div class="form-group">
		<label for="profileContent" class="col-sm-offset-1 col-sm-3 control-label">가입한 모임무피</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="" name="s" value="" readonly>
		</div>
	</div>
	http://localhost:8080/moim/myListMoim?userId=admin
	
	<!-- 프로필이미지 (버튼누르면 수정되게끔 설정) 차후 추가 수정,보완해야 함 -->	
	<!-- <p>프로필이미지 : ${dbUser.profileImage}<button type="button" class="btm_image" id="img_btn"><img src="이미지경로">${user.profileImage}</button></p> -->
	
	<!-- 프로필수정 -->
	${user.ProfileImage}
	
	<!-- 출력만하면 됨 -->
	<p>닉네임 : ${dbUser.nickname}</p>
	<p>뱃지 : ${dbUser.badge}</p>
	<p>코인 : ${dbUser.coin}</p>
		
	<p>[추가구현필요] : 팔로잉 수</p>
	<p>[추가구현필요] : 팔로워 수</p>
	
	<p>프로필소개 : ${dbUser.profileContent}</p>
	
	<p>[추가구현필요] : 마이홈게시글 첨부파일</p>
	<p>[추가구현필요] : 마이홈게시글 내용</p>
	<p>[추가구현필요] : 마이홈게시글 좋아요 수</p>
	<p>[추가구현필요] : 모임무피 대표썸네일</p->
	<p>[추가구현필요] : 모임무피명</p>
	
	<p>관심사1 : ${dbUser.interestFirst}</p>
	<p>관심사2 : ${dbUser.interestSecond}</p>
	<p>관심사3 : ${dbUser.interestThird}</p>	
	
</body>
</html>