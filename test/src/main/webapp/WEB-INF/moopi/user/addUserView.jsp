<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<! -- jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
<!-- 구글폰트api -->	
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
	<link href="/css/admin/styles.css" rel="stylesheet" />
	
<!-- 카카오로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 구글로그인 -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<meta name="google-signin-scope" content="profile email">
	<meta name ="google-signin-client_id" content="959630660117-f5d12kulu8hloob7jid8f0jfeenr57sv.apps.googleusercontent.com">
	<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- 네이버로그인 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
	
<!-- 템플릿 관련 CDN -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/admin/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
          crossorigin="anonymous">
<!-------------------------------------------------------------------------------------------------------------------------->   
  
<script>
// 가입버튼
	function fncAddUserInfo() {
		var id=$("input[name='userId']").val();
		var password=$("input[name='password']").val();
		var password2=$("input[name='password2']").val();
		
		if(id == null || id.length <1){
			alert("아이디는 필수로 입력하셔야 합니다");
			return;
		}
		
		if(password == null || password.length <1){
			alert("비밀번호는 필수로 입력하셔야 합니다");
			return;
		}
		
		if(password2 == null || password2.length <1){
			alert("비밀번호를 한번 더 입력해주세요");
			return;
		}
		
		<!-- 필수값인 아이디와 비밀번호를 입력 후 가입을 누르면 UserController의 addUser가 실행된다.-->
		$("form").attr("method" , "POST").attr("action" , "/user/addUserInfo").submit();
	}
<!-------------------------------------------------------------------------------------------------------------------------->

//-- 아이디 유효성체크 / 중복, 미중복체크 / 아이디 유효성 검사(1 = 중복 / 0 != 중복) --------------------------------------------------------------------------------------------------------------------------

	$(function() {
		
		$("#userId").keyup(function() {
	
			var userId = $('#userId').val();		
			
			$.ajax({
				
				url : '${pageContext.request.contextPath}/user/idCheck?userId='+userId,
				type : 'get',
				success : function(data) {					
					
					if (data == 1) {
							
							// 1 : 아이디 중복일 경우
								
								$("#id_check").text("해당 아이디는 이미 사용중입니다.");
								$("#id_check").css("color", "red");
								$("#loginButton").attr("disabled", true);
						
						} else if (data == 0) {
								
								var id = $('#userId').val();
								var regex = /^[a-z]+[a-z0-9]{5,19}$/g;
								var result = regex.exec(id);
								
								if (id == "") {
									$("#id_check").text("아이디를 입력해주세요");
									return;
								} else if (result != null){
									$("#id_check").text("사용가능한 아이디입니다.");
									$("#id_check").css("color", "black");
									$("#loginButton").attr("disabled", false);
								} else {
									$("#id_check").text("");
									$("#id_check").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다");
									$("#id_check").css("color","red")
								}
						
						} 
												
					}, error : function() {
							console.log("실패");
					}
			});
		});
	});
<!-------------------------------------------------------------------------------------------------------------------------->


	
//-- [중간완료] 비밀번호 일치 Ajax 실행  --------------------------------------------------------------------------------------------------------------------------
		
		$(function(){
		
			$("#password").keyup(function(){
				
				var regex = /^[A-Za-z\d]{8,12}$/;
				var result = regex.exec($("#password").val());
				
				if(result != null){
                    $('#pwd_right').text("");
                }else{
                    $('#pwd_right').text("비밀번호는 영어대소문자와 숫자를 포함하여 8-11자리이상으로 작성해주세요");
                    $('#pwd_right').css("color","red")
                }
			
				$('#pwd_check').text('');
				$("#loginButton").attr("disabled", false);
			});
		
			$("#password2").keyup(function(){				
					if ($("#password").val() != $("#password2").val()){					
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치하지 않습니다.');
						$('#pwd_check').css("color","red")
						$("#loginButton").attr("disabled", true);

					}else{
						$('#pwd_check').text('');
						$('#pwd_check').text('비밀번호가 일치합니다.');
						$('#pwd_check').css("color","black")
						$("#loginButton").attr("disabled", false);
						
			}
		}); 
	});
<!-------------------------------------------------------------------------------------------------------------------------->   
               
</script>
  
    <style>
        .login{
            background-color : #D6D6D6;
            padding-top: 76px;
        }
    </style>

</head>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->
<div>
	<a href="javascript:history.back()">
	<img class="img-back" src="../images/icons/icon_back.png" width="25" name="back"></a>
</div>

<body class="h-screen font-sans login bg-cover">
<div class="container mx-auto h-full flex flex-1 justify-center items-center">
    <div class="w-full max-w-lg">    
        <div class="leading-loose">
            <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">
                <p class="text-gray-800 font-medium">회원가입</p>
         	       
                <div class="id">
                    <label class="block text-sm text-gray-00" for="cus_Id">아이디</label>
                   	 <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="userId" name="userId" type="text" required="" placeholder="사용하실 아이디를 입력해주세요" aria-label="Id">
                    <div class="check_font" id="id_check" style="font-size : 12px"></div>
                </div>            
                
               	<div class="pwd">
                    <label class="block text-sm text-gray-00" for="cus_password">비밀번호</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="password" id="password" name="password" type="text" required="" placeholder="비밀번호를 입력해주세요" aria-label="password">
                    <div class="check_font" id="pwd_right" style="font-size : 12px" ></div>
                </div>
                
                <div class="pwd-confirm">
                    <label class="block text-sm text-gray-00" for="cus_password2">비밀번호확인</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="password" id="password2" name="password2" type="text" required="" placeholder="비밀번호를 한번 더 입력해주세요" aria-label="password2">
                    <div class="check_font" id="pwd_check" style="font-size : 12px"></div>
                </div>
                
                <div class="mt-4">
                    <button class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded" id="loginButton" name="join" type="submit" onclick="javascript:fncAddUserInfo()">가입</button>
                </div>
                              
                <a class="inline-block right-0 align-baseline font-monospace text-sm text-500 hover:text-blue-800" href="/user/loginView">
                    이미 가입된 계정이 있으신가요?
                </a>
            </form>
        </div>
    </div>
</div>

</body>
</html>