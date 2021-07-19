<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script> 
	
//--[완료] 가입 Event--------------------------------------------------------------------------------------------------------------------------
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddUserInfo();
		});
	});
<!-------------------------------------------------------------------------------------------------------------------------->
	
//--#[사용안하고있음] 취소 Event--------------------------------------------------------------------------------------------------------------------------
	$(function() {
		$("a[href='#']").on("click" , function() {
			$("form")[0].reset();
		});
	});
<!-------------------------------------------------------------------------------------------------------------------------->

//--#반드시 입력 Event --------------------------------------------------------------------------------------------------------------------------
	function fncAddUserInfo() {

		var id=$("input[name='userId']").val();
		var password=$("input[name='password']").val();
		var password2=$("input[name='password2']").val();
		var joinPath=$("input[name='joinPath']").val();
		
		if(id == null || id.length <1){
			alert("아이디는 필수로 입력하셔야 합니다");
			return;
		}
		
		if(password == null || password.length <1){
			alert("비밀번호는 필수로 입력하셔야 합니다");
			return;
		}
		
		if(password2 == null || password2.length <1){
			alert("비밀번호를 한번 더 입력해주세요");
			return;
		}
		
		<!-- 필수값인 아이디와 비밀번호를 입력 후 가입을 누르면 UserController의 addUser가 실행된다.-->
		$("form").attr("method" , "POST").attr("action" , "/user/addUserInfo").submit();
	}
<!-------------------------------------------------------------------------------------------------------------------------->

//-- 아이디 유효성체크 / 중복, 미중복체크 / 아이디 유효성 검사(1 = 중복 / 0 != 중복) --------------------------------------------------------------------------------------------------------------------------

	$(function() {
		
		$("#userId").keyup(function() {
	
			var userId = $('#userId').val();		
			
			$.ajax({
				
				url : '${pageContext.request.contextPath}/user/idCheck?userId='+userId,
				type : 'get',
				success : function(data) {					
					
					if (data == 1) {
							
							// 1 : 아이디 중복일 경우
								
								$("#id_check").text("해당 아이디는 이미 사용중입니다.");
								$("#id_check").css("color", "red");
								$("#loginButton").attr("disabled", true);
						
						} else if (data == 0) {
								
								$("#id_check").text("사용가능한 아이디입니다.");
								$("#id_check").css("color", "black");
								$("#loginButton").attr("disabled", false);
						
						} 
												
					}, error : function() {
							console.log("실패");
					}
			});
		});
	});
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

<h3> user/addUser : 회원가입시작 </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">회원가입</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		
		  <!-- 아이디 입력 [Ajax연관] -->
	
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="사용하실 아이디를 입력해주세요" required>						
			</div>
			<div class="check_font" id="id_check"></div>
		</div>	

		  <!-- 비밀번호 입력 -->
		<div class="form-group">
			<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
			</div>
		</div>
		  
		  <!-- 비밀번호 확인 -->
		<div class="form-group">
			<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호확인</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호를 한번 더 입력해주세요">
			</div>
			<div class="check_font" id="pwd_check"></div>
		</div>
		
		<!-- 가입경로 : hidden -->
		<!--<input type="hidden" class="form-control" id="joinPath" name="joinPath" value="${user.joinPath}">-->

<!---------------------------------------------------------------------------------------------------------------------------->	

<!-- 가입, 취소 Button ---------------------------------------------------------------------------------------------------------------->									
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" id="loginButton" class="btn btn-primary">가입</button>
				<a class="btn btn-default btn" a href="/" role="button">취소</a>
			</div>
		</div>	  	  
	  
<!-- FORM END ---------------------------------------------------------------------------------------------------------------->
		
 	</div>
	
</body>

</html>