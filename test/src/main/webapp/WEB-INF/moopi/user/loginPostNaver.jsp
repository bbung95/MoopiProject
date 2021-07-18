<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> loginPostNaver </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-------------------------------------------------------------------------------------------------------------------------->
	
	
	<script type="text/javascript">

		// Client Id 값, RedirectURI 지정
		var naver_id_login = new naver_id_login("MJJpKOvtYqXuhtTnhQtq", "http://localhost:8080/");

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
				} else {
					alert("ERROR");
					window.close();
				}//End if문
								
	 		}//End naverSignInCallback
	 		
	</script>

<!--
<script type="text/javascript">

	alert("실행");
		var naver_id_login = new naver_id_login("MJJpKOvtYqXuhtTnhQtq", "http://localhost:8080/user/loginPostNaver");
-->
<!--	         
			// 접근 토큰 값 출력
			alert(naver_id_login.oauthParams.access_token); 
-->
	          
<!--			// 접근 토큰 값 출력 [콘솔창 정상출력 확인 완료]
			console.log("네이버 토큰 확인 : "+naver_id_login.oauthParams.access_token);	
			console.log("state 확인 : "+naver_id_login.oauthParams.state);
			console.log("토큰 타입 확인 : "+naver_id_login.oauthParams.token_type);
			console.log("expires_in 확인 : "+naver_id_login.oauthParams.expires_in);
			
			alert("URL로 주어지는 기본적인 토큰 값 출력완료");
			alert("네이버 토큰 확인 : "+naver_id_login.oauthParams.access_token);	
			alert("state 확인 : "+naver_id_login.oauthParams.state);
			alert("토큰 타입 확인 : "+naver_id_login.oauthParams.token_type);
			alert("expires_in 확인 : "+naver_id_login.oauthParams.expires_in); 
-->
<!--          
			// 네이버 사용자 프로필 조회 - naverSignInCallback function 호출
			naver_id_login.get_naver_userprofile("naverSignInCallback()"); 
			function naverSignInCallback() {
-->
<!--				
				// 예시 문항에 있던거
				//var id = naver_id_login.getProfileData('id')+"@n";
				//var nickname = naver_id_login.getProfileData('name');
	            //var email = naver_id_login.getProfileData('email');
	            
	            var naverId = naver_id_login.getProfileData('id');	            
	            alert("아이디 : "+naverId);		
-->
<!--	            
	            $.ajax({
	                 url : "/user/loginPostNaver?userId="+userId,
						headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
	                  },
	                  success : function(idChk){
	                      
							if(idChk==true){ //DB에 아이디가 없을 경우 => 회원가입
								console.log("회원가입중...");
	                          
								$.ajax({
									url : "/user/json/addUserInfo",
									method : "POST",
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									data : JSON.stringify({
										userId : id,
										userName : nickname,
										password : "naver123",
									}),
									success : function(JSONData){
										alert("회원가입이 정상적으로 되었습니다.");
										window.close();
										top.opener.location="/user/snsLogin/"+id;
									}
								}); 
							}
							if(idChk==false){ //DB에 아이디가 존재할 경우 => 로그인
								console.log("로그인 중...");
								window.close();
								top.opener.location="/user/snsLogin/"+id;
							}
						}
					}); 
	            }
-->
<!--	         
</script> -->
</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> user/loginPostNaver : loginPostNaver </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">네이버로그인 POST</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->
	
	여기 : ${user.userId}

</body>
</html>