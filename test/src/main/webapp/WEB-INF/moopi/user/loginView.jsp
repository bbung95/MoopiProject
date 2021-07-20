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
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
	
	<meta name="google-signin-scope" content="profile email">
	<meta name ="google-signin-client_id" content="959630660117-f5d12kulu8hloob7jid8f0jfeenr57sv.apps.googleusercontent.com">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>
		
	// 카카오 API 키 : 2e00cfe75ad365584acc76b588be8d74
	// 구글 Client ID : 959630660117-f5d12kulu8hloob7jid8f0jfeenr57sv.apps.googleusercontent.com
	// 구글 키 : AIzaSyD3N7qWQr_bjwh9Lw-fLaK8bW5GtqbvAV8

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
		
		<!-- UserController의 loginUser를 따라간다. -->
		$("form").attr("method", "POST").attr("action", "/user/loginUser").submit();
	}	
	
<!---------------------------------------------------------------------------------------------------------------------------->		
  
 <!-- [완] 구글로그인 API -------------------------------------------------------------------------------------------------------------------------->
        
        // 첫번째 Function (해당 페이지 시작하자마자 실행된다)
		function init() {
			
			gapi.load('auth2', function() {
											gapi.auth2.init();
											options = new gapi.auth2.SigninOptionsBuilder();
											options.setPrompt('select_account');
							
									        // email과 profile을 받아온다.
											options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
											
									        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
									        
									        // googleLogin : Body의 id 값을 따라간다.  
									        // options : options = new gapi.auth2.SigninOptionsBuilder();
									        // onSignIn function 
									        // onSignInFailure function
											gapi.auth2.getAuthInstance().attachClickHandler('googleLogin', options, googleSign, onSignInFailure);
			}) //End gapi.load
		} //End init function


		// 두번째 Function - 구글가입, 로그인진행시
		function googleSign(googleUser) {
			
			// access_token
			var access_token = googleUser.getAuthResponse().access_token
			
				$.ajax({		    	
				    		// 구글 선택동의 창 출력			
							url : 'https://people.googleapis.com/v1/people/me',
				       
				       	 	// key에 자신의 API 키를 넣습니다.
							data: {personFields:'birthdays', key:'AIzaSyD3N7qWQr_bjwh9Lw-fLaK8bW5GtqbvAV8', 'access_token': access_token},
							method:'GET'
						})						
							.done(function(e){
								        		// 여기가 제일중요 profile 정보가 다 담겨서 온다. LS가 ID인
												var profile = googleUser.getBasicProfile();
												var userId = profile.LS;
												var userName = profile.Ue;
												
												console.log("프로필 총 출력 : "+profile)
												console.log("고유식별값 : "+profile.LS)
												console.log("유저이름 : "+profile.Ue)
												
												// QueryString 형식으로 userId를 담아보낸다
												// Profile 전체는 Object로 넘어감 / json 사용해야 할 듯
												location.href = "/user/googleLogin?userId="+userId												
											})
												.fail(function(e){
												console.log(e);
											})
		} //End onSignIn Function
		
		// 세번째 Function - 실패시
		function onSignInFailure(t){		
			console.log(t);
			alert("실패");
		}     
        
<!---------------------------------------------------------------------------------------------------------------------------->	

<!--- [구현중] 네이버로그인 API --------------------------------------------------------------------------------------------------------->	
	
	function NaverLogin() {  
		
		alert("실행");
			
			var naverLogin = new naver.LoginWithNaverId ({
				alert("2");
				clientId: "MJJpKOvtYqXuhtTnhQtq",
				callbackUrl: "http://localhost:8080/user/naverlogin",
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 45},			

			});

				naverLogin.init(function naverlogin() {
		
				// Client Id 값, RedirectURI 지정
					var naver_id_login = new naver_id_login("MJJpKOvtYqXuhtTnhQtq", "http://localhost:8080/user/loginPostNaver");
		
				// 접근 토큰 값 출력 [콘솔창 정상출력 확인 완료]
					console.log("네이버 토큰 확인 : "+naver_id_login.oauthParams.access_token);	
					console.log("state 확인 : "+naver_id_login.oauthParams.state);
					console.log("토큰 타입 확인 : "+naver_id_login.oauthParams.token_type);
					console.log("expires_in 확인 : "+naver_id_login.oauthParams.expires_in);
					
					alert("URL로 주어지는 기본적인 토큰 값 출력완료");
					alert("네이버 토큰 확인 : "+naver_id_login.oauthParams.access_token);	
					alert("state 확인 : "+naver_id_login.oauthParams.state);
					alert("토큰 타입 확인 : "+naver_id_login.oauthParams.token_type);
					alert("expires_in 확인 : "+naver_id_login.oauthParams.expires_in);
		
		
				// 네이버 사용자 프로필 조회 - naverSignInCallback function 호출
					naver_id_login.get_naver_userprofile("naverSignInCallback()"); 
					
					function naverSignInCallback() {		
						
						if(naver_id_login.getProfileData('id')){
							var naverId = naver_id_login.getProfileData('id');
							console.log("아이디 : "+naverId);	
							alert("아이디 : "+naverId);	
							
							$.ajax({
								
								type : "POST",
								url : currentHostPath + '/user/loginPostNaver',
								data : {
									naverId : 'naverId',	
								},
								success : function(data) {
									console.log("성공");
								},
								error : function(data) {
									console.log("실패");
								}
								
							});
														
						} else {
							alert("ERROR");
							window.close();
						}//End if문
										
			 		}//End naverSignInCallback
			
			});
		

		//$("form").attr("method" , "POST").attr("action" , "/user/naverlogin").submit();
	}	
<!-- [구현중] 카카오로그인 API -------------------------------------------------------------------------------------------------------------------------->

	<!-- a태그 id인 custom-login-btn을 따라가면 KakaoLogin 메서드가 실행된다 -->

	$("#custom-login-btn").on("click" , function() {
		KakaoLogin();
	});
		
<!---------------------------------------------------------------------------------------------------------------------------->			

<!--[카카오톡 로그인]---------------------------------------------------------------------------------------------------->	
		
	function KakaoLogin() { 
		
		// 카카오 API key
		Kakao.init('2e00cfe75ad365584acc76b588be8d74');

		Kakao.Auth.login({
		
			success : function(authObj) {
				
				console.log(authObj);
				
				Kakao.API.request({
				
				       url: '/v2/user/me',
				       
					success: function(response){

						console.log("아이디 : "+response.id);
						console.log("카카오계정 : "+response.kakao_account);
						console.log("이메일주소 : "+response.kakao_account['email']);
						
						var email = response.kakao_account['email'];
						var userId = response.id;
							
						location.href = "/user/kakaoLogin?userId="+userId
						//$("form").attr("method" , "POST").attr("action" , "/user/kakaoLogin?userId="+userId).submit();
				
					} //End response function
					
				}) //End API.request
				
			} //End authObj Function
			
		}) //End Auth.login
		
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
		
		<div class="row">
		
		<h1 class="bg-primary text-center">로그인</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

	<form class="form-horizontal"">
  
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
				<button type="button" class="btn btn-default" onClick="KakaoLogout()">카카오 로그아웃</button>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<img src="../images/API/kakao_login_medium_narrow.png" name="kakaoLogin" onclick="javascript:KakaoLogin()">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary" onclick="KakaoLogin()">카카오로그인</button>
			</div>
		</div>
			
		<div class="form-group">	
			<a id="naver-login-btn" href="#" role="button">
				<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="45" id="naverIdLogin" onclick="NaverLogin()"/>      
			</a>
		</div>
		
<!---------------------------------------------------------------------------------------------------------------------------->

<!-- 구글 API Login ---------------------------------------------------------------------------------------------------------------->				

  		<!-- [7월 19일 01:34] 이미지 경로지정 차후 구현시 사용 -->
  		<!-- <img src="../images/API/google_login.png" height="48" id="googleLogin"/></button> -->
  		
		<li id="googleLogin">
 			<a href="javascript:void(0)">
				<span>구글 로그인</span>
			</a>
			</li>
		</ul>
		
<!---------------------------------------------------------------------------------------------------------------------------->

<!-- 네이버 API Login ---------------------------------------------------------------------------------------------------------------->					

	<div id="naverIdLogin" align="center">
		<a id="naver-login-btn" href="#" role="button">
			<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="45" id="naverIdLogin" onclick="NaverLogin()"/>      
		</a>
	</div>

<!---------------------------------------------------------------------------------------------------------------------------->

<!-- 로그인, 취소 Button ---------------------------------------------------------------------------------------------------------------->									
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				
				<a class="btn btn-default btn" href="/" role="button">취소</a>
			</div>
		</div>
		
		<button type="button" class="btn btn-primary" onClick="fncLogin()">로그인</button>
<!---------------------------------------------------------------------------------------------------------------------------->	
	
<!-- FORM END ---------------------------------------------------------------------------------------------------------------->
		  			
 	</div>

</body>
</html>