<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Hey Flash Moopi</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<!-- AOS 스크롤 효과 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<style>
body {
	padding-top: 50px;
}
</style>

<!-- 리스트 아이템 -->
<style>
.userEL8990950 {
	padding: 20px 0;
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
	height: 100%;
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
	font
}

.tpl-forum-list-name:not(:empty):not(.hidden) {
	margin-top: 15px;
}

.item-ul {
	margin: 5px auto;
	display: inline-block;
}

.item-ul>li {
	display: inline-block;
	float: left;
	line-height: 1.4;
}

.item-ul>li:not(:empty):not(.hidden) ~ li:empty+li:not(:empty):not(.hidden):before,
	.item-ul>li:not(:empty):not(.hidden) ~ li.hidden+li:not(:empty):not(.hidden):before,
	.item-ul>li:not(:empty):not(.hidden)+li:not(:empty):not(.hidden):before
	{
	content: '|';
	margin: 0 10px;
	position: relative;
	display: inline-block;
	float: left;
}
</style>

<!-- 이미지 호버 -->
<style>
.hover01 figure img {
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
}

.hover01 figure:hover img {
	-webkit-transform: scale(1.3);
	transform: scale(1.3);
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
}

.carousel-item>img {
	max-height: 500px;
	opacity: 0.7;
}

#btnbar {
	position: fixed;
	bottom: 0;
	right: 0;
	margin: 20px;
}

#btnbar>button {
	background: #d1e0e3;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	transition: all 0.5s;
}

#btnbar>button>i {
	font-size: 20px;
}

#btnbar>button:hover {
	background: #e0ecff;
}

.interestNo {
	font-size: 16px;
	font-weight: bold;
	height: 40px;
	cursor: pointer;
	line-height: 20px;
	align-items: center;
}

.interestNo:hover {
	color: #4299e1;
}

.interestActive {
	color: #4299e1;
}

.listhead {
	font-size: 24px;
	font-weight: bold;
	line-height: 34px;
	margin-bottom: 16px;
}
</style>

<script>
	function fncAddFlashView() {
		alert("번개생성");
		self.location = "/flash/addFlashView?userId=${dbUser.userId}"
	}

	function fncGetFlash(flashNo) {
		alert("번개무피 상세보기");
		self.location = "/flash/getFlash?flashNo=" + flashNo
	}

	function fncAddFlash() {
		alert("번개생성 시작!");

		// 	var name = $("name:flashName").val();
		// 	var file = $("#uploadFile").val();
		// 	var content = $("#flashContent").val();
		// 	var time = $("#flashTime").val();

		// 	if (name == null || name.length< 1)
		// 		alert('번개무피명을 입력해주세요!');
		// 		return
		// 	}

		// 	if (file == null || file.length< 1)
		// 		alert('썸네일 사진을 올려주세요');
		// 		return
		// 	}

		// 	if (content == null || content.length< 1)
		// 		alert('썸네일 사진을 올려주세요');
		// 		return
		// 	}	

		// 	if (time == null || time.length< 1)
		// 		alert('번개 시간 설정해주세요!');
		// 		return
		// 	}

		$(".form-horizontal").attr("method", "POST").attr("action",
				"/flash/addFlash").submit();

	}

	$('.search-btn').on(
			'click',
			function() {

				$('#getFlashList').attr('method', "Get").attr("action",
						"/flash/getFlashList").submit();
			})
</script>



</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!-- 검색 조건 -->
	<input type="hidden" id="addr" value="${search.addr }" />
	<input type="hidden" id="interest" value="${search.interestNo }" />
	<input type="hidden" id="searchCondition"
		value="${search.searchCondition}" />

<div id="wrapper">
	<!-- 메인 헤더 -->
	<div id="carouselExampleSlidesOnly"
		class="carousel slide carousel-fade" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="6000">
				<img src="/images/background/moim2.jpg" class="d-block w-100"
					alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h2>안녕하세요 자유로움을 추구하는 번개무피 여러분~</h2>
					<!-- <p>Some representative placeholder content for the first slide.</p> -->
				</div>
			</div>
			<div class="carousel-item " data-bs-interval="6000">
				<img src="/images/background/moim1.jpg" class="d-block w-100"
					alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h2>여기는 무피에서 가장 자유로운 공간이에요.</h2>
					<p>무피 회원 이라면 누구나 번개 생성 참가를 할수있어요.</p>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="6000">
				<img src="/images/background/flash1.jpg" class="d-block w-100"
					alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h2>하지만 자유에는 조금의 책임이 따른답니다 번개 생성시 2코인 참가시 1코인을 소비하게 되어요</h2>
					<p>부족한 코인은 오른쪽 상단 충전에서 구매 하실수 있습니다!.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 정렬 -->
	<div class="container d-flex">
		<input type="hidden" class="interest" name="interestNo" value="0">
		<input type="hidden" class="addr" name="addr" value=""> <input
			type="hidden" class="order" name="type" value=""> <input
			type="hidden" class="searchCondition" name="searchCondition" value="">
		<div class="me-auto p-2 bd-highlight h4">번개</div>
		<div class="bd-highlight ">
			<div class="dropdown mt-3">

				<button class="btn btn-light dropdown-toggle selectbtn shadow-sm"
					type="button" data-bs-toggle="dropdown" id="addrbtn" style="margin-right: 20px;">Addr</button>
				<ul class="dropdown-menu addr" aria-labelledby="dropdownMenuButton"
					 style="height: 200px; overflow: auto;">

				</ul>
			</div>
		</div>
	</div>



	<!-- 리스트 뷰 -->
	<div class="userEL8990950 colorSet" data-forum-type="thumb"
		data-fcolor="#191919">
		<div class="container">
			<div class="row multi-columns-row">
				<div class="row">
					<div class="col-xs-3 col-sm-3 col-md-3">
						<hr / style="margin: 0px 0px 15px 0px;">
						<c:forEach var="interest" items="${interest}">
							<div class="interestNo" type="${interest.interestNo}">${interest.interestName}</div>

						</c:forEach>
					</div>
					<div class="col-xs-9 col-sm-9 col-md-9">

						<hr style="margin: 0px 0px 10px 0px;" />
						 <div class="listhead">번개 리스트</div>
						<div class="row" id="flashListView"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<!-- btn collector -->
	<div id="btnbar">
	
	<c:if test="${!empty dbUser}" >
	<button data-bs-toggle="modal" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">
		<i class="bi bi-plus"></i>
	</button>
	</c:if>
	<button onclick="location.href='#carouselExampleSlidesOnly'">
		<i class="bi bi-chevron-up"></i>
	</button>
	</div>
	

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel">번개를 번개처럼생성!</h2>




					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>


				</div>

				<div class="modal-body">
					<!-- 폼시작 -->

					<!-- form Start /////////////////////////////////////-->
					<form class="form-horizontal" name="detailForm"
						enctype="multipart/form-data">
						<input type="hidden" id="userId" name="userId"
							value="${dbUser.userId}">
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개무피명</label>
							<div class="col-sm-20">
								<input type="text" class="form-control" id="flashName"
									name="flashName" placeholder="번개명">
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개썸네일</label>
							<div class="col-sm-40">
								<input type="file" class="form-control" id="uploadFile"
									name="uploadFile" placeholder="대표썸네일">
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-3 col-sm-3 control-label">번개소개</label>
							<div class="col-sm-40">
								<textarea style="resize: none" class="form-control"
									id="flashContent" name="flashContent" placeholder="50자이내"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개장소</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="flashAddr"
									name="flashAddr" placeholder="지역구">
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개모임인원</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="flashMaxCount"
									name="flashMaxCount" placeholder="최대참가인원">
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개만남시간</label>
							<div class="col-sm-20">
								<input type="datetime-local" class="form-control" id="flashTime"
									name="flashTime" placeholder="만남시간">
							</div>
						</div>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
							<div class="col-sm-20">
								<select class="form-control" id="flashInterest"
									name="flashInterest">
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
									<option value="12">맛집/카</option>
								</select>
							</div>
						</div>


						<!-- 		  <div class="form-group"> -->
						<!-- 		    <div class="col-sm-offset-4  col-sm-4 text-center"> -->
						<!-- 		      <button type="button" class="btn btn-primary" onClick="fncAddMoim()" >등록</button> -->
						<!-- 			   <a class="btn btn-default btn" role="button"  onclick="history.back()">취소</a> -->
						<!-- 		    </div> -->
						<!-- 		  </div> -->
					</form>

					<!-- 폼끝 -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-bs-dismiss="modal" aria-label="Close">Close</button>
					<button type="button" class="btn btn-primary"
						onClick="fncAddFlash()">Create</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />

	<!-- 무한 -->
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


	<script>
		var loading = false;

		let currentPage = 1;

		// 지역구
		let addrs = [ "종로구", "중구", "용산", "성동구", "광진구", "동대문구", "중랑구", "성북구",
				"강북구", "도봉구", "노원구", "은평구", "마포구", "양천구", "강서구", "구로구", "금천구",
				"영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구" ];

		for (var i = 0; i < addrs.length; i++) {

			let display = '<li><a class="dropdown-item" href="#">' + addrs[i]
					+ '</a></li>';
			$('.addr').append(display);
		}

		$('.addr > li > a').on('click', function() {

			$('#addrbtn').text($(this).text());
			$('#addr').val($(this).text().trim());
			$('#flashListView').children().remove();

			location.href = "#carouselExampleSlidesOnly";
			currentPage = 1;
			getListFlash();
		})

		// 관심사
		$('.interestNo').on('click', function() {

			let type = $(this).attr('type');
			$('.interestActive').attr('class', 'interestNo');
			$(this).attr('class', 'interestNo interestActive');
			$('#interest').val(type);
			$('#moimListView').children().remove();

			location.href = "#carouselExampleSlidesOnly";
			currentPage = 1;
			getMoimList();
		})

		$(window).scroll(
				function() {
					if ($(document).height() - $(window).height() == $(window)
							.scrollTop()) {

						if (!loading) {
							loading = true;
							getListFlash()
						} else {
						}
					}
				});

		function getListFlash() {

			let addr = $('#addr').val();
			let interest = $('#interest').val();
			let searchCondition = $('#searchCondition').val();

			if (interest != 0 && addr != '') {
				$('#searchCondition').val("4");
			} else if (interest != 0) {
				$('#searchCondition').val("1");
			} else if (addr != '') {
				$('#searchCondition').val("2");
			} else {
				$('#searchCondition').val("0");
			}

			$
					.ajax({
						url : "/flash/json/getListFlash",
						method : "POST",
						dataType : "JSON",
						contentType : "application/json",
						data : JSON.stringify({
							"currentPage" : currentPage,
							"searchCondition" : searchCondition,
							"addr" : addr,
							"interestNo" : interest
						}),
						success : function(data, status) {

							let list = data.list;
							if (list.length > 0) {
								for (var i = 0; i < data.list.length; i++) {
									let displayValue = '';

									displayValue = '<div data-aos="" class="col-xs-4 col-sm-4 col-md-4 no-padding item " id="getFlash" onClick="fncGetFlash('
											+ list[i].flashNo
											+ ')" >'
											+ '<div class="border-wrap op_itemline10 img-thumbnail" >'
											+ '<div class="thumb-wrap">'
											+ '<div class="tpl-forum-list-thumb">'
											+ '<div class="thumbnail-wrapper ">'
											+ '<div class="thumbnail ">'
											+ '<div class="thumbnail-centered ">'
											+ '<img src="/images/uploadFiles/'+list[i].flashFile+'" class="thumbnail-img">'
											+ '</div>'
											+ '</div>'
											+ '</div>'
											+ '</div>'
											+ '</div>'
											+ '<div class="cont-wrap">'
											+ '<div class="tpl-forum-list-content"'
											+ '<span class="tpl-forum-list-title"'
											+'data-selector=".tpl-forum-list-title" data-font="true"'
											+'data-title="title font">'
											+ list[i].flashName
											+ '</span>'
											+ '</div>'
											+ '<div'
											+'class="tpl-forum-list-name tpl-forum-list-etc config-font-etc d-flex"'
											+'data-selector=".tpl-forum-list-etc" data-font="true"'
											+'data-title="others">'
											+ '<img src="/images/uploadFiles/'
											+ list[i].flashConstructor.profileImage
											+ '" style="width: 40px; height:40px; border-radius: 50%;" />'
											+ '<span>'+list[i].flashConstructor.nickname+'</span>'
											+ '</div>'
											+'<div><span class="rounded-3 shadow-sm p-1 h7">'
											+list[i].flashAddr+'</span><span class="rounded-3 shadow-sm p-1 h7">'
											+list[i].flashInterest+'</span></div>'
											+ '<ul class="d-flex item-ul" style="list-style: none;">'
											+ '<li class="tpl-forum-list-category tpl-forum-list-etc config-font-etc">'
											+ list[i].flashTime
											+ '</li>'
											+ '<li class="tpl-forum-list-hit tpl-forum-list-etc config-font-etc">'
											+ list[i].flashCurrentCount
											+ '</li>'
											+ '<li class="tpl-forum-list-comment tpl-forum-list-etc config-font-etc">'
											+ list[i].flashMaxCount
											+ '</li>'
											+ '</ul>'
											+ '<div class="tpl-forum-list-cont"'
											+'data-selector=".tpl-forum-list-cont" data-font="true"'
											+'data-title="content font"></div>'
											+ '</div>' + '</div>' + '</div>'

									$('#flashListView').append(displayValue);
								}
								loading = false;
								console.log(currentPage);
								currentPage++;
							}

						}
					});
		}
		getListFlash();

		AOS.init();
	</script>
</body>
</html>