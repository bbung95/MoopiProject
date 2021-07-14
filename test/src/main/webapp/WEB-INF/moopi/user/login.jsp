<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

	// 로그인
	$( function(fncLogin()) {
		
		alert("로그인 페이지 정상이동완료");
		
		$("#userId").focus();
		
		$("button").on("click", function() {
			alert("진입2");
			var id=$("input:text").val();
			var pwd=$("input:password").val();
				
			if(id == null || id.length < 1) {
				alert("ID 를 입력하지 않으셨습니다.");
				$("#userId").focus();
				return;
			}	
				
			if(pwd == null || pwd.length < 1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
	
		$("form").attr("method","POST").attr("action","/addUser).attr("target","_parent").submit();
		});	
	
	});
	
	<!-- fncLogin() -->
		$(function() {
			$( "button" ).on("click" , function() {
				self.location = "addUser"
			});
		});
	
		
	function fncAddUser() { 
		alert("로그인페이지");
		self.location = "addUser"
	}
	
	function fncGoogleLogin() { 
		alert("구글로그인");
	}
	
	function fncNaverLogin() { 
		alert("네이버로그인");
	}
	
	function fncKakaoLogin() { 
		alert("카카오로그인");
	}
		
</script>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> user/login : 로그인시작 </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">로그인</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
  
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해주세요">
			</div>
		</div>
		
<!-- ## 아이디찾기 -->
		<div class="form-group">
			<label for="searchIdView" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="아이디찾기View 띄워주기">아이디를 잊으셨나요?</a>
		</div>
		  
		<div class="form-group">
			<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요" >
			</div>
		</div>
		
<!-- ## 비밀번호찾기 -->
		<div class="form-group">
			<label for="searchUserPwd" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="비밀번호찾기 뷰 띄워주기">비밀번호를 잊으셨나요?</a>
		</div>
		
<!-- ## 회원가입 -->
		<div class="form-group">
			<label for="addUser" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="addUser">회원가입</a>
		</div>

<!-- 구글 API Login ---------------------------------------------------------------------------------------------------------------->				
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default" onClick="fncGoogleLogin()">구글로그인</button>
			</div>
		</div>
<!---------------------------------------------------------------------------------------------------------------------------->

<!-- 네이버 API Login ---------------------------------------------------------------------------------------------------------------->					
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default" onClick="fncNaverLogin()">네이버로그인</button>
			</div>
		</div>
<!---------------------------------------------------------------------------------------------------------------------------->

<!-- 카카오 API Login ---------------------------------------------------------------------------------------------------------------->						
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default" onClick="fncKakaoLogin()">카카오로그인</button>
			</div>
		</div>
<!---------------------------------------------------------------------------------------------------------------------------->

<!-- 로그인, 취소 Button ---------------------------------------------------------------------------------------------------------------->									
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary" onClick="fncLogin()">로그인</button>
				<a class="btn btn-default btn" href="/main" role="button">취소</a>
			</div>
		</div>
<!---------------------------------------------------------------------------------------------------------------------------->	

<!-- FORM END ---------------------------------------------------------------------------------------------------------------->
		  			
 	</div>

</body>
</html>