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
		<script src="/javascript/summernote-lite.js"></script>
		<script src="/javascript/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="/css/summernote-lite.css">
		 	
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
				alert($("textarea.form-control").val()) 
				
				fncAddReply();
			});
		});	

		function fncAddReply(){
			
			alert($(this).parent().html())
			
			var replyContent=$("textarea.form-control").val()
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
	html  { background-color: #ffffff; background-image:none;}	
	body, body > .dsgn-body { background-color: transparent;
	background-image: none;position: absolute; top: 0; left: 0;  right: 0; bottom: 0; width: auto; height: auto; padding: 0px; overflow: auto; }													
	.forum-user-info li.user-ctrl .dropdown-menu,							
	.forum-user-info li.user-ctrl .dropdown-menu li a {background-color: #ffffff; background-image:none;}							
	.forum-user-info li.user-ctrl .dropdown-menu,.forum-user-info li.user-ctrl .dropdown-menu li + li {border-color:black}							
	.forum-user-info li.user-ctrl .dropdown-menu li a {color:black}							
	.forum-user-info li.user-ctrl .dropdown-menu li a:focus,							
	.forum-user-info li.user-ctrl .dropdown-menu li a:hover,							
	.forum-view .tpl-forum-list-footer button.btn.btn-round:focus,							
	.forum-view .tpl-forum-list-footer button.btn.btn-round:hover,							
	.page-comments .comm-footer .btn.btn-submit:hover {background-color:rgba(0,0,0,0.07);color:black !important;}							
	.forum-write .tpl-forum-list-footer button,.forum-view .fr-view .fr-file {border-color:rgba(0,0,0,0.4)}							
	.forum-write .tpl-forum-list-footer button,.forum-user-info li.user-info,					
	.forum-view .fr-view .fr-file {color:rgba(0,0,0,0.8)}							
	.forum-write .tpl-forum-title, .forum-write .tpl-forum-content {color : black}							
	#forum-ctrl path {fill : rgba(0,0,0,0.6)}							
	.page-comments .tpl-comment-form textarea::-webkit-input-placeholder {color:rgba(0,0,0,0.6) !important;}							
	.page-comments .tpl-comment-form textarea:-ms-input-placeholder {color:rgba(0,0,0,0.6) !important;}							
	.page-comments .tpl-comment-form textarea:-mos-input-placeholder {color:rgba(0,0,0,0.6) !important;}									
	</style>
	</head>
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
	<div class="col-xs-12 col-sm-12 col-md-12">
			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>QnA게시판조회</strong></span></h3>
		   </div>
	<div >
	<input class="board" type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
	
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
	
		<c:if test="user.userId == '#replyWriter' ">
	<button type="button" class="btn btn-primary" id="updateBoard">수정하기</button>
	<button type="button" class="btn btn-primary" id="deleteBoard">삭제하기</button>
	</c:if>
	<button type="button" class="btn btn-primary" id="addBoardReport">게시글신고</button>
<!-- 	</a> -->

	<p></p>
	</div>
	</div>
	<c:forEach var="reply" items="${list}">
		--------------------------------------------
		<div >
		<input type="hidden" class="reply" id="replyNo" name="replyNo" value="${reply.replyNo}">
		<p id="replyContent">${reply.replyWriter.nickname} ${reply.replyWriter.profileImage } : ${reply.replyContent}    작성시간 ${reply.replyRegDate}</p>
	<%-- 	<c:if test="user.userId == '#replyWriter' "> --%>
		<button type="button" class="btn btn-primary" id="updateReply">답변수정</button>
		<button type="button" class="btn btn-primary" id="deleteReply">답변삭제</button>
	<%-- 	</c:if> --%>
		
		<button type="button" class="btn btn-primary" id="addReportReply">답글신고</button>
		
		</c:forEach>
	
	 
	
	<div class="page-comments" data-id="545295" style="text-align: center; font-size: 20px; background-image: none; background-position: center center; background-repeat: no-repeat; min-height: 50px; margin-top: -21px;">
		<div class="container">
			<form id = "addReplyForm">
				<div class="tpl-comment-form" style="border-color: rgba(0, 0, 0, 0.2);">				
					<div class="comm-wrap">					
						<div class="comm-body">						
						<span class="comm-profile">							
							<svg viewBox="0 0 40 40" width="35" height="35">								
							<!-- 	코멘트 프로필사진부분 -->
								<pattern id="comment-write-image" patternUnits="userSpaceOnUse" width="40" height="40">									
								<image xlink:href="//storage.googleapis.com/i.addblock.net/member/profile_default.jpg?_1627201858221" width="40" height="40"></image>								
								</pattern>
								<circle cx="20" cy="20" r="20" fill="url(#comment-write-image)">프로필이미지</circle>
							</svg>
							<span>${dbUser.nickname } ddd</span>		
						</span>						
							<div class="comm-area">							
								<textarea class="form-control" id="summernote" placeholder="댓글을 입력해주세요." name="replyContent" id="replyContent" style="color: rgba(0, 0, 0, 0.8);">test</textarea>						
							</div>					
						</div>					
							<div class="comm-footer">			 			
								<div class="checkbox">			 				
									<label style="color: rgba(0, 0, 0, 0.8);">			 					
										<span class="cl-icon">
										</svg>
									</label>
								</div>						
								<div class="btn-box comment-submit">
									<input type="hidden" id = "replyWriter" value="${dbUser.userId}"> 
		  							<input type="hidden" id = "boardNo" value="${board.boardNo }"> 
									<span class="btn btn-submit btn-round" style="border-color: rgba(0, 0, 0, 0.4); color: rgba(0, 0, 0, 0.8);" id="addReply"> 등록</span>
								</div>
							</div>
					</div>			
				</div>
			</form>	
				<ul class="comment-list"></ul>
		</div>
	</div>
	
	
	
	
	
	<p></p>
	
		 
	
	</form>
	
	
	
	<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
	</body>
	
	</html>
	
