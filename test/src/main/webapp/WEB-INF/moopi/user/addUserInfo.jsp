<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

	$( function(fndAddUserInfo()) {
	alert("여기 시작");
	}

	function fncAddUserInfo(){ 
		alert("login.jsp_____회원가입시작");
		
		var name=$(".userName").val();
		var birth1=$("select:birth1").val();
		var birth2=$("select:birth2").val();
		var birth3=$("select:birth3").val();
		
		$("form").attr("method", "POST".attr("action", "/user/addUser").submit();
	}
	
</script>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> user/addUserInfo : 추가정보입력시작 </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

<div class="container">
	
	<h1 class="bg-primary text-center">추가정보입력</h1>

<!-- FORM START ---------------------------------------------------------------------------------------------------------------->
		
	<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		
		<!-- #기존 아이디 입력 값 / API사용의 경우 API 이메일주소 기재 될 예정 -->
		<div class="form-group">
			<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="userId" name="userId" placeholder="여기에 이전 아이디값 가져오기" readonly>
			</div>
		</div>
		
		<!-- 이름 및 성별입력 -->
		<div class="form-group">
			<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요">
				</div>
			<label for="gender" class="col-sm-1 control-label">성별</label>		
				<span class="col-sm-3" >
					<select name="gender">
						<option value="남성">남성</option>
						<option value="여성">여성</option>
					</select>
				</span>	
		</div>
		
		<!-- # 모바일번호인증 - CoolSMS API 구현해야 함 -->
		<div class="form-group">
			<label for="phone" class="col-sm-offset-1 col-sm-3 control-label">모바일번호</label>
			<div class="col-sm-4">
				<span class="col-sm-3">
					<button type="button" class="btn btn-info">인증하기</button>
				</span>	
			</div>
		</div>
		
		<!-- # 닉네임입력 - Ajax 사용해야 함 -->
		<div class="form-group">
			<label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요">
			</div>
		</div>
		
		<!-- 생년월일 -->
		<div class="form-group">
			<label for="birth" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
			<span class="col-sm-1">
				
				<!-- #생년 추가구현예정 -->
				<select name="birth1"> <!-- #생년 추가구현예정 -->
						<option value="1992년">1992</option>
						<option value="1993년">1993</option>
				</select> 
				
				<!-- #생월 추가구현예정 -->
				<select name="birth2">
						<option value="1월">1</option>
						<option value="2월">2</option>
				</select>
				
				<!-- #생일 추가구현예정 -->
				<select name="birth3">
						<option value="11">11</option>
						<option value="12">12</option>
				</select>
				
			</span>
		</div>
		
		<!-- #전체 거주지입력 / 주소지 API 구현해야 함 -->
		<div class="form-group">
			<label for="fullAddr" class="col-sm-offset-1 col-sm-3 control-label">거주지입력</label>
			<div class="col-sm-2">
			<input type="text" class="form-control" id="fullAddr" name="fullAddr" placeholder="주소를 입력해주세요" readonly>
			</div>
				<span class="col-sm-3">
					<button type="button" class="btn btn-info">우편번호입력</button>
				</span>	
		</div>
		
		<!-- 관심사입력 -->
		<div class="form-group">
			<label for="interest" class="col-sm-offset-1 col-sm-3 control-label">관심사</label>
			<span class="col-sm-1">
				
				<!-- #관심사1 추가구현예정 -->
				<select name="interest1"> 
						<option value="운동">운동</option>
						<option value="토익/취업">토익/취업</option>
				</select> 
				
				<!-- #관심사2 추가구현예정 -->
				<select name="interest2">
						<option value="공예">공예</option>
						<option value="드라이브/차">드라이브/차</option>
				</select>
				
				<!-- #관심사3 추가구현예정 -->
				<select name="interest3">
						<option value="프로그래밍/컴퓨터">프로그래밍/컴퓨터</option>
						<option value="게임/오락">게임/오락</option>
				</select>
				
			</span>
		</div>

<!-- 가입완료 Button ---------------------------------------------------------------------------------------------------------------->											  
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary" onClick="fncAddUserInfo()">등록</button>
			</div>
		</div>
<!---------------------------------------------------------------------------------------------------------------------------->	

<!-- FORM END ---------------------------------------------------------------------------------------------------------------->
		  			
 	</div>

</body>
</html>