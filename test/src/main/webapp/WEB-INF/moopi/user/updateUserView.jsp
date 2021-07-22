<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title> 계정정보조회(모바일번호,비밀번호수정) </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

// # 새 창으로 모바일번호 인증 띄우기 --------------------------------------------------------------------------------------------------------------------------
					
		
		function addUser() {
			
			var popWin;
			var addUser = $("#mobildAuth").val();
			
			popWin = window.open(
									"getMobileAuth?addUser",
									"childForm",
									"left=460, top=300, width=460, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			
			function setChildTest() {
				openWin.document.getElementById("cInput").value = document.getElementById("pnNum").value;				
       		}
		}
	
<!-------------------------------------------------------------------------------------------------------------------------->

//-- [중간완료] 비밀번호 일치 Ajax 실행  --------------------------------------------------------------------------------------------------------------------------
		
		$(function(){
		
			$("#password").keyup(function(){
				$('#pwd_check').text('');
				$("#loginButton").attr("disabled", false);
			});
		
			$("#password2").keyup(function(){				
					if ($("#password").val() != $("#password2").val()){					
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
						$("#loginButton").attr("disabled", true);

					}else{
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치합니다.');
						$("#loginButton").attr("disabled", false);
						
			}
		}); 
	});
<!-------------------------------------------------------------------------------------------------------------------------->


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
		
		<h1 class="bg-primary text-center">계정정보</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

	<form class="form-horizontal"">
	
	<!-- 유저아이디 -------------------------------------------------------------------------------------------------->
	<p>아이디 : ${dbUser.userId}</p>
	<p>이름 : ${dbUser.userName}</p>
	<p>모바일번호 : ${dbUser.phone}</p>
	<p>생년월일 : ${dbUser.birth}</p>
		
	<!-- 모바일번호변경 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
 	  	<div class="col-sm-offset-2  col-sm-4 text-center">
 	  	<h5>모바일번호</h5>
 	  	</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<input type="text" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
		</div>
	</div>
	
	<!-- 비밀번호 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
 	  	<div class="col-sm-offset-2  col-sm-4 text-center">
 	  	<h5>비밀번호</h5>
 	  	</div>
	</div>
	
	<!-- 현재비밀번호 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<input type="text" class="form-control" id="userName" name="userName" value="${dbUser.userName}" readonly>
			현재 비밀번호를 입력해주세요
		</div>
	</div>
	
	<!-- 새 비밀번호 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
		<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호를 입력해주세요">
			</div>
	</div>
	
	<!-- 비밀번호 확인 -->
	<div class="form-group">
		<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호확인</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="password2" name="password2" placeholder="새 비밀번호를 한번 더 입력해주세요">
			</div>
		<div class="check_font" id="pwd_check"></div>
	</div>

<!-- 수정, 취소 Button ---------------------------------------------------------------------------------------------------------------->									
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" id="loginButton" class="btn btn-primary">수정</button>
			<a class="btn btn-default btn" a href="/" role="button">취소</a>
		</div>
	</div>	  	
	
	
</body>
</html>