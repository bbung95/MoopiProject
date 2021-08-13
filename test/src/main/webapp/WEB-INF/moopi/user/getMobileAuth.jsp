<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 모바일 인증하기 페이지 </title>
<!-- 스윗얼럿 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

	
<!-- 필수 Core theme CSS (includes Bootstrap)-->
	<link href="/css/admin/styles.css" rel="stylesheet" />
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
			var phone = $("#pnNum").val()
			
			if(phone == null || phone.length != 11){
				
				swal("올바른 형식의 모바일번호가 아닙니다.","","warning");
				return;
			}
			
			if(AuthNum == key){				
				$(function() {	
								
						if (href == "?findId") {
							$("#checkBtn").fadeIn();		
							var phone = $("#pnNum").val();	
							$("form").attr("method", "POST").attr("action", "/user/searchIdView").submit();		
								
							return;				
						

						} else if (href == "?addUser") {		
							opener.document.getElementById("pInput").value = document.getElementById("pnNum").value
							window.close();
							return;
								
						// 계정정보수정에서 회원모바일번호수정
						} else if (href == "?updatePwdView") {						
							var phone=$('input[name=phone]').val();
							var userId=$('input[name=userId]').val();							
							opener.document.getElementById("pInput").value = document.getElementById("pnNum").value
							window.close();
							return;

						} else {
						
								var phone = $("#pnNum").val();
								$("form").attr("method", "POST").attr("action", "/user/updatePwdView").submit();	
						}							
					
						
        			});			
			} else {
				swal("인증번호가 올바르지 않습니다.","인증번호를 다시 확인해주세요","error");
			}
			
		}		
<!-------------------------------------------------------------------------------------------------------------------------->

// [모바일인증API]
		
		function fncAuth(){
	
			var phone = $("#pnNum").val()
			
			if(phone == null || phone.length != 11){
				
				swal("올바른 형식의 모바일번호가 아닙니다.","","warning");
				return;
			}
			swal("모바일 인증번호가 발송되었습니다.","","success");
			
			$.ajax({
						url : "/user/json/sms/"+phone ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : 
							
							function(JSONData , status) {
								key = JSONData.key;
								
						}
						
				});	 //ajax종료 */
		};
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

		<form class="start">
		
		<h3 class="MobileAuth"> 모바일번호인증 </h3>
		<hr style="border:solid 0.11px black;">
		
		<!-- userId Hidden -->
 	  	<input type="hidden" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
 	  	<input type="hidden" id="type" name="type" value=""/>
 	  	<p class="listUserJoin"> 회원가입시 입력하신 정보로 조회하실 수 있습니다 </p>
 	  	
		<!-- 번호 입력 후 인증하기 버튼 -->
		<div class="writeInformation">
			<div class="form-group">
					<label for="mobileAuth" class="col-sm-offset-1 col-sm-2 control-label" id="Content1">모바일번호 인증을 진행해주세요</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="pnNum" name="phone" placeholder="번호를 입력하세요" >
					</div>
					<div class="col-sm-1">
						<button type="button" id="mobileAuth" class="micro_btn" onClick="fncAuth()">인증하기</button>
					</div>
			</div>
			
			<!-- 인증번호 입력 -->
			<div class="form-class">		
				<label for="mobileAuth" class="col-sm-offset-1 col-sm-2 control-label">인증번호 입력 후 확인버튼 눌러주세요</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="AuthNum" name="AuthNum" placeholder="인증번호를 입력해주세요">
					</div>
			</div>
			
		</div>
		
		<!-- 확인,취소 -->
		<div class="AuthNumWrite">
			<div class="col-sm-offset-4  col-sm-4 text-center">			
				<button class="px-4 py-4 text-white font-light tracking-wider bg-gray-900 rounded" style="width:500px;" id="checkBtn" name="img_btn" type="button" onClick="fncKey()">확인</button>	
			</div>
		</div> 
		
		<div class="information">
			<p> • 모바일번호 입력시 "-" 없이 입력해주세요. </p>
			<p> • 이용에 불편함을 느끼실 경우 <a href="mailto:hello@norgianclue.com">hello@norgianclue.com</a> 이메일주소로 문의 부탁드리겠습니다. </p>
		</div>
		

		</form>

</body>
</html>