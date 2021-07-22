<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>

<!-- BootsWatch CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous">

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">

	<div class="container">

		<a class="navbar-brand" href="#">Moopi</a>

		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<!-- toolBar Button End //////////////////////// -->

		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target"
			data-hover="dropdown"
			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">

			<!-- Tool Bar 를 다양하게 사용하면.... -->
			<ul class="nav navbar-nav">
				<li><a href="#">모임무피</a></li>
				<li><a href="#">번개무피</a></li>
				<li><a href="#">무피게시판</a></li>
				<li><a href="#">문의게시판</a></li>
			</ul>

			<div class="collapse navbar-collapse" id="target">
				<ul class="nav navbar-nav navbar-right">

					<!-- sessionScope.id가 없으면 : 로그인을 하지 않았을 경우 -->
					<c:if test="${empty sessionScope.dbUser}">
						<li><a href="/user/loginView">로그인</a></li>
					</c:if>
					
					<!-- sessionScope.id가 있을시 : 로그인을 했을 경우 -->
					<c:if test="${not empty sessionScope.dbUser}">
						<li class="dropdown-toggle" id="noticeCount"><a href="#"
							data-toggle="dropdown" role="button" aria-expanded="false"> <span>알림</span>
						</a>
							<ul id="noticeList" class="dropdown-menu">
								<div align="right">
									<a href="javascript:deleteNoticeAll()">전체삭제</a>
								</div>
								<div class="noticeOut">
								</div>
							</ul></li>
						<li><a href="#">채팅</a></li>
						
						<li class="dropdown-toggle" id="addPayment"><a href="#"
							data-toggle="dropdown" role="button" aria-expanded="false"> <span>충전</span>
						</a>
						
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 							
								<span> 메뉴 </span>					
							</a>
							<ul class="dropdown-menu">
								<li> <a href="#">마이홈</a></li>
								<li> <a href="#">내정보보기</a></li>
								<li> <a href="#">쪽지	</a></li>
								<li> <a href="#">My결제내역</a></li>
								<li> <a href="#">My코인내역</a></li>
								<li> <a href="#">로그아웃</a></li>
								<c:if test="${dbUser.userRole == '1'}">
									<li> <a href="#">관리자</a></li>
								</c:if>
							</ul></li>							
					</c:if>
								
				</ul>
			</div>
		</div>
	</div>
	<!-- dropdown hover END -->

</div>
</div>

<div class="weather"> 
	<div class="CurrIcon"></div>
	<div class="CurrTemp"></div>
	<div class="City"></div> 
</div>



<!-- ToolBar End /////////////////////////////////////-->



<script type="text/javascript">
	
	// login session userId
	var dbUser = '<c:out value="${dbUser.userId}"/>';
	
	
	$(document).ready(function() { 
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
			
			$.ajax({ 
				url:'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=92b4d06becd22c0b70b3ea777b320f09&units=metric', 
				
				dataType:'json',
				type:'GET',
				success:function(data){ 
					var $Icon = (data.weather[0].icon).substr(0,2); 
					var $Temp = Math.floor(data.main.temp) + 'º'; 
					var $city = data.name; 
					console.log($Icon);
					$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>'); 
					$('.CurrTemp').prepend($Temp); 
					$('.City').append($city); 
					}
				}) 
				});

	
	
	
	//읽지않은 알림 카운트
	function noticeCount() {
		$.ajax({
					url : "/common/json/getNoticeCount/"+dbUser,
					method : "GET",
					dataType : "text",
					success : function(data, status) {
						if (data != 0) {
							let display = "<span id='test' style='background: red;'> ! </span>";
							$('#noticeCount > a > span').append(display);
						}
					}
				});
	}

	//해당 알림 삭제
	function deleteNotice(noticeNo) {
		$.ajax({
			url : "/common/json/deleteNotice/" + noticeNo,
			method : "GET",
			dataType : "text",
			success : function(data, status) {
				$('.notice '+noticeNo).remove();
				
			}
		});
	}

	//알림 전체삭제
	function deleteNoticeAll() {
		$.ajax({
			url : "/common/json/deleteNoticeAll/"+dbUser,
			method : "GET",
			dataType : "text",
			success : function(data, status) {

				$('.noticeOut').children().remove();
				let display = "<li style='height: 40px'>알림이 존재하지 않습니다.</li>";
				$('.noticeOut').append(display);
			}
		});
	}
	
	function chatjoin(target){
			popWin = window.open(
					"/chat/joinRoom?userId="+dbUser+"&trgt="+target,
					"popWin",
					"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}
	
	// 읽지않은 알림과 알림 리스트
	if(dbUser !== ''){
		$.ajax({
				url : "/common/json/getListNotice/"+dbUser,
				method : "GET",
				dataType : "JSON",
				success : function(data, status) {
					
					let display = '';
					if (data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							
							//채팅 알림 type 1
							if(data[i].noticeType == '1'){
									display += "<div style='height: 60px; width: 250px;' class='notice "+data[i].noticeNo+"' onclick='javascript:chatjoin(\""+data[i].noticeUser.userId+"\")'><span>"
									+ data[i].noticeUser.nickname+" : "+data[i].noticeContent
									+ "</span>"
									+"<span><a href='javascript:deleteNotice("+data[i].noticeNo+")'>X</a></span></div>";
							
							// 모임 정모 생성 알림 type 2
							}else if(data[i].noticeType == '2'){
								display += "<span class='notice "+data[i].noticeNo+"' style='height: 60px; width: 250px;' onclick='location.href=\"/meeting/listMeeting?userId="+dbUser+"&mmNo="+data[i].moim.mmNo+"\"'><span>"
								+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].moim.mmFile+"' />"
								+ data[i].moim.mmName+"의  "+data[i].noticeContent
								+ "</span></span>"
								+"<span><a href='javascript:deleteNotice("+data[i].noticeNo+")'>X</a></span>";
								
							// 정모 가입 알림 type 3
							}else if(data[i].noticeType == '3'){
								display += "<span class='notice "+data[i].noticeNo+"' style='height: 60px; width: 250px;' onclick='location.href=\"/meeting/listMeeting?userId="+dbUser+"&mmNo="+data[i].moim.mmNo+"\"'><span>"
								+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].moim.mmFile+"' />"
								+ data[i].moim.mmName+data[i].noticeContent
								+ "</span></span>"
								+"<span><a href='javascript:deleteNotice("+data[i].noticeNo+")'>X</a></span>";
							
							// 모임 가입승인 알림 type 4
							}else if(data[i].noticeType == '4'){
								display += "<span class='notice "+data[i].noticeNo+"' style='height: 60px; width: 250px;' onclick='location.href=\"/moim/getMoim?mmNo="+data[i].moim.mmNo+"\"'><span>"
								+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].moim.mmFile+"' />"
								+ data[i].moim.mmName+"의  "+data[i].noticeContent
								+ "</span></span>"
								+"<span><a href='javascript:deleteNotice("+data[i].noticeNo+")'>X</a></span>";
							
							// 플래쉬 참가 알림 type 5
							}else if(data[i].noticeType == '5'){
								display += "<span class='notice "+data[i].noticeNo+"' style='height: 60px; width: 250px;' onclick='location.href=\"/flash/getFlash?flashNo="+data[i].flash.flashNo+"\"'><span>"
								+ "<img style='width: 50px; height: 50px; margin: 5px' src='/images/uploadFiles/"+data[i].flash.flashImage+"' />"
								+ data[i].flash.flashName+"의 "+data[i].noticeUser.nickname+data[i].noticeContent
								+ "</span></span>"
								+"<span><a href='javascript:deleteNotice("+data[i].noticeNo+")'>X</a></span>";
							
							// 게시글 댓글 알림 type 6
							}else if(data[i].noticeType == '6'){
							
						
							// 게시글 좋아요 알림 type 7
							}else if(data[i].noticeType == '7'){
							
							
							// 팔로우 알림 type 8
							}else if(data[i].noticeType == '8'){
								display += "<div style='height: 60px; width: 250px;'  class='notice "+data[i].noticeNo+"' onclick='location.href=\"/user/getMyHome?userId="+data[i].noticeUser.userId+"\"'><span>"
								+ "<img style='width: 50px; height: 50px; margin: 5px; border-radius: 50%;' src='/images/uploadFiles/"+data[i].noticeUser.profileImage+"' />"
								+ data[i].noticeUser.nickname+data[i].noticeContent
								+ "</span>"
								+"<span><a href='javascript:deleteNotice("+data[i].noticeNo+")'>X</a></span></div>";
							
							// 모임 가입승인 알림 type 9
							}
						}
						$('.noticeOut').append(display);
					} else {
						let display = "<li style='height: 40px'>알림이 존재하지 않습니다.</li>";
						$('.noticeOut').append(display);
					}
					noticeCount();
				}
			})
		}

	// 알림 읽음표시
	$('#noticeCount').on('click', function() {
		$.ajax({
			url : "/common/json/updateNoticeState/"+dbUser,
			method : "GET",
			dataType : "JSON",
			success : function(data, status) {
			}
		})
		$('#test').remove();
	})
	
	////////////////////////////// toolbar navigator
	
	$("a:contains('Moopi')").on("click", function(){
	
		location.href = "/";
	})
	
	$("a:contains('모임무피')").on("click", function(){
		
		location.href = "/moim/listMoim";
	})
	
	$("a:contains('번개무피')").on("click", function(){
		
		location.href = "/flash/listFlash";
	})
	
	$("a:contains('무피게시판')").on("click", function(){
		
		
		location.href = "/board/listBoard?category=1";
	})
	
	$("a:contains('문의게시판')").on("click", function(){
		
		location.href = "/board/listBoard?category=2";
	})
	
	$("a:contains('채팅')").on("click", function() {

		popWin = window
		.open(
				"/chat/chatList",
				"popWin",
				"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	});
	
	$("a:contains('마이홈')").on("click", function(){
	
		location.href = "/user/getMyHome?userId="+dbUser;
	})
	
	$("a:contains('내정보보기')").on("click", function(){
		
		location.href = "/user/updateProfile?userId="+dbUser;
	})
	
	$("a:contains('쪽지')").on("click", function(){
		
		location.href = "/";
	})
	
	$("a:contains('My결제내역')").on("click", function(){
		
		location.href = "/payment/paymentList?userId="+dbUser;
	})
	
	$("a:contains('My코인내역')").on("click", function(){
		
		location.href = "/coin/coinHistory?userId="+dbUser;
	})
	
	$("a:contains('로그아웃')").on("click", function(){
		
		location.href = "/user/logout";
	})
	
	$("a:contains('관리자')").on("click", function(){
		
		location.href = "/common/adminMoopi";
	})
	
	$("a:contains('충전')").on("click", function(){
		
		location.href = "/payment/addPaymentView?userId="+dbUser;
	})
</script>

