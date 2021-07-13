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
function fncUpdateFlash(){
	alert("번개를 번개처럼 수정.");
	$("form").attr("method", "POST").attr("action", "/flash/updateFlash").submit();

}
</script>





</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>번개 수정!</h3>

<div class="container">
	
		<h1 class="bg-primary text-center">번개무피 수정</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="userId" name="userId" value="${userId}">
		  <input type="hidden" id="flashNo" name="flashNo" value="${flash.flashNo}">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개무피명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashName" name="flashName" value="${flash.flashName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개썸네일</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" value="${flash.flashFile}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개소개</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashContent" name="flashContent" value="${flash.flashContent}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashAddr" name="flashAddr" value="${flash.flashAddr}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개모임인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashMaxCount" name="flashMaxCount" value="${flash.flashMaxCount}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개만남시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashTime" name="flashTime" value="${flash.flashTime}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="flashInterest" name="flashInterest" value="${flash.flashInterest}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" onClick="fncUpdateFlash()" >수정</button>
			   <a class="btn btn-default btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>

</body>
</html>