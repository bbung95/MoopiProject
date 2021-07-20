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

//--# [모바일인증번호] 인증번호 입력 후 본인인증완료 --------------------------------------------------------------------------------------------------------------------------
		
		// 실전 	: var key = "";
		// TEST : var key = "123456";
		
		var key = "";
		
		function fncKey() {
		
	
			var AuthNum = $("#AuthNum").val()			
			alert("입력한 인증번호 : "+AuthNum);
			
			if(AuthNum === key){				
				$(function() {	
					alert("본인인증이 완료되었습니다.");
						opener.document.getElementById("pInput").value = document.getElementById("pnNum").value
						window.close();
        			});			
			} else {
				alert("인증번호가 올바르지 않습니다. 인증번호를 다시 확인해주세요");
			}
			
		}		
<!-------------------------------------------------------------------------------------------------------------------------->

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
		<!-- 번호 입력 후 인증하기 버튼 -->
		<div class="form-group">
			<label for="mobileAuth" class="col-sm-offset-1 col-sm-2 control-label">모바일번호 인증을 진행해주세요</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="pnNum" name="pnNum" placeholder="번호를 입력하세요">
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
				<a class="btn btn-default btn" href="/" role="button">취소</a>
			</div>
		</div> 
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->



</body>
</html>