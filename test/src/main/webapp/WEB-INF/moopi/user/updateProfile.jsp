<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Moopi</title>

<! -- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<!-------------------------------------------------------------------------------------------------------------------------->

<!-- 구글폰트api -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap"
	rel="stylesheet">


<!-- 필수 Core theme CSS (includes Bootstrap)-->
<link href="/css/admin/styles.css" rel="stylesheet" />

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="/js/scripts.js"></script>

<!-- 다음주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				$('#addr').val(data.sigungu);
			}
		}).open();				
	}
	
	
function edit(type){
		
		var userId = $("#userId").val();
		var nickname = $("#userNickname").val();
		var profileContent = $("#profileContent").val();
		var fullAddr = $("#fullAddr").val();
		var addr = $("#addr").val();
		var interestFirst = $("#interestFirst").val();
		var interestSecond = $("#interestSecond").val();
		var interestThird = $("#interestThird").val();	
		
		if(type == 3){
			$.ajax ({
				url : "/user/json/updateUser/"+type,
				type : "POST",
				contentType : "application/JSON",
				dataType : "text",
				data : JSON.stringify ({ "userId" : userId, "nickname" : nickname }),
				success : function(data, state) {
						swal("SUCCESS!","닉네임 변경이 완료되었습니다.","success");
						$('.mainNickname').text(data);
				}	
			});	
		}else if(type == 4){
			
			$.ajax ({
				url : "/user/json/updateUser/"+type,
				method : "POST",
				contentType : "application/JSON",
				dataType : "text",
				data : JSON.stringify({"userId" : userId, "profileContent" : profileContent}),					
				success : function(data, state) {
					swal("SUCCESS!","프로필소개 수정이 완료되었습니다.","success");
					}					
			});
		}else if (type == 5){
									
				$.ajax ({
					url : "/user/json/updateUser/"+type,
					type : "POST",
					contentType : "application/JSON",
					dataType : "text",
					data : JSON.stringify ({"userId" : userId, "fullAddr" : fullAddr, "addr" : addr}),
					success : function(data, state) {
						swal("SUCCESS!","주소지 변경이 완료되었습니다.","success");
						}				
				});
			
		}else if(type == 6){
			
			$.ajax ({
				url : "/user/json/updateUser/"+type,
				type : "POST",
				contentType : "application/JSON",
				dataType : "text",
				data : JSON.stringify ({"userId" : userId, 
										"interestFirst" : interestFirst,
										"interestSecond" : interestSecond,
										"interestThird" : interestThird}),
				success : function(data, state) {
					swal("SUCCESS!","관심사 변경이 완료되었습니다.","success");
					}					
			});
		}
	}
	
	
	$('input[name="myhomeState"]').on('click', function() {			
		var userId = $("#userId").val();
		var myhomeState = $('.radio-value:checked').val();
		
		/* $.ajax ({
			url : "/user/json/updateUser/7"
			method : "POST",
			contentType : "application/JSON",
			dataType : "text",
			data : JSON.stringify ({"userId" : userId, 
									"myhomeState" : myhomeState}),
			success : function(data, state) {
				swal("SUCCESS!","마이홈 상태가 변경되었습니다.","success");
			}	
		})	 */			
	})
	
	
	
<!-- [완료] Nickname 수정 -->
	/* function updateNN(){	
		var userId = $("#userId").val();		
		var nickname = $("#userNickname").val();		
		$.ajax ({
			url : "/user/json/updateNickname",
			type : "POST",
			contentType : "application/JSON",
			dataType : "text",
			data : JSON.stringify ({ "userId" : userId, "nickname" : nickname }),
			success : function(data, state) {
					swal("SUCCESS!","닉네임 변경이 완료되었습니다.","success");
					$('.mainNickname').text(data);
			}	
		});	
	} */
	
<!-- [완료] profileContent 수정 -->
	/* function updatePC(){		
		var userId = $("#userId").val();		
		var profileContent = $("#profileContent").val();			
		$.ajax ({
			url : "/user/json/updateContent",
			method : "POST",
			contentType : "application/JSON",
			dataType : "text",
			data : JSON.stringify({"userId" : userId, "profileContent" : profileContent}),					
			success : function(data, state) {
				swal("SUCCESS!","프로필소개 수정이 완료되었습니다.","success");
				}					
		});
	} */
	
<!-- [완료] fullAddr, addr 수정 -->
	/* function updateAddr(){		
		var userId = $("#userId").val();		
		var fullAddr = $("#fullAddr").val();
		var addr = $("#addr").val();					
		$.ajax ({
			url : "/user/json/updateAddress",
			type : "POST",
			contentType : "application/JSON",
			dataType : "text",
			data : JSON.stringify ({"userId" : userId, "fullAddr" : fullAddr, "addr" : addr}),
			success : function(data, state) {
				swal("SUCCESS!","주소지 변경이 완료되었습니다.","success");
				}					
		});
	} */
					
<!-- [완료] interest 수정 -->
	/* function updateInterest(){	
		var userId = $("#userId").val();		
		var interestFirst = $("#interestFirst").val();
		var interestSecond = $("#interestSecond").val();
		var interestThird = $("#interestThird").val();						
		$.ajax ({
			url : "/user/json/updateInterest",
			type : "POST",
			contentType : "application/JSON",
			dataType : "text",
			data : JSON.stringify ({"userId" : userId, 
									"interestFirst" : interestFirst,
									"interestSecond" : interestSecond,
									"interestThird" : interestThird}),
			success : function(data, state) {
				swal("SUCCESS!","관심사 변경이 완료되었습니다.","success");
				}					
		});
	} */
	
<!-- [완료] 마이홈상태 수정 -->
	/* $(function updateMyhome() {			
		$('input[name="myhomeState"]').on('click', function() {			
			var userId = $("#userId").val();
			var myhomeState = $('.radio-value:checked').val();
			$.ajax ({
				url : "/user/json/updateMyhomeStat",
				type : "POST",
				contentType : "application/JSON",
				dataType : "text",
				data : JSON.stringify ({"userId" : userId, 
										"myhomeState" : myhomeState}),
				success : function(data, state) {
					swal("SUCCESS!","마이홈 상태가 변경되었습니다.","success");
				}	
				})				
		})
	}); */
	
	
	<!-- 모달 회원탈퇴 -->
	 function fncLeave() {
     
     	var userId = $("#userId").val();
     	var userRole = $("#userRole").val();
     	var stateReason = $("input[name='leaveReason']").val();
     	
     	location.href = "/user/updateLeaveUser?userId="+userId+"&userRole="+userRole+"&stateReason="+stateReason;
     	//$("form").attr("method" , "POST").attr("action" , "/user/updateLeaveUser").submit();
     	
     }  
</script>
<style>
body {
	padding-top: 100px;
}

.profileImg {
	max-width: 100%;
	border-radius: 100%;
}

.max-w-lg {
	max-width: 32rem;
}

a:link {
	color: gray;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: none;
}

#staticBackdrop {
	top: 50%;
	margin-top: -100%;
}

.modal-title {
	font-weight: 700;
	font-size: 24px;
}

.h4 {
	font-size: 18px;
}

.delete_p {
	font-weight: 340;
	color: gray;
}

.container px-5 my-5 {
	background-color: #d6d5d5;
}

#leaveReason {
	width: 430px;
	height: 100px;
}

#updatebtn {
	background-color: #4299E1;
	position: relative;
	left: 383px;
	top: -52px;
	width: 80px;
	height: 32px;
}

#updateContent {
	background-color: #4299E1;
	position: relative;
	left: 1px;
	top: 0px;
	width: 80px;
	height: 120px;
}

#adrSearch {
	background-color: #4299E1;
	position: relative;
	left: 0px;
	top: 0px;
	width: 80px;
	height: 32px;
}

#editBtn {
	background-color: #4299E1;
	position: relative;
	left: 383px;
	top: -69px;
	width: 80px;
	height: 68px;
}

.leaveUser {
	position: relative;
	left: 385px;
	top: -28px;
	width: 100px;
}

.updateProfile {
	position: relative;
	font-size: 36px;
	text-align: center;
	font-weight: 340;
}

.etcContent {
	position: relative;
	font-size: 15px;
	text-align: center;
	font-weight: 340;
}

#profileContent {
	width: 378px;
	text-align: center;
}

#userNickname {
	width: 378px;
}

.thumbnail-wrapper {
	width: 100%;
	border-radius : 50%;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.thumbnail {
	position: relative;
	border-radius : 50%;
	padding-top: 100%;
	overflow: hidden;
}

.thumbnail-centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	transform: translate(50%, 50%);
}

.thumbnail-img {
	/*   max-width: 100%; */
	/*   height: 박스의 height와 같아야 한다. */
	transform: translate(-50%, -50%);
}
</style>

</head>

<body>

	<!-- [툴바] ----------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />

	<div id="wrapper">

		<div class="container px-5 my-5 ">
			<body class="h-screen font-sans login bg-cover">
				<div
					class="container mx-auto h-full flex flex-1 justify-center items-center">
					<div class="w-full max-w-lg">
						<div class="leading-loose">
							<h1 class="updateProfile">프로필수정</h1>
							<p class="etcContent">변경하실 사항을 입력해주신 후 수정버튼을 눌러주세요</p>
							<div class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">
								<p class="text-gray-800 font-medium" style="text-align: center;"></p>

								<!-- 아이디, 주소(동) [hidden] -->
								<input type="hidden" id="userId" name="userId"
									value="${dbUser.userId}" /> <input type="hidden"
									class="form-control" id="addr" name="addr">

								<!-- 프로필사진, 닉네임, 닉네임 수정버튼 -->
								<form id="upload" enctype="multipart/form-data">
									<div class="row text-center" data-matrix-loop="true"
										data-matrix-column="1">
										<div class="col-xs-4 col-sm-4 col-md-4 item"></div>
										<div class="col-xs-4 col-sm-4 col-md-4 item">


											<div class="thumbnail-wrapper">
												<div class="thumbnail">
													<div class="thumbnail-centered ">
														<input id="uploadFile" type="file" style="display: none"
															accept="image/*" /> <img
															src="/images/uploadFiles/${dbUser.profileImage}"
															class="profileImg thumbnail-img">
													</div>
												</div>
											</div>


											<div class="text-box" style="margin-top: 0px;">
												<h5 class="head_title" data-edit="true"
													data-selector="h5.head_title">
													<!-- 닉네임 -->
													<span class="fsize15"><strong class="mainNickname">${dbUser.nickname}</strong></span>
												</h5>
											</div>
										</div>
									</div>
							</div>
						</div>
						</form>

						<!-- 닉네임수정 -->
						<div class="profileContent px-4 px-1">
							<label class="block text-sm text-gray-00" for="userId">닉네임</label>
							<input class="w-full px-4 py-1 text-gray-700 bg-gray-200 rounded"
								type="text" style="color: gray;" name="nickname"
								id="userNickname" value="${dbUser.nickname}" required=""
								placeholder="닉네임 입력해주세요">
							<div class="check_font" id="NNCheck"
								style="height: 20px; font-size: 12px"></div>
							<button
								class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button"
								id="updatebtn" name="updatebtn" type="button"
								onclick="javascript:edit(3)" style="margin-top: 0px;">수정</button>
						</div>

						<!-- 프로필소개 -->
						<div class="profileContent px-4 px-1">
							<label class="block text-sm text-gray-00" for="userId">프로필소개</label>
							<input class="w-full px-4 py-5 text-gray-700 bg-gray-200 rounded"
								style="color: gray;" id="profileContent" name="profileContent"
								type="text" required="" value="${dbUser.profileContent}"
								aria-label="profileContent" placeholder="프로필소개를 입력해주세요">
							<button
								class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button"
								id="updateContent" name="updateContent" type="button"
								onclick="javascript:edit(4)">수정</button>
						</div>

						<!-- 주소 -->
						<div>
							<div class="address px-4 px-1">
								<label class="block text-sm text-gray-00" for="address">주소</label>

								<input
									class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded"
									type="text" style="width: 379px;" id="fullAddr" name="fullAddr"
									value="${dbUser.fullAddr}" onclick="javascript:searchAdr()"
									placeholder="주소지 검색을 눌러주세요" readonly>
								<button
									class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button"
									id="adrSearch" name="addr" type="button"
									onclick="javascript:edit(5)">수정</button>
							</div>
						</div>

						<!-- 관심사 -->

						<div>
							<div class="address px-4 px-1">
								<label class="block text-sm text-gray-00" for="interest">관심사</label>

								<div class="col-sm-15">

									<select name="interestFirst" id="interestFirst"
										style="width: 378px;"
										class="px-4 py-0 text-black font-light tracking-wider bg-gray-200 rounded">
										<option>${dbUser.interestFirst}</option>
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
									</select> <select name="interestSecond" id="interestSecond"
										style="width: 378px;"
										class="px-4 py-0 text-black font-light tracking-wider bg-gray-200 rounded">
										<option>${dbUser.interestSecond}</option>
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
									</select> <select name="interestThird" id="interestThird"
										style="width: 378px;"
										class="px-4 py-0 text-black font-light tracking-wider bg-gray-200 rounded">
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
									<button
										class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded"
										id="editBtn" name="img_btn" type="button"
										onclick="javascript:edit(6)">수정</button>
								</div>
							</div>


							<!-- 마이홈 공개, 비공개 설정-->
							<div class="form-group px-4 px-1">
								<label class="block text-sm text-gray-00" for="MHopen">마이홈공개여부</label>
								<label for="radio-0">공개</label> <input type="radio"
									class="radio-value" name="myhomeState" id="myhomeState"
									value="0"> <label for="radio-1">비공개</label> <input
									type="radio" class="radio-value" name="myhomeState"
									id="myhomeState" value="1">
							</div>
						</div>

					</div>
				</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<script>
 
   $(".profileImg").on("click", function() {  	
		$("#uploadFile").click();  
   });
   
   $("#uploadFile").on('change', (e)=>{
   		console.log(e.target.files);
   		updateProfileImage(e);
   });
   
   // [2021-07-19 400Error 발생 : Required request part 'profileImage' is not present
	// 0. 프로필이미지수정 버튼 실행시 uploadFile 실행

	function updateProfileImage(e) {
		
		console.log("프로필이미지 Ajax 실행");
	
		// formData Object 생성 + form 가져오기
		let form = $('#upload');
		
		var formData = new FormData(form[0]);
		formData.append("file", e.target.files[0]); 
		
		console.log("formData : "+formData);
		
		for (var key of formData.keys()) {
			console.log(key);
		}

		for (var value of formData.values()) {
  			console.log(value);
		}
		
    	$.ajax({
                url : "/user/json/uploadProfileImage"
                    , method : "POST"
                    , processData : false
                    , contentType : false
                    , data : formData
                    , dataType: 'text'
                    , success:function(result) {
                    swal("SUCCESS!","프로필 사진 수정이 완료되었습니다.","success");
                        
                        $('.profileImg').attr('src',"/images/uploadFiles/"+result);         
                    } 
		})
    }
   
   </script>
</body>
</html>