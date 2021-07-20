<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 계정정보조회(모바일번호,비밀번호수정) </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

</script>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> 프로필수정 </h3>
	
<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">프로필수정</h1>

<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

<!--  (버튼누르면 수정되게끔 설정) 차후 추가 수정,보완해야 함 -->	
	<p>프로필이미지 : ${user.profileImage}</p>
	<p>닉네임 : ${user.nickname}</p>
	<p>프로필소개 : ${user.profileContent}</p>
	<p>뱃지 : ${user.badge}</p>
	<p>관심사1 : ${user.interestFirst}</p>
	<p>관심사2 : ${user.interestSecond}</p>
	<p>관심사3 : ${user.interestThird}</p>
	<p>거주지 전체주소 : ${user.fullAddr}</p>	
	<p>거주지 간략주소 : ${user.addr}</p>	
	
	
// 원본	
// 1. 닉네임수정
	function updateNickname() {
		
		var userId=$("input[name='userId'").val();
		var nickname=$("input[name='nickname'").val();

		$("form").attr("method" , "POST").attr("action" , "/user/updateNickname").submit();
	}
	
	// 2. 프로필소개 수정
	function updateContent() {
		
		var userId=$("input[name='userId'").val();
		var ProfileContent=$("input[name='ProfileContent'").val();
		
		$("form").attr("method" , "POST").attr("action" , "/user/updateContent").submit();		
	}	
	
</body>
</html>