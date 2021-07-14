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

<script>
function fncAddBoardView(){
	alert("게시글등록");
	self.location ="/board/MoopiBoard/addBoard";
}


</script>
  

</head>
<body> <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
     
   
<h3> 게시글 등록</h3>
    <hidden></hidden>
     <input type="hidden" id="boardCategory" name="boardCategory" value="1"/>
     <input type="hidden" id="boardWriter" name="boardWriter" value="user01"/>
    <p>게시글제목 </p> <input id="boardName" name="boardName"></input>
    
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
<textarea id="summernote"><p>글을 입력해주세요.</p></textarea>
<button type="button" class="btn btn-default" onClick="fncAddBoard()">등록하기</button>
</body>
</html>

