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

<script>

//-- 아이디 유효성체크 --------------------------------------------------------------------------------------------------------------------------
	$(function() {
		
		$("#findId").keyup(function() {
	
			var userId = $('#findId').val();		
			
			$.ajax({
				
				url : '${pageContext.request.contextPath}/user/idCheck?userId='+userId,
				type : 'get',
				success : function(data) {					
					
					if (data == 1) {
							
							// 1 : 아이디 중복일 경우
								
								$("#id_check").text("존재하는 아이디입니다.");
								$("#id_check").css("color", "red");
								$("#joinButton").attr("disabled", false);
								

						
						} else if (data == 0) {
								
								$("#id_check").text("존재하지 않는 아이디입니다.");
								$("#id_check").css("color", "black");
								$("#joinButton").attr("disabled", true);
						
						} 
																		
					}, error : function() {
							console.log("실패");
					}
			});
		});
	});
<!-------------------------------------------------------------------------------------------------------------------------->

//-- [완료] searchUserPwd에서 존재하는 아이디 입력시 getMobileAuth로 이동 --------------------------------------------------------------------------------------------------------------------------	
	$(function() {	
			$("#joinButton").on("click", function() {
				location.href="/user/getMobileAuth";
			});
	});
<!-------------------------------------------------------------------------------------------------------------------------->
	
</script>

</head>
<body>


<h3> 새로운 비밀번호를 설정하시겠습니까? </h3>

<!-- # 모바일번호인증 - CoolSMS API ---------------------------------------------------------------------------------------------------------------------------------------->
		
		<!-- 번호 입력 후 인증하기 버튼 -->
		<div class="form-group">
			<label for="mobileAuth" class="col-sm-offset-1 col-sm-9 control-label">아이디를 먼저 입력해주세요</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="findId" name="findId" placeholder="아이디를 입력해주세요">
					<div class="check_font" id="id_check"></div>
				</div>
		</div>
		
		<!-- 확인,취소 -->
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" id="joinButton" class="btn btn-default">확인</button>
				<a class="btn btn-default btn" href="/" role="button">취소</a>
			</div>
		</div> 
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->

</body>
</html>