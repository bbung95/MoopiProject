<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>
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


<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<script src="/javascript/owl.carousel.min.js"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- AOS 스크롤 효과 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


<script type="text/javascript">
	function fncAddMoimView() {
		swal({
			title : "모임무피를 만들까요?",
			icon : "info",
			closeOnClickOutside : false
		}).then(function() {
			self.location = "/moim/addMoimView?userId=${dbUser.userId}";
		})
	}

	function fncGetMoim(mmNo) {
		//swal("모임상세보기");
		self.location = "/moim/getMoim?mmNo=" + mmNo
	};

	function fncGetMyMoim() {
		self.location = "/moim/myListMoim?userId=${dbUser.userId}"
	};

	function fncAddMoim() {
		//swal("모임을 생성합니다.");
		$("#addMoim").attr("method", "POST").attr("action", "/moim/addMoim")
				.submit();
	}

	$('.content').on("dragover", dragOver).on("dragleave", dragOver).on("drop",
			uploadFiles);

	function dragOver(e) {
		e.stopPropagation();
		e.preventDefault();
		if (e.type == "dragover") {
			$(e.target).css({
				"background-color" : "black",
				"outline-offset" : "-20px"
			});
		} else {
			$(e.target).css({
				"background-color" : "gray",
				"outline-offset" : "-10px"
			});
		}
	}

	function uploadFiles(e) {
		e.stopPropagation();
		e.preventDefault();
		dragOver(e);

		e.dataTransfer = e.originalEvent.dataTransfer;
		var files = e.target.files || e.dataTransfer.files;
		if (files.length > 1) {
			//alert('하나만 올려라.');
			return;
		}
		if (files[0].type.match(/image.*/)) {
			$(e.target).css(
					{
						"background-image" : "url("
								+ window.URL.createObjectURL(files[0]) + ")",
						"outline" : "none",
						"background-size" : "100% 100%"
					});
		} else {
			alert('이미지가 아닙니다.');
			return;
		}
	}
</script>

<script>
	$(document).ready(function() {
		$(".owl-carousel").owlCarousel({
			items : 3,
			margin : 10,
			center : true,
			loop : true,
			nav : false,
			autoplay : true,
			autoplayTimeout : 1600,
			autoplayHoverPause : true,
			autoHeight : false,
			autoWidth : false

		});

	});
	
	function number_check(){
	    if(event.keyCode < 48 || event.keyCode > 57){
	        event.returnValue=false;
	    }
	}
	
</script>

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

<style>
.word {
	color: #fff;
	text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #0fa,
		0 0 82px #0fa, 0 0 92px #0fa, 0 0 102px #0fa, 0 0 151px #0fa;
}

.userProfile {
	margin: 10px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.picture {
	/*     width: auto;  */
	height: 200px;
	max-width: 200px;
	max-height: 200px;
}

.thumbnail-wrapper {
	width: 200px;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.thumbnail {
	position: relative;
	padding-top: 200px;
	overflow: hidden;
}

.thumbnail-centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	transform: translate(-50%, -50%);
}

thumbnail-img {
	/*   max-width: 100%; */
	/*   height: 박스의 height와 같아야 한다. */
	transform: translate(-50%, -50%);
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
		<header id="carouselExampleSlidesOnly"
			class="carousel slide carousel-fade" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="6000">
					<img src="/images/background/moim4.png" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h4 class="word">Dale Carnegie</h4>
						<p class="word">The royal road to a man's heart is to talk to
							him about the things he treasures most.</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="6000">
					<img src="/images/background/moim3.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h4 class="word">Tennesse Williams</h4>
						<p class="word">Life is partly what we make it, and partly
							what it is made by the friends we choose.</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="6000">
					<img src="/images/background/moim5.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h4 class="word">Albert Camus</h4>
						<p class="word">Don't walk in front of me, I may not follow.
							Don't walk behine me, I may not lead. Walk beside me and just be
							my friend</p>
					</div>
				</div>
			</div>
		</header>

		<!-- 정렬 -->
		<div class="container d-flex">
			<input type="hidden" class="interest" name="interestNo" value="0">
			<input type="hidden" class="addr" name="addr" value=""> <input
				type="hidden" class="order" name="type" value=""> <input
				type="hidden" class="searchCondition" name="searchCondition"
				value="">
			<div class="me-auto p-2 bd-highlight h4">모임</div>
			<div class="bd-highlight">
				<div class="dropdown mt-3">

					<button class="btn btn-light dropdown-toggle selectbtn shadow-sm"
						type="button" data-bs-toggle="dropdown" id="addrbtn"
						style="margin-right: 20px;">Addr</button>
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

							<!-- 내 가입 목록 -->
							<c:if test="${!empty dbUser}">
								<div class="listhead">내 무피 목록</div>
								<div class="row" style="margin-bottom: 20px;">
									<div class="owl-carousel">
										<c:forEach items="${list2}" var="moim">
											<div class="thumbnail-wrapper rounded-3 shadow">
												<div class="thumbnail rounded-3">
													<div class="thumbnail-centered ">
														<img onClick="fncGetMoim(${moim.mmNo})"
															src="/images/uploadFiles/${moim.mmFile}"
															class="thumbnail-img">
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<div class="listhead">모임 리스트</div>

							<div class="row" id="moimListView"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- btn collector -->
	<div id="btnbar">
		<c:if test="${!empty dbUser}">
			<button data-bs-toggle="modal" data-bs-target="#myModal">
				<i class="bi bi-plus"></i>
			</button>
		</c:if>
		<button onclick="location.href='#carouselExampleSlidesOnly'">
			<i class="bi bi-chevron-up"></i>
		</button>
	</div>

	<!-- Modal 시작-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">모임 무피 만들기!</h4>
				</div>
				<div class="modal-body">
					<!-- 폼시작 -->

					<!-- form Start /////////////////////////////////////-->
					<form id="addMoim" class="form-horizontal" name="detailForm"
						enctype="multipart/form-data">
						<input type="hidden" id="userId" name="userId"
							value="${dbUser.userId}">
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임무피명</label>
							<div class="col-sm-20">
								<input type="text" class="form-control" id="mmName"
									name="mmName" placeholder="모임명 최대 20글자" maxlength="20">
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">대표썸네일</label>
							<div class="col-sm-40">
								<input type="file" class="form-control" id="uploadFile"
									name="uploadFile" placeholder="대표썸네일">
							</div>
						</div>

						<br>

						<%-- 							<center> --%>
						<!-- 								<p>drag and drop your image!</p> -->
						<!-- 								<div class="content"></div> -->
						<%-- 							</center> --%>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">간단소개글</label>
							<div class="col-sm-40">
								<textarea style="resize: none" class="form-control"
									id="mmContent" name="mmContent" placeholder="50자이내" maxlength="50"></textarea>
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
							<div class="col-sm-40">
								<select class="form-control" id="mmAddr" name="mmAddr">
									<option>종로구</option>
									<option>중구</option>
									<option>용산구</option>
									<option>성동구</option>
									<option>광진구</option>
									<option>동대문구</option>
									<option>중랑구</option>
									<option>성북구</option>
									<option>강북구</option>
									<option>도봉구</option>
									<option>노원구</option>
									<option>은평구</option>
									<option>서대문구</option>
									<option>마포구</option>
									<option>양천구</option>
									<option>강서구</option>
									<option>구로구</option>
									<option>금천구</option>
									<option>영등포구</option>
									<option>동작구</option>
									<option>관악구</option>
									<option>서초구</option>
									<option>강남구</option>
									<option>송파구</option>
									<option>강동구</option>
								</select>
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인원</label>
							<div class="col-sm-40">
								<input type="text" class="form-control" id="mmMaxCount"
									name="mmMaxCount" placeholder="가입가능정원" onkeypress="number_check()" maxlength="2">
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
							<div class="col-sm-40">
								<select class="form-control" id="mmInterest" name="mmInterest">
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

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최소연령</label>
							<div class="col-sm-40">
								<input type="text" class="form-control" id="mmMinAge"
									name="mmMinAge" placeholder="최소연령" onkeypress="number_check()" maxlength="2">
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최대연령</label>
							<div class="col-sm-40">
								<input type="text" class="form-control" id="mmMaxAge"
									name="mmMaxAge" placeholder="최대연령" onkeypress="number_check()" maxlength="2">
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상태</label>
							<div class="col-sm-40">
								<div class="radio">
									<label> <input type="radio" name="mmState"
										id="mmState1" value="1" checked> 공개
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="mmState"
										id="mmState2" value="2"> 비공개
									</label>
								</div>
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">유형</label>
							<div class="col-sm-4">
								<div class="radio">
									<label> <input type="radio" name="mmType" id="mmType1"
										value="1" checked> 일반 모임무피
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="mmType" id="mmType"
										value="2"> 자유 모임무피
									</label>
								</div>
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
					<button type="button" class="btn btn-primary"
						onClick="fncAddMoim()">Create</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달끝 -->


	<jsp:include page="../layout/footer.jsp" />


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>

	<script>
							var currentPage = 1;

							// 지역구
							let addrs = [ "종로구", "중구", "용산", "성동구", "광진구",
									"동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구",
									"은평구", "마포구", "양천구", "강서구", "구로구", "금천구",
									"영등포구", "동작구", "관악구", "서초구", "강남구", "송파구",
									"강동구" ];

							for (var i = 0; i < addrs.length; i++) {

								let display = '<li><a class="dropdown-item" href="#">'
										+ addrs[i] + '</a></li>';
								$('.addr').append(display);
							}

							$('.addr > li > a').on('click', function() {

								$('#addrbtn').text($(this).text());
								$('#addr').val($(this).text().trim());
								$('#moimListView').children().remove();

								location.href = "#carouselExampleSlidesOnly";
								currentPage = 1;
								getMoimList();
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

							/* 스크롤  */
							$(document).scroll(
									function() {
										var maxHeight = $(document).height();
										var currentScroll = $(window)
												.scrollTop()
												+ $(window).height();

										if (maxHeight <= currentScroll + 100) {

											getMoimList()

										}//if문 종료
									})

							function getMoimList() {

								let addr = $('#addr').val();
								let interest = $('#interest').val();
								let searchCondition = $('#searchCondition')
										.val();

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
											url : "/moim/json/listMoim",
											method : "POST",
											dataType : "json",
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
											data : JSON
													.stringify({
														"currentPage" : currentPage,
														"searchCondition" : searchCondition,
														"addr" : addr,
														"interestNo" : interest
													}),
											success : function(JSONData, status) {
												var index = JSONData.list.length;

												console.log(currentPage);
												var displayValue = '';
												for (var i = 0; i < index; i++) {

													displayValue = '<div data-aos="" class="col-xs-4 col-sm-4 col-md-4 no-padding item" id="getFlash" onClick="fncGetMoim( '
															+ JSONData.list[i].mmNo
															+ ')" >'
															+ '<div class="border-wrap op_itemline10 img-thumbnail shadow" >'
															+ '<div class="thumb-wrap">'
															+ '<div class="tpl-forum-list-thumb">'
															+ '<div class="thumbnail-wrapper ">'
															+ '<div class="thumbnail">'
															+ '<div class="thumbnail-centered ">'
															+ '<img src="/images/uploadFiles/'+JSONData.list[i].mmFile+'" class="thumbnail-img">'
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
															+ JSONData.list[i].mmName
															+ '</span>'
															+ '</div>'
															+ '<div'
								+'class="tpl-forum-list-name tpl-forum-list-etc config-font-etc"'
								+'data-selector=".tpl-forum-list-etc" data-font="true"'
								+'data-title="others">'
															+ '<div><span class="rounded-3 shadow-sm p-1 h7">'
															+ JSONData.list[i].mmAddr
															+ '</span><span class="rounded-3 shadow-sm p-1 h7">'
															+ JSONData.list[i].mmInterest
															+ '</span>'
															+ '<div class="inline-block rounded-3 shadow-sm p-1 h7"><i class="bi bi-people-fill"></i>'
															+ JSONData.list[i].mmCurrentCount
															+ ' / '
															+ JSONData.list[i].mmMaxCount
															+ '</div>'
															+ '</div>'
															+ '<ul class="d-flex item-ul" style="list-style: none;">'
															+ '<li class="tpl-forum-list-category tpl-forum-list-etc config-font-etc">'
															//+ list[i].flashTime
															+ '</li>'
															+ '<li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc">'
															//+ list[i].flashAddr
															+ '</li>'
															+ '<li class="tpl-forum-list-hit tpl-forum-list-etc config-font-etc">'
															//+ list[i].flashCurrentCount
															+ '</li>'
															+ '<li class="tpl-forum-list-comment tpl-forum-list-etc config-font-etc">'
															//+ list[i].flashMaxCount
															+ '</li>'
															+ '</ul>'
															+ '<div class="tpl-forum-list-cont"'
								+'data-selector=".tpl-forum-list-cont" data-font="true"'
								+'data-title="content font"></div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'

													$("#moimListView").append(
															displayValue);
												}

												currentPage++;
											}//success 종료
										})//ajax종료
							}
							// 시작함수 init
							getMoimList();

							AOS.init();
						</script>
</body>
</html>
