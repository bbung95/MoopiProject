<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon --> 
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />

<!-- Bootstrap icons -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
	<!--<link rel="stylesheet" href="/images/uploadFiles" >  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
  	
<!--   	써머노트 -->
  	<script src="/javascript/summernote-lite.js"></script>
	<script src="/javascript/lang/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/css/summernote-lite.css">
  	
  	
<!-- 게시판 -->  	
<script>


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddBoard();
	});
});	



function fncAddBoard(){
	swal("게시글등록");
	
	var boardCategory	=$("input[name='boardCategory']").val();
	var boardWriter		=$("input[name='boardWriter']").val();
	var boardName		=$("input[name='boardName']").val();	
	var boardContent	=$("input[name='boardContent']").val();
	
	$("form.form-horizontal").attr("method" , "POST").attr("action" , "/moim/addBoard").submit();
	
}


</script>
  <style>
body {
	padding-top: 100px;

	background-color:#f7f6f3;
}

main{
font-family: 'Nanum Gothic', sans-serif;
font-size: 16px;
}
</style>

</head>
<body> 
     <jsp:include page="../layout/toolbar.jsp" />
    <main>
    <script>  
     $(document).ready(function() {
    	 $('#summernote').summernote({
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
	});
			  });
     
     function uploadSummernoteImageFile(file, editor) {
         data = new FormData();
         data.append("file", file);
         $.ajax({
             data : data,
             type : "POST",
             url : "/board/uploadImage",
             contentType : false,
             processData : false,
             success : function(data) {
                 //항상 업로드된 파일의 url이 있어야 한다.
                 $(editor).summernote('insertImage', data.url);
             }
         });
     }
     
     $("div.note-editable").on('drop',function(e){
         for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
         	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
         }
        e.preventDefault();
   })
     
     
     
     
     
 			      </script> 
 
 <div class="container">

		<div class="col-xs-12 col-sm-12 col-md-12">
			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>Write</strong></span></h3>
		  
		   </div>
		   
	 <!--  뉴폼 -->
	 <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="boardWriter.userId" name="boardWriter.userId" value="${dbUser.userId }">
		  <input type="hidden" id="boardCategory" name="boardCategory" value="4">
		  <input type="hidden" id="boardMoimNo" name="boardMoimNo" value="${boardMoimNo }">
		  
		  <div class="form-group">
		    <div  style="padding-bottom: 30px;">
		      <input type="text" class="form-control" id="boardName"  name="boardName"  style="width:90%;" placeholder="제목을 입력해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div style="width:90%;">
		    <textarea  id="summernote" name ="boardContent"></textarea>
		    </div>
		  </div>
		  
		 
		  <div class="form-group">
		    <div class="col-sm-offset-5  col-sm-4 text-center" style="float:right;">
		      <button type="button" class="btn btn-primary" >등록</button>
			   <a class="btn btn-default btn" href="javascript:history.back();" role="button">취소</a>
		    </div>
		  </div>
		</form>
	</div> 
<jsp:include page="../layout/moimSidebar.jsp"></jsp:include>				

</main>
<jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>
	 <!-- 뉴폼 -->
		
		
		<!-- form Start /////////////////////////////////////-->
<!-- 		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data"> -->
<%-- 		  <input type="hidden" id="boardWriter.userId" name="boardWriter.userId" value="${dbUser.userId }"> --%>
<!-- 		  <input type="hidden" id="boardCategory" name="boardCategory" value="4"> -->
<%-- 		  <input type="hidden" id="boardMoimNo" name="boardMoimNo" value="${boardMoimNo }"> --%>
		  
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="ssn" class="col-sm-offset col-sm-2 control-label">Title</label> -->
<!-- 		    <div class="col-sm-6"> -->
<!-- 		      <input type="text" class="form-control" id="boardName" name="boardName" placeholder="title..."> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
		  
<!-- 		  <div class="form-group"> -->
<!-- 		  	<div class="table op_tableline10" data-loop="true" data-view="7"> -->
<!-- 		    <label for="ssn" class="col-sm-offset col-sm-2 control-label">Content</label> -->
<!-- 		    <div class="col-sm-6"> -->
<!-- 		    <textarea id="summernote" name ="boardContent">Content...</textarea> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
<!-- 		  </div> -->
		  
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="ssn" class="col-sm-offset col-sm-2 control-label">비밀번호</label> -->
<!-- 		    <div class="col-sm-2"> -->
<!-- 		      <input type="text" class="form-control" id="boardPassword" name="boardPassword"> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
		 
<!-- 		  <div class="form-group"> -->
<!-- 		    <div class="col-sm-offset-5  col-sm-4 text-center"> -->
<!-- 		      <button type="button" class="btn btn-primary" >등록</button> -->
<!-- 			   <a class="btn btn-default btn" href="javascript:history.back();" role="button">취소</a> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
		  
		 
		  
		  
<!-- 		</form> -->

<%-- <jsp:include page="../layout/searchbar.jsp"></jsp:include> --%>
<!-- </body> -->
<!-- </html> -->