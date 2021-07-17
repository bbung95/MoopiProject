<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 뷰 / 로그인 화면페이지 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

	// 카카오 API 키
	Kakao.init('2e00cfe75ad365584acc76b588be8d74');
	
	// 구글 metaname 차후 수정해야
	//<meta name ="google-signin-client_id" content="959630660117-f5d12kulu8hloob7jid8f0jfeenr57sv.apps.googleusercontent.com">

<!---------------------------------------------------------------------------------------------------------------------------->		
	function fncLogin() {
		
		var id=$('input[name=userId]').val();
		var password=$('input[name=password]').val();
								
		if(id == null || id.length < 1) {
			alert("ID 를 입력하지 않으셨습니다.");
			$('input[name=userId]').focus();
			return;
		}	
				
		if(password == null || password.length < 1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			$('input[name=password]').focus();
			return;
		}
		
		alert("로그인 완료");
		
		<!-- UserController의 loginUser를 따라간다. -->
		$("form").attr("method", "POST").attr("action", "/user/loginUser").submit();
	}	
	
<!---------------------------------------------------------------------------------------------------------------------------->		

<!-- [구현중] 카카오로그인 API -------------------------------------------------------------------------------------------------------------------------->

	<!-- a태그 id인 custom-login-btn을 따라가면 KakaoLogin 메서드가 실행된다 -->

	$("#custom-login-btn").on("click" , function() {
		KakaoLogin();
	});
		
<!---------------------------------------------------------------------------------------------------------------------------->		

<!-- [구현중] 구글로그인 API -------------------------------------------------------------------------------------------------------------------------->
	function fncGoogleLogin() {
		var access_token = googleUser.getAuthResponse().access_token
		
		$.ajax({
				// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
				url: 'https://people.googleapis.com/v1/people/me'
				
				// key에 자신의 API 키를 넣습니다.
				, data: {personFields:'birthdays', key:'AIzaSyD3N7qWQr_bjwh9Lw-fLaK8bW5GtqbvAV8', 'access_token': access_token}
				, method:'GET'
		}) // End GoogleLogin ajax
		
		.done(function(e){
				
				//프로필을 가져온다.
				var profile = googleUser.getBasicProfile();
					console.log(profile)
				})
				
				.fail(function(e){
					console.log(e);
				})// END profile
				
		} //End function
			
		function onSignInFailure(t){		
			console.log(t);
		}//End Fail function
	
	
<!---------------------------------------------------------------------------------------------------------------------------->	

<!------------------------------------------ ---------------------------------------------------------------------------------->	
	function fncNaverLogin() { 
		alert("네이버로그인");
	}

<!--[카카오톡 로그인]---------------------------------------------------------------------------------------------------->	
	
	function KakaoLogin() { 

		Kakao.Auth.login({
		
			success : function(authObj) {
				
				console.log(authObj);
				alert("function(authObj) 1차 성공");
				
				Kakao.API.request({
				       url: '/v2/user/me',
				       
					success: function(response){

						console.log("아이디 : "+response.id);
						console.log("카카오계정 : "+response.kakao_account);
						console.log("이메일주소 : "+response.kakao_account['email']);
						
						var email = response.kakao_account['email'];
						var userId = response.id;
						
						alert("카카오 로그인 성공");
						alert("email 받는지 확인 : "+email);
						alert("userId : "+userId);
							
						//location.href = "/user/kakaoLogin?userId="+userId
						$("form").attr("method" , "POST").attr("action" , "/user/kakaoLogin?userId="+userId).submit();
				
					} //End response function
					
				}); //End API.request
				
			} //End authObj Function
			
		}); //End Auth.login
		
	} //End Function

<!---------------------------------------------------------------------------------------------------------------------------->		
	
<!--[카카오톡 로그아웃]---------------------------------------------------------------------------------------------------->	
	
		function KakaoLogout() {
			
			if (Kakao.Auth.getAccessToken()) {
				alert("로그아웃");
				Kakao.API.request({
					url : '/v1/user/unlink',
					
					success : function(response) {
						alert("로그아웃 성공하였습니다.");
						console.log(response)
					}, fail : function(error) {
						console.log(error)
					},
				})
				
				Kakao.Auth.setAccessToken(undefined)
			}
		}
<!---------------------------------------------------------------------------------------------------------------------------->		
		
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
			<div class="check_font" id="id_check"></div>
		</div>
		
<!-- ## 아이디찾기 -->
		<div class="form-group">
			<label for="searchIdView" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="javascript:void(window.open('/user/getMobileAuth', '아이디찾기','width=460, height=800'))">아이디를 잊으셨나요?</a>			
		</div>

<!-- 비밀번호입력 -->		  
		<div class="form-group">
			<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요" >
			</div>
			<div class="check_font" id="pwd_check"></div>
		</div>
		
<!-- ## 비밀번호찾기 -->
		<div class="form-group">
			<label for="searchUserPwd" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="javascript:void(window.open('/user/searchUserPwd', '아이디찾기','width=460, height=800'))">비밀번호를 잊으셨나요?</a>
		</div>
		
<!-- ## 회원가입 -->
		<div class="form-group">
			<label for="addUser" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="/user/addUserView">회원가입</a>
		</div>
		
<!-- [구현중] 카카오 API Login & Logout ---------------------------------------------------------------------------------------------------------------->						
	
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" id="kakaoLogin">
				<img src="../images/API/kakao_login_medium_narrow.png" onClick="KakaoLogin()"></button>
				<button type="button" class="btn btn-default" onClick="KakaoLogout()">카카오 로그아웃</button>
			</div>
		</div>
		
		<!-- [7월 17일 17:24] 카카오톡 로그인 관련 이미지 경로 첨부 후 지정완료, 사이트에 뜨는 것 까지 확인 완료 ] -->
<!--
			<a id="custom-login-btn" a href="javascript:KakaoLogin()">
				<img src="../images/API/kakao_login_medium_narrow.png">	
			</a>
-->
<!---------------------------------------------------------------------------------------------------------------------------->

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

<!-- 로그인, 취소 Button ---------------------------------------------------------------------------------------------------------------->									
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary" onClick="fncLogin()">로그인</button>
				<a class="btn btn-default btn" href="/" role="button">취소</a>
			</div>
		</div>
<!---------------------------------------------------------------------------------------------------------------------------->	

<!-- FORM END ---------------------------------------------------------------------------------------------------------------->
		  			
 	</div>

</body>
</html>