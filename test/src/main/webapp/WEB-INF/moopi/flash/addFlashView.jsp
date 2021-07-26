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
function fncAddFlash(){
	alert("번개 생성한다.");
	$(".form-horizontal").attr("method", "POST").attr("action", "/flash/addFlash").submit();
	//console.log($('#userId').val());

}

</script>





</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>번개번개!</h3>

<div class="container">
	
		<h1 class="bg-primary text-center">번개무피 생성</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="userId" name="userId" value="${userId}">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개무피명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashName" name="flashName" placeholder="번개명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개썸네일</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="대표썸네일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개소개</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashContent" name="flashContent" placeholder="50자이내">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashAddr" name="flashAddr" placeholder="지역구">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개모임인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashMaxCount" name="flashMaxCount" placeholder="최대참가인원">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개만남시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashTime" name="flashTime" placeholder="만남시간">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashInterest" name="flashInterest" placeholder="아웃도어/여행/축구등등">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" onClick="fncAddFlash()" >등록</button>
			   <a class="btn btn-default btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>
<jsp:include page="../layout/searchbar.jsp"></jsp:include>

</body>
</html>