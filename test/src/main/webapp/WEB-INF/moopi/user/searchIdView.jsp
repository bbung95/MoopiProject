<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 아이디찾기 View </title>

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
	
	var phone=$('input[name=phone]').val();

</script>		
	<style>
	    @font-face {
	    	src: url("../font/NanumGothic-Regular.ttf")'
	    	font-family : "NanumGothic";
	    }
	    
		body{
			font-family : "NanumGothic";
			padding-top: 70px;
		}
		
		.start {
			font-family : "NanumGothic";
			padding: 30px 30px;
		}
		
		.findId {
		font-family : "NanumGothic";
			text-align: center;
			font-size: 30px;
			padding : 15px;
			
		}
		
		.linePadding {
			font-family : "NanumGothic";
			text-align: center;
			padding : 10px;
		}
		
		.findUserId {
			font-family : "NanumGothic";
			text-align: center;
			border: 1px solid gray;
			width: 100%;		
			padding: 100px 48px;
			padding-top: 30px;
		    padding-right: 48px;
		    padding-bottom: 30px;
		    padding-left: 48px;
		}
		
		.confirm {
			font-family : "NanumGothic";
			padding-top : 20px;
		}
		
		.control-label {
			font-family : "NanumGothic";
			font-size : 18px;
			padding-top : 20px;
		}		
	</style>
</head>
<body>

<form class="start">
		
		<h3 class="findId"> 아이디찾기 </h3>
		<hr style="border:solid 0.11px black;">
		
		<!-- userId Hidden -->
 	  	<input type="hidden" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
 	  	
 	  	<p class="linePadding"></p>
 	  	
		<!-- 아이디찾기 -->
		<div class="findUserId">
			<div class="form-group">
				<label for="mobileAuth" class="control-label" id="Content1">회원님의 아이디는 ${dbUser.userId} 입니다.</label>
			</div>		
		</div>
		
		<!-- 확인 -->
		<div class="confirm">
			<div class="col-sm-offset-4  col-sm-4 text-center">			
				<button class="px-4 py-4 text-white font-light tracking-wider bg-gray-900 rounded" style="width:500px;" id="checkBtn" name="img_btn" type="button" onclick="javascript:window.close()">확인</button>	
			</div>
		</div> 

		</form>

</body>
</html>