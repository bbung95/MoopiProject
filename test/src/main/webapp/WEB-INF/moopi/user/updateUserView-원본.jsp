<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title> 계정정보조회(모바일번호,비밀번호수정) </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<!-- 템플릿 관련 CDN -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/admin/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
          crossorigin="anonymous">
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

// # 새 창으로 모바일번호 인증 띄우기 --------------------------------------------------------------------------------------------------------------------------
					
		
		function addUser() {
			
			var popWin;
			var addUser = $("#mobildAuth").val();
			
			popWin = window.open(
									"getMobileAuth?addUser",
									"childForm",
									"left=460, top=300, width=460, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			
			function setChildTest() {
				openWin.document.getElementById("cInput").value = document.getElementById("pnNum").value;				
       		}
		}
	
<!-------------------------------------------------------------------------------------------------------------------------->

//-- [중간완료] 비밀번호 일치 Ajax 실행  --------------------------------------------------------------------------------------------------------------------------
		
		$(function(){
		
			$("#password").keyup(function(){
				$('#pwd_check').text('');
				$("#loginButton").attr("disabled", false);
			});
		
			$("#password2").keyup(function(){				
					if ($("#password").val() != $("#password2").val()){					
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
						$("#loginButton").attr("disabled", true);

					}else{
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치합니다.');
						$("#loginButton").attr("disabled", false);
						
			}
		}); 
	});
<!-------------------------------------------------------------------------------------------------------------------------->


//-- [중간완료] 비밀번호 일치 Ajax 실행  --------------------------------------------------------------------------------------------------------------------------
		
		$(function(){
		
			$("#password1").keyup(function(){
				$('#pwd_check').text('');
				$("#updateBtn").attr("disabled", false);
			});
		
			$("#password2").keyup(function(){				
					if ($("#password1").val() != $("#password2").val()){					
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
						$("#updateBtn").attr("disabled", true);

					}else{
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치합니다.');
						$("#updateBtn").attr("disabled", false);
						
			}
		}); 
	});
	
			$(function(){
		
			$("#password1").keyup(function(){
				
				var regex = /^[A-Za-z\d]{8,12}$/;
				var result = regex.exec($("#password").val());
				
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
					if ($("#password").val() != $("#password2").val()){					
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
						$('#pwd_check').css("color","red")
						$("#updateBtn").attr("disabled", true);

					}else{
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치합니다.');
						$('#pwd_check').css("color","black")
						$("#updateBtn").attr("disabled", false);
						
			}
		}); 
	});


</script>		
    <style>
	body{
	padding-top: 50px;
	}
	</style>
</head>
<body>

	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
		<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->
	
	<!-- [left toolbar] -------------------------------------------------------->
		<jsp:include page="../layout/userToolbar.jsp"/>	
	<!----------------------------------------------------------------->

<body class="h-screen font-sans login bg-cover">
<div class="container mx-auto h-full flex flex-1 justify-center items-center">
    <div class="w-full max-w-lg">    
        <div class="leading-loose">
            <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">
                <p class="text-gray-800 font-medium">추가정보입력</p>
         	       
                <div class="id">
                    <label class="block text-sm text-gray-00" for="userId">아이디</label>
					<input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="userId" name="userId" type="text" required="" value="${user.userId}" readonly aria-label="Id">
                </div>    
                
                <input type="hidden" class="form-control" id="password" name="password" value="${user.password}">
                
				<div class="userName">
                    <label class="block text-sm text-gray-00" for="userName">이름</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="userName" name="userName" type="text" required="" placeholder="이름을 입력해주세요" aria-label="userName">
                    <div class="check_font" id="nameCheck" style="font-size : 12px" ></div>
                </div>
                
				<div class="gender">
                    <label class="block text-sm text-gray-00" for="gender">성별</label>
                    	<input type="radio" name="gender" value="남">남
                    	<input type="radio" name="gender" value="여">여              
					</span>
                </div>
                
				<div class="phone">
                    <label class="block text-sm text-gray-00" for="phone">모바일번호</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="pInput" name="phone" type="text" required="" placeholder="인증을 진행해주세요" aria-label="phone" style="width:340px;">
                    <button type="button" id="mobileAuth" class="btn btn-info" onclick="javascript:addUser()" style="color:gray;">인증하기</button>	
                </div>
                
				<div class="nickname">
                    <label class="block text-sm text-gray-00" for="nickname">닉네임</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="nickname" name="nickname" type="text" required="" placeholder="닉네임을 입력해주세요" aria-label="nickname">
                    <div class="check_font" id="NNCheck" style="font-size : 12px" ></div>	
                </div>
                
				<div class="birth">
                    <label class="block text-sm text-gray-00" for="birth">생년월일
                    <p><input type="date" id="birth" name="birth" value="2021-07-24" min="1900-01-01" max="2022-01-01"></p>
                </div>
                
                <div class="address">
                    <label class="block text-sm text-gray-00" for="address">주소</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="text"  id="fullAddr" name="fullAddr" placeholder="주소지 검색을 눌러주세요" readonly style="width:325px;">
					<button type="button" id="adrSearch" name="addr" onclick="javascript:searchAdr()" style="color:gray;"> 주소지검색</button>
                </div>
                
                <input type="hidden" class="form-control" id="addr" name="addr">

<!-- 관심사입력 -->
		<div class="form-group">
			<label for="interest" class="col-sm-offset-1 col-sm-3 control-label"></label>
			<span class="col-sm-1">
				
				<!-- #관심사1 추가구현예정 -->
				<select name="interestFirst">
						<option>관심사1</option>
						<option value="1">아웃도어/여행/사진/영상</option>
						<option value="2">운동/스포츠</option>
						<option value="3">인문학/책/글</option>
						<option value="4">업종/직무</option>
						<option value="5">외국/언어</option>
						<option value="6">문화/공연/축제/음악/악기</option>
						<option value="7">공예/만들기</option>
						<option value="8">댄스/무용</option>
						<option value="9">사교/인맥</option>                                    
						<option value="10">차/오토바이</option>
						<option value="11">게임/오락</option>
						<option value="12">맛집/카페</option>
				</select> 
				
				<!-- #관심사2 추가구현예정 -->
				<select name="interestSecond">
						<option>관심사2</option>
						<option value="1">아웃도어/여행/사진/영상</option>
						<option value="2">운동/스포츠</option>
						<option value="3">인문학/책/글</option>
						<option value="4">업종/직무</option>
						<option value="5">외국/언어</option>
						<option value="6">문화/공연/축제/음악/악기</option>
						<option value="7">공예/만들기</option>
						<option value="8">댄스/무용</option>
						<option value="9">사교/인맥</option>                                    
						<option value="10">차/오토바이</option>
						<option value="11">게임/오락</option>
						<option value="12">맛집/카페</option>
				</select> 
				
				<!-- #관심사3 추가구현예정 -->
				<select name="interestThird"> 
						<option>관심사3</option>
						<option value="1">아웃도어/여행/사진/영상</option>
						<option value="2">운동/스포츠</option>
						<option value="3">인문학/책/글</option>
						<option value="4">업종/직무</option>
						<option value="5">외국/언어</option>
						<option value="6">문화/공연/축제/음악/악기</option>
						<option value="7">공예/만들기</option>
						<option value="8">댄스/무용</option> 
						<option value="9">사교/인맥</option>                                    
						<option value="10">차/오토바이</option>
						<option value="11">게임/오락</option>
						<option value="12">맛집/카페</option>
				</select> 
				
			</span>
		</div>
		
		<div class="mt-4">
			<button class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded" id="joinButton" name="join" type="submit" onclick="javascript:fncAddUser()">등록</button>
		</div>
		             
            </form>
        </div>
    </div>
</div>








<h3> user/login : 로그인시작 </h3>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
		
		<div class="row">
		
		<h1 class="bg-primary text-center">계정정보</h1>
		
<!-- FORM START ---------------------------------------------------------------------------------------------------------------->

	<form class="form-horizontal"">
	
	<!-- 유저아이디 -------------------------------------------------------------------------------------------------->
	<p>아이디 : ${dbUser.userId}</p>
	<p>이름 : ${dbUser.userName}</p>
	<p>모바일번호 : ${dbUser.phone}</p>
	<p>생년월일 : ${dbUser.birth}</p>
		
	<!-- 모바일번호변경 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
 	  	<div class="col-sm-offset-2  col-sm-4 text-center">
 	  	<h5>모바일번호</h5>
 	  	</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<input type="text" class="form-control" id="userId" name="userId" value="${dbUser.userId}" readonly>
		</div>
	</div>
	
	<!-- 비밀번호 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
 	  	<div class="col-sm-offset-2  col-sm-4 text-center">
 	  	<h5>비밀번호</h5>
 	  	</div>
	</div>
	
	<!-- 현재비밀번호 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<input type="text" class="form-control" id="userName" name="userName" value="${dbUser.userName}" readonly>
			현재 비밀번호를 입력해주세요
		</div>
	</div>
	
	<!-- 새 비밀번호 -------------------------------------------------------------------------------------------------->
	<div class="form-group">
		<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호를 입력해주세요">
			</div>
	</div>
	
	<!-- 비밀번호 확인 -->
	<div class="form-group">
		<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호확인</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="password2" name="password2" placeholder="새 비밀번호를 한번 더 입력해주세요">
			</div>
		<div class="check_font" id="pwd_check"></div>
	</div>

<!-- 수정, 취소 Button ---------------------------------------------------------------------------------------------------------------->									
	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" id="loginButton" class="btn btn-primary">수정</button>
			<a class="btn btn-default btn" a href="/" role="button">취소</a>
		</div>
	</div>	 
	
	
</body>
</html>