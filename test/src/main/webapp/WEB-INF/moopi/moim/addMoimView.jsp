<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script>
function fncAddMoim(){
	alert("모임을 생성하겠씁니다.");
	$("#addMoim").attr("method", "POST").attr("action", "/moim/addMoim").submit();

}
</script>





</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>모임생성페이지입니다...</h3>

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
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">간단소개글</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmContent" name="mmContent" placeholder="50자이내">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmAddr" name="mmAddr" placeholder="지역구">
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
		      <input type="text" class="form-control" id="mmInterest" name="mmInterest" placeholder="아웃도어/여행/축구등등">
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