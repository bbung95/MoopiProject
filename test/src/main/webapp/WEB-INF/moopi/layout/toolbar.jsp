<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://unpkg.com/tailwindcss@1.2.0/dist/tailwind.min.css"
	rel="stylesheet">

<!-- Noto Sans font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,600;1,400&display=swap"
	rel="stylesheet">

<!-- Maven Pro font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Maven+Pro:wght@700&display=swap" rel="stylesheet">


<script defer
	src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
	integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
	crossorigin="anonymous"></script>


<style>
body {
	overflow: auto;
	overflow-x: hidden;
	font-family: 'Open Sans', sans-serif;
}

/* scorollbar hide */
body::-webkit-scrollbar {
	display: none;
}

.weather {
	position: fixed;
	bottom: 0;
	left: 0;
	margin-left: 20px;
	margin-bottom: 20px;
}

#toolbar {
	background: white;
	height: 68px;
	transition: all 0.5s;
}


.toolbar-color{
	font-size: 16px;
	line-height: 24px;
	font-weight: bold;
	cursor: pointer;
}

#toolbar-main{
	font-family: 'Maven Pro', sans-serif;
	font-size: 25px;
}

.toolbar_i {
	font-size: 20px;
	margin: 5px;
}

#noticeCount {
	position: absolute;
	display: none;
	top: 0px;
	left: 25px;
}

.notice_pre {
	white-space: normal;
	word-break: break-all;
	padding-left: 15px;
	padding-right: 15px;
	text-align: left;
	font-size: 15px;
	margin-top: 0.5rem;
	margin-bottom: 0.5rem;
}

#search-input {
	height: 35px;
	line-height: 30px;
	outline: 0;
	border: 1px solid var(- -sc-color2);
	font-size: 1em;
	border-radius: 20px;
	padding: 0 20px;
}

.searchlist {
	height: 400px;
	border: 1px solid var(- -sc-color3);
	background: var(- -sc-color4);
	margin-top: 10px; "
	border-radius: 20px;
	overflow: auto;
	-ms-overflow-style: none;
}

.searchlist::-webkit-scrollbar {
	display: none;
}

/* 이미지 비율 */
.search-thumbnail-wrapper {
	width: 150px;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.search-thumbnail {
	position: relative;
	padding-top: 150px;
	overflow: hidden;
}

.search-thumbnail-centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	transform: translate(50%, 50%);
}

.search-thumbnail-img {
	/*   max-width: 100%; */
	/*   height: 박스의 height와 같아야 한다. */
	transform: translate(-50%, -50%);
}

.thumbnail-wrapper {
	width: 100%;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

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

/*사이즈*/
@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 960px;
	}
}

/*사실 이 블럭은 없어도 된다*/
@media ( min-width : 1200px) {
	.container {
		width: 1160px;
	}
}
</style>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="fixed-top " id="toolbarbox">
	<nav class="navbar navbar-expand-lg navbar-light" id="toolbar">
		<div class="container px-5">
			<a class="navbar-brand toolbar-color" id="toolbar-main" href="/">MOOPi</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<form class="d-flex" style="margin-left: 40px;">
				<input type="hidden" class='type' value="1"> <input
					id="search-input" name="saerchkeyword" class="form-control"
					type="search" placeholder="키워드를 입력해주세요" aria-label="Search"
					autocomplete="off">
			</form>


			<div class="collapse navbar-collapse " id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 ">
					<li class="nav-item "><a class="nav-link toolbar-color">모임무피</a></li>
					<li class="nav-item "><a class="nav-link toolbar-color">번개무피</a></li>
					<li class="nav-item "><a class="nav-link toolbar-color">무피게시판</a></li>
					<li class="nav-item "><a class="nav-link toolbar-color">문의게시판</a></li>

					<!-- sessionScope.id가 없으면 : 로그인을 하지 않았을 경우 -->
					<c:if test="${empty sessionScope.dbUser}">
						<li class="nav-item"><a class="nav-link toolbar-color">로그인</a></li>
					</c:if>

					<!-- sessionScope.id가 있을시 : 로그인을 했을 경우 -->
					<c:if test="${not empty sessionScope.dbUser}">

						<!-- 알림 -->
						<li class="nav-item noticebtn" data-bs-toggle="offcanvas"
							data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><a
							class="nav-link" style="position: relative;"> <i
								class="bi bi-envelope toolbar_i toolbar-color"></i><span
								id="noticeCount" class="badge rounded-pill bg-danger"></span></a></li>

						<!-- 채팅 -->
						<li class="nav-item chatbtn"><a class="nav-link"><i
								class="bi bi-chat toolbar_i toolbar-color"></i></a></li>

						<!-- 로그인시 메뉴  -->
						<li class="nav-item dropdown"><a class="nav-link "
							id="navbarDropdownPortfolio" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"><img
								src="/images/uploadFiles/${dbUser.profileImage}"
								style="width: 30px; height: 30px; border-radius: 50%;" /></a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
								<li><a class="dropdown-item">마이홈</a></li>
								<li><a class="dropdown-item">내정보보기</a></li>
								<li><a class="dropdown-item">충전</a></li>
								<li><a class="dropdown-item">로그아웃</a></li>
								<c:if test="${dbUser.userRole eq '1'}">
									<li><a class="dropdown-item" href="/common/adminMoopi"
										target="_blank">관리자</a></li>
								</c:if>
							</ul></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>




	<!-- 검색창 -->
	<div id="searchbox"
		style="background: white; display: none; border-bottom: 0.1px solid #f0f3f7;">
		<div class="container">
			<div style="max-width: 600px;">
				<div style="margin-bottom: 10px; padding-top: 10px;">
					<div class="btn btn-primary saerchbar-btn active" type="1">모임</div>
					<div class="btn btn-primary saerchbar-btn" type="2">번개</div>
					<div class="btn btn-primary saerchbar-btn" type="3">포스팅</div>
					<div class="btn btn-primary saerchbar-btn" type="4">유저</div>
				</div>
				<hr />
				<div class="h4">검색 결과</div>
				<div class="searchlist row"></div>
			</div>
		</div>
	</div>

</div>


<div class="weather">
	<div class="CurrIcon"></div>
	<div class="CurrTemp"></div>
	<div class="City"></div>
</div>



<!-- offcanvas  -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<h5 id="offcanvasRightLabel">Moopi 알림</h5>
		<button type="button" class="btn text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close">전체삭제</button>
	</div>
	<div class="offcanvas-body noticeOut"></div>
</div>

<!-- ToolBar End /////////////////////////////////////-->
<script type="text/javascript">
	// login session userId
	var dbUser = '<c:out value="${dbUser.userId}"/>';
	var searchPage = 1;
	var userProfile = '<c:out value="${dbUser.profileImage}"/>';
	var nickname = '<c:out value="${dbUser.nickname}"/>';
	var loading = false;

	$(document)
			.ready(
					function() {
						let weatherIcon = {
							'01' : 'fas fa-sun',
							'02' : 'fas fa-cloud-sun',
							'03' : 'fas fa-cloud',
							'04' : 'fas fa-cloud-meatball',
							'09' : 'fas fa-cloud-sun-rain',
							'10' : 'fas fa-cloud-showers-heavy',
							'11' : 'fas fa-poo-storm',
							'13' : 'far fa-snowflake',
							'50' : 'fas fa-smog'
						};

						$
								.ajax({
									url : 'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=92b4d06becd22c0b70b3ea777b320f09&units=metric',

									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon)
												.substr(0, 2);
										var $Temp = Math.floor(data.main.temp)
												+ 'º';
										var $city = data.name;
										$('.CurrIcon')
												.append(
														'<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.CurrTemp').prepend($Temp);
										$('.City').append($city);
									}
								})
					});

	//읽지않은 알림 카운트
	function noticeCount() {
		$.ajax({
			url : "/common/json/getNoticeCount/" + dbUser,
			method : "GET",
			dataType : "text",
			success : function(data, status) {

				if (data != 0) {

					$('#noticeCount').append(data);
					$('#noticeCount').css('display', 'block');
				}
			}
		});
	}

	//알림 전체삭제
	$('button:contains("전체삭제")').on('click', function() {
		$.ajax({
			url : "/common/json/deleteNoticeAll/" + dbUser,
			method : "GET",
			dataType : "text",
			success : function(data, status) {

				$('.noticeOut').children().remove();
				let display = "<div style='height: 40px'>알림이 존재하지 않습니다.</div>";
				$('.noticeOut').append(display);
			}
		});
	})

	// 알림 읽음표시
	$('.noticebtn').on('click', function() {
		$.ajax({
			url : "/common/json/updateNoticeState/" + dbUser,
			method : "GET",
			dataType : "JSON",
			success : function(data, status) {
			}
		})
		$('#noticeCount').css('display', 'none');
	})

	/* function chatjoin(target) {
		popWin = window
				.open(
						"/chat/joinRoom?userId=" + dbUser + "&trgt=" + target
								+ "&type=1",
						"popWin",
						"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	} */

	// 읽지않은 알림과 알림 리스트
	if (dbUser !== '') {
		$
				.ajax({
					url : "/common/json/getListNotice/" + dbUser,
					method : "GET",
					dataType : "JSON",
					success : function(data, status) {
						
						
						let display = '';
						if (data.length > 0) {
							for (var i = 0; i < data.length; i++) {
						console.log(data[i]);

								//채팅 알림 type 1
								if (data[i].noticeType == '1') {
									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="javascript:chatjoin('
											+ data[i].noticeUser.userId
											+ ')" >'
											+ data[i].noticeContent
											+ '</div>' + '</div>'

									// 모임 정모 생성 알림 type 2
								} else if (data[i].noticeType == '2') {

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].moim.mmFile
											+ '" class="me-2" style="width: 50px; height: 50px; margin: 5px; border-radius: 10%;""> <strong'
											+'class="me-auto">'
											+ data[i].moim.mmName
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/meeting/listMeeting?userId='
											+ dbUser
											+ '&mmNo='
											+ data[i].moim.mmNo
											+ '\'">'
											+ data[i].moim.mmName
											+ '의 정모가 추가되었습니다.</div>' + '</div>'

									// 정모 가입 알림 type 3
								} else if (data[i].noticeType == '3') {
									console.log(data[i].noticeUser);
									
									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/meeting/listMeeting?userId='
											+ dbUser
											+ '&mmNo='
											+ data[i].moim.mmNo
											+ '\'">'
											+ data[i].noticeUser.nickname
											+ '님이 '
											+ data[i].moim.mmName
											+ '의 참가하셨습니다.</div>' + '</div>'

									// 모임 가입승인 알림 type 4
								} else if (data[i].noticeType == '4') {

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].moim.mmFile
											+ '" class="me-2" style="width: 50px; height: 50px; margin: 5px; border-radius: 10%;""> <strong'
											+'class="me-auto">'
											+ data[i].moim.mmName
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/moim/getMoim?mmNo='
											+ data[i].moim.mmNo
											+ '\'">'
											+ data[i].moim.mmName
											+ '의 가입 승인되었습니다.</div>' + '</div>'

									// 플래쉬 참가 알림 type 5
								} else if (data[i].noticeType == '5') {

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/flash/getFlash?flashNo='
											+ data[i].flash.flashNo
											+ '\'">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].flash.flashFile
											+ '" style="width:50px; height: 50px; margin: 5px; border-radius: 10%;"/>'
											+ data[i].noticeUser.nickname
											+ '님이 '
											+ data[i].flash.flashName
											+ '에 참가하셨습니다.</div>' + '</div>'

									// 게시글 댓글 알림 type 6
								} else if (data[i].noticeType == '6') {

									let fileArry = data[i].board.boardFile.split("/");

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='
											+ data[i].toUserId
											+ '\'">'
											+ '<img src="/images/uploadFiles/'
											+ fileArry[0]
											+ '" style="width:50px; height: 50px; margin: 5px; border-radius: 10%;"/>'
											+ data[i].noticeUser.nickname
											+ '님이 댓글을 작성했습니다.</div>' + '</div>'

									// 게시글 좋아요 알림 type 7
								} else if (data[i].noticeType == '7') {

									let fileArry = data[i].board.boardFile
											.split("/");

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='
											+ data[i].toUserId
											+ '\'">'
											+ '<img src="/images/uploadFiles/'
											+ fileArry[0]
											+ '" style="width:50px; height: 50px; margin: 5px; border-radius: 10%;"/>'
											+ data[i].noticeUser.nickname
											+ '님이 좋아요했습니다.</div>' + '</div>'

									// 팔로우 알림 type 8
								} else if (data[i].noticeType == '8') {

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='
											+ data[i].noticeUser.userId
											+ '\'">'
											+ data[i].noticeUser.nickname
											+ data[i].noticeContent
											+ '</div>'
											+ '</div>'

									// 모임 초대 알림 type 9
								} else if (data[i].noticeType == '9') {

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-body">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].moim.mmFile
											+ '" class="me-2" style="width: 50px; height: 50px; margin: 5px; border-radius: 10%;" onclick="location.href=\'/moim/getMoim?mmNo='
											+ data[i].moim.mmNo
											+ '\'">'
											+ '<small>'
											+ data[i].noticeRegDate
											+ '</small><br/>'
											+ data[i].moim.mmName
											+ '모임의 초대되었습니다'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '<div class="mt-2 pt-2 border-top">'
											+ '<button type="button" class="btn btn-primary btn-sm notice-accept" mmNo="'+data[i].moim.mmNo+'" userId="'+data[i].toUserId+'" >수락</button>'
											+ '<button type="button" class="btn btn-secondary btn-sm refuseApply" data-bs-dismiss="toast" memberNo="'+data[i].member.memberNo+'">거절</button>'
											+ '</div>' + '</div>' + '</div>'

									// 팔로우 게시글 알림
								} else if (data[i].noticeType == '10') {

									let fileArry = data[i].board.boardFile
											.split("/");

									display += '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+ '<div class="toast-header">'
											+ '<img src="/images/uploadFiles/'
											+ data[i].noticeUser.profileImage
											+ '" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'
											+ data[i].noticeUser.nickname
											+ '</strong> <small>'
											+ data[i].noticeRegDate
											+ '</small>'
											+ '<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+ '</div>'
											+ '<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='
											+ data[i].noticeUser.userId
											+ '\'">'
											+ '<img src="/images/uploadFiles/'
											+ fileArry[0]
											+ '" style="width:50px; height: 50px; margin: 5px; border-radius: 10%;"/>'
											+ data[i].noticeUser.nickname
											+ '님이 게시글을 등록했습니다.</div>'
											+ '</div>'

								}
							}
							$('.noticeOut').append(display);
						} else {
							let display = "<div style='height: 40px'>알림이 존재하지 않습니다.</div>";
							$('.noticeOut').append(display);
						}
						noticeCount();

						// 해당알림 삭제
						$('.btn-close')
								.on(
										'click',
										function() {

											let noticeNo = $(this).attr(
													'notice');

											$
													.ajax({
														url : "/common/json/deleteNotice/"
																+ noticeNo,
														method : "GET",
														dataType : "text",
														success : function(
																data, status) {

															$("." + noticeNo)
																	.remove();

															if ($('.noticeOut')
																	.text() == '') {
																let display = "<div style='height: 40px'>알림이 존재하지 않습니다.</div>";
																$('.noticeOut')
																		.append(
																				display);
															}
														}
													});
										})
						// 알림삭제 end

						$('.notice-accept')
								.on(
										'click',
										function() {

											let mmNo = $(this).attr("mmNo");
											let userId = $(this).attr("userId");
											let notice = $(this);

											$
													.ajax({
														url : "/moim/json/acceptApplyMoim",
														method : "POST",
														contentType : "application/JSON",
														data : JSON
																.stringify({
																	"mmUser" : {
																		"userId" : userId
																	},
																	"mmNo" : mmNo,
																	"memberRole" : 7
																}),
														dataType : "text",
														success : function(
																data, state) {

															notice
																	.parent()
																	.parent()
																	.find(
																			'.btn-close')
																	.click();
															if ($('.noticeOut')
																	.text() == '') {
																let display = "<div style='height: 40px'>알림이 존재하지 않습니다.</div>";
																$('.noticeOut')
																		.append(
																				display);
															}
														}
													})
										})

						$('.refuseApply')
								.on(
										'click',
										function() {

											let memberNo = $(this).attr(
													"memberNo");
											let notice = $(this);

											$
													.ajax({
														url : "/moim/json/refuseApply",
														method : "POST",
														contentType : "application/JSON",
														data : JSON
																.stringify({
																	"memberNo" : memberNo
																}),
														dataType : "text",
														success : function(
																data, state) {

															notice
																	.parent()
																	.parent()
																	.find(
																			'.btn-close')
																	.click();
															if ($('.noticeOut')
																	.text() == '') {
																let display = "<div style='height: 40px'>알림이 존재하지 않습니다.</div>";
																$('.noticeOut')
																		.append(
																				display);
															}
														}
													})
										})

					}
				})
	}

	////////////////////////////// toolbar navigator

	$("a:contains('Moopi')").on("click", function() {

		location.href = "/";
	})

	$("a:contains('모임무피')").on("click", function() {

		location.href = "/moim/listMoim?userId=${dbUser.userId}";
	})

	$("a:contains('번개무피')").on("click", function() {

		location.href = "/flash/listFlash";
	})

	$("a:contains('무피게시판')").on("click", function() {

		location.href = "/board/listBoard?category=1";
	})

	$("a:contains('문의게시판')").on("click", function() {

		location.href = "/board/listBoard?category=2";
	})

	$("a:contains('로그인')").on('click', function() {

		location.href = "/user/loginView";
	})

	$(".chatbtn")
			.on(
					"click",
					function() {

						popWin = window
								.open(
										"https://bbung95-rtc.herokuapp.com/chatList?userId="
												+ dbUser + "&profile="
												+ userProfile + "&nickname="
												+ nickname,
										"popWin",
										"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
					});

	$("a:contains('마이홈')").on("click", function() {

		location.href = "/user/getMyHome?userId=" + dbUser;
	})

	$("a:contains('내정보보기')").on("click", function() {

		location.href = "/user/myInformation";
	})

	$("a:contains('로그아웃')").on("click", function() {

		location.href = "/user/logout";
	})

	$("a:contains('충전')").on("click", function() {

		location.href = "/payment/addPaymentView?userId=" + dbUser;
	})
	
	
	$(document).on('click', (e)=>{
		
		if(!$('#toolbarbox').has(e.target).length){
			$('#search-input').css('width', '230px');
			$('#searchbox').css('display', 'none');
		}
	})
	
	// 검색바
	$('#search-input').on('focus', function(){
		$('#searchbox').css('height', '500px');
		$('#searchbox').css('display', 'block');
	})
	
	function searchList(searchKeyword , searchType){
		
		$.ajax({
			url: "/common/json/searchList/"+searchType,	
			method: "POST",
			data: JSON.stringify({searchKeyword : searchKeyword,
							  	currentPage : searchPage}),
			contentType : "application/JSON",		
				type : "JSON",
				success: function(data, state){
					
					// type에 따라 리셋
					let display = '';
					
					// moim
					if(searchType == 1){
						for(var i in data.list){
							display += '<div class="d-flex rounded-3 shadow-sm mb-1 bg-body border boder-1 align-items-center"'
									+'onclick="location=\'moim/getMoim?mmNo='+data.list[i].mmNo+'\'" style="height: 160px;">'
									+'<div class="search-thumbnail-wrapper">'
							  		+'<div class="search-thumbnail">'
							  		+'<div class="search-thumbnail-centered">'
 									+ '<img class="search-thumbnail-img rounded-2 shadow-sm moim-img" src="/images/uploadFiles/'+data.list[i].mmFile+'"/>'
							    	+'</div>'
							 	 	+'</div>'
									+'</div>'
									+'<div style="margin-left: 20px;">'
									+'<div class="h5">'+data.list[i].mmName+'<span class="rounded-3 shadow-sm p-1 h7">'
									+data.list[i].mmAddr+'</span><span class="rounded-3 shadow-sm p-1 h7">'
									+data.list[i].mmInterest+'</span>'
									+'<div class="inline-block rounded-3 shadow-sm p-1 h7"><i class="bi bi-people-fill"></i>'
									+data.list[i].mmCurrentCount+' / '+data.list[i].mmMaxCount+'</div>'
									+'</div>'
									+'<div>'+data.list[i].mmContent+'</div>'
									+'</div>'
									+'</div>'
						}
					// flash
					}else if(searchType == 2){
						for(var i in data.list){
									
							display += '<div class="d-flex rounded-3 shadow-sm mb-1 bg-body border boder-1 align-items-center"'
									+ 'onclick="location=\'flash/getFlash?flashNo='+data.list[i].flashNo+'\'" style="height: 160px;">'
									+'<div class="search-thumbnail-wrapper">'
					  				+'<div class="search-thumbnail">'
					  				+'<div class="search-thumbnail-centered">'
									+ '<img class="search-thumbnail-img rounded-2 shadow-sm moim-img" src="/images/uploadFiles/'+data.list[i].flashFile+'"/>'
					    			+'</div>'
					 	 			+'</div>'
									+'</div>'
									+'<div style="margin-left: 20px;">'
									+'<div class="h5">'+data.list[i].flashName+'<span class="rounded-3 shadow-sm p-1 h7">'
									+data.list[i].flashAddr+'</span><span class="rounded-3 shadow-sm p-1 h7">'
									+data.list[i].flashInterest+'</span>'
									+'<div class="inline-block rounded-3 shadow-sm p-1 h7"><i class="bi bi-people-fill"></i>'
									+data.list[i].flashCurrentCount+' / '+data.list[i].flashMaxCount+'</div>'
									+'</div>'
									+'<div>'+data.list[i].flashContent+'</div>'
									+'</div>'
									+'</div>'		
							
						}
					// postting
					}else if(searchType == 3){
						for(var i in data.list){
							let fileArry = data.list[i].boardFile.split("/");
							
							display += '<div class="card shadow-sm" style="width: 18rem; padding: 0px; margin: 5px;" onclick="location=\'/user/getMyHome?userId='+data.list[i].boardWriter.userId+'\'">'
									+'<div class="thumbnail-wrapper">'
					  				+'<div class="thumbnail">'
					  				+'<div class="thumbnail-centered">'
									+ '<img class="card-img-top thumbnail-img rounded-2 shadow-sm moim-img" src="/images/uploadFiles/'+fileArry[0]+'"/>'
					    			+'</div>'
					 	 			+'</div>'
									+'</div>'
							  		+'<div class="card-body">'
							    	+'<p class="card-text">'+data.list[i].boardContent+'</p>'
							  		+'</div>'
									+'</div>'
									
									
						}
					// user
					}else{
						for(var i in data.list){
									
							 display += '<div class="d-flex rounded-3 shadow-sm mb-1 bg-body border boder-1 align-items-center"'
							 		+'onclick="location=\'/user/getMyHome?userId='+data.list[i].userId+'\'">'
							 		+'<div>'
									+'<img style="margin: 5px; width:70px; height: 60px; border-radius: 50%;" src="/images/uploadFiles/'+data.list[i].profileImage+'"></img>'
									+'</div>'
									+'<div style="margin-left: 10px;">'
									+'<div class="h7">'+data.list[i].nickname
									+ '<span class="interest rounded-3 shadow-sm p-1 h7">'+data.list[i].interestFirst+'</span>'
									+ '<span class="interest rounded-3 shadow-sm p-1 h7">'+data.list[i].interestSecond+'</span>'
									+ '<span class="interest rounded-3 shadow-sm p-1 h7">'+data.list[i].interestThird+'</span>'
									+'</div>'
							
							/* if(dbUser != '' || dbUser != data.list[i].userId){
								display += '<button class="btn btn-secondary" target="'+data.list[i].userId+'" type="1">채팅</button>'
										+'<button class="btn btn-primary" target="'+data.list[i].userId+'">팔로우</button></div>';
							}  */		
									
							display +='</div>'
							 		+'</div>'
										
						}
						
					}
					
					console.log(searchPage);
					searchPage++;
					$('.searchlist').append(display);
					
					
					// 채팅 버튼
					/* $('button:contains("채팅")').on('click', function(){
						
						let target = $(this).attr('target');
						let type = $(this).attr('type');
						
						$.ajax({
								url: "/common/chat/joinRoom/"+dbUser+"/"+target+"/"+type,
								method: "GET",
								dataType: "JSON",
								success: function(data,state){
									console.log(JSON.stringify(data));
									let url;
									if(data.type == 1){

										  url = "https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.userId+"&type="+data.type
										+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname
										+"&trgtProfile="+data.target.profileImage; 
									}else{

										url = "https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.mmNo+"&type="+data.type
										+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.mmName
										+"&trgtProfile="+data.target.mmFile+"&roomNo="+data.target.mmNo;
									}
								popWin = window.open(
									url,
 									"popWin"+target,
									"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
								}
								
							
						})
						
					}) */
					
					// 채팅 버튼
					$('button:contains("팔로우")').on('click', function(){
						
						let button = $(this);
						let target = $(this).attr('target');
						$.ajax({
							url: "/user/json/follow/"+target,
							method: "GET",
							dataType: "JSON",
							success: function(data,state){
								if(data){
									button.attr('background', 'gray');
								}else{
									button.css('background', '');
								}
							}
						});
					});
				}
			})
	}
	
	function searchCollect(){
		
		searchPage = 1;
		$('.searchlist').children().remove();
		searchList($('#search-input').val() , $('.type').val());
	}
	
	$('.saerchbar-btn').on('click', function(){
		
		let type = $(this).attr('type');
		$('.type').val(type);
		
		$('.active').attr('class', 'btn btn-primary saerchbar-btn');
		$(this).attr('class', 'btn btn-primary saerchbar-btn active');
		
		searchCollect()
	})
	
	// ajax search
	$('#search-input').on('keypress', function(){
		searchCollect()
	})
	
	$('#search-input').on('keyup', function(){
		searchCollect()
	})
	
	
	// 요소 무한스크롤
	$.fn.whenScrolledToBottom = function (cback_fxn) {
     this.on('scroll',this,function(e){
         if( e.data.scrollTop() >= e.data[0].scrollHeight - e.data.height()){
             return cback_fxn.apply(e.data, arguments)
     	    }
     	});
	};
	

	$('.searchlist').whenScrolledToBottom(function(){
		searchList($('#search-input').val() , $('.type').val());
	});
	
	
	
	$(document).scroll(function() {
  		var maxHeight = $(document).height();
 		 var currentScroll = $(window).scrollTop() + $(window).height();
  	
 		 if (maxHeight-70 >= maxHeight - $(window).scrollTop()) {
  			 $('#toolbar').css('background', '#4299e1');
  			 $('.toolbar-color').css('color', 'white');
 		 }
 		 if (maxHeight-70 <= maxHeight - $(window).scrollTop()) {
  			 $('#toolbar').css('background', 'white');
  			 $('.toolbar-color').css('color', 'black');
		 }
	})
	
</script>