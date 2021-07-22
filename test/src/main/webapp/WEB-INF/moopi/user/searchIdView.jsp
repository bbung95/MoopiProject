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

<script>
	var userId=$('input[name=userId]').val();
</script>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> 아이디찾가 </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
		
		<div class="row">
		
		<h1 class="bg-primary text-center">아이디찾기</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

	<form class="form-horizontal"">
 	  		
 	  	<div class="form-group">
 	  		<div class="col-sm-offset-2  col-sm-4 text-center">
 	  		<h5>아이디</h5>
 	  		</div>
 	  	</div>
 	  	
 	  	 <div class="form-group">
 	  		<div class="col-sm-offset-4  col-sm-4 text-center">
 	  		<input type="text" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
 	  		</div>
 	  	</div>
 	  	
 	  	
 	  	<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-default" id="checkBtn">확인</button>
			</div>
		</div> 
 	  			
 	</form>

</body>
</html>