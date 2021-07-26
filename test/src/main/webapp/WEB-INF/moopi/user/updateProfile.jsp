<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>프로필수정</title>

<! -- jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
<!-- 구글폰트api -->	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">
	
<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>	

<!-- 필수 Core theme CSS (includes Bootstrap)-->
	<link href="/css/admin/styles.css" rel="stylesheet" />

<!-- 다음주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<!-- 필수 css템플릿 관련 CDN -->
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/admin/all.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">

<!-- 모달 왜 안돼 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<!-------------------------------------------------------------------------------------------------------------------------->   
  
<script>
<!-- 닉네임 유효성체크 -->
	$(function() {	
		$('input[name="nickname"]').keyup(function() {
			var nickname = $('input[name="nickname"]').val();		
			$.ajax({				
				url : '${pageContext.request.contextPath}/user/nicknameCheck?nickname='+nickname,
				type : 'get',
				success : function(data) {									
					if (data == 1) {							
							// 닉네임이 중복일경우							
								$("#NNCheck").text("해당 닉네임은 이미 사용중입니다.");
								$("#NNCheck").css("color", "red");
								$("#updatebtn").attr("disabled", true);						
					} else if (data == 0) {								
								$("#NNCheck").text("사용가능한 닉네임 입니다.");
								$("#NNCheck").css("color", "black");
								$("#updatebtn").attr("disabled", false);						
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
			oncomplete: function(data) {
				$('#fullAddr').val(data.address);
				$('#addr').val(data.bname);
			}
		}).open();				
	}
	
<!-- [완료] Nickname 수정 -->
	function updateNN(){
		
		var userId = $("#userId").val();		
		var nickname = $("#userNickname").val();
		
		$.ajax ({
			url : "/user/json/updateNickname/"+userId+"/"+nickname,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data, state) {				
				var nickname = "jsonData.nickname";				
				$("#nickname").val();
			}
		});
	}
	
<!-- [완료] profileContent 수정 -->
	function updatePC(){		
		var userId = $("#userId").val();		
		var profileContent = $("#profileContent").val();		
		$.ajax ({
			url : "/user/json/updateContent/"+userId+"/"+profileContent,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data, state) {
				var profileContent = "jsonData.profileContent";				
				$("#profileContent").val();
			}
		});
		alert("프로필소개 수정이 완료되었습니다.");
	}
	
<!-- [완료] fullAddr, addr 수정 -->
	function updateAddr(){		
		var userId = $("#userId").val();		
		var fullAddr = $("#fullAddr").val();
		var addr = $("#addr").val();				
		$.ajax ({
			url : "/user/json/updateAddress/"+userId+"/"+fullAddr+"/"+addr,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data, state) {
				var fullAddr = "jsonData.fullAddr";		
				var addr = "jsonData.addr";						
				$("#fullAddr").val();
				$("#addr").val();
			}
		});
		alert("주소 수정이 완료되었습니다.");
	}
					
<!-- [완료] interest 수정 -->
	function updateInterest(){	
		var userId = $("#userId").val();		
		var interestFirst = $("#interestFirst").val();
		var interestSecond = $("#interestSecond").val();
		var interestThird = $("#interestThird").val();						
		$.ajax ({
			url : "/user/json/updateInterest/"+userId+"/"+interestFirst+"/"+interestSecond+"/"+interestThird,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data, state) {			
				var interestFirst = "jsonData.interestFirst";		
				var interestSecond = "jsonData.interestSecond";	
				var interestThird = "jsonData.interestThird";						
				$("#interestFirst").val();
				$("#interestSecond").val();
				$("#interestThird").val();
			}
		});
		alert("관심사 수정이 완료되었습니다.");
	}
	
<!-- [완료] 마이홈상태 수정 -->
	$(function updateMyhome() {			
		$('input[name="myhomeState"]').on('click', function() {			
			var userId = $("#userId").val();
			var myhomeState = $('.radio-value:checked').val();
			$.ajax ({
				url : "/user/json/updateMyhomeStat/"+userId+"/"+myhomeState,
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				success : function(data, state) {			
					var myhomeState = "jsonData.myhomeState";											
					$("#myhomeState").val();					
				}				
			});				
			alert("마이홈상태가 변경완료되었습니다.");		
		})	 
	});
	
<!-- 회원탈퇴 -->
	function deleteUser() {
	
		alert("탈퇴를 누름");
		
		var userId = $("#userId").val();
		alert("유저아이디 : "+userId);
		
		$("form").attr("method" , "POST").attr("action" , "/user/updateLeaveUserView").submit();
	}
		
</script>
	<style>
		body {
			padding-top: 70px;
		}		
		
		.profileImg {
			max-width : 100%;
 			border-radius: 100%;
		}
		        
        .max-w-lg {
    		max-width: 32rem;
		}
		
		a:link { color: gray; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover { color: red; text-decoration: none;}  
		
		.deleteUserRight {
			text-align: right;
		}



		
	</style>

</head>

<body>
<!-- [툴바] ----------------------------------------------------------->
<jsp:include page="../layout/toolbar.jsp"/>
<!-- [left toolbar] -------------------------------------------------------->
	<div class="container main">
		<div class="row">
			<div class="col-xl-2 ">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">내 정보수정</li>
					<li class="list-group-item">My모임무피</li>
					<li class="list-group-item">My번개무피</li>
					<li class="list-group-item">My결제내역</li>
					<li class="list-group-item">My코인내역</li>
				</ul>
			</div>
			<div class="col-xl-10"></div>
		</div>
	</div>
<!----------------------------------------------------------------->


<div class="container px-5 my-5 ">
<body class="h-screen font-sans login bg-cover">
<div class="container mx-auto h-full flex flex-1 justify-center items-center">
    <div class="w-full max-w-lg">    
        <div class="leading-loose">
            <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">
                <p class="text-gray-800 font-medium" style="text-align:center;"></p>
         	             	     
				<!-- 아이디, 주소(동) [hidden] -->
				<input type="hidden" id="userId" name="userId" value="${dbUser.userId}"/>
				<input type="hidden" class="form-control" id="addr" name="addr">
				
         	     	<!-- 프로필사진, 닉네임, 닉네임 수정버튼 -->
					<div class="row text-center" data-matrix-loop="true" data-matrix-column="1">
						<div class="col-xs-4 col-sm-4 col-md-4 item"></div>
						<div class="col-xs-4 col-sm-4 col-md-4 item">
							<img src="http://newspublic.org/news/data/20210224/p1065611064396601_914_thum.jpeg" class="profileImg">			
							<div class="text-box" style="margin-top: 20px;">
								<h5 class="head_title" data-edit="true" data-selector="h5.head_title">
									<!-- 닉네임 -->
									<span class="fsize15"><strong>${dbUser.nickname}</strong></span>																													
								</h5>
							</div>
						</div>
						</div>
					</div>  
					
				<!-- 닉네임수정 -->
                <div class="profileContent px-4 px-1">
                    <label class="block text-sm text-gray-00" for="userId">닉네임</label>
					<input class="w-full px-4 py-1 text-gray-700 bg-gray-200 rounded" type="text" style="color:gray;" type="text" name="nickname" id="userNickname" value="${dbUser.nickname}" aria-label="nn" placeholder="닉네임 입력해주세요">						
					<div class="check_font" id="NNCheck" style="font-size : 12px" ></div>	
					<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded" id="updatebtn" name="updatebtn" type="submit" onclick="javascript:updateNN()">수정</button>							
					<div></div> 
                </div>         	     
         	      
         	    <!-- 프로필소개 -->
                <div class="profileContent px-4 px-1">
                    <label class="block text-sm text-gray-00" for="userId">프로필소개</label>
					<input class="w-full px-4 py-5 text-gray-700 bg-gray-200 rounded" style="color:gray;" id="profileContent" name="profileContent" type="text" required="" value="${dbUser.profileContent}" aria-label="profileContent" placeholder="프로필소개를 입력해주세요">						
					<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded" id="updateContent" name="updateContent" type="submit" onclick="javascript:updatePC()">수정</button>		
					<div></div> 
                </div>                               
                
                <!-- 주소 -->
				<div>
	                <div class="address px-4 px-1">
	                    <label class="block text-sm text-gray-00" for="address">주소</label>
	                   
	                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="text"  id="fullAddr" name="fullAddr" value="${dbUser.fullAddr}" placeholder="주소지 검색을 눌러주세요" readonly >
						<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded" id="adrSearch" name="addr" type="submit" onclick="javascript:searchAdr()">검색</button>		
	                </div>
				</div>

				<!-- 관심사 -->

				<div>
	                <div class="address px-4 px-1">
	                    <label class="block text-sm text-gray-00" for="interest">관심사</label>

						<div class="col-sm-15"> 
							
							<select name="interestFirst" id="interestFirst" style="width:460px;" class="px-4 py-0 text-black font-light tracking-wider bg-gray-200 rounded">
									<option> ${dbUser.interestFirst} </option> 
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
														
							<select name="interestSecond" id="interestSecond" style="width:460px;" class="px-4 py-0 text-black font-light tracking-wider bg-gray-200 rounded">
									<option> ${dbUser.interestSecond} </option>
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
												
							<select name="interestThird" id="interestThird" style="width:460px;" class="px-4 py-0 text-black font-light tracking-wider bg-gray-200 rounded">
									<option>${dbUser.interestThird}</option>
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

					</div>
					<div>				
						<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded" id="img_btn" name="img_btn" type="submit" onclick="javascript:updateInterest()">수정</button>	
					</div>
				</div>
				
	
				<!-- 마이홈 공개, 비공개 설정-->
				<div class="form-group px-4 px-1">	
					<label class="block text-sm text-gray-00" for="MHopen">마이홈공개여부</label>		
						<label for="radio-0">공개</label>
						<input type="radio" class="radio-value" name="myhomeState" id="myhomeState" value="0">																
						<label for="radio-1">비공개</label>
						<input type="radio" class="radio-value" name="myhomeState" id="myhomeState" value="1">
					</div>				
				</div>
				
				<!-- 회원탈퇴 -->
				<div>					
					<div class="form-group px-4 px-1" style="text-align:right;">
						<button class="deleteUserRight" onclick="javascript:deleteUser()">회원탈퇴</a></span>											
					</div>
				</div>
			
			</form>					
        </div>
    </div>   
</div>
		        			  			
	<form>			
        <!--Footer-->
        <footer class="bg-grey-darkest text-white p-2">
            <div class="flex flex-1 mx-auto">&copy; Moopi (Move People)</div>
        </footer>
        <!--/footer-->
    </div>
</div>



</body>
</html>