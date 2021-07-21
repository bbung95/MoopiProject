<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이홈보기</title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

<!---[마이홈으로 이동하는 단순 컨트롤러 실행]----------------------------------------------------------------------------------------------------------------------->	

		$("button[name='movePU']").on("click", function(){
			location.href = "/user/updateProfile"
		});
<!-------------------------------------------------------------------------------------------------------------------------->

</script>
<style>
body {
	padding-top: 70px;
}

#homeContainer {
	margin: auto;
}

.profileImg {
	border-radius: 50%;
	width: 250px;
	height: 250px;
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

.addView{
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

.dropBox{
	width: 100%;
	height: 250px;
	border: 0.5px solid gray;
}
</style>
</head>
<body>

	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->

	<div id="homeContainer" class="container">
		<div class="row">
			<div style="background: gray;" class="col-sm-4">
				<img class="profileImg" src="/images/uploadFiles/poco.jpg" />
			</div>
			<div class="col-sm-8">
				<div>${user.nickname}</div>
				<div>뱃지 : ${user.badge}</div>
				<div>코인수 : ${user.coin}</div>
				<div>관심사1 : ${user.interestFirst}</div>
				<div>관심사2 : ${user.interestSecond}</div>
				<div>관심사3 : ${user.interestThird}</div>
				<div>소개 : ${user.profileContent}</div>
				<div>팔로워 ${followerCount}</div>
				<div>팔로잉 ${folloingCount}</div>
				<c:if test="${dbUser.userId == user.userId}">
				<button>프로필수정</button>
				<button>게시글등록</button>
				</c:if>
				<c:if test="${dbUser.userId != user.userId}">
				<button target="${user.userId}">팔로우</button>
				<button target="${user.userId}">채팅</button>
				</c:if>
			</div>
		</div>
		<hr />
		<div class="row">
			<div id="boardList" class="col-sm-8">
				<c:forEach var="moim" items="${moimList}">
					<div class="board">
						<img class="boardProfile" src="/images/uploadFiles/${moim.mmFile}"></img> <span>${moim.mmName}</span>
						<div align="center">
							<img style="margin: 5px; height: 250px;"
								src="/images/uploadFiles/poco.jpg"></img>
						</div>
						<button>좋아요</button> 0
						<div>게시글 내용들 컨텐트르르르</div>
					</div>
				</c:forEach>
				<a href="#" class="thumbnail">
     				 <img style="width: 200px;" src="/images/uploadFiles/poco.jpg">
   				 </a>
   				 <a href="#" class="thumbnail">
     				 <img src="/images/uploadFiles/poco.jpg">
   				 </a>
   				 <a href="#" class="thumbnail">
     				 <img src="/images/uploadFiles/poco.jpg">
   				 </a>
			</div>
			<div class="col-sm-4" >
				<div>소모임 리스트</div>
				<c:forEach var="moim" items="${moimList}">
					<li style="background: gray" onclick="location.href='/moim/getMoim?mmNo=${moim.mmNo}'" ><img class="moimImg"
						src='/images/uploadFiles/${moim.mmFile}' /> <span>${moim.mmName}</span></li>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="addView">
		<button style="margin-bottom: 20px; border-radius: 50%;">X</button>
		<form  enctype="multipart/form-data">
			<div class="dropBox"></div>
			<input type="hidden" name="boardWriter" value="${dbUser.userId}"/>
			<input type="file" name="uploadFile">
			<textarea name="boardContent" style="width: 100%; height: 100px;"></textArea>
			<button>등록</button>
		</form>
	</div>


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
<script>
$('button:contains("채팅")').on('click', function(){
	
	let target = $(this).attr('target');
	popWin = window.open(
			"/chat/joinRoom?userId="+dbUser+"&trgt="+target,
			"popWin"+target,
			"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
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