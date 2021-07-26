<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>

<!-- Favicon --> 
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />

<!-- Bootstrap icons -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- <link rel="stylesheet" href="/images/uploadFiles" >   -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/javascript/owl.carousel.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> 
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
function fncAddMoim(){
	alert("모임을 생성하겠씁니다.");
	$("#addMoim").attr("method", "POST").attr("action", "/moim/addMoim").submit();

}

$('.content')
.on("dragover", dragOver)
.on("dragleave", dragOver)
.on("drop", uploadFiles);

function dragOver(e){
e.stopPropagation();
e.preventDefault();
if (e.type == "dragover") {
  $(e.target).css({
    "background-color": "black",
    "outline-offset": "-20px"
  });
} else {
    $(e.target).css({
    "background-color": "gray",
    "outline-offset": "-10px"
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
      alert('하나만 올려라.');
      return;
  }
  if (files[0].type.match(/image.*/)) {
              $(e.target).css({
          "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
          "outline": "none",
          "background-size": "100% 100%"
      });
  }else{
    alert('이미지가 아닙니다.');
    return;
  }
}
</script>


<style>
.content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
    background-color: gray;
}

.content{
	margin-bottom: 20px;
}

</style>


</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<div class="container">
	
		<h1 class="bg-primary text-center">모임무피생성</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form id = "addMoim" class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="userId" name="userId" value="${dbUser.userId}">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임무피명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmName" name="mmName" placeholder="모임명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">대표썸네일</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="대표썸네일">
		    </div>
		  </div>
		  
		  <center>
		  <p>drag and drop your image!</p>
			<div class="content">
			</div>
		  </center>		
		    
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">간단소개글</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmContent" name="mmContent" placeholder="50자이내">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="mmAddr" name="mmAddr">
				  <option>종로구</option><option>중구</option><option>용산구</option><option>성동구</option>
				  <option>광진구</option><option>동대문구</option><option>중랑구</option><option>성북구</option>
				  <option>강북구</option><option>도봉구</option><option>노원구</option><option>은평구</option><option>서대문구</option>
				  <option>마포구</option><option>양천구</option><option>강서구</option><option>구로구</option>
				  <option>금천구</option><option>영등포구</option><option>동작구</option><option>관악구</option>
				  <option>서초구</option><option>강남구</option><option>송파구</option><option>강동구</option>				  
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmMaxCount" name="mmMaxCount" placeholder="가입가능정원">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
		    <div class="col-sm-4">
		    	<select class="form-control" id="mmInterest" name="mmInterest">
				  <option>아웃도어/여행/사진/영상</option><option>운동/스포츠</option><option>인문학/책/글</option>
				  <option>업종/직무</option><option>외국/언어</option><option>문화/공연/축제/음악/악기</option>
				  <option>공예/만들기</option><option>댄스/무용</option><option>사교/인맥</option>
				  <option>차/오토바이</option><option>게임/오락</option><option>맛집/카</option>	  
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최소연령</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmMinAge" name="mmMinAge" placeholder="최소연령">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최대연령</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmMaxAge" name="mmMaxAge" placeholder="최대연령">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상태</label>
		  <div class="col-sm-4">
		  <div class="radio">
			  <label>
			    <input type="radio" name="mmState" id="mmState1" value="1" checked>
			    공개
			  </label>
			</div>
			<div class="radio">
			  <label>
			    <input type="radio" name="mmState" id="mmState2" value="2">
			    비공개
			  </label>
			</div>
			</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">유형</label>
		  <div class="col-sm-4">
		  <div class="radio">
			  <label>
			    <input type="radio" name="mmType" id="mmType1" value="1" checked>
			    일반 모임무피
			  </label>
			</div>
			<div class="radio">
			  <label>
			    <input type="radio" name="mmType" id="mmType" value="2">
			    자유 모임무피
			  </label>
			</div>
			</div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" onClick="fncAddMoim()" >등록</button>
			   <a class="btn btn-default btn" role="button"  onclick="history.back()">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>
<jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>