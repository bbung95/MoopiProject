<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer
	src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
	integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
	crossorigin="anonymous"></script>
<style>
.weather {
	position: fixed;
	bottom: 0;
	left: 0;
	margin-left: 20px;
	margin-bottom: 20px;
}

#toolbar {
	background: white;
	height: 62px;
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

/*사이즈*/
@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 1000px;
	}
}

/*사실 이 블럭은 없어도 된다*/
@media ( min-width : 1200px) {
	.container {
		width: 1000px;
	}
}
</style>

<div style="width: 10px; height: 10px;"></div>

<!-- ToolBar Start /////////////////////////////////////-->
<nav class="navbar navbar-expand-lg navbar-light  fixed-top"
	id="toolbar">
	<div class="container px-5">
		<a class="navbar-brand" href="/">Moopi</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link">모임무피</a></li>
				<li class="nav-item"><a class="nav-link">번개무피</a></li>
				<li class="nav-item"><a class="nav-link">무피게시판</a></li>
				<li class="nav-item"><a class="nav-link">문의게시판</a></li>

				<!-- sessionScope.id가 없으면 : 로그인을 하지 않았을 경우 -->
				<c:if test="${empty sessionScope.dbUser}">
					<li class="nav-item"><a class="nav-link">로그인</a></li>
				</c:if>

				<!-- sessionScope.id가 있을시 : 로그인을 했을 경우 -->
				<c:if test="${not empty sessionScope.dbUser}">

					<!-- 알림 -->
					<li class="nav-item noticebtn" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><a
						class="nav-link" style="position: relative;"> <i
							class="bi bi-envelope toolbar_i"></i><span id="noticeCount"
							class="badge rounded-pill bg-danger"></span></a></li>

					<!-- 채팅 -->
					<li class="nav-item chatbtn"><a class="nav-link"><i
							class="bi bi-chat toolbar_i"></i></a></li>

					<!-- 로그인시 메뉴  -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
						href="#" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"><img
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
	<div class="offcanvas-body noticeOut">

		

	</div>
</div>

<!-- ToolBar End /////////////////////////////////////-->
<script type="text/javascript">
	// login session userId
	var dbUser = '<c:out value="${dbUser.userId}"/>';
	var userProfile = '<c:out value="${dbUser.profileImage}"/>';
	var nickname = '<c:out value="${dbUser.nickname}"/>';

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

	function chatjoin(target) {
		popWin = window
				.open(
						"/chat/joinRoom?userId=" + dbUser + "&trgt=" + target
								+ "&type=1",
						"popWin",
						"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}

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

								//채팅 알림 type 1
								if (data[i].noticeType == '1') {
									/* display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ data[i].noticeNo
											+ "' onclick='javascript:chatjoin(\""
											+ data[i].noticeUser.userId
											+ "\")'><span>"
											+ data[i].noticeUser.nickname
											+ " : "
											+ data[i].noticeContent
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>"; */

									// 모임 정모 생성 알림 type 2
								} else if (data[i].noticeType == '2') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/meeting/listMeeting?userId="
											+ dbUser
											+ "&mmNo="
											+ data[i].moim.mmNo
											+ "\"'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].moim.mmFile+"' />"
											+ data[i].moim.mmName
											+ "의  "
											+ data[i].noticeContent
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";

									// 정모 가입 알림 type 3
								} else if (data[i].noticeType == '3') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/meeting/listMeeting?userId="
											+ dbUser
											+ "&mmNo="
											+ data[i].moim.mmNo
											+ "\"'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].moim.mmFile+"' />"
											+ data[i].moim.mmName
											+ data[i].noticeContent
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";

									// 모임 가입승인 알림 type 4
								} else if (data[i].noticeType == '4') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/moim/getMoim?mmNo="
											+ data[i].moim.mmNo
											+ "'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].moim.mmFile+"\"' />"
											+ data[i].moim.mmName
											+ "의  "
											+ data[i].noticeContent
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";

									// 플래쉬 참가 알림 type 5
								} else if (data[i].noticeType == '5') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/flash/getFlash?flashNo="
											+ data[i].flash.flashNo
											+ "\"'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].flash.flashImage+"' />"
											+ data[i].flash.flashName
											+ "의 "
											+ data[i].noticeUser.nickname
											+ data[i].noticeContent
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";

									// 게시글 댓글 알림 type 6
								} else if (data[i].noticeType == '6') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/user/getMyHome?userId="
											+ data[i].toUserId
											+ "\"'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px; border-radius: 50%;' src='/images/uploadFiles/"
											+ data[i].noticeUser.profileImage
											+ "' />"
											+ data[i].noticeUser.nickname
											+ "님이 댓글을 작성했습니다"
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";

									// 게시글 좋아요 알림 type 7
								} else if (data[i].noticeType == '7') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/user/getMyHome?userId="
											+ data[i].toUserId
											+ "\"'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px; border-radius: 50%;' src='/images/uploadFiles/"
											+ data[i].noticeUser.profileImage
											+ "' />"
											+ data[i].noticeUser.nickname
											+ "님이 좋아요했습니다."
											+ "</span>"
											+ "<span><button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";

									// 팔로우 알림 type 8
								} else if (data[i].noticeType == '8') {
											
									display	+= '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+'<div class="toast-header">'
											+'<img src="/images/uploadFiles/'+data[i].noticeUser.profileImage+'" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'+data[i].noticeUser.nickname+'</strong> <small>'+data[i].noticeRegDate+'</small>'
											+'<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+'</div>'
											+'<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='+data[i].noticeUser.userId+'\'">'
											+data[i].noticeContent+'</div>'
											+'</div>'		
											
									// 모임 초대 알림 type 9
								} else if (data[i].noticeType == '9') {
									display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
											+ "<span onclick='location.href=\"/moim/getMoim?mmNo="
											+ data[i].moim.mmNo
											+ "\"'>"
											+ "<img style='width: 50px; height: 50px; margin: 5px; border-radius: 50%;' src='/images/uploadFiles/"
											+ data[i].moim.mmFile
											+ "' />"
											+ data[i].moim.mmName
											+ "의 초대되었습니다"
											+ "</span>"
											+ "<span>"
											+ "<button type='button' class='btn btn-default notice-accept' mmNo='"+data[i].moim.mmNo+"' userId='"+data[i].toUserId+"'>Accept</button>"
											+ "<button type='button' class='btn btn-default refuseApply' memberNo='"+data[i].member.memberNo+"'>reject</button>"
											+ "<button type='button' class='btn-close' notice='"+data[i].noticeNo+"' aria-label='Close'></button></span></div>";
								
									// 팔로우 게시글 알림
								} else if (data[i].noticeType == '10') {
											
									display	+= '<div class="shadow-sm p-3 mb-1 bg-body rounded notice '+data[i].noticeNo+'">'
											+'<div class="toast-header">'
											+'<img src="/images/uploadFiles/'+data[i].noticeUser.profileImage+'" class="me-2" style="width: 40px; height: 40px; margin: 5px; border-radius: 50%;""> <strong'
											+'class="me-auto">'+data[i].noticeUser.nickname+'</strong> <small>'+data[i].noticeRegDate+'</small>'
											+'<button type="button" class="btn-close" data-bs-dismiss="toast"'
											+'aria-label="Close" notice="'+data[i].noticeNo+'"></button>'
											+'</div>'
											+'<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='+data[i].noticeUser.userId+'\'">'
											+data[i].noticeUser.nickname+'님이 게시글을 등록했습니다.</div>'
											+'</div>'
											
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

						$('.notice-accept').on('click', function() {

							let mmNo = $(this).attr("mmNo");
							let userId = $(this).attr("userId");
							let notice = $(this);

							$.ajax({
								url : "/moim/json/acceptApplyMoim",
								method : "POST",
								contentType : "application/JSON",
								data : JSON.stringify({
									"mmUser" : {
										"userId" : userId
									},
									"mmNo" : mmNo
								}),
								dataType : "text",
								success : function(data, state) {
									notice.next().next().click();
								}
							})
						})

						$('.refuseApply').on('click', function() {

							let memberNo = $(this).attr("memberNo");
							let notice = $(this);

							$.ajax({
								url : "/moim/json/refuseApply",
								method : "POST",
								contentType : "application/JSON",
								data : JSON.stringify({
									"memberNo" : memberNo
								}),
								dataType : "text",
								success : function(data, state) {
									notice.next().click();

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

	/* $("a:contains('관리자')").on("click", function() {

		location.href = "/common/adminMoopi";
	}) */
</script>