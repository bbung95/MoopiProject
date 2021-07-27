<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 비밀번호변경 View </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>
	
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
	function updatePwd() {
		
		var userId=$("input[name='userId'").val();
		var password=$("input[name='password'").val();

		$("form").attr("method" , "POST").attr("action" , "/user/updatePwdView").submit();
	}
	
</script>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> 비밀번호변경 </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
		
		<div class="row">
		
		<h1 class="bg-primary text-center">비밀번호변경</h1>
			
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

	<form class="form-horizontal"">
 	  		
 	  	<div class="form-group">
 	  		<div class="col-sm-offset-4  col-sm-4 text-left">
 	  			<h5> ${dbUser.userId}님의 본인인증이 완료되었습니다. </h5>
				<h5> 원하는 비밀번호를 입력해주세요. </h5>
				<h3> 새 비밀번호 </h4>
 	  		</div>
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
 	  	
 	  	
 	  	<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default" id="checkBtn" onClick="updatePwd()">수정</button>
				<a class="btn btn-default btn" id="close" onClick="fncClose()" role="button">취소</a>
			</div>
		</div> 
 	  			
 	</form>

</body>
</html>