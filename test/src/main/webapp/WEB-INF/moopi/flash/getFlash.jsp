<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
function fncUpdateFlash(){
	alert("번개를 번개처럼 수정.");
	$("form").attr("method", "POST").attr("action", "/flash/updateFlash").submit();

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
					//alert("로딩중..");
					alert(JSONData.list.length+"명 참가중 입니다.");
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
										+'<div class="fw-bold">'+JSONData.list[i].meflId.nickname+'</div>'
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
								src="/images/uploadFiles/${flash.flashConstructor.profileImage}" width="50" height="50 "  />
							<div class="ms-3">
<%-- 								<div class="fw-bold">${flash.flashConstructor.userId}</div> --%>
								<div class="fw-bold">${flash.flashConstructor.nickname}</div>
								<div class="text-muted">번개무피 방장</div>
							</div>
						</div>
						<div class="cal" style="padding-top: 1px"></div>
						
						<button type="button" class="btn btn-outline-primary"
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
									href="#!">${flash.flashInterest}</a>
									<c:if test="${flash.flashState == 1 }"> <a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">모집중</a>
									</c:if>
									<c:if test="${flash.flashCurrentCount != flash.flashMaxCount}">
									<c:if test="${flash.flashState == 2 }"> <a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">모집완료</a>
									</c:if>
									</c:if>
									<a
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

						<a
									class="badge bg-secondary text-decoration-none link-light"
									href="#!">번개만남시간:${flash.flashTime}</a>
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
						
						
						
						<c:if test="${dbUser.userId == flash.flashConstructor.userId}">
						<button type="button" class="btn btn-light" data-bs-toggle="modal"  data-bs-target="#staticBackdrop">번개수정</button>
						</c:if>
						
						<c:if test="${flash.flashCurrentCount != flash.flashMaxCount}">
						<c:if test="${dbUser.userId != flash.flashConstructor.userId}">
						<c:if test="${dbUser.userId != null}">
						<button type="button" class="btn btn-outline-primary" 
							onClick="fncJoinFlash(${flash.flashNo})">번개참여하기</button>
						</c:if>
						</c:if>
						</c:if>
						<jsp:include page="../layout/searchbar.jsp"></jsp:include>


					</div>
				</div>
			</div>
		</section>
	</main>

<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel">번개무피 수정하기</h2>
					<button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">
        <!-- 폼시작 -->
        
        <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="userId" name="userId" value="${flash.flashConstructor.userId}">
		  <input type="hidden" id="flashNo" name="flashNo" value="${flash.flashNo}">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개무피명</label>
		    <div class="col-sm-20">
		      <input type="text" class="form-control" id="flashName" name="flashName" placeholder="번개명" value="${flash.flashName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개썸네일</label>
		    <div class="col-sm-40">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="대표썸네일" value="${flash.flashFile}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-3 col-sm-3 control-label">번개소개</label>
		    <div class="col-sm-40">
		      <textarea  style="resize:none" class="form-control" id="flashContent" name="flashContent" placeholder="500자이내" value="${flash.flashContent}"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개장소</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="flashAddr" name="flashAddr" placeholder="지역구" value="${flash.flashAddr}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개모임인원</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="flashMaxCount" name="flashMaxCount" placeholder="최대참가인원" value="${flash.flashMaxCount}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개만남시간</label>
		    <div class="col-sm-20">
		      <input type="datetime-local" class="form-control" id="flashTime" name="flashTime" placeholder="만남시간" value="${flash.flashTime}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
		    <div class="col-sm-20">
		      <select class="form-control" id="flashInterest" name="flashInterest" value="${flash.flashInterest}">
		      	 <option value="1">아웃도어/여행/사진/영상</option><option value="2">운동/스포츠</option><option value="3">인문학/책/글</option>
				  <option value="4">업종/직무</option><option value="5">외국/언어</option><option value="6">문화/공연/축제/음악/악기</option>
				  <option value="7">공예/만들기</option><option value="8">댄스/무용</option><option value="9">사교/인맥</option>
				  <option value="10">차/오토바이</option><option value="11">게임/오락</option><option value="12">맛집/카</option>
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
        <button type="button" class="btn btn-default" data-bs-dismiss="modal" aria-label="Close">취소</button>
        <button type="button" class="btn btn-primary" onClick="fncUpdateFlash()">수정</button>
      </div>
    </div>
  </div>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>


</body>
</html>