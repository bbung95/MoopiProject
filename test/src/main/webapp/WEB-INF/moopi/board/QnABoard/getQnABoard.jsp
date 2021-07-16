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
	     $(document).ready(function() {
				      $('#summernote').summernote({
				        placeholder: '내용을 입력해주세요.',
				        tabsize: 2,
				        height: 200,
				        focus : true,
				        toolbar: [
				          ['fontname', ['fontname']],
				          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				          ['fontsize', ['fontsize']],
				          ['color', ['forecolor','color']],
				          ['para', ['paragraph']],
				          ['insert', ['picture', 'video']],
				        ],
				        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
				      });
				  });
	 			      </script> 
	<script type="text/javascript">
	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#updateBoard" ).on("click" , function() {
				fncUpdateView();
			});
		});	
		
		function fncUpdateView(){
			alert("게시글수정");
			alert(${board.boardNo});
			var boardNo = ${board.boardNo};
		// 	var boardCategory	=$("input[name='boardCategory']").val();
		// 	var boardWriter		=$("input[name='boardWriter']").val();
		// 	var boardName		=$("input[name='boardName']").val();
		// 	var boardContent	=$("input[name='boardContent']").val();
			
			$("form").attr("method" , "GET").attr("action" , "/board/updateView").submit();
		}
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#deleteBoard" ).on("click" , function() {
				fncDeleteBoard();
			});
		});	
		
		function fncDeleteBoard(){
			alert("게시글삭제");
			alert(${board.boardNo});
			var boardNo = ${board.boardNo};
			
			$("form").attr("method" , "GET").attr("action" , "/board/deleteBoard").submit();
			
		}
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addReply" ).on("click" , function() {
				fncAddReply();
			});
		});	
		
		
		
		$( "button.addReply" ).on("click" , function() {
			alert("답글작성");
			alert($("input[name='replyContent']").val());
			
			var replyContent	=$("input[name='replyContent']").val();
			var boardNo 		=$("input[name='boardNo']").val();
			var replyWriter     = "user1";			
			
			
			$.ajax( 
					{
						url : "/reply/json/addReply" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

//								Debug...
//								alert(status);
//								Debug...
//								alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h4>"
														JSONData.replyWriter.nickname+JSONData.replyWriter.profileImage+" : "
														+JSONData.replyContent+JSONData.replyRegDate
														+"</h4>"
							//Debug...									
							//alert(displayValue);
// 							$( "#"+prodNo+"" ).html(displayValue);
						}
				});
				////////////////////////////////////////////////////////////////////////////////////////////
	};
			
			
		
		
		
// 		$( "td.prodNo" ).on("click" , function() {
			
// 			//Debug..
// //				alert( $( this ).html().trim() );
// //				alert( $(this).find('input').val());
// 			//prodNo 추출
// 			var prodNo = $(this).find('input').val();
// //				alert(prodNo);
// //				// tranCode null값에 따른 if문 
// //				if(prodNo !=null){
// //				self.location = "/product/getProduct?prodNo="+prodNo+"&"+"${url}";
			
			
	
			 
	
	
	</script>
	  
	<style>
	body{
		padding-top: 50px;
	}
	</style>
	</head>
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<form >
	<h3>무피 QnA게시판조회</h3>
	
	<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
	
	--------------------------------------------
	<p>게시글번호 :${board.boardNo}</p>
	<p>게시글이름 :${board.boardName}</p>
	<p>게시글내용 :${board.boardContent}</p>
	<c:if test="${empty board.boardUpdate }">
	<p>작 성 일 : ${board.boardRegDate}</p> 
	</c:if>
	<c:if test="${!empty board.boardUpdate }">
	<p>수 정 일 : ${board.boardUpdate}</p>
	</c:if>
	<p>작 성 자 : ${board.boardWriter.nickname} ${board.boardWriter.profileImage }</p>
	
	
	<button type="button" class="btn btn-primary" id="updateBoard">수정하기</button>
	<button type="button" class="btn btn-primary" id="deleteBoard">삭제하기</button>
	<button type="button" class="btn btn-primary" id="addReply">답글작성</button>
	<p></p>
	<c:if test="${ empty list}">
	
			<div class="col-sm-5">
		    	<input id="summernote" name ="replyContent"/>
		    </div>
	
	
	<div id="addReply">
	
	</div>
	</c:if>
	 
	
	<p></p>
	<c:forEach var="reply" items="${list}">
	--------------------------------------------
	<input type="hidden" id="replyNo" name="replyNo" value="${reply.replyNo}">
	<p>${reply.replyWriter.nickname} ${reply.replyWriter.profileImage } : ${reply.replyContent}    작성시간 ${reply.replyRegDate}</p>
	<button type="button" class="btn btn-primary" name="updateReply">답변수정</button>
	</c:forEach>
	
	
	</form>
	<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
	</body>
	</html>
	
