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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>



		
</script>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> 마이홈보기 </h3>
	${user.userId} 님 안녕하세요
	
<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">마이홈</h1>

<!-- FORM START ---------------------------------------------------------------------------------------------------------------->
	
	<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">

	<!-- 프로필이미지 (버튼누르면 수정되게끔 설정) 차후 추가 수정,보완해야 함 -->	
	<p>프로필이미지 : ${user.profileImage}<button type="button" class="btm_image" id="img_btn"><img src="이미지경로">${user.profileImage}</button></p>
	
	<!-- 출력만하면 됨 -->
	<p>닉네임 : ${user.nickname}</p>
	<p>뱃지 : ${user.badge}</p>
	<p>코인 : ${user.coin}</p>
		
	<p>[추가구현필요] : 팔로잉 수</p>
	<p>[추가구현필요] : 팔로워 수</p>
	
	<p>프로필소개 : ${user.profileContent}</p>
	
	<p>[추가구현필요] : 마이홈게시글 첨부파일</p>
	<p>[추가구현필요] : 마이홈게시글 내용</p>
	<p>[추가구현필요] : 마이홈게시글 좋아요 수</p>
	<p>[추가구현필요] : 모임무피 대표썸네일</p->
	<p>[추가구현필요] : 모임무피명</p>
	
	<p>관심사1 : ${user.interestFirst}</p>
	<p>관심사2 : ${user.interestSecond}</p>
	<p>관심사3 : ${user.interestThird}</p>	
	
	<!-- 프로필이미지 -->
	<div class="form-group">
		<label for="profileImage" class="col-sm-offset-1 col-sm-3 control-label">프로필이미지</label>
		<div class="col-sm-4">
		<button type="button" class="btm_image" id="img_btn"><img src="이미지경로">${user.profileImage}</button>
		</div>
	</div>
	
	<!-- 닉네임 -->
	<div class="form-group">
		<label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname}" readonly>
		</div>
	</div>
	
	<!-- 뱃지 -->
	<div class="form-group">
		<label for="badge" class="col-sm-offset-1 col-sm-3 control-label">뱃지</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="badge" name="badge" value="${user.badge}" readonly>
		</div>
	</div>
	
	<!-- 코인 : 마우스를 댈 시 잔여코인출력, 마우스를 클릭 시 결제구 -->
	<div class="form-group">
		<label for="coin" class="col-sm-offset-1 col-sm-3 control-label">코인</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="coin" name="coin" value="${user.coin}" readonly>
		</div>
	</div>
	

	
</body>
</html>