<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

					<li class="dropdown-toggle" id="noticeCount"><a href="#"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>알림</span>
					</a>
						<ul id="noticeList" class="dropdown-menu">
							<div align="right"><a href="javascript:deleteNoticeAll('user01')">전체삭제</a></div>
						</ul></li>
					<li><a href="#">채팅</a></li>
					<c:if test="${empty sessionScope.user}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"> <span>메뉴</span>
								</span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">마이홈</a></li>
								<li><a href="#">내정보보기</a></li>
								<li><a href="#">쪽지</a></li>
								<li><a href="#">로그아웃</a></li>
								<li><a href="#">관리자</a></li>
							</ul></li>
						<li><a href="/user/login">로그인</a></li>
					</c:if>
					<%-- <c:if test="${empty sessionScope.user}">
						<li><a href="#">Sign in</a></li>
					</c:if> --%>
				</ul>
			</div>
		</div>
	</div>
	<!-- dropdown hover END -->

</div>
</div>
<!-- ToolBar End /////////////////////////////////////-->



<script type="text/javascript">
	//읽지않은 알림 카운트
	function noticeCount() {
		$
				.ajax({
					url : "/common/json/getNoticeCount/user01",
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

			}
		});
		$('.notice '+noticeNo).remove();
	}

	//알림 전체삭제
	function deleteNoticeAll(userId) {
		$.ajax({
			url : "/common/json/deleteNoticeAll/user01",
			method : "GET",
			dataType : "text",
			success : function(data, status) {

			}
		});
		$('.notice').remove();
	}
	// 읽지않은 알림과 알림 리스트
	$
			.ajax({
				url : "/common/json/getListNotice/user01",
				method : "GET",
				dataType : "JSON",
				success : function(data, status) {
					if (data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							let display = "<li style='height: 40px' class='notice "+data[i].noticeNo+"'><span>"
									+ data[i].noticeContent
									+ "</span><span><a href='javascript:deleteNotice("
									+ data[i].noticeNo + ")'>X</a></span></li>";

							$('#noticeList').append(display);
						}
					} else {
						let display = "<li style='height: 40px'>알림이 존재하지 않습니다.</li>";
						$('#noticeList').append(display);
					}
					noticeCount();
				}
			})

	// 알림 읽음표시
	$('#noticeCount').on('click', function() {
		$.ajax({
			url : "/common/json/updateNoticeState/user01",
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
				"http://localhost:3000/?userId=user02",
				"popWin",
				"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	});
</script>
