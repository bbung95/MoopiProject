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
			
			$("form.form-horizontal").attr("method" , "GET").attr("action" , "/board/updateView").submit();
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
			
			$("form.form-horizontal").attr("method" , "GET").attr("action" , "/board/deleteBoard").submit();
			
		}
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addReply" ).on("click" , function() {
				alert("addReply");
				
				
				fncAddReply();
			});
		});	

		function fncAddReply(){
			
			
			var replyContent=$("#replyContent").val();
			var replyWriter = $("#replyWriter").val();
			var boardNo = $("#boardNo").val();
			
			alert(boardNo);
			alert(replyWriter);
			alert(replyContent);
			
			$.ajax({
				url: "/reply/json/addReply",
				type: "POST",
				dataType: "json",
				contentType : "application/json",
				data :  JSON.stringify ({ "boardNo": boardNo, "replyWriter": {"userId" :replyWriter}, "replyContent":replyContent}),		
				success: function(data, state){
					alert(state)
				
					var displayValue = "<h4>"
						+"작성자 : " +JSONData.replyWriter.nickname+"<br/>"
						+"프로필 : "+JSONData.replyWriter.profileImage+"<br/>"
						+"답글내용 : "+JSONData.replyContent+"<br/>"
						+"작성일 : "+JSONData.replyRegDate+"<br/>"
						+"</h4>"
					
						$("#replyAddContent").val(displayValue);
						
						
				}
		

		});
		
		}
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#updateReply" ).on("click" , function() {
// 				alert("test")
				fncGeteReply();
			});
		});	
		
		function fncGeteReply(){
			alert("게시글수정");
			alert($("#replyNo" ).val() );
			var replyNo = $("#replyNo" ).val();
			$.ajax({
				url: "/reply/json/getReply/"+replyNo,
				type: "GET",
				dataType: "json",
				contentType : "application/json",
				data :  JSON,
			    success : function(JSONData , status) {
		               //alert(JSONData.memberRole);	
		                alert(status);
			            alert("JSONData : \n"+JSONData.replyContent);
		                var replyContent = JSONData.replyContent;
		                var displayValue = "<h6>"
		    			+"<form class='form-horizontal' name='detailForm'>"
		    			+"<input type='hidden' id='replyNo' value=''>"
		    			+"답글 내용 :" +"<input type='text' id='replyContent' value=''>"+"<br>"
		    			+"<p></p>"
		    			+"<a onClick='fncUpdateReply()'>수정하기</a>"+ "<br>"
		    			+"</form>"
		    			+"</h6>";
		    			
						$("#replyContent").remove();
		    			$("#replyUpdateContent").html(displayValue);
		    			$('#replyNo').val(replyNo);
		    			$('#replyContent').val(replyContent);
		                }
			
			            }
         
			)};
			
			
		
		
		
		
		function fncUpdateReply(){
			alert("리플업데이트");
			alert($("#replyContent").val());
			
			var replyNo = $("#replyNo").val();
			var replyContent = $("#replyContent").val();
			
			$.ajax({
				url: "/reply/json/updateReply",
				type: "POST",
				dataType: "json",
				contentType : "application/json",
				data : JSON.stringify ({ "replyNo": replyNo , "replyContent":replyContent}),
			    success : function(JSONData , status) {
			    	
		                alert(status);
			            alert("JSONData : \n"+JSONData.replyContent);
			            console.log(JSONData);
		                var replyContent = JSONData.replyContent;
		                var replyWriterNickname = JSONData.replyWriter.nickname;
		                var replyWriterProfileImage = JSONData.replyWriter.profileImage;
		                alert(replyWriterNickname);
		                
		            	var displayValue = "<h4>"
							+"작성자 : " +JSONData.replyWriter.nickname+"<br/>"
							+"프로필 : "+JSONData.replyWriter.profileImage+"<br/>"
							+"답글내용 : "+JSONData.replyContent+"<br/>"
							+"작성일 : "+JSONData.replyRegDate+"<br/>"
							+"</h4>"
							
						$("#replyContent1").remove();
		    			$("#replyUpdateContent").html(displayValue);
		                }
		            
			});
				
		};
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#deleteReply" ).on("click" , function() {
				
				alert("test")
				fncDelteReply();
			});
		});	
		
		function fncDelteReply(){
			alert("리플삭제");
			alert($("#replyContent").val());
			
			var replyNo = $("#replyNo").val();
			var replyContent = $("#replyContent").val();
			
			$.ajax({
				url: "/reply/json/deleteReply/"+replyNo,
				type: "GET",
				dataType: "json",
				contentType : "application/json",
				data : JSON,
			    success : function(JSONData , status) {
			    	
		                alert(status);
		                
						$("#replyContent").remove();
		                }
		             
			});
				
		};
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "button.btn.btn-primary:contains('게시글신고')"  ).on("click" , function() {
				
				
				fncAddBoardReport();
				
			});
		});	
		
		
		function fncAddBoardReport(){
			alert("AddBoardReport 실행");
			
			
			var reportTarget = $("#boardNo").val();
			
			
			self.location ="/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget;
			
		}
			
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "button.btn.btn-primary:contains('답글신고')"  ).on("click" , function() {
				
				
				fncAddReplyReport();
				
			});
		});	
		
		
		function fncAddReplyReport(){
			alert("AddReplyReport 실행");
			
			
			var reportTarget = $("#replyNo").val();
			
			
			self.location ="/report/addReportView?reportCategory=2&reportTargetRe.replyNo="+reportTarget;
			
		}				
				
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
	<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
	<h3>무피 QnA게시판조회</h3>
	<div >
	<input class="board" type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
	
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
<!-- 	<a href="http://127.0.0.1:8080/report/addReportView?reportCategory=1&reportTarget="+$(board.boardNo) target="_blank" width=300, height=400, left=300, top=50> -->
	<button type="button" class="btn btn-primary" id="addBoardReport">게시글신고</button>
<!-- 	</a> -->
	<p></p>
	</div>
	</div>
	<c:if test="${ empty list}">
	<form id = "addReplyForm">
		<td width="550">
			<div>
				<textarea rows="4" cols="70" name="replyContent"   id="replyContent"></textarea>			
			</div>
		</td>
		   <input type="hidden" id = "replyWriter" value="${dbUser.userId}"> 
		   <input type="hidden" id = "boardNo" value="${board.boardNo }"> 
		   <button type="button" class="btn btn-primary" id="addReply">답글작성</button>
	</form>
	
	</c:if>
	 
	<div id="replyAddContent" value=''></div>
	
	
	<p></p>
	<c:forEach var="reply" items="${list}">
	--------------------------------------------
	<div >
	<input type="hidden" class="reply" id="replyNo" name="replyNo" value="${reply.replyNo}">
	<p id="replyContent">${reply.replyWriter.nickname} ${reply.replyWriter.profileImage } : ${reply.replyContent}    작성시간 ${reply.replyRegDate}</p>
	<button type="button" class="btn btn-primary" id="updateReply">답변수정</button>
	<button type="button" class="btn btn-primary" id="deleteReply">답변삭제</button>
	<button type="button" class="btn btn-primary" id="addReportReply">답글신고</button>
	<div id="replyUpdateContent"></div>
	</div>
	</c:forEach>
		 
	
	</form>
	<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
	</body>
	
	</html>
	
