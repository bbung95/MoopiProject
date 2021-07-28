<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moopi Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Css -->
<link rel="stylesheet" href="/css/admin/styles.css">
<link rel="stylesheet" href="/css/admin/all.css">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
</head>

<script>
	
	function goMyHome() {
		var userId = $("#userId").val();
		location.href = "/user/getMyHome?userId="+userId
	}
	

</script>

	<style>
	.profileImg {
		max-width : 100%;
 		border-radius: 100%;
 		width: 25%;
 		float : left;
	}
	// 마이홈버튼
	#goMyhome {
	position: relative;
		left : 30px;
		top : 0px;
	}								
	
	.solid {
		border : 0.5px solid black;
	}
	
	</style>

<body>

	<!--Container -->
	<div class="mx-auto bg-grey-lightest">
		<!--Screen-->
		<div class="min-h-screen flex flex-col">
			<!--Header Section Starts Here-->
			<header class="bg-nav">
				<div class="flex justify-between">
					<div class="p-1 mx-3 inline-flex items-center">
						<i class="fas fa-bars pr-2 text-white" onclick="sidebarToggle()"></i>
						<h1 class="text-white p-2">Moopi</h1>
					</div>
					<div class="p-1 flex flex-row items-center">
						<a href="https://github.com/tailwindadmin/admin"
							class="text-white p-2 mr-2 no-underline hidden md:block lg:block">Github</a>


						<img onclick="profileToggle()"
							class="inline-block h-8 w-8 rounded-full"
							src="https://avatars0.githubusercontent.com/u/4323180?s=460&v=4"
							alt=""> <a href="#" onclick="profileToggle()"
							class="text-white p-2 no-underline hidden md:block lg:block">Adam
							Wathan</a>
						<div id="ProfileDropDown"
							class="rounded hidden shadow-md bg-white absolute pin-t mt-12 mr-1 pin-r">
							<ul class="list-reset">
								<li><a href="#"
									class="no-underline px-4 py-2 block text-black hover:bg-grey-light">My
										account</a></li>
								<li><a href="#"
									class="no-underline px-4 py-2 block text-black hover:bg-grey-light">Notifications</a></li>
								<li><hr class="border-t mx-2 border-grey-ligght"></li>
								<li><a href="#"
									class="no-underline px-4 py-2 block text-black hover:bg-grey-light">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</header>
			<!--/Header-->

			<div class="flex flex-1">
				<!--Sidebar-->
				<jsp:include page="../layout/adminToolbar.jsp" />
				<!--/Sidebar-->
				<!--Main-->
				<main class="bg-white-500 flex-1 p-3 overflow-hidden">

					<div class="flex flex-col">
						
<!--############################################################## Grid Form ##############################################################-->
						<div class="container px-5 my-5 ">	
						<body class="h-screen font-sans login bg-cover">
						<div class="container mx-auto h-full flex flex-1 justify-center items-center">
						    <div class="w-full max-w-lg">    
						        <div class="leading-loose">
						            <form>
						                <p class="text-gray-800 font-medium" style="text-align:center;"></p>
						         	    	     
										<!-- 아이디 [hidden] -->
										<input type="hidden" id="userId" name="userId" value="${dbUser.userId}"/>
										
						         	     	<!-- 프로필사진, 닉네임, 닉네임 수정버튼 -->
											<div class="row text-center" data-matrix-loop="true" data-matrix-column="1">
												<div class="col-xs-4 col-sm-4 col-md-4 item"></div>
												
												<div class="col-xs-4 col-sm-4 col-md-4 item">
													<img src="http://newspublic.org/news/data/20210224/p1065611064396601_914_thum.jpeg" class="profileImg">														
														<!-- 마이홈 버튼 -->
														<div>
															<img class="img-back" src="../images/icons/home.png" width="30" id="goMyhome" onclick="javascript:goMyHome()"></a>
														</div>																											
													</div>
												</div>
											</div>
									
									<form>
										<!-- 아이디 -->
										<div class="profileContent px-4 px-1">
						                    <label class="block text-sm text-gray-00" id="adminUserId" for="userId" value="${user.userId}" >회원아이디</label>
											<input class="w-full px-3 py-1 text-gray-700 bg-gray-200 rounded" style="color:gray;" id="userId" name="getuserId" type="text" required="" value="${dbUser.userId}" aria-label="profileContent">																		
											<div></div> 
						                </div> 
											
										<!-- 닉네임수정 -->
						                <div class="profileContent px-4 px-1">
						                    <label class="block text-sm text-gray-00" for="userId">닉네임</label>
											<input class="w-full px-4 py-1 text-gray-700 bg-gray-200 rounded" type="text" style="color:gray;" name="nickname" id="userNickname" value="${dbUser.nickname}" aria-label="nn" placeholder="닉네임 입력해주세요">						
											<div class="check_font" id="NNCheck" style="height: 20px; font-size : 12px" ></div>	
											<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button" id="updatebtn" name="updatebtn" type="button" onclick="javascript:updateNN()" style="margin-top: 0px;">수정</button>							
											<div></div> 
						                </div>         	     
						         	      
						         	    <!-- 프로필소개 -->
						                <div class="profileContent px-4 px-1">
						                    <label class="block text-sm text-gray-00" for="userId" >프로필소개</label>
											<input class="w-full px-4 py-5 text-gray-700 bg-gray-200 rounded" style="color:gray;" id="profileContent" name="profileContent" type="text" required="" value="${dbUser.profileContent}" aria-label="profileContent" placeholder="프로필소개를 입력해주세요">						
											<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button" id="updateContent" name="updateContent" type="button" onclick="javascript:updatePC()" >수정</button>		
											<div></div> 
						                </div>                               
						                
						                <!-- 주소 -->
										<div>
							                <div class="address px-4 px-1">
							                    <label class="block text-sm text-gray-00" for="address">주소</label>
							                   
							                    <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded" type="text"  id="fullAddr" name="fullAddr" value="${dbUser.fullAddr}" placeholder="주소지 검색을 눌러주세요" readonly >
												<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button" id="adrSearch" name="addr" type="button" onclick="javascript:searchAdr()">검색</button>		
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
												<button class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded" id="img_btn" name="img_btn" type="button" onclick="javascript:updateInterest()">수정</button>	
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
												
<!--############################################################## Grid Form ##############################################################-->


						<form class="form-inline" name="detailForm">
						
							<table class="tg solid">
								<thead>
								  <tr>
								    <th class="tg-0pky">주제</th>
								    <th class="tg-0pky">회원관련내용</th>
								  </tr>
								</thead>
								<tbody>
								  <tr>
								    <td class="tg-0pky">아이디</td>
								    <td class="tg-0pky">${user.userId}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">이름</td>
								    <td class="tg-0pky">${user.userName}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">닉네임</td>
								    <td class="tg-0pky">${user.nickname}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">모바일번호</td>
								    <td class="tg-0pky">${user.phone}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">주소지</td>
								    <td class="tg-0pky">${user.addr}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">가입일자</td>
								    <td class="tg-0pky">${user.regDate}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">가입경로</td>
								    <td class="tg-0pky">${user.joinPath}</td>
								  </tr>
								  <tr>
								    <td class="tg-0pky">관심사1</td>
								    <td class="tg-0pky">${user.interestFirst}</td>
								  </tr>
								<tr>
								    <td class="tg-0pky">관심사2</td>
								    <td class="tg-0pky">${user.interestSecond}</td>
								  </tr>
								<tr>
								    <td class="tg-0pky">관심사3</td>
								    <td class="tg-0pky">${user.interestThird}</td>
								  </tr>
								</tbody>
							</table>


							<input type="hidden" id="currentPage" name="currentPage" value="" />
						</form>



					</div>
				</main>
				<!--/Main-->
			</div>
			<!--Footer-->
			<footer class="bg-grey-darkest text-white p-2">
				<div class="flex flex-1 mx-auto">&copy; My Design</div>
			</footer>
			<!--/footer-->

		</div>

	</div>

	<script src="/js/admin/main.js"></script>

</body>

</html>