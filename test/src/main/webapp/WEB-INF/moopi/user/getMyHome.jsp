<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이홈보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>

<!---[마이홈으로 이동하는 단순 컨트롤러 실행]----------------------------------------------------------------------------------------------------------------------->	
		$("button[name='movePU']").on("click", function(){
			location.href = "/user/updateProfile"
		});
<!-------------------------------------------------------------------------------------------------------------------------->

</script>

<style>
.userEL8993463 {
	position: relative;
	padding: 20px 0;
}

.userEL8993463 .divider-box {
	position: relative;
	margin: 0 auto;
}

.userEL8993463 hr {
	display: inline-block;
	float: left;
	width: 33.333%;
	border: 0;
	border-top: 1px solid #e1e1e1;
	height: 1px;
}

.userEL8993463 .center {
	border-width: 3px;
	margin-top: 19px;
}

.userEL8990950 {
	padding: 30px 0;
	background-color: #ffffff;
}

.userEL8990950 .table {
	margin-bottom: 20px;
}

.userEL8990950 .item {
	padding: 0 3px 6px;
}

.userEL8990950 .item .border-wrap {
	min-height: 100%;
}

.userEL8990950 .op_itemline10 {
	border: 1px solid #dddddd;
}

.userEL8990950 .item .thumb-wrap {
	position: relative;
	line-height: 1;
}

.userEL8990950 .item .thumb-wrap .tpl-forum-list-thumb img {
	width: 100%;
}

.userEL8990950 .tpl-forum-list-title {
	font-family: 'Lato', 'Nanum Gothic';
	font-size: 20px;
	line-height: 1.3;
	font-weight: normal;
	color: #303030;
}

.userEL8990950 .tpl-forum-list-etc {
	color: #757575;
	text-align: center;
	line-height: 1.8;
	vertical-align: top;
	font-size: 12px;
	font-family: 'Lato', 'Nanum Gothic';
}

.userEL8990950 .tpl-forum-list-cont {
	font-family: 'Lato', 'Nanum Gothic';
	color: #757575;
	font-size: 13px;
	text-overflow: ellipsis;
	overflow: hidden;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	display: block;
	display: -webkit-box;
	line-height: 1.6;
}

.userEL8990950 .item .cont-wrap {
	padding: 25px 15px 20px;
	text-align: center;
	line-height: 1.8;
	vertical-align: top;
}


.userEL8990950 .item .cont-wrap ul {
	margin: 5px auto;
	display: inline-block;
}

.userEL8990950 .item .cont-wrap ul>li {
	display: inline-block;
	float: left;
	line-height: 1.4;
}



</style>

<style>
body {
	margin: 0 auto;
}

#homeContainer {
	margin: auto;
}

.profileImg {
	border-radius: 50%;
}

.moimImg {
	width: 120px;
	height: 120px;
	padding: 5px;
	border-radius: 10px;
}

.interest {
	border: 0.5px solid gray;
	padding: 2px;
	border-radius: 4px;
	background: #ebe8e4;
}

.thumbnail-wrapper {
	width: 100%;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

/* 반응형 이미지 1:1 정렬  */
.thumbnail {
	position: relative;
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

	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->

	<main class="py-5">
		<div class="container px-5 my-5 ">

			<div class="row text-center" data-matrix-loop="true"
				data-matrix-column="1">

				<div class="col-xs-4 col-sm-4 col-md-4 item"></div>
				<div class="col-xs-4 col-sm-4 col-md-4 item">
					<img
						src="//storage.googleapis.com/i.addblock.net/sample/content_image_46_1.jpg"
						class="img-responsive profileImg" data-attach="true"
						data-fixedsize="true" data-fixed-width="300" style="width: 300px;">
					<div class="text-box" style="margin-top: 20px;">
						<p class="desc" data-edit="true" data-selector="p">
							<span class="fsize14">"${user.profileContent}"</span>
						</p>
						<h5 class="head_title" data-edit="true"
							data-selector="h5.head_title">
							<span class="fsize13"><strong>${user.nickname}</strong></span>
						</h5>
						<h6 class="sub_text" data-edit="true" data-selector="h6.sub_text">
							<span class="fsize12">팔로워 ${followerCount} &nbsp;
								팔로잉${folloingCount}</span>
						</h6>
					</div>

					<div>
						<c:if test="${dbUser.userId == user.userId}">
							<button class="btn btn-light mybtn">프로필수정</button>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-light"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">게시글등록</button>
						</c:if>
						<c:if test="${dbUser.userId != user.userId}">
							<button class="btn btn-primary mybtn" type="button"
								target="${user.userId}">팔로우</button>
							<button class=" btn btn-light mybtn" type="button"
								target="${user.userId}" type="1">채팅</button>
						</c:if>
					</div>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 item">
					<div class="card border-0 bg-light mt-xl-3">
						<div class="card-body p-4 py-lg-3">
							<div class="d-flex align-items-center justify-content-center">
								<div class="text-center">
									<div class="h6 fw-bolder">Have more questions?</div>
									<p class="text-muted mb-3">
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

			<hr />

			<div class="text-center">
				<c:if test="${!empty user.interestFirst}">
					<span class="interest">${user.interestFirst}</span>
				</c:if>
				<c:if test="${!empty user.interestSecond}">
					<span class="interest">${user.interestSecond}</span>
				</c:if>
				<c:if test="${!empty user.interestThird}">
					<span class="interest">${user.interestThird}</span>
				</c:if>
			</div>

			<!-- 바디 -->
			<div class="userEL8990950 colorSet" data-forum-type="thumb"
				data-fcolor="#191919">
				<div class="container">
					<!-- 게시글 생성박스 -->
					<div id="boardView" class="row multi-columns-row"></div>
					<div id="loadbar"></div>
				</div>
			</div>
	</main>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">게시글등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form id="upload">
						<div class="dropBox" style="width: 100%; height: 300px;"></div>
						<input type="hidden" name="userId" value="${dbUser.userId}" />
						<button type="button" class="uploadbtn btn btn-light">업로드</button>
						<input style="display: none" id="uploadFiles" type="file"
							name="uploadFiles" multiple="multiple">
						<textarea name="boardContent"
							style="width: 100%; height: 100px; resize: none"></textArea>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-light">등록</button>
					<button type="button" id="close" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/searchbar.jsp"></jsp:include>



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
			+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname
			+"&trgtProfile="+data.target.profileImage,
			"popWin"+target,
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
				$('button:contains("팔로우")').attr('class', 'col-xl-6 btn btn-light mybtn')
			}else{
				$('button:contains("팔로우")').attr('class', 'col-xl-6 btn btn-primary mybtn')
			}
		}
	});
});
$('button:contains("프로필수정")').on('click', function(){
	
	location.href= "/user/updateProfile?userId="+dbUser;
});

// 팔로우 유무 체크
if(${followCheck}){
	$('button:contains("팔로우")').attr('class', 'col-xl-6 btn btn-light mybtn')
}

//////// 게시글 등록
function upload(formData){
	// formData key &value 확인
	 for (var key of formData.keys()) {
	  console.log(key);
	}
	for (var value of formData.values()) {
	  console.log(value);
	} 
	$.ajax({
            url : "/user/json/addMyBoard"
                , method : "POST"
                , processData : false
                , contentType : false
                , data : formData
                , dataType: 'JSON'
                , success:function(data, state) {
                    
                        
                        let fileArry = data.boardFile.split("/");
    					
    					let displayValue = '<div class="col-xs-4 col-sm-4 col-md-4 no-padding item">'
    										+'<div class="border-wrap op_itemline10">'
    										+'<div class="thumb-wrap">'
    										+'<div class="tpl-forum-list-thumb" >'
    										+'<div class="thumbnail-wrapper">'
    										+'<div class="thumbnail">'
    										+'<div class="thumbnail-centered">'
    										+'<img class="thumbnail-img" src="/images/uploadFiles/'+fileArry[0]+'" class="img-responsive" >'
    										+'</div>'
    										+'</div>'
    										+'</div>'
    										+'</div>'
    										+'<div class="cont-wrap">'
    										+'<div class="tpl-forum-list-content">'
    										+'<span class="tpl-forum-list-title" data-selector=".tpl-forum-list-title" data-font="true"'
    										+'data-title="title font">Amazing work one really feelslike in a stone age. Impressive!</span>'
    										+'</div>'
    										+'<div class="tpl-forum-list-name tpl-forum-list-etc config-font-etc" data-selector=".tpl-forum-list-etc" data-font="true"'
    										+'data-title="others">Den Kdivinich</div>'
    										+'<ul>'
    										+'<li class="tpl-forum-list-category tpl-forum-list-etc config-font-etc">category</li>'
    										+'<li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc">now</li>'
    										+'<li class="tpl-forum-list-hit tpl-forum-list-etc config-font-etc">1486</li>'
    										+'<li class="tpl-forum-list-comment tpl-forum-list-etc config-font-etc">25</li>'
    										+'</ul>'
    										+'<div class="tpl-forum-list-cont" data-selector=".tpl-forum-list-cont" data-font="true"'
    										+'data-title="content font">Phasellus justo ante, ultrices eget lorem ut, vestibulum ultrices mauris.</div>'
    										+'</div>'
    										+'</div>'
    										+'</div>'
    					
                	setTimeout(function() {
                		$('#close').click();
    					$('#boardView').prepend(displayValue);
                	}, 3000, displayValue)
                    
                }
      });
}

$('.uploadbtn').on('click', function(){
	$('#uploadFiles').click();
});

$('.modal-footer > button:contains("등록")').on('click',function(){
	let form = $('#upload');
	let formData = new FormData(form[0]);
	upload(formData);
})

// 팔로우 유무 체크
if(${followCheck}){
	$('button:contains("팔로우")').css('background', 'gray');
}

////  무한 스크롤  
		var loading = false;

		let currentPage = 1;

		$(window).scroll(
				function() {
					if ($(document).height() - $(window).height() == $(window)
							.scrollTop()) {

						if (!loading) {
							loading = true;
							myBoard()
						} else {
						}
					}
				});

		function myBoard() {

			$.ajax({
						url : "/user/json/myBoardList/${user.userId}/"+currentPage,
						method : "GET",
						dataType : "JSON",
						success : function(data, status) {
							console.log(data);
							let list = data.list;
							if(list.length > 0){
							for (var i = 0; i < data.list.length; i++) {
								
								let fileArry = list[i].boardFile.split("/");
								
								let displayValue = '<div class="col-xs-4 col-sm-4 col-md-4 no-padding item">'
													+'<div class="border-wrap op_itemline10">'
													+'<div class="thumb-wrap">'
													+'<div class="tpl-forum-list-thumb" >'
													+'<div class="thumbnail-wrapper">'
													+'<div class="thumbnail">'
													+'<div class="thumbnail-centered">'
													+'<img class="thumbnail-img" src="/images/uploadFiles/'+fileArry[0]+'" class="img-responsive" >'
													+'</div>'
													+'</div>'
													+'</div>'
													+'</div>'
													+'<div class="cont-wrap">'
													+'<div class="tpl-forum-list-content">'
													+'<span class="tpl-forum-list-title" data-selector=".tpl-forum-list-title" data-font="true"'
													+'data-title="title font">Amazing work one really feelslike in a stone age. Impressive!</span>'
													+'</div>'
													+'<div class="tpl-forum-list-name tpl-forum-list-etc config-font-etc" data-selector=".tpl-forum-list-etc" data-font="true"'
													+'data-title="others">Den Kdivinich</div>'
													+'<ul>'
													+'<li class="tpl-forum-list-category tpl-forum-list-etc config-font-etc">category</li>'
													+'<li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc">now</li>'
													+'<li class="tpl-forum-list-hit tpl-forum-list-etc config-font-etc">1486</li>'
													+'<li class="tpl-forum-list-comment tpl-forum-list-etc config-font-etc">25</li>'
													+'</ul>'
													+'<div class="tpl-forum-list-cont" data-selector=".tpl-forum-list-cont" data-font="true"'
													+'data-title="content font">Phasellus justo ante, ultrices eget lorem ut, vestibulum ultrices mauris.</div>'
													+'</div>'
													+'</div>'
													+'</div>'
								$('#boardView').append(displayValue);
							}
							loading = false;
							currentPage++;
							}
						}
					});
		}
		myBoard();
</script>
</body>
</html>