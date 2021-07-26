<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

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
     
     function fncLeave() {
     
     	alert("진짜탈퇴");
     	var userId = $("#userId").val();
     	var userRole = $("#userRole").val();
     	var stateReason = $("#stateReason").val();
     	alert(userId);
     	alert(userRole);
     	alert(stateReqson);
     	location.href = "/user/updateLeaveUser?userId="+dbUser+"&userRole="+ userRole+"&stateReason="+stateReason;
     }    
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
	
	<!-- 유저아이디 hidden -->
	<input type="hidden" id="userId" name="userId" value="${dbUser.userId}"/>
	<input type="hidden" id="userRole" name="userRole" value="${dbUser.userRole}"/>
	유저아이디 : ${dbUser.userId}
	유저롤 : ${dbUser.userRole}

<body class="h-screen font-sans login bg-cover">
<div class="container mx-auto h-full flex flex-1 justify-center items-center">
    <div class="w-full max-w-lg">    
        <div class="leading-loose">
            <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">
                <p class="text-gray-800 font-medium">정말 저희 무피를 떠나실 건가요?</p>
				
				<div class="container mx-auto h-full flex flex-1 justify-center items-center" background-color:"#b2b2b2;">
	                <div class="id">
	                    <h4> 회원탈퇴 신청 전 아래 사항을 확인 부탁드립니다 😊 </h4>
						<p>1. 신청일부터 30일 후 회원탈퇴가 처리되며, 회원탈퇴 처리 전까지 저희 무피사이트를 찾아주셔서 로그인 진행을 해주신다면 그 신청을 철회할 수 있습니다.</p>
						<p>2. 회원탈퇴 후 기존 계정으로 회원가입을 신청할 수 없습니다.</p>
						<p>3. 배송/교환/반품 중인 상품이 있는 경우 신청할 수 없습니다.</p>
						<p>4. 회원탈퇴 시 가입한 모임, 코인 등 회원이 가진 권리는 모두 소멸합니다. 회원탈퇴 후 잔여코인과 관련한 환불이 불가하므로 필요한 경우 탈퇴 전에 환불을 신청해주세요.</p>
						<p>5. 회원탈퇴 시 회사가 보관하고 있는 회원 데이터는 모두 영구적으로 삭제됩니다. 다만, 관련 법령에 따라 회사가 보관할 의무가 있는 정보 또는 자료는 일정기간 동안 보관됩니다.</p>
						<p>6. 회원탈퇴 후 저희 무피사이트에 게시한 게시물을 편집하거나 삭제할 수 없습니다. 필요한 경우 신청 전 게시물을 편집하거나 삭제해주세요.</p>
	                </div>            
                </div>
               
                <div class="container mx-auto h-full flex flex-1 justify-center items-center">
	               	<div class="pwd">
	               	 <h4> 사유를 입력해주세요 </h4>
	                    <label class="block text-sm text-gray-00"></label>
	                    <input class="w-full px-30 py-1 text-gray-700 bg-gray-200 rounded" type="text" max-width: 500px; id="stateReason">
	                </div>
                </div>

				<div class="mt-4">
                    <button class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded" type="submit" onclick="javascript:history.back()">뒤로가기</button>
					<button class="px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded" type="submit" onclick="javascript:fncLeave()">탈퇴하기</button>
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