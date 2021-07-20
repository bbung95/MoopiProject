<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Moopi</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<style>
	nav{
		background: gray;
		display : flex;
		flex-direction: row;
	}
</style>
<body>
	<nav>
		<div class="nav">
			<div>회원목록</div>
			<div>모임목록</div>
			<div>번개목록</div>
			<div>신고목록</div>
			<div>결제목록</div>
		</div>
		<div class="main">
			안녕하세요
		</div>
	</nav>
<script>
	$('.nav div:contains("회원목록")').on('click', function(){
		
		location.href = "/common/getUserList";
	})
	$('.nav div:contains("모임목록")').on('click', function(){
		
		location.href = "/common/getMoimList";
	})
	$('.nav div:contains("번개목록")').on('click', function(){
		
		location.href = "/common/getFlashList";
	})
	$('.nav div:contains("신고목록")').on('click', function(){
		
		location.href = "/common/getFlashList";
	})
	$('.nav div:contains("결제목록")').on('click', function(){
		
		location.href = "/common/getFlashList";
	})
</script>
</body>
</html>