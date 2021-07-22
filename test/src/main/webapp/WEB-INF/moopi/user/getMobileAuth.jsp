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
	
	// 취소버튼 누를시 닫힘
	function fncClose() {
		 self.close();
	}
	
//--# [모바일인증번호] 인증번호 입력 후 본인인증완료 --------------------------------------------------------------------------------------------------------------------------
				
		var key = "123456";
		
		// 들어온 페이지 값 지정
		// addUser - 회원가입 / findId - 아이디찾기 / updatePwd - 비밀번호 찾기 및 수
		var href = document.location.search;	
	
		function fncKey() {
			
			var userId=$('input[name=userId]').val();
			var AuthNum = $("#AuthNum").val()	
			
			
			if(AuthNum == key){				
				$(function() {	
					
						if (href == "?findId") {		
								var phone = $("#pnNum").val();
								alert("유저아이디 : "+userId);
								$("form").attr("method", "POST").attr("action", "/user/searchIdView").submit();					
						
						} else if (href == "?addUser") {		
								opener.document.getElementById("pInput").value = document.getElementById("pnNum").value
								window.close();

						} else {
						
								var phone = $("#pnNum").val();
								
								alert("?setPwd 진입완료");
								alert("userId : "+userId);
								alert("phone : "+phone);
						
								$("form").attr("method", "POST").attr("action", "/user/updatePwdView").submit();	
						}					
					
						
        			});			
			} else {
				alert("인증번호가 올바르지 않습니다. 인증번호를 다시 확인해주세요");
			}
			
		}		
<!-------------------------------------------------------------------------------------------------------------------------->
/*\\					
		function findId() {

			var phone = $("input[name=phone]").val();
				$("form").attr("method", "POST").attr("action", "/user/getIdView").submit();
		}
*/
//--# [모바일인증번호] 인증번호 발송하기 --------------------------------------------------------------------------------------------------------------------------
		
		function fncAuth(){
		
			
			alert("인증버튼 누를시 활성화되는 alert");
			
			var phone = $("#pnNum").val()
			alert("입력한 연락처 : "+phone);
			
			$.ajax( 
					{
						url : "/user/json/sms/"+phone ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : 
						
							function(JSONData , status) {
	
								alert("status : "+status);
								alert("JSONData : \n"+JSONData);
								alert("JSONData : \n"+JSONData.key);
								key = JSONData.key;
								//<img src="/images/uploadFiles/${product.fileName}"/>
						}
						
				});	 //ajax종료
		};
		

		
</script>

</head>
<body>


<h3> 모바일번호인증 </h3>

<!-- # 모바일번호인증 - CoolSMS API ---------------------------------------------------------------------------------------------------------------------------------------->		
		<form>
		
		<!-- userId Hidden -->
		<div class="form-group">
 	  		<div class="col-sm-offset-4  col-sm-4 text-center">
 	  		<input type="text" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
 	  		</div>
 	  	</div>
 	  	
		<!-- 번호 입력 후 인증하기 버튼 -->
		<div class="form-group">
			<label for="mobileAuth" class="col-sm-offset-1 col-sm-2 control-label">모바일번호 인증을 진행해주세요</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="pnNum" name="phone" placeholder="번호를 입력하세요">
				</div>
				<div class="col-sm-1">
					<button type="button" id="mobileAuth" class="btn btn-default" onClick="fncAuth()">인증하기</button>
				</div>
		</div>
		
		<!-- 인증번호 입력 -->
		<div class="form-group">		
			<label for="mobileAuth" class="col-sm-offset-1 col-sm-2 control-label">인증번호 입력 후 확인버튼 눌러주세요</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="AuthNum" name="AuthNum" placeholder="04:59">
				</div>
		</div>
		
		<!-- 확인,취소 -->
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default" id="checkBtn" onClick="fncKey()">확인</button>
				<a class="btn btn-default btn" id="close" onClick="fncClose()" role="button">취소</a>
			</div>
		</div> 
		</form>
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->



</body>
</html>