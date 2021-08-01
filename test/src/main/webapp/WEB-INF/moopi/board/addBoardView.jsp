<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

	<jsp:include page="../common/commonCDN.jsp"/>
  	
<!--   	써머노트 -->
  	<script src="/javascript/summernote-lite.js"></script>
	<script src="/javascript/lang/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/css/summernote-lite.css">
  	
  	
  	
<script>


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddBoard();
	});
});	



function fncAddBoard(){
// 	alert("게시글등록");
	
// 	var boardCategory	=$("input[name='boardCategory']").val();
// 	var boardWriter		=$("input[name='boardWriter']").val();
// 	var boardName		=$("input[name='boardName']").val();	
// 	var boardContent	=$("input[name='boardContent']").val();
	
	$("form.form-horizontal3").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
	
}


</script>
  <style>
body{
	padding-top: 100px;
	margin: auto;
	
}

		@media ( min-width : 768px) {
		.container {
			width: 750px;
		}
	}
	
	@media ( min-width : 992px) {
		.container {
			width: 1000px;
		}
	}
	
	/*사실 이 블럭은 없어도 된다*/
	@media ( min-width : 1200px) {
		.container {
			width: 1000px;
		}
	}					
	
</style>

</head>
<body> 
     <jsp:include page="../layout/toolbar.jsp" />
    
    <script>  
     $(document).ready(function() {
    	 $('#summernote').summernote({
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '내용을 입력해주세요.',	//placeholder 설정
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

		<div class="col-xs-12 col-sm-12 col-md-12" style="padding-bottom: 50px;">
			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>
			    ${boardCategory eq 'Moopi' ? '공지글 작성' : 'QnA 작성'}
			    </strong></span></h3>
		  
		   </div>
		   
	 
		
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal3" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="boardWriter.userId" name="boardWriter.userId" value="${dbUser.userId }">
		  <input type="hidden" id="boardCategory" name="boardCategory" value="${boardCategory eq 'Moopi' ? '1' : '2' }">
		  
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
		  
		  <c:if test="${boardCategory eq 'QnA' }">
		  <div class="form-group" style="padding-top:30px;">
		    <label for="ssn" class="col-sm-offset col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="boardPassword" name="boardPassword">
		    </div>
		  </div>
		 </c:if>
		  <div class="form-group">
		    <div class="col-sm-offset-5  col-sm-4 text-center" style="float:right;">
		      <button type="button" class="btn btn-primary" >등록</button>
			   <a class="btn btn-default btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		  
		 
		  
		  
		</form>
		
		<jsp:include page="../layout/footer.jsp"></jsp:include>
		
</body>
</html>