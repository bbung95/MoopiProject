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
		fncAddBoard();
	});
});	



function fncAddBoard(){
	alert("게시글등록");
	
	var boardCategory	=$("input[name='boardCategory']").val();
	var boardWriter		=$("input[name='boardWriter']").val();
	var boardName		=$("input[name='boardName']").val();	
	var boardContent	=$("input[name='boardContent']").val();
	
	$("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
	
}


</script>
  <style>
body{
	padding-top: 50px;
}
</style>

</head>
<body> 
     <jsp:include page="../../layout/toolbar.jsp" />
<!-- <h3> 게시글 등록</h3> -->
<!--     <hidden></hidden> -->
<!--      <input type="hidden" id="boardCategory" name="boardCategory" value="1"/> -->
<!--      <input type="hidden" id="boardWriter" name="boardWriter" value="user01"/> -->
<!--     <p>게시글제목 </p> <input id="boardName" name="boardName"></input> -->
    
    <script>  
     $(document).ready(function() {
			      $('#summernote').summernote({
			        placeholder: '내용을 입력해주세요.',
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
 
 <div class="container">

		<h1 class="bg-primary text-center">무피 QnA 작성</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="boardWriter.userId" name="boardWriter.userId" value="user4">
		  <input type="hidden" id="boardCategory" name="boardCategory" value="2">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="boardName" name="boardName" placeholder="게시글제목">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글내용</label>
		    <div class="col-sm-4">
		    <textarea id="summernote" name ="boardContent"><p>글을 입력해주세요.</p></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >등록</button>
			   <a class="btn btn-default btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="boardPassword" name="boardPassword">
		    </div>
		  </div>
		  
		  
		</form>
<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
</body>
</html>