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

<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- jquery bpop -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/javascript/jquery.bpopup-0.1.1.min.js"></script>



</script>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="/css/swiper.min.css">


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
.userEL9007628 {
	position: relative;
	border: 1px solid black;
	margin: 0 auto;
	background-color:;
	background-image: none;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	color:;
	font-family: Montserrat, "Nanum Gothic";
	font-size: 13px;
}

.userEL9007628 .divider-box {
	position: relative;
	margin: 0 auto 0 0;
	width: 25%;
}

.userEL9007628 hr {
	border: 0;
	border-top: 3px solid #03d663;
	height: 1px;
}

.userEL9007628 h2.head_title {
	font-weight: normal;
	font-size: inherit;
	margin-top: 40px;
	margin-bottom: 30px;
}

.userEL9007628 p {
	margin-bottom: 0;
}

@media only screen and (min-width:992px) {
	.userEL9007628 .text-wrap {
		padding-left: 30px;
	}
	.userEL9007628 .img-wrap {
		padding-right: 30px;
	}
}

@media only screen and (max-width:991px) {
	.userEL9007628 h2.head_title {
		margin-top: 32px;
		margin-bottom: 24px;
	}
	.userEL9007628 .img-wrap {
		margin-top: 30px;
	}
}

@media only screen and (max-width:767px) {
	.userEL9007628 h2.head_title {
		margin-top: 20px;
		margin-bottom: 15px;
	}
	.userEL9007628 .img-wrap {
		margin-top: 20px;
	}
}
</style>
<style>
body {
	margin: 0 auto;
}

.boardProfile {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.replyProfile {
	border-radius: 50%;
	width: 30px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: -10px;
}

#replyContents {
	list-style-type: none;
	margin: 0 auto;
	padding: 0;
}

#replyContents>li {
	padding: 0.5rem 1rem;
}

.moimImg {
	width: 120px;
	height: 120px;
	padding: 5px;
	border-radius: 10px;
}

.interest {
	border-radius: 4px;
	border: 0.5px solid gray;
	border-radius: 4px;
	padding: 5px;
	background: #ededed;
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

/* bpopup */
#element_to_pop_up {
	display: none;
	height: auto;
	max-height: 482px;
}

/* Swiper sliber */
.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.board_i>i {
	font-size: 20px;
	margin-left: 10px;
	position: absolute;
	bottom: 0;
}

pre {
	white-space: normal;
	word-break: break-all;
	padding-left: 15px;
	padding-right: 15px;
	text-align: left;
	font-size: 15px;
	margin-top: 0.5rem;
	margin-bottom: 0.5rem;
}
</style>
<style>
.effect5 {
	position: relative;
	/* width: 400px; height: 300px; 
   background: #000;
  overflow: hidden;
  box-shadow: 1px 1px 3px rgba(0,0,0,0.4); */
}

.effect5 img {
	/*   filter: sepia(20%) saturate(60%);
 */
	
}

.effect5 figcaption {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	z-index: 1;
	text-align: center;
	line-height: 1.7em;
	color: #black;
	text-transform: uppercase;
	font-size: 20px;
	opacity: 0;
	transition: all 0.3s ease;
}

.effect5 figcaption h3 {
	font-size: 1.3em;
	letter-spacing: 2px;
	font-weight: 100;
}

.effect5 figcaption em {
	display: block;
	font-weight: bold;
	letter-spacing: 1px;
	font-weight: 700;
}

.effect5:before, .effect5:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.3);
	border-top: 70px solid rgba(0, 0, 0, 0.4);
	border-bottom: 70px solid rgba(0, 0, 0, 0.4);
	transition: all 0.3s ease;
	z-index: 1;
	opacity: 0;
}

.effect5:before {
	transform: scaley(2);
}

.effect5:after {
	transform: scaley(2);
}

.effect5:hover:before, .effect5:hover:after {
	opacity: 1;
	transform: scale(1);
}

.effect5:hover>img {
	opacity: 0.7;
}

.effect5:hover figcaption {
	opacity: 1;
	transition-delay: 0.1s;
}

figcaption>i {
	font-size: 40px;
}

.follow-content {
	max-height: 500px;
	min-height: 400px;
	overflow: auto;
	height: auto;
}

.follow-item {
	margin: 0px 20px 0px 20px;
}

.followlistbtn {
	background: #e4eff2;
}

.followAct {
	background: #ADD8E6;
}

.my-moim-img {
	width: 50px;
	height: 50px;
	border-radius: 30%;
	display: inline-block;
}

.mybtn {
	background: #ADD8E6;
}

.mybtn:hover {
	background: #e4eff2;
}

#dropBox {
	border: 0.5px solid black;
	overflow: auto;
	border-radius: 15px;
}

#boardContent {
	border: 0.5px solid black;
	border-radius: 15px;
	outline: 0;
}
</style>
</head>
<body>

	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->

	<div id="wrapper">
		<main class="py-5">
			<div class="container px-5 my-5 ">


				<div class="row " data-matrix-loop="true"
					style="padding-bottom: 20px;" data-matrix-column="1">

					<div class="col-xs-3 col-sm-3 col-md-3 item"></div>
					<div
						class="col-xs-3 col-sm-3 col-md-3 item d-flex justify-content-center">


						<div class="thumbnail-wrapper "
							style="border-radius: 50%; width: 150px; height: 150px; border: 3px solid #4299e1;">
							<div class="thumbnail" style="border-radius: 50%;">
								<div class="thumbnail-centered ">
									<img src="/images/uploadFiles/${user.profileImage}"
										class="thumbnail-img " data-attach="true"
										data-fixedsize="true" data-fixed-width="250">
								</div>
							</div>
						</div>


					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 item">
						<div class="text-box" style="margin-top: 20px;">
							<h5 class="head_title" data-edit="true"
								data-selector="h5.head_title">
								<span class="fsize13" style="font-size: 25px;"><strong>${user.nickname}</strong></span>
							</h5>
							<p class="desc" data-edit="true" data-selector="p">
								<span class="fsize14">"${user.profileContent}"</span>
							</p>
							<h6 class="sub_text" data-edit="true" data-selector="h6.sub_text">
								<span class="followList" type="2">팔로워 <span
									id="followCount">${followerCount}</span></span> &nbsp; <span
									class="followList" type="1">팔로잉 ${folloingCount}</span>
							</h6>
						</div>

						<div>
							<c:if test="${dbUser.userId == user.userId}">
								<button class="btn btn-light mybtn">프로필수정</button>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-light mybtn"
									data-bs-toggle="modal" data-bs-target="#register">게시글등록</button>
							</c:if>
							<c:if test="${dbUser.userId != user.userId}">
								<button class="btn mybtn" target="${user.userId}">팔로우</button>
								<button class=" btn mybtn" target="${user.userId}" type="1">채팅</button>
								<button type="button" class="btn addReportUser mybtn ">신고</button>
							</c:if>
						</div>

					</div>

					<!-- 모임리스트 -->
					<div class="col-xs-3 col-sm-3 col-md-3 item">
						<div style="font-weight: bold">모임</div>
						<div class="card border-0 bg-light "
							style="overflow: auto; height: 200px; border-radius: 20px;">
							<div class="card-body p-4 py-lg-3">
								<c:forEach var="moim" items="${moim}">
									<div style="margin: 5px; border-radius: 10px;"
										onclick="location='/moim/getMoim?mmNo=${moim.mmNo}'">

										<img class="my-moim-img "
											src="/images/uploadFiles/${moim.mmFile}" /> <span>${moim.mmName}</span>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

				</div>


				<hr style="margin-bottom: 25px;">

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
					<!-- 게시글 생성박스 -->
					<div id="boardView" class="row multi-columns-row"></div>
				</div>
			</div>
		</main>
	</div>



	<!-- get board view -->
	<div class="container" id="element_to_pop_up">
		<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8">
				<div class="swiper-container">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>

				</div>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 text-wrap"
				style="background: white;" id="element_content"></div>
		</div>
	</div>




	<!-- Modal -->
	<div class="modal fade" id="register" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">게시글등록</h5>
					<button type="button" id="close" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form id="upload">
						<div id="dropBox" style="width: 100%; height: 300px;"></div>
						<input type="hidden" name="userId" value="${dbUser.userId}" />
						<button type="button" class="uploadbtn btn btn-light">업로드</button>
						<input style="display: none" id="uploadFiles" type="file"
							multiple="multiple">
						<textarea id="boardContent" name="boardContent"
							style="width: 100%; height: 100px; resize: none"></textArea>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-light">등록</button>
					<!-- <button type="button" 
						class="btn btn-secondar		data-bs-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
	</div>


	<!-- Modal2 -->
	<div class="modal fade " id="followList" data-bs-keyboard="false"
		tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content follow-content">
				<div id="followType" class="d-flex justify-content-center ">
					<div class="btn button followlistbtn" type="2">팔로워</div>
					<div class="btn button followlistbtn" type="1">팔로잉</div>
				</div>
				<div class="followOut" style="padding-top: 50px;"></div>
			</div>
		</div>
	</div>

	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<!-- Swiper JS -->
	<script src="/javascript/swiper.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
	
	var dbUser = "<c:out value='${dbUser.userId}'/>";
	var userId = "<c:out value='${user.userId}'/>";
	
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: false,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 30,
        // display none시 슬라이드 적용 오류
        observeParents: true,
        observer: true,
    });
    
$('button:contains("채팅")').on('click', function(){

	let type = $(this).attr('type');
	let target = $(this).attr('target');
	
	if(dbUser == ''){
		
		alert("로그인 후 이용가능합니다.");
		return;
	}
		
		$.ajax({
				url: "/common/chat/joinRoom/"+dbUser+"/"+target+"/"+type,
				method: "GET",
				dataType: "JSON",
				success: function(data,state){
					
					let url;
					
						/*  url = "https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.userId+"&type="+data.type
						+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname
						+"&trgtProfile="+data.target.profileImage; */
						 
						 url = "http://localhost:82/chat?userId="+data.user.userId+"&trgt="+data.target.userId+"&type="+data.type
							+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname
							+"&trgtProfile="+data.target.profileImage;
					
				popWin = window.open(
					url,
						"popWin"+target,
					"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			
		}
	})
		
})

$('.mybtn:contains("팔로우")').on('click', function(){
	
	if(dbUser == ''){
		
		alert("로그인 후 이용가능합니다.");
		return;
	}
	
	let target = $(this).attr('target');
	$.ajax({
		url: "/user/json/follow/"+target,
		method: "GET",
		dataType: "JSON",
		success: function(data,state){
			
			let count = parseInt($('#followCount').text().trim());
			
			if(data){
				$('.mybtn:contains("팔로우")').css('background', '#e4eff2')
				$('#followCount').text(count+1);
			}else{
				$('.mybtn:contains("팔로우")').css('background', '#ADD8E6')
				$('#followCount').text(count-1);
			}
		}
	});
});
$('button:contains("프로필수정")').on('click', function(){
	
	location.href= "/user/updateProfile?userId="+dbUser;
});

// 팔로우 유무 체크
if(${followCheck}){
	$('.mybtn:contains("팔로우")').css('background', '#e4eff2')
}


//////// 게시글 등록
function upload(formData){
	// formData key &value 확인
	 /*  for (var key of formData.keys()) {
	  console.log(key);
	}
	for (var value of formData.values()) {
	  console.log(value);
	}   */
	$.ajax({
            url : "/user/json/addMyBoard"
                , method : "POST"
                , processData : false
                , contentType : false
                , data : formData
                , dataType: 'JSON'
                , success:function(data, state) {
                    	
                        let fileArry = data.boardFile.split("/");
    					
                        let displayValue = '<div class="col-xs-4 col-sm-4 col-md-4 no-padding item myitem" onclick="getMyBoard('+data.boardNo+')">'
										+'<div class="border-wrap op_itemline10">'
										+'<div class="thumb-wrap">'
										+'<div class="tpl-forum-list-thumb" >'
										 +'<div class="thumbnail-wrapper">'
										+'<div class="thumbnail effect5">'
										+ '<figcaption>'
	      								 + '<h3><em><i class="bi bi-heart likebtn"></i><span class="likeCount">'+data.boardLike+' </span>&nbsp'
	      								 +'<i class="bi bi-chat-left"></i><span> '+data.replyCount+'</span></em></h3>'
	    								 + '</figcaption>'
										+'<div class="thumbnail-centered ">'
										+'<img class="thumbnail-img img-responsive" src="/images/uploadFiles/'+fileArry[0]+'" \ >'
										+'</div>' 
										+'</div>'
										+'</div>'
										+'</div>'
										+'</div>'
										+'</div>'
										+'</div>'	
    					
                	setTimeout(function() {
                		$('#close').click();
                		$('#boardContent').val('');
                		$('#dropBox').children().remove();
                		fileList = [];
    					$('#boardView').prepend(displayValue);
                	}, 3000, displayValue)
                    
                }
				
      });
}

$('#uploadFiles').on('change', (e)=>{ 
	preView(e , 1);
});

// 이미지 업로드 미리보기
function preView(e , type){
	
	// 업로드방식
	if(type == 1){
		
		for (var image of e.target.files) { 
			fileList.push(image);
			var reader = new FileReader();
			reader.onload = function(e) {
				var img = '<img class="inline-block" src="'+event.target.result+'" style="width : 200px;">'		
 				$('#dropBox').append(img) ;
			}; 
			reader.readAsDataURL(image); 
		} 
	// 드래그앤 드롭
	}else if (type == 2 ){
  		for (var image of e.originalEvent.dataTransfer.files) { 
  			fileList.push(image);
  			var reader = new FileReader();
  			
  			reader.onload = function(e) {
  				var img = '<img class="inline-block" src="'+event.target.result+'" style="width : 200px;">'		
  	 			$('#dropBox').append(img) ;
  			}; 
  			reader.readAsDataURL(image); 
  		} 
	}
}


$('.uploadbtn').on('click', function(){
	$('#uploadFiles').click();
	
});

let fileList = [];

/////// drag & drop event
$('#dropBox').on("dragenter", function(e){
 	 e.preventDefault();
 	 e.stopPropagation();
	}).on("dragover", function(e){
 	 e.preventDefault();
 	 e.stopPropagation();
 	 $(this).css("background-color", "#FFD8D8");
	}).on("dragleave", function(e){
 	 e.preventDefault();
 	 e.stopPropagation();
	  $(this).css("background-color", "#FFF");
 }).on("drop", function(e){
	 e.preventDefault();
 	 $(this).css("background-color", "#FFF");
  	
 	 preView(e, 2);
  	
 });
///////


$('.modal-footer > button:contains("등록")').on('click',function(){
	let form = $('#upload');
	let formData = new FormData(form[0]);
	for(var i in fileList){
		formData.append("uploadFiles", fileList[i]);
	}	
	upload(formData);
})

////  무한 스크롤  
		var loading = false;

		let currentPage = 1;

		$(window).scroll(
				function() {
					if ($(document).height() - $(window).height() == $(window)
							.scrollTop() + 300) {

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
							let list = data.list;
							if(list.length > 0){
							for (var i = 0; i < data.list.length; i++) {
								
								let fileArry = list[i].boardFile.split("/");
								
								let displayValue = '<div class="col-xs-4 col-sm-4 col-md-4 no-padding item myitem board'+list[i].boardNo+'" onclick="getMyBoard('+list[i].boardNo+')">'
													+'<div class="border-wrap op_itemline10">'
													+'<div class="thumb-wrap">'
													+'<div class="tpl-forum-list-thumb" >'
													 +'<div class="thumbnail-wrapper">'
													+'<div class="thumbnail effect5">'
													+ '<figcaption>'
								      				 + '<h3><em><i class="bi bi-heart likebtn"></i><span>'+list[i].boardLike+' </span>&nbsp'
								      				 +'<i class="bi bi-chat-left"></i><span> '+list[i].replyCount+'</span></em></h3>'
								    				 + '</figcaption>'
													+'<div class="thumbnail-centered ">'
													+'<img class="thumbnail-img" src="/images/uploadFiles/'+fileArry[0]+'" class="img-responsive" >'
 													+'</div>'
 													+'</div>'
													+'</div>'
													+'</div>'
													+'</div>'
													+'</div>'
													+'</div>'
													
													/* let displayValue = '<div class="effect-wrap">'
											  			 + '<figure class="effect5">'
									    				 + '<img src="https://tistory4.daumcdn.net/tistory/2141493/skin/images/simg06.png" alt="">'
									    				 + '<figcaption>'
									      				 + '<h3>Mouse Hover<em>Effect</em></h3>'
									    				 + '</figcaption>'
									 				 	 + '</figure>'
														 + '</div>'	 */		
													
								$('#boardView').append(displayValue);
							}
							loading = false;
							currentPage++;
							}
						}
					});
		}
		myBoard();
		
		
		function getMyBoard(boardNo){
			
				$.ajax({
				url: "/user/json/getMyBoard/"+boardNo,
				method : "GET",
				dataType : "JSON",
				success: function(data, state){
					 let board = data.board;
					let reply = data.reply;
					let fileArry = board.boardFile.split("/");
					
					let displayslide = '';
					let display = ''; 
					 // 게시글 이미지 
					for(var i= 0; i < fileArry.length-1; i++){
						
						displayslide += '<div class="swiper-slide">'
									+'<div class="thumbnail-wrapper">'
									+'<div class="thumbnail">'
									+'<div class="thumbnail-centered ">'
									+'<img class="thumbnail-img" src="/images/uploadFiles/'+fileArry[i]+'" class="img-responsive" style="width: 100%; height: auto;">'
									+'</div>'
									+'</div>'
									+'</div>'
									+'</div>'
					}	 		
					
					// 게시글 상세내용
					 display += '<div class="d-flex align-items-center"><img class="boardProfile" src="/images/uploadFiles/'+board.boardWriter.profileImage+'" />'
							+ '<div style="margin: 5px 5px 5px 5px;">'+board.boardWriter.nickname+'</div>'
							+ '<div class="ms-auto" style="margin: 5px 5px 5px 5px;">'+board.boardRegDate+'</div>'
							+ '<div onclick="deleteBoard('+board.boardNo+');">삭제</div></div>'
							+ '<hr/>'
							+ '<pre data-edit="true" data-selector="p" >'
							+ '<span class="fsize13">'+board.boardContent+'</span>'
							+ '</pre>'
							+ '<ul id="replyContents" style="overflow: auto; max-height: 300px;">'

					// 리플	
					for(var i = 0; i < reply.length; i++){
						display += '<li>'
							+ '<div class="d-flex align-items-center" style="font-size: 13px" onclick="location.href=\'/user/getMyHome?userId='+reply[i].replyWriter.userId+'\'">'
							+ '<img class="replyProfile" src="/images/uploadFiles/'+reply[i].replyWriter.profileImage+'" />'
							+'<div style="margin: 5px 5px 5px 5px;">'+reply[i].replyWriter.nickname+'</div>'
							+'<div style="margin: 5px 5px 5px 5px;">'+reply[i].replyRegDate+'</div></div>'
							+ '<pre style="font-size : 13px; padding-left: 40px;">'+reply[i].replyContent+'</pre></li>';
					}
							
					// 리플 입력폼
					display	+= '</ul><hr/ style="margin: 0;">'
							+ '<div class="board_i"><div>'
					
					// like 온 오프
					if(data.likeCheck){
						display += '<i class="bi bi-heart-fill likebtn"></i><span class="likeCount">'+board.boardLike+'</span></div>'
					}else{
						display += '<i class="bi bi-heart likebtn"></i><span class="likeCount">'+board.boardLike+'</span></div>'
					}	
					
					display	+= '<div class="input-group mb-3">'
							+ '<input type="hidden" id="myBoardNo" value="'+board.boardNo+'"/>'
							+ '<input type="text" class="form-control" placeholder="Recipient reply" name="replyContent" id="replyContent">'
							+ '<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="addReply('+board.boardNo+')">전송</button>'
							+ '</div></div>'
									
					$('.swiper-wrapper').children().remove();
					$('.swiper-wrapper').append(displayslide);
					$('#element_content').children().remove();
					$('#element_content').append(display);
					
					$('.likebtn').on('click', function(){
						$.ajax({
							url : "/user/json/myBoardLike/"+boardNo,
							method : "GET",
							dataType : "JSON",
							success: function(data, state){
								
								let count = parseInt($('.likeCount').text().trim());
								$('.likeCount').children().remove();
								
								if(data){
									$('.bi-heart-fill').attr('class','bi bi-heart likebtn');
									$('.likeCount').text(count-1);
								}else{
									$('.bi-heart').attr('class','bi bi-heart-fill likebtn');
									$('.likeCount').text(count+1);
								}
							}
						})
					}) 
				}
			})
			
 			  $('#element_to_pop_up').bPopup({
 				fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
/*  				positionStyle: 'fixed',
 */	        });  
		}
		
		// 댓글등록
		function addReply(boardNo){
			
			let replyContent = $('#replyContent').val();
			
			// 유효성체크
			if(dbUser == ''){
				
				alert("로그인 후 이용가능합니다.");
				return;
			}
			
			$.ajax({
				url: "/reply/json/addReply",
				type: "POST",
				dataType: "json",
				contentType : "application/json",
				data :  JSON.stringify ({ "boardNo": boardNo, "replyWriter": {"userId" :dbUser}, "replyContent":replyContent , "type": 1}),		
				success: function(data, state){
					
					let display = '<li>'
								+ '<div style="align-items: center; font-size: 13px" onclick="location.href=\'/user/getMyHome?userId='+data.replyWriter.userId+'\'">'
								+ '<img class="replyProfile" src="/images/uploadFiles/'+data.replyWriter.profileImage+'" />'+data.replyWriter.nickname+' '+data.replyRegDate+'</div>'
								+ '<pre style="font-size : 13px; padding-left: 40px;">'+data.replyContent+'</pre></li>';
					
					$('#replyContents').append(display);
					$('#replyContent').val('');
				}

			});
		}
		
		// 댓글삭제
		function deleteReply(){
			$.ajax({
				url: "/reply/json/deleteReply/"+replyNo,
				type: "GET",
				dataType: "json",	
				contentType : "application/json",
				data : "text",
		  		success : function(data , status) {
		    	
	                alert(status);
	                
					$("#replyContent").remove();
	            }
			})     
		}
		
		// 게시글삭제
		function deleteBoard(boardNo){
			
			swal({
				  title: "게시글을 삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("게시글이 삭제되었습니다.", {
				      icon: "success",
				    });
				  } else {
				    swal("삭제를 취소합니다");
				    return;
				  }
				  
				  $.ajax({
						url: "/user/json/deleteMyBoard",
						type: "POST",
						dataType: "json",	
						contentType : "application/json",
						data : JSON.stringify({
									"boardNo" : boardNo
						}),
				  		success : function(data , status) {
				    	
			                $(".board"+boardNo).remove();
			                $('#element_to_pop_up').bPopup().close();
			            }
					})    
				});
		}
		
		// 팔로우 리스트 모달
		var followModal = new bootstrap.Modal(document.getElementById('followList'), {
			  keyboard: false
			})
		
		function getFollowList(order){
			
			$.ajax({
				url: "/user/json/getFollowList/"+userId+"/"+order,
				type: "GET",
				dataType: "JSON",
				success: function(data, state){
					
					$('.followOut').children().remove();
					let display = '';
					for(var i of data){
						if(order == 1){
						
						display = '<div class="d-flex border-bottom follow-item">'
								+ '<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='+i.targetId+'\'"><img src="/images/uploadFiles/'+i.profileImage
								+ '" style="width: 50px; height: 50px; border-radius: 50%; margin-right: 20px;" />'
								+ i.nickname
								+ '</div>'
								+ '<button type="button" class="btn btn-primary me-2 m-auto"'
								+ 'data-bs-dismiss="toast" aria-label="Close">팔로우</button>'
								+ '</div>'
						}else{
							
							display = '<div class="d-flex border-bottom follow-item">'
								+ '<div class="toast-body" onclick="location.href=\'/user/getMyHome?userId='+i.userId+'\'"><img src="/images/uploadFiles/'+i.profileImage
								+ '" style="width: 50px; height: 50px; border-radius: 50%; margin-right: 20px;" />'
								+ i.nickname 
								+ '</div>'
								+ '<button type="button" class="btn btn-primary me-2 m-auto"'
								+ 'data-bs-dismiss="toast" aria-label="Close">팔로우</button>'
								+ '</div>'
						}
						
						$('.followOut').append(display);
					}				
					
				}
			})
		}
		
		$('.followList').on('click', function(){
			
			let order = $(this).attr("type");
			
			$('.followAct').attr('class', 'btn button followlistbtn' );
			
			if(order == 1){
				$('.followlistbtn[type="1"]').attr('class','btn button followlistbtn followAct');
			}else if(order == 2){
				$('.followlistbtn[type="2"]').attr('class','btn button followlistbtn followAct');
			}
			
			getFollowList(order);
			followModal.show();
		})
		
		$('.followlistbtn').on('click', function(){
			
			$('.followAct').attr('class', 'btn button followlistbtn' );
			$(this).attr("class", "btn button followlistbtn followAct");
			
			let order = $(this).attr("type");
			getFollowList(order);
		})
		
		
	
   
	// 리포트
		
   $(  ".addReportUser" ).on("click" , function() {
      fncAddReportUser();
   });

   function fncAddReportUser(){
      var reportTarget = "${user.userId}";
      
      popWin = window.open(
            "/report/addReportView?reportCategory=3&reportTarget.userId="+reportTarget ,
            "popReport",
            "left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
   }

 


	</script>
</body>
</html>