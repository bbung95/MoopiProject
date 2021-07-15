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
	<!--<link rel="stylesheet" href="/images/uploadFiles" >  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	
<script>
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncUpdateBoard();
	});
});	



function fncUpdateBoard(){
	alert("게시글수정");
	
	var boardNo			=$("input[name='boardNo']").val();
	var boardName		=$("input[name='boardName']").val();
	var boardContent	=$("input[name='boardContent']").val();
	
	$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
	
}


</script>
  
<style>
body{
	padding-top: 50px;
}
</style>
    
    <script>  
     $(document).ready(function() {
			      $('#summernote').summernote({
			        placeholder: '${board.boardContent}',
			        tabsize: 2,
			        height: 300,
			        focus : true,
			        toolbar: [
			          ['fontname', ['fontname']],
			          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			          ['font', ['bold', 'underline', 'clear']],
			          ['fontsize', ['fontsize']],
			          ['color', ['forecolor','color']],
			          ['para', ['ul', 'ol', 'paragraph']],
			          ['height', ['height']],
			          ['table', ['table']],
			          ['insert', ['picture', 'video']],
			          ['view', ['fullscreen']]
			        ],
			        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			      });
			  });
       </script> 

 

</head>
<body>
	<jsp:include page="../../layout/toolbar.jsp" />

	<form class="form-horizontal">
	

 
 
 <div class="container">
	
		<h1 class="bg-primary text-center">QnA 게시글 수정</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		
		  <input type="hidden" id="boardNo" name="boardNo" value=${board.boardNo}>
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="boardName" name="boardName" placeholder="${board.boardName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글내용</label>
		    <div class="col-sm-4">
		    <textarea id="summernote" name ="boardContent">${board.boardContent}</textarea>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >수정</button>
			   <a class="btn btn-default btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		  
		  
		</form>
		</div>
</body>



</html>

