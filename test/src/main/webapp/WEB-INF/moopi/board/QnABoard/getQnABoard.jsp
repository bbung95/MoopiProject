	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Insert title here</title>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<!--<link rel="stylesheet" href="/images/uploadFiles" >  -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link
			href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap"
			rel="stylesheet">
		
		<!-- Bootstrap Dropdown Hover JS -->
		<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
		<!-- Favicon-->
		<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
		<!-- Bootstrap icons-->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
			rel="stylesheet" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="/css/styles.css" rel="stylesheet" />
		
		<script src="/javascript/summernote-lite.js"></script>
		<script src="/javascript/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="/css/summernote-lite.css">
		 	
	
	  
	<style>
	html  { background-color: #ffffff; background-image:none;}	
	body {
	padding-top: 100px;
	margin: auto;
	font-family: 'Gaegu', cursive;
}
	.hrLine { position: relative; padding: 0px 0; }
	.hrLine hr{ border: 0; border-top:3px solid #3073ac; height:1px;width: 100%; margin-top: 10px;    margin-bottom: 10px; }			
	.replyHr hr{ border: 0; border-top:1px solid #3073ac; height:1px;width: 100%; margin-top: 10px;    margin-bottom: 10px; }
						
	</style>
	</head>
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
<!-- 	<div class="col-xs-12 col-sm-12 col-md-12"> -->
<!-- 			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>QnA게시판조회</strong></span></h3> -->
<!-- 		   </div> -->
	<article>
		
	 	
		<div class="container hrLine"> 
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2"></div>
				<div class="col-xs-8 col-sm-8 col-md-8">
				<section clsss="board-head">
					<h2 class="head_title" data-edit="true" data-selector="h3.head_title" style="margin:0px"><span class="fsize20" ><strong>QnA게시판조회</strong></span></h2>
						                <hr class="half-rule userEL9009200" data-selector="hr" data-border="true" data-title="line color">
				<div style="display:inline-block; font-size:20px; margin:0px"> ${board.boardName}</div>
				<div style="display:inline-block; float:right;">${board.boardRegDate}
				</div>
				<input class="board" type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
				<div style="text-align:right;">
					<pattern id="comment-write-image" patternUnits="userSpaceOnUse" width="40" height="40">									
						<image xlink:href="//storage.googleapis.com/i.addblock.net/member/profile_default.jpg?_1627201858221" width="40" height="40"></image>								
					</pattern>${board.boardWriter.nickname} </div>
				</section>
				<hr>
				<section class="board-content">
					<div style="min-height:200px">
					${board.boardContent}
					</div>
					<p style="text-align:right;">작성시간 : ${board.boardRegDate}</p>
					<hr>
				</section>
				
<!-- 				리플리스트 시작 -->
				<section class="reply-content">
				
					<div class="container replyHr">
						<c:forEach var="reply" items="${list}">
						<div class="col-xs-1 col-sm-1 col-md-1">
<%-- 							<c:if test="user.userId == '#reple.replyWriter.userId' "> --%>
						</div>
						
						<input type="hidden" class="reply" id="replyNo" name="replyNo" value="${reply.replyNo}">
						<div class="col-xs-7 col-sm-7 col-md-7">
							<div style="display: inline-block">
								${reply.replyWriter.nickname}
							</div>
							<div style="display: inline-block; float:right;">
							    작성시간 : ${reply.replyRegDate}
							</div>
							<div style="min-height:70px">
							${reply.replyContent}
							</div>
							<button type="button" class="btn btn-primary" id="updateBoard">수정</button>
								<button type="button" class="btn btn-primary" id="deleteBoard">삭제</button>
<%-- 							</c:if> --%>
								<button type="button" class="btn btn-primary" id="addReportReply">신고</button>
							<hr>
						</div>
						
						<div class="row">
						
						</c:forEach>
 <!-- 					리플리스트 끝.	 -->
 				</section>
 				<section class="replyWrite">
								<form id = "addReplyForm">
										<div class="col-xs-2 col-sm-2 cols-md-2" style="text-align:right;">
												${dbUser.nickname }
										</div>
										<div class="col-xs-6 col-sm-6 cols-md-6">
											<textarea id="summernote" placeholder="댓글을 입력해주세요." name="replyContent" id="replyContent" ></textarea>						
										</div>					
											<input type="hidden" id = "replyWriter" value="${dbUser.userId}"> 
				  							<input type="hidden" id = "boardNo" value="${board.boardNo }"> 
										<div class="btn btn-submit btn-round" style=" float:right; border-color: rgba(0, 0, 0, 0.4); color: rgba(0, 0, 0, 0.8);" id="addReply"> 
											등록
										</div>
								</form>	
				</section>
				</div>	
				<div class="col-xs-2 col-sm-2 col-md-2"></div>
				
			</div>
		</div>
		</section>
	
	<p></p>
	
		 
	
	</form>	
	
	
	
	<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
	</body>
	<script type="text/javascript">
	 $(document).ready(function() {
    	 $('#summernote').summernote({
				height: 150,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				  toolbar: [
					    // [groupName, [list of button]]
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold',  'underline']],
					    ['color', ['forecolor']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['insert',['picture']],
					  ],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
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
				alert($("#summernote").val()) 
				
				fncAddReply();
			});
		});	

		function fncAddReply(){
			
			alert($(this).parent().html())
			
			var replyContent=$("#summernote").val()
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
	</html>
	
