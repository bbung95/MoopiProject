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

<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/css/admin/styles.css" rel="stylesheet" />

<!-- 템플릿 관련 CDN -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/admin/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
          crossorigin="anonymous">
          
<!-- 스윗얼럿 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-------------------------------------------------------------------------------------------------------------------------->   
  
<script>
// 가입버튼
	function fncAddUserInfo() {
		var id=$("input[name='userId']").val();
		var password=$("input[name='password']").val();
		var password2=$("input[name='password2']").val();
		
		if(id == null || id.length <1){
			swal("아이디는 필수로 입력하셔야 합니다.","아이디를 확인해주세요","error");
			return;
		}		
		if(password == null || password.length<8){
			swal("올바른 비밀번호가 아닙니다.","비밀번호를 확인해주세요","error");
			return;
		}		
		if(password2 == null || password2.length<8){
			swal("올바른 비밀번호가 아닙니다.","비밀번호를 확인해주세요","error");
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
									$("#id_check").css("color","red");
									$("#loginButton").attr("disabled", true);									
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
               
</script>
  
    <style>
    	body {
			top:50%;
			left:50%;
			background:#f00;
    	}
    	
        .login{
            background-color : #D6D6D6;
            padding-top: 0px;
        }
        
        .text-gray-800 {
        	font-size : 25px;
        }
        		
		#Id_blank{
			font-size : 15px;
			 font-weight: 500;
		}
		
		#id_check {
			text-align: left;	
			height : 20px;	
		}
		
		#cus_password{
			font-size : 15px;
			font-weight: 500;
		}
		
		#pwd_right {
			text-align: left;	
			height : 20px;	
			font-size : 12px
		}
		
		#pwd_check {
			text-align: left;	
			height : 20px;
			font-size : 12px	
		}
		
		#cus_password2{
			font-size : 15px;
			font-weight: 500;
		}
		
		#loginButton{ 
	        width:400px;
	        margin:auto;
	        display:block;
		}
		
		.already{
			text-align : right;	
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
                <p class="text-gray-800">회원가입</p>
         	    <hr>
                <div class ="ID_BLANK">
                	<div class="cus_Id_Main">
                		<label class="block text-sm text-gray-00" id="Id_blank">아이디</label>
                    </div>
                    <div>
						<input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="userId" name="userId" type="text" required="" placeholder="사용하실 아이디를 입력해주세요" aria-label="Id">
                   	</div>
						<div class="check_font" id="id_check" style="font-size:12px" "pixed"></div>
                </div>            
                
               	<div class="PWD_BLANK">
                    <label class="block text-sm text-gray-00" id="cus_password">비밀번호</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="password" id="password1" name="password" type="text" required="" placeholder="비밀번호를 입력해주세요" aria-label="password">
                    <div class="check_font" id="pwd_right"></div>
                </div>
                
                <div class="pwd-confirm">
                    <label class="block text-sm text-gray-00" id="cus_password2">비밀번호확인</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="password" id="password2" name="password2" type="text" required="" placeholder="비밀번호를 한번 더 입력해주세요" aria-label="password2">
                    <div class="check_font" id="pwd_check"></div>
                </div>
                
                <div class="mt-4">
                    <button class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded" id="loginButton" name="join" type="button" onclick="javascript:fncAddUserInfo()">가입</button>
                </div>
                
                <div class="already">              
                <a class="inline-block right-0 align-baseline font-monospace text-sm text-500 hover:text-blue-800" href="/user/loginView">
                    이미 가입된 계정이 있으신가요?
                </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>