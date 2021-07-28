<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

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

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>

<script>
function fncUpdateFlashView(flashNo){
	alert("모임수정");
	self.location ="/flash/updateFlashView?flashNo="+flashNo
}

function fncJoinFlash(flashNo){
	
	alert("번개참여");
	alert("번개참여완료!");
	self.location ="/flash/joinFlash?userId=${dbUser.userId}&flashNo="+flashNo
}


function fncGetJoinFlashList(flashNo){
	
	$.ajax(
			{
				url : "/flash/json/getJoinFlashList/"+flashNo ,
				method : "GET" ,
				type : "JSON" ,
				success : function(JSONData , status) {
					//Debug...
					alert("로딩중..");
					alert(JSONData.list.length);
					//$( ".cal" ).remove(displayValue);	
					//let displayValue = '';
					//Debug...
						//console.log(JSONData.list[i].meflId.userId);
						$( ".cal" ).children().remove();	
						let displayValue = '';
						for(var i=0;i < JSONData.list.length;i++){
						displayValue += "<div>"

										+'<div class="d-flex align-items-center mt-lg-5 mb-4">'
										+'<div class="ms-3">'
										+'<div class="fw-bold">'+JSONData.list[i].meflId.userId+'</div>'
										+'<div class="text-muted">번개무피 참가자</div>'
										+'</div>'
										+'</div>'
										+'</div>';
							
						
						} //for문끝
						$( ".cal" ).append(displayValue);	
							
						
				
				}	
		
	  });
	
	
};


</script>

<style>
</style>



</head>
<body>

	<jsp:include page="../layout/toolbar.jsp" />

	<main class="flex-shrink-0">
		<!-- Navigation-->

		<!-- Page Content-->
		<section class="py-5">
			<div class="container px-5 my-5">
				<div class="row gx-5">
					<div class="col-lg-3">
						<div class="d-flex align-items-center mt-lg-5 mb-4">
							<img class="img-fluid rounded-circle"
								src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							<div class="ms-3">
								<div class="fw-bold">${flash.flashConstructor.userId}</div>
								<div class="text-muted">번개무피 방장</div>
							</div>
						</div>
						<div class="cal" style="padding-top: 1px"></div>
						
						<button type="button" class="btn btn-default"
							onClick="fncGetJoinFlashList(${flash.flashNo})">번개참여목록보기</button>
					</div>
					<div class="col-lg-9">
						<!-- Post content-->
						<article>
							<!-- Post header-->
							<header class="mb-4">
								<!-- Post title-->
								<h1 class="fw-bolder mb-1">${flash.flashName}</h1>
								<!-- Post meta content-->
								<div class="text-muted fst-italic mb-2">게시일:${flash.flashRegdate}</div>
								<!-- Post categories-->
								<a class="badge bg-secondary text-decoration-none link-light"
									href="#!">${flash.flashInterest}</a> <a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">${flash.flashState}</a> <a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">참가인원:${flash.flashCurrentCount}</a> <a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">모집인원:${flash.flashMaxCount}</a>
							</header>
							<!-- Preview image figure-->
							<figure class="mb-4">
								<img src="/images/uploadFiles/${flash.flashFile}" width="800"
									height="400 " />
							</figure>
							<!-- Post content-->
							<section class="mb-5">

								<h2 class="fw-bolder mb-4 mt-5">번개무피 소개</h2>
								<p class="fs-5 mb-4">${flash.flashContent}</p>

							</section>
						</article>
						<!-- Comments section-->


						<section>
							<div class="card bg-light">
								<div class="card-body">
									<!-- Comment form-->
									<form class="mb-1 mt-lg-1">
										<div class="fw-bold">-번개장소-</div>
										<p>${flash.flashAddr}</p>
									</form>
								</div>
							</div>
						</section>


						<button type="button" class="btn btn-default"
							onClick="fncUpdateFlashView(${flash.flashNo})">번개정보수정</button>
						<!-- 						<button type="button" class="btn btn-default" -->
						<%-- 							onClick="fncGetJoinFlashList(${flash.flashNo})">번개참여신청목록보기</button> --%>
						<button type="button" class="btn btn-default"
							onClick="fncJoinFlash(${flash.flashNo})">번개참여하기</button>
						<jsp:include page="../layout/searchbar.jsp"></jsp:include>


					</div>
				</div>
			</div>
		</section>
	</main>




</body>
</html>