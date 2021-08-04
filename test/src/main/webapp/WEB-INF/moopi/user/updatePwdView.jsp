<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 비밀번호변경</title>
<!-- 스윗얼럿 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-------------------------------------------------------------------------------------------------------------------------->
<!-- 필수 Core theme CSS (includes Bootstrap)-->
	<link href="/css/admin/styles.css" rel="stylesheet" />
	
<script>
	
//-- [중간완료] 비밀번호 일치 Ajax 실행  --------------------------------------------------------------------------------------------------------------------------
	var userId=$('input[name=userId]').val();

	$(function(){
		
			$("#password1").keyup(function(){
				
				var regex = /^[A-Za-z\d]{8,12}$/;
				var result = regex.exec($("#password1").val());
				
				if(result != null){
                    $('#pwd_right').text("");
                    $("#updateBtn").attr("disabled", false);
                }else{
                    $('#pwd_right').text("비밀번호는 영어대소문자와 숫자를 포함하여 8-11자리이상으로 작성해주세요");
                    $('#pwd_right').css("color","red");
                    $("#updateBtn").attr("disabled", false);
                }
			
				$('#pwd_check').text('');
				$("#updateBtn").attr("disabled", false);
			});
		
			$("#password2").keyup(function(){				
					if ($("#password1").val() != $("#password2").val()){					
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
						$("#updateBtn").attr("disabled", true);
						return;
					}else{
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치합니다.');
						$("#updateBtn").attr("disabled", false);
						return;
						
			}
		}); 
	});
<!-------------------------------------------------------------------------------------------------------------------------->
	function updatePwd() {
		
		var userId=$("input[name='userId']").val();
		var password = $("input[name='password']").val();
		var password2 = $("input[name='password2']").val();
		
		console.log(password);
		console.log(password2);
		console.log(password.length);
		
		if(password != password2 || password.length < 8){
			
			swal("FAIL!","올바르지 않은 형식입니다.","warning");
			
			return;
		}
		
		$.ajax ({
				url : "/user/json/updateUser/2",
				method : "POST",
				contentType : "application/JSON",
				dataType : "text",
				data : JSON.stringify({"userId" : userId, "password" : password}),
					
					success : function(data, state) {
						
/* 						swal("SUCCESS!","변경이 완료되었습니다.","success");
 */						
						swal({
							title : "SUCCESS!",
							text: "변경이 완료되었습니다.",
						    icon  : "success",
						    closeOnClickOutside : false
						}).then(function(){
							close();
						});
						
					}
		})
	}
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
	
	.updatePWD {
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
	
	.check_font {
		position : fixed;
		font-family : "NanumGothic";
		text-align: left;
		font-size: 12px;			
	}
	
	#confirmPWD {
		padding-top : 12px;
	}
	
	</style>
</head>
<body>




<!-- # 모바일번호인증 - CoolSMS API ---------------------------------------------------------------------------------------------------------------------------------------->		
		<form class="start">
		
		<h3 class="updatePWD"> 비밀번호변경 </h3>
		<hr style="border:solid 0.11px black;">
		
		<!-- userId Hidden -->
 	  	<input type="hidden" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
 	  	<p class="listUserJoin">  ${dbUser.userId}님의 본인인증이 완료되었습니다. 원하시는 비밀번호로 변경해주세요</p>
 	  	
 	  	
 	  	
		<!-- 번호 입력 후 인증하기 버튼 -->
		<div class="writeInformation">
		
			 <!-- 비밀번호 입력 -->
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">새 비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password1" name="password" placeholder="비밀번호를 입력해주세요">
				</div>
					<div class="check_font" id="pwd_right" style="font-size : 12px" ></div>
			</div>
			
			 <!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="password2" id="confirmPWD" class="col-sm-offset-1 col-sm-3 control-label">새 비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호를 한번 더 입력해주세요">
				</div>
				<div class="check_font" id="pwd_check"></div>
			</div>

			
		</div>
		
		<!-- 확인,취소 -->
		<div class="AuthNumWrite">
			<div class="col-sm-offset-4  col-sm-4 text-center">	
				<button class="px-4 py-4 text-white font-light tracking-wider bg-gray-900 rounded" type="button" style="width:500px;" id="checkBtn" onClick="javascript:updatePwd()">수정</button>			
			</div>
		</div> 
		
		<div class="information">
			<p> • 추측하기 어려운 비밀번호로 작성해주세요 </p>
			<p> • 비밀번호 변경 권장기간은 최소 3개월입니다. </p>
			<p> • 이용에 불편함을 느끼실 경우 문의게시판으로 문의 부탁드리겠습니다. </p>
		</div>
		
		</form>

</body>
</html>