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
	
// 	var boardNo			=$("input[name='boardNo']").val();
// 	var boardName		=$("input[name='boardName']").val();
// 	var boardContent	=$("input[name='boardContent']").val();
	
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

