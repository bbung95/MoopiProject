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

//--# [모바일인증번호] Ajax--------------------------------------------------------------------------------------------------------------------------

		var key = "";	
	
		function fncKey() {
			
			var keyNum = $("#keyNum").val()
			alert(keyNum);
			if(keyNum === key){
				alert("본인인증이 완료되었습니다.");
			}else{
				alert("인증번호를 다시한번 확인해주세요");
			}
			
		}
		
		function fncAuth(){
			var phone = $("#phone1").val()
			alert(phone);
			$.ajax( 
					{
						url : "/user/json/sms/"+phone ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							alert(status);
							//Debug...
							alert("JSONData : \n"+JSONData);
							alert("JSONData : \n"+JSONData.key);
							key = JSONData.key;
							//<img src="/images/uploadFiles/${product.fileName}"/>
						}
				});	 //ajax종료
		};
<!-------------------------------------------------------------------------------------------------------------------------->
	
		
</script>

</head>
<body>


<h3> 모바일번호인증 </h3>

		<!-- # 모바일번호인증 - CoolSMS API 구현해야 함 / 차후 inputtype에 readonly 기재하기-->
		<div class="form-group">
			<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="keyNum" name="keyNum" placeholder="04:59">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-default" onClick="fncKey()">제출</button>
				</div>
		</div>

</body>
</html>