<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 모바일 인증하기 페이지 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->
<!-- 필수 Core theme CSS (includes Bootstrap)-->
	<link href="/css/admin/styles.css" rel="stylesheet" />
	
<script>

//-- 아이디 유효성체크 --------------------------------------------------------------------------------------------------------------------------
	$(function() {
		
		$("#findId").keyup(function() {
	
			var userId = $('#findId').val();		
			
			$.ajax({
				
				url : '${pageContext.request.contextPath}/user/idCheck?userId='+userId,
				type : 'get',
				success : function(data) {
				
					$(function() {
						$("#joinButton").attr("disabled", false);
						$("#joinButton").css("color", "gray");	
					
						if ( $("#id_check").text == "" ) {
								$("#joinButton").css("color", "gray");
								$("#joinButton").attr("disabled", false);								
							} else if (data == 1 || $("#id_check").text == null ) {
								$("#id_check").text("존재하는 아이디입니다.");
								$("#id_check").css("color", "red");
								$("#joinButton").attr("disabled", false);
								$("#joinButton").css("color", "white");	
							} else if (data == 0) {	
								$("#id_check").text("존재하지 않는 아이디입니다.");
								$("#id_check").css("color", "black");
								$("#joinButton").attr("disabled", true);
								$("#joinButton").css("color", "gray");
							}
						 // End if Function	
					}) //End $(function)				
				} //End success
			}) //End $.ajax
		}) //End keyup
	}) //End $(Function()				

<!-------------------------------------------------------------------------------------------------------------------------->

<!--[비밀번호찾]----------------------------------------------------------------------------------------------------------------->	
	function setPwd() {	
	
		alert("setPwd실행");
	
		var userId=$('input[name=userId]').val();
		
		$("form").attr("method" , "POST").attr("action" , "/user/getMobileAuthPW?setPwd").submit();											
																	
	}
<!---------------------------------------------------------------------------------------------------------------------------->	

	
</script>

    <style>
    @font-face {
    	src: url("../font/NanumGothic-Regular.ttf")'
    	font-family : "NanumGothic";
    }
    
	body{
		font-family : "NanumGothic";
		padding-top: 30px;
	}
	
	.start {
		font-family : "NanumGothic";
		padding: 30px 30px;
	}
	
	.MobileAuth {
	font-family : "NanumGothic";
		text-align: center;
		font-size: 30px;
		padding : 15px;
		
	}
	
	.listUserJoin {
		font-family : "NanumGothic";
		text-align: center;
		padding : 10px;
	}
	
	.writeInformation {
		font-family : "NanumGothic";
		border: 1px solid gray;
		width: 100%;
		padding: 30px 48px;
		padding-top: 30px;
	    padding-right: 48px;
	    padding-bottom: 30px;
	    padding-left: 48px;
	}
	
	.AuthNumWrite {
		font-family : "NanumGothic";
		padding-top : 20px;
	}
	
	#mobileAuth {
		position: absolute;
		border: 1px solid gray;
	    bottom: 7.5px;
	    right: 19px;
	    width: 68px;
	    padding: 0;
	}
	
	.information {
		font-family : "NanumGothic";
		font-size : 12px;
		padding-top : 20px;
		color : gray;
	}
	
	</style>

</head>
<body>

<!-- # 모바일번호인증 - CoolSMS API ---------------------------------------------------------------------------------------------------------------------------------------->		
		<form class="start">
		
		<h3 class="MobileAuth"> 비밀번호재설정 </h3>
		<hr style="border:solid 0.11px black;">
		
		<!-- userId Hidden -->
 	  	<input type="hidden" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
 	  	
 	  	<p class="listUserJoin"> 회원가입시 입력하신 아이디와 모바일인증으로 비밀번호 재설정이 가능합니다. </p>
 	  	
		<!-- 번호 입력 후 인증하기 버튼 -->
		<div class="writeInformation">
			<div class="form-group">
				<label for="mobileAuth" class="col-sm-offset-1 col-sm-9 control-label">아이디를 먼저 입력해주세요</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="findId" name="userId" placeholder="아이디를 입력해주세요">
						<div class="check_font" id="id_check"></div>
					</div>
			</div>			
		</div>
		
		<!-- 확인,취소 -->
		<div class="AuthNumWrite">
			<div class="col-sm-offset-4  col-sm-4 text-center">			
				<button class="px-4 py-4 text-white font-light tracking-wider bg-gray-900 rounded" style="width:500px;" id="joinButton" name="img_btn" type="button" onclick="javascript:setPwd()">확인</button>
			</div>
		</div> 
		
		<div class="information">
			<p> • 존재하지 않는 아이디일 경우 <a href="http://localhost:8080/user/getMobileAuth?findId">ID찾기</a> 를 눌러주세요 </p>
			<p> • 이용에 불편함을 느끼실 경우 문의게시판으로 문의 부탁드리겠습니다. </p>
		</div>
		

		</form>
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->



</body>
</html>