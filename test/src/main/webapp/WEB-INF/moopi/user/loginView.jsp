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

<!---------------------------------------------------------------------------------------------------------------------------->		
	function fncLogin() {
		
		alert("function 진입완료");
		
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
		
		alert("성공");
		
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

<!---------------------------------------------------------------------------------------------------------------------------->	

	function fncGoogleLogin() { 
		alert("구글로그인");
	}
	
	function fncNaverLogin() { 
		alert("네이버로그인");
	}

<!--[카카오톡 로그인]---------------------------------------------------------------------------------------------------->	
	
	function KakaoLogin() { 

		Kakao.Auth.login({
		
			scope :'account_email',
			
			success : function(authObj) {
				
				console.log(authObj);
				alert("function(authObj) 1차 성공");
				
				Kakao.API.request({
				       url: '/v2/user/me',
				       
					success: function(response){
						console.log("카카오계정 : "+response.kakao_account);
						console.log("이메일주소 : "+response.kakao_account['email']);
						var userId = response.kakao_account['email'];
						alert("카카오 로그인 성공");
						alert("email 받는지 확인 : "+userId);
						
						location.href = "/user/kakaoLogin";
						
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
		</div>
		
<!-- ## 아이디찾기 -->
		<div class="form-group">
			<label for="searchIdView" class="col-sm-offset-1 col-sm-6 control-label"></label>
			<a href="javascript:void(window.open('/user/getMobileAuth', '아이디찾기','width=460, height=800'))">아이디를 잊으셨나요?</a>			
		</div>
		  
		<div class="form-group">
			<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요" >
			</div>
		</div>
		
		<form id="userform" method="post">
			<input type="hidden" name="data[user_id]" id="data_user_id" value=""/>
		</form>

		
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

<!-- 카카오 API Login / Logout ---------------------------------------------------------------------------------------------------------------->						
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default">카카오로그인</button>
			</div>
		</div>
		
		 
		<!--[카카오톡 로그인 관련 이미지 첨부]-->
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<a id="custom-login-btn" a href="javascript:KakaoLogin()">
					<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbN40ps%2FbtqETLcjsMw%2FCw2ZN9kFTOGqkYTxw5KBDK%2Fimg.png" style="height:38px;width:auto;"/>	
				</a>
				
				<!--	<form method="get" action="form-action.php">
						<p><label>Input Color : <input type="text" name="color"></label></p>
						<p><input type="submit" value="Submit"></p>
   					 </form> -->
			</div>
		</div>
		
		<!-- 카카오 로그아웃 -->
		<div>
			<a id="custom-logout-btn" href="javascript:KakaoLogout()">로그아웃</a>
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