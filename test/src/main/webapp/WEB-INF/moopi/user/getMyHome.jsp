<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이홈보기</title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap"
	rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

<!---[마이홈으로 이동하는 단순 컨트롤러 실행]----------------------------------------------------------------------------------------------------------------------->	

		$("button[name='movePU']").on("click", function(){
			location.href = "/user/updateProfile"
		});
<!-------------------------------------------------------------------------------------------------------------------------->

</script>
<style>
#homeContainer {
	margin: auto;
	width: 80%;
}

.profileImg {
	border-radius: 50%;
	width: 300px;
	height: 300px;
	border: 5px solid gray;
}

.moimImg {
	width: 120px;
	height: 120px;
	padding: 5px;
	border-radius: 10px;
}

#boardList {
	border-right: 0.5px solid gray;
}

.board {
	margin: 5px;
	height: 400px;
	border-radius: 10px;
	border: 0.5px solid gray;
	width: 500px;
}

.boardProfile {
	margin: 10px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.addView {
	height: 60%;
	width: 30%;
	display: none;
	background: white;
	position: fixed;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 20%;
	border-radius: 3%;
	border: 0.1px solid gray;
	padding: 20px;
}
</style>
</head>
<body>

	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->
	<main class="py-5">
		<div class="container px-5 my-5">
			<!-- 헤더 -->
			<header class="row gx-5">
				<div class="col-xl-4 text-center">
					<img class="profileImg" src="/images/uploadFiles/poco.jpg" />
				</div>
				<div class="col-xl-4">
					<span class="fw-normal h4">${user.nickname}</span><span class="h5">
						뱃지 ${user.badge}</span>
					<div class="h5">
						<span>팔로워 ${followerCount} </span><span> 팔로잉
							${folloingCount}</span>
					</div>
					<div class="flex-column">
						<div style="font-size: 15px;">소개 : ${user.profileContent}</div>
						<div class="btn">
							<c:if test="${dbUser.userId == user.userId}">
								<button class="">프로필수정</button>
								<button>게시글등록</button>
							</c:if>
							<c:if test="${dbUser.userId != user.userId}">
								<button target="${user.userId}">팔로우</button>
								<button target="${user.userId}" type="1">채팅</button>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-xl-4">
					<div>코인수 : ${user.coin}</div>
					<div style="display: flex; flex-direction: row-reverse;">
						<c:if test="${!empty user.interestFirst}">
							<div class="interest">${user.interestFirst}</div>
						</c:if>
						<c:if test="${!empty user.interestSecond}">
							<div class="interest">${user.interestSecond}</div>
						</c:if>
						<c:if test="${!empty user.interestThird}">
							<div class="interest">${user.interestThird}</div>
						</c:if>
					</div>
				</div>
			</header>
			<hr />

			<!-- 바디 -->
			<div class="row gx-5">
				<div class="col-xl-8 ">
					<c:forEach var="moim" items="${moimList}">
						<div class="board">
							<img class="boardProfile"
								src="/images/uploadFiles/${moim.mmFile}"></img> <span>${moim.mmName}</span>
							<div align="center">
								<img style="margin: 5px; height: 250px;"
									src="/images/uploadFiles/poco.jpg"></img>
							</div>
							<button>좋아요</button>
							0
							<div>게시글 내용들 컨텐트르르르</div>
						</div>
					</c:forEach>
				</div>
				<div class="col-xl-4">
					<div class="card border-0 bg-light mt-xl-5">
						<div class="card-body p-4 py-lg-5">
							<div class="d-flex align-items-center justify-content-center">
								<div class="text-center">
									<div class="h6 fw-bolder">Have more questions?</div>
									<p class="text-muted mb-4">
										Contact us at <br /> <a href="#!">support@domain.com</a>
									</p>
									<div class="h6 fw-bolder">Follow us</div>
									<a class="fs-5 px-2 link-dark" href="#!"><i
										class="bi-twitter"></i></a> <a class="fs-5 px-2 link-dark"
										href="#!"><i class="bi-facebook"></i></a> <a
										class="fs-5 px-2 link-dark" href="#!"><i
										class="bi-linkedin"></i></a> <a class="fs-5 px-2 link-dark"
										href="#!"><i class="bi-youtube"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>




	<div id="homeContainer" class="container">
		<div class="row">

			<hr />
			<div class="row">
				<div id="boardList" class="col-sm-8">
					<c:forEach var="moim" items="${moimList}">
						<div class="board">
							<img class="boardProfile"
								src="/images/uploadFiles/${moim.mmFile}"></img> <span>${moim.mmName}</span>
							<div align="center">
								<img style="margin: 5px; height: 250px;"
									src="/images/uploadFiles/poco.jpg"></img>
							</div>
							<button>좋아요</button>
							0
							<div>게시글 내용들 컨텐트르르르</div>
						</div>
					</c:forEach>

				</div>
				<div class="col-sm-4">
					<div>소모임 리스트</div>
					<c:forEach var="moim" items="${moimList}">
						<li style="background: gray"
							onclick="location.href='/moim/getMoim?mmNo=${moim.mmNo}'"><img
							class="moimImg" src='/images/uploadFiles/${moim.mmFile}' /> <span>${moim.mmName}</span></li>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="addView">
			<button style="margin-bottom: 20px; border-radius: 50%;">X</button>
			<form enctype="multipart/form-data">
				<div class="dropBox"></div>
				<input type="hidden" name="boardWriter" value="${dbUser.userId}" />
				<input type="file" name="uploadFile">
				<textarea name="boardContent" style="width: 100%; height: 100px;"></textArea>
				<button>등록</button>
			</form>
		</div>

		<jsp:include page="../layout/searchbar.jsp"></jsp:include>


		<%-- 	
<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">마이홈</h1>

<!-- FORM START ---------------------------------------------------------------------------------------------------------------->
	
	<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
	
	<!-- 프로필이미지 (버튼누르면 수정되게끔 설정) 차후 추가 수정,보완해야 함 -->	
	<!-- <p>프로필이미지 : ${user.profileImage}<button type="button" class="btm_image" id="img_btn"><img src="이미지경로">${user.profileImage}</button></p> -->
	
	<!-- 프로필수정 -->
	<button type="button" name="movePU">프로필수정</button>	
	
	<!-- 출력만하면 됨 -->
	<p>닉네임 : ${user.nickname}</p>
	<p>뱃지 : ${user.badge}</p>
	<p>코인 : ${user.coin}</p>
		
	<p>[추가구현필요] : 팔로잉 수</p>
	<p>[추가구현필요] : 팔로워 수</p>
	
	<p>프로필소개 : ${user.profileContent}</p>
	
	<p>[추가구현필요] : 마이홈게시글 첨부파일</p>
	<p>[추가구현필요] : 마이홈게시글 내용</p>
	<p>[추가구현필요] : 마이홈게시글 좋아요 수</p>
	<p>[추가구현필요] : 모임무피 대표썸네일</p->
	<p>[추가구현필요] : 모임무피명</p>
	
	<p>관심사1 : ${user.interestFirst}</p>
	<p>관심사2 : ${user.interestSecond}</p>
	<p>관심사3 : ${user.interestThird}</p>	
			  
	<!-- 아이디 : hidden -->
	<!--<input type="hidden" class="form-control" id="userId" name="userId" value="${user.userId}">-->
			  
	<div class="form-group">
		<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">대표썸네일</label>
		<div class="col-sm-4">
			<input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="대표썸네일">
		</div>
	</div>
		  
	<!-- 프로필이미지 -->
	<div class="form-group">
		<label for="profileImage" class="col-sm-offset-1 col-sm-3 control-label">프로필이미지</label>
		<div class="col-sm-4">
		<button type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="프로필이미지">${user.profileImage}</button>
		</div>
	</div>
	
	<!-- 닉네임 -->
	<div class="form-group">
		<label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname}" readonly>
		</div>
	</div>
	
	<!-- 뱃지 -->
	<div class="form-group">
		<label for="badge" class="col-sm-offset-1 col-sm-3 control-label">뱃지</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="badge" name="badge" value="${user.badge}" readonly>
		</div>
	</div>
	
	<!-- 코인 : 마우스를 댈 시 잔여코인출력, 마우스를 클릭 시 결제구 -->
	<div class="form-group">
		<label for="coin" class="col-sm-offset-1 col-sm-3 control-label">코인</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="coin" name="coin" value="${user.coin}" readonly>
		</div>
	</div>
	

	

	 --%>

		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="/js/scripts.js"></script>

		<script>
$('button:contains("채팅")').on('click', function(){
	
	let target = $(this).attr('target');
	let type = $(this).attr('type');
	
	$.ajax({
		url: "/common/chat/joinRoom/"+dbUser+"/"+target+"/"+type,
		method: "GET",
		dataType: "JSON",
		success: function(data,state){
	
		popWin = window.open(
			"https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.userId+"&type="+data.type
			+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname,
			+"&trgtProfile="+data.target.profileImage;			"popWin"+target,
			"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	})
})

$('button:contains("팔로우")').on('click', function(){
	
	let target = $(this).attr('target');
	$.ajax({
		url: "/user/json/follow/"+target,
		method: "GET",
		dataType: "JSON",
		success: function(data,state){
			if(data){
				$('button:contains("팔로우")').css('background', 'gray');
			}else{
				$('button:contains("팔로우")').css('background', '');
			}
		}
	});
});

$('button:contains("게시글등록")').on('click', function(){
	
	$('.addView').css('display', 'block');
})

$('button:contains("X")').on('click', function(){
	
	$('.addView').css('display', 'none');
})

// 팔로우 유무 체크
if(${followCheck}){
	$('button:contains("팔로우")').css('background', 'gray');
}

</script>
</body>
</html>