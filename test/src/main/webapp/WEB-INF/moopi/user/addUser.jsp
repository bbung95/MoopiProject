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
	
// # 가입 Event--------------------------------------------------------------------------------------------------------------------------
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddUserInfo();
		});
	});
	
// # 취소 Event--------------------------------------------------------------------------------------------------------------------------
	$(function() {
		$("a[href='#']").on("click" , function() {
			$("form")[0].reset();
		});
	});
	
// # 반드시 입력 Event --------------------------------------------------------------------------------------------------------------------------
	function fncAddUserInfo() {
	
		var id=$("input[name='userId']").val();
		var password=$("input[name='password']").val();
		var password2=$("input[name='password2']").val();
		
		alert("id : "+id);
		alert("password : "+password);
		alert("password2 : "+password2);
		
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
		
		$("form").attr("method" , "POST").attr("action" , "/user/addUserInfo").submit();
	}

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
		
		<!-- 아이디입력 및 중복확인체크 / 차후 Ajax로 구현해야 함 -->
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="사용하실 아이디를 입력해주세요">			
				<span id="helpBlock" class="help-block">
					<strong class="text-danger">아이디 중복체크를 진행해주세요</strong>
				</span>
			</div>
			<span class="col-sm-3">
				<button type="button" class="btn btn-info">중복확인</button>
			</span>	
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
		</div>

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