<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<! -- jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- 이게있으면 모달이 안된다 -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
<!-- 구글폰트api -->	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">
	
<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>	

<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
	
<!-- 스윗얼럿 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

<!-- 다음주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
<!-------------------------------------------------------------------------------------------------------------------------->   
  
<script>

<!-- 이름 적합성검사 -->
	$(function() {
		$("#userName").keyup(function(){		
			var regex = /[가-힣]{2,}/;
			var result = regex.exec($("#userName").val());		
			if(result != null){
				$("#nameCheck").text(""); 
			}else{
				$("#nameCheck").text("이름은 한글만 입력 가능합니다.");
				$("#nameCheck").css("color", "red");
				$("#joinButton").attr("disabled", true); 
			}		
		})	
	});
	
<!-- 닉네임 유효성체크 -->
	$(function() {	
		$("#nickname").keyup(function() {
			var nickname = $('#nickname').val();		
			$.ajax({				
				url : '${pageContext.request.contextPath}/user/nicknameCheck?nickname='+nickname,
				type : 'get',
				success : function(data) {									
					if (data == 1) {							
							// 닉네임이 중복일경우							
								$("#NNCheck").text("해당 닉네임은 이미 사용중입니다.");
								$("#NNCheck").css("color", "red");
								$("#joinButton").attr("disabled", true);						
					} else if (data == 0) {								
								$("#NNCheck").text("사용가능한 닉네임 입니다.");
								$("#NNCheck").css("color", "black");
								$("#joinButton").attr("disabled", false);						
					} 
				}, error : function() {
					console.log("실패");
				}
			});
		});
	});

<!-- [주소 API] -->
	function searchAdr() {	
		new daum.Postcode({		
			oncomplete : function(data) {
				$('#fullAddr').val(data.address);
				$('#addr').val(data.sigungu);
			}
		}).open();				
	}

<!-- [모바일인증 - 새 창] -->	
	function addUser() {		
		var popWin;
		var addUser = $("#mobildAuth").val();			
		popWin = window.open(
				"getMobileAuth?addUser",
				"childForm",
					"left=460, top=300, width=600, height=550, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");	
		function setChildTest() {
				penWin.document.getElementById("cInput").value = document.getElementById("pnNum").value;				
       	}
	}
	
// # 회원가입 Event--------------------------------------------------------------------------------------------------------------------------

		// 네이버아이디 Client Id 값, RedirectURI 지정
			var naver_id_login = new naver_id_login("MJJpKOvtYqXuhtTnhQtq", "http://localhost:8080/user/loginPostNaver");

		// 네이버 사용자 프로필 조회 - naverSignInCallback function 호출
			naver_id_login.get_naver_userprofile("naverSignInCallback()"); 
			
			function naverSignInCallback() {		
				if(naver_id_login.getProfileData('id')){
					var naverId = naver_id_login.getProfileData('id').val();
					console.log("아이디 : "+naverId);	
					alert("아이디 : "+naverId);		
												
				} else {
					alert("ERROR");
					window.close();
				}//End if문
								
	 		}//End naverSignInCallback
	
// # 값 담아주기 Event --------------------------------------------------------------------------------------------------------------------------		

	function fncAddUser() {
	
		var id=$("input[name='userId']").val();
		var password=$("input[name='password']").val();
		var gender=$("select[name='gender']").val();
		var userName=$("input[name='userName']").val();		
		var phone=$("input[name='phone']").val();
		var nickname=$("input[name='nickname']").val();
		var fullAddr=$("input[name='fullAddr']").val;
		var addr=$("input[name='addr']").val();
		var interest1=$("select[name='interestFirst']").val();
		var interest2=$("select[name='interestSecond']").val();
		var interest3=$("select[name='interestThird']").val();	
		var birth = $("input[name='birth']").val();

		
		alert("반갑습니다 "+userName+"님 회원가입을 축하드립니다.");
		
		$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
	
	};
	
			
			


</script>
  
    <style>
        .login{
            background-color : #D6D6D6;
        }
        
        #nameCheck{
        	text-align: left;	
			height : 20px;	
        }
        
        #mobileAuth{		
        	position: relative;	
	        border: 1px solid gray;
			top : -38px;
			font-size: 12px;
		    width: 70px;
		    margin-left: 323px;
       	}
       	
       	.nickname{
       		position: relative;	
       	}
       	
       	#adrSearch{		
        	position: relative;	
	        border: 1px solid gray;
			top : -38px;
			font-size: 12px;
		    width: 70px;
		    margin-left: 323px;
		    padding-down : -150px;
       	}
    </style>

</head>

<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

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
                    	<input type="radio" name="gender" value="1">남
                    	<input type="radio" name="gender" value="2">여             
					</span>
                </div>
                
				<div class="phone">
                    <label class="block text-sm text-gray-00" for="phone">모바일번호</label>
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" id="pInput" name="phone" type="text" required="" placeholder="인증을 진행해주세요" aria-label="phone" >
                    <button class="micro_btn" type="button" id="mobileAuth" onclick="javascript:addUser()" style="color:gray;">인증하기</button>	
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
                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="text"  id="fullAddr" name="fullAddr" placeholder="주소지 검색을 눌러주세요" readonly>
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

</body>
</html>