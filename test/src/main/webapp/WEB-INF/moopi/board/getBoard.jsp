
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<jsp:include page="../common/commonCDN.jsp"></jsp:include>

<script src="/javascript/summernote-lite.js"></script>
<script src="/javascript/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote-lite.css">



<style>
html {
	background-color: #ffffff;
	background-image: none;
}

body {
	padding-top: 100px;
	margin: auto;
}

.hrLine {
	position: relative;
	padding: 0px 0;
}

.hrLine hr {
	border: 0;
	border-top: 3px solid #3073ac;
	height: 1px;
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.replyHr hr {
	border: 0;
	border-top: 1px solid #3073ac;
	height: 1px;
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.board_title {
	border-top: 2px solid #2f5285;
	background-color: #e1eeff;
	padding: 2px 8px;
	align-items: center;
}

.board_title {
	font-weight: bold;
}

.reply_head {
	font-weight: bold;
	background-color: #e8e8e8;
	border-radius: 4px;
	display: flex;
	justify-content: space-between;
	padding: 5px;
}

.board_content {
	font-weight: bold;
	font-size: 25px;
	min-height: 200px;
	padding: 10px;
}

.reply_content {
	font-weight: bold;
	font-size: 20px;
	padding: 15px;
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

.profileImg {
    border-radius: 50%;
    width :40px;
    height: 40px;
}
img, svg {
    vertical-align: middle;
}
</style>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<form class="form-horizontal3" name="detailForm"
		enctype="multipart/form-data">
		<!-- 	<div class="col-xs-12 col-sm-12 col-md-12"> -->
		<!-- 			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>QnA게시판조회</strong></span></h3> -->
		<!-- 		   </div> -->
		<article>



			<div class="container hrLine">




				<div class="row">
					<div class="col-xs-8 col-sm-12 col-md-12"
						style="padding-bottom: 50px;">
						<h2 class="head_title" data-edit="true"
							data-selector="h3.head_title" style="margin: 0px">
							<span class="fsize40"><strong>
							
							${boardCategory eq 'Moopi' ? '무피공지' : 'QnA 게시판조회'}
							</strong></span>
						</h2>
						<br>
						<br>

						<section clsss="board">
							<div style="font-size: 35px; margin: 0px">
								${board.boardName}</div>
							<div class="board_title">

								<div style="display: inline-block; float: right; text-align: right;">${board.boardRegDate}<br> 조회수 : ${board.boardHit}
								</div>

								<input class="board" type="hidden" id="boardNo" name="boardNo"
									value="${board.boardNo}">

								<div style="text-align: left;">
									
									<div class="tpl-forum-list-name tpl-forum-list-etc op_itemline10" style="display: flex !important; align-items: center !important;"> 
			                            <img src="/images/uploadFiles/${board.boardWriter.profileImage}" class="img-responsive profileImg">
			                            <div style="margin: 5px 5px 5px 5px;">${board.boardWriter.nickname}</div></div>
								</div>
								
							</div>
							<span class="board_content" >${board.boardContent}</span><span class="board_hit" style="float:right;padding-right:10px"></span>
							<div style="float: right;">
								<c:if test="${dbUser.userId eq board.boardWriter.userId}">
									<button type="button" class="btn btn-primary updateBoard">수정</button>
									<button type="button" class="btn btn-primary deleteBoard">삭제</button>
								</c:if>
								<c:if test="${dbUser.userId != board.boardWriter.userId and boardCategory eq 'QnA'}">
								<button type="button" class="btn btn-primary addReportBoard">신고</button>
								</c:if>
							</div>
							<br> <br>
						</section>

						<!-- 				리플리스트 시작 -->
						<section class="reply-content">
							<div class="container reply_list">
								<c:forEach var="reply" items="${list}">
									<div id="${reply.replyNo }">
										<input type="hidden" class="reply" name="replyNo"
											value="${reply.replyNo}">
										<div class="reply_head">
											<div style="display: inline-block">
											<div class="tpl-forum-list-name tpl-forum-list-etc op_itemline10" style="display: flex !important; align-items: center !important;"> 
			                            <img src="/images/uploadFiles/${reply.replyWriter.profileImage}" class="img-responsive profileImg">
			                            <div style="margin: 5px 5px 5px 5px;">${reply.replyWriter.nickname}</div></div>
			                            
												
												</div>
											<div style="display: inline-block; float: right;">작성시간
												: ${reply.replyRegDate}</div>
										</div>
										<div class="reply_content" style="min-height: 70px">
											${reply.replyContent}</div>
										<div style="float: right;">


											<c:if test="${dbUser.userId eq reply.replyWriter.userId}">
												<button type="button" class="btn btn-primary updateReply">수정</button>
												<button type="button" class="btn btn-primary deleteReply">삭제</button>
											</c:if>
											<c:if test="${dbUser.userId != reply.replyWriter.userId}">
											<button type="button" class="btn btn-primary addReportReply">신고</button>
											</c:if>
										</div>
										<br>
										<br>
									</div>

								</c:forEach>
								<div class="reply"></div>
							</div>
							<!-- 				<div class="row"> -->

							<!-- 					리플리스트 끝.	 -->
						</section>

						<c:if test="${dbUser.userRole eq '1' and boardCategory eq 'QnA' }">
						<section class="replyWrite">
							<form name="detailForm" enctype="multipart/form-data">
								<div id="addReplyForm"
									style="float: right; padding-right: 20px; padding-top: 20px;">
									<div class="col-md-5" style="font-size: 20px;">
									<img src="/images/uploadFiles/${dbUser.profileImage}" class="img-responsive profileImg">
										${dbUser.nickname }</div>
									<div style="padding-left: 100px; width: 900px">
										<textarea id="summernote" placeholder="댓글을 입력해주세요."
											name="replyContent" id="replyContent"></textarea>
									</div>
									<input type="hidden" id="replyWriter" value="${dbUser.userId}">
									<input type="hidden" id="boardNo" value="${board.boardNo }">
									<div class="reply_button" style="padding-top: 20px;">
										<div class="btn btn-submit btn-round"
											style="float: right; border-color: rgba(0, 0, 0, 0.4); color: rgba(0, 0, 0, 0.8);"
											id="addReply">등록</div>
									</div>
								</div>
							</form>
						</section>
						</c:if>
					</div>
				</div>
			</div>
		</article>
		<p></p>



	</form>


<div id="wrapper"><jsp:include page="../layout/footer.jsp"></jsp:include></div>


</body>
<script type="text/javascript">
	
	 $(document).ready(function() {
    	 $('#summernote').summernote({
				height: 150,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: ' ',	//placeholder 설정
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
   		</script>

<script type="text/javascript">
   
		
   		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".updateBoard" ).on("click" , function() {
				fncUpdateView();
			});
		});	
		
		
		function fncUpdateView(){
// 			alert("게시글수정");
// 			alert(${board.boardNo});
			var boardNo = ${board.boardNo};
			$("form.form-horizontal3").attr("method" , "GET").attr("action" , "/board/updateView").submit();
		}
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".deleteBoard" ).on("click" , function() {
				fncDeleteBoard();
			});
		
		function fncDeleteBoard(){
			var boardNo = ${board.boardNo};
			
			var result = confirm("게시글을 삭제하시겟습니까?");
			if(result){
				$("form.form-horizontal3").attr("method" , "GET").attr("action" , "/board/deleteBoard").submit();
			}
			
		}
		
		// 보드리폿
// 		<button type="button" class="btn btn-primary addReportBoard" >신고</button>
		
		$(  ".addReportBoard"  ).on("click" , function() {
				fncAddBoardReport();
			});
		
		function fncAddBoardReport(){
			var reportTarget = $("#boardNo").val();
			
// 			self.location ="/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget;
			popWin = window.open(
					"/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget ,
					"popReport",
					"left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
		
		// 리플리폿
		//	+'	<button type="button" class="btn btn-primary addReportReply">신고</button>'		
			
			$(  ".addReportReply"  ).on("click" , function() {
				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
				fncAddReplyReport(replyNo);
			});
			
			function fncAddReplyReport(replyNo){
// 				self.location ="/report/addReportView?reportCategory=2&reportTargetRe.replyNo="+replyNo;
				popWin = window.open(
						"/report/addReportView?reportCategory=2&reportTargetRe.replyNo="+replyNo ,
						"popReport",
						"left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
				
			}	
			
			
		</script>


<script type="text/javascript">
		
			$( "#addReply" ).on("click" , function() {
				
				fncAddReply();
			});

		function fncAddReply(){
			
			var replyContent=$("#summernote").val()
			var replyWriter = $("#replyWriter").val();
			var boardNo = $("#boardNo").val();
			
			$.ajax({
				url: "/reply/json/addReply",
				type: "POST",
				dataType: "json",
				contentType : "application/json",
				data :  JSON.stringify ({ "boardNo": boardNo, "replyWriter": {"userId" :replyWriter}, "replyContent":replyContent}),		
				success: function(data, state){
// 					alert(state)
					var displayValue =
					
					 ' 	<div id='+data.replyNo+'>'		
					+'  <input type="hidden" class="reply" name="replyNo" value='+data.replyNo+'>'
					+'	<div class="reply_head">'
					+'	<div style="display: inline-block">'
					+'  <img src="/images/uploadFiles/'+data.replyWriter.profileImage+'" class="img-responsive profileImg">'
					+	 data.replyWriter.nickname
					+'	</div>'
					+'	<div style="display: inline-block; float:right;">'
					+'    작성시간 : '+ data.replyRegDate
					+'	</div>'
					+'	</div>'
					+'	<div class="reply_content" style="min-height:70px">'
					+   data.replyContent
					+'	</div>'
					+'	<div style="float:right;">'
					+'	<button type="button" class="btn btn-primary updateReply">수정</button>'
					+'	<button type="button" class="btn btn-primary deleteReply">삭제</button>'
// 					+'	<button type="button" class="btn btn-primary addReportReply">신고</button>'
					+'	</div>'
					+'	</div>'
					+'	<br><br>'
					
						$(".reply_list").append(displayValue);
						$(".note-editable").empty();
					
						
	 		       			$( ".updateReply" ).on("click" , function() {
	 		       				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
	 		       				fncGetReply(replyNo);
	 		       			});
						
	 		       			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		       			$( ".deleteReply" ).on("click" , function() {
	 		       				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
	 		       				fncDelteReply(replyNo);
	 		       			});
	 		            	
	 		       			$(  ".addReportReply"  ).on("click" , function() {
	 		       				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
	 		       				fncAddReplyReport(replyNo);
	 		       			});
						}
				});
		
			}
		
			
			$( ".updateReply" ).on("click" , function() {
				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
				fncGetReply(replyNo);
			});
		
		function fncGetReply(replyNo){
			$.ajax({
				url: "/reply/json/getReply/"+replyNo,
				type: "GET",
				dataType: "json",
				contentType : "application/json",
				data :  JSON,
			    success : function(data , status) {
		                var displayValue = 
						'<div class="btn btn-submit btn-round" style=" float:right; border-color: rgba(0, 0, 0, 0.4); color: rgba(0, 0, 0, 0.8);" id="updateReply">' 
					+	'수정'
					+	'</div>'
					+	'<input type="hidden" name="replyNo" value="'+data.replyNo+'">'
		    			
						$("#"+replyNo).empty();
						$(".reply_button").empty();
						$(".reply_button").append(displayValue);
						$(".note-editable").append(data.replyContent);
						
						$(function(){
							$("#updateReply").on("click", function(){
								
								replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
								replyContent = $(this).parent().parent().find("textarea[name=replyContent]").val()
								fncUpdateReply(replyNo, replyContent)
							})
						})
						
						function fncUpdateReply(replyNo, replyContent){
// 							alert("리플업데이트");
// //				 			replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
// 							alert(replyNo)			
// 							alert(replyContent)			
							
							$.ajax({
								url: "/reply/json/updateReply",
								type: "POST",
								dataType: "json",
								contentType : "application/json",
								data : JSON.stringify ({ "replyNo": replyNo , "replyContent":replyContent}),
							    success : function(data , status) {
							    	
// 						                alert(status);
							            console.log(data);
							            
						            	var displayValue = 
						            		 ' 	<div class='+data.replyNo+'>'		
						 					+'  <input type="hidden" class="reply" name="replyNo" value='+data.replyNo+'>'
						 					+'	<div class="reply_head">'
						 					+'	<div style="display: inline-block">'
						 					+'  <img src="/images/uploadFiles/'+data.replyWriter.profileImage+'" class="img-responsive profileImg">'
						 					+	 data.replyWriter.nickname
						 					+'	</div>'
						 					+'	<div style="display: inline-block; float:right;">'
						 					+'    작성시간 : '+ data.replyRegDate
						 					+'	</div>'
						 					+'	</div>'
						 					+'	<div class="reply_content" style="min-height:70px">'
						 					+   data.replyContent
						 					+'	</div>'
						 					+'	<div style="float:right;">'
						 					+'	<button type="button" class="btn btn-primary updateReply">수정</button>'
						 					+'	<button type="button" class="btn btn-primary deleteReply">삭제</button>'
// 						 					+'	<button type="button" class="btn btn-primary addReportReply">신고</button>'
						 					+'	</div>'
						 					+'	</div>'
						 					+'	<br><br>'	
												
				 		 				var displayValue2 = 
				 		 					
				 		 					'<div class="btn btn-submit btn-round" style=" float:right; border-color: rgba(0, 0, 0, 0.4); color: rgba(0, 0, 0, 0.8);" id="addReply">' 
										+	'	등록'
										+	'</div>'
						 					
						    			$("#"+replyNo).append(displayValue);
						    			$(".note-editable").empty();
				 		            	$(".reply_button").empty();
				 		            	$(".reply_button").append(displayValue2);
						               
					 		       			$( "#addReply" ).on("click" , function() {
					 		       				fncAddReply();
					 		       			});
					 		            	
					 		       			$( ".updateReply" ).on("click" , function() {
					 		       				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
					 		       				fncGetReply(replyNo);
					 		       			});
					 		            	
					 		       			$( ".deleteReply" ).on("click" , function() {
// 					 		       				alert("updateReply 내부 deleteReply")
					 		       				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
					 		       				fncDelteReply(replyNo);
					 		       			});
					 		            	
					 		       			$(  ".addReportReply"  ).on("click" , function() {
					 		       				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
					 		       				fncAddReplyReport(replyNo);
					 		       			});
						    		}
							});
						}
		                }
		            }
			)};
		
			$( ".deleteReply" ).on("click" , function() {
// 				alert("바깥의 deleteReply")
				replyNo = $(this).parent().parent().find("input[name=replyNo]").val()
				fncDelteReply(replyNo);
			});
		
		function fncDelteReply(replyNo){
			$.ajax({
				url: "/reply/json/deleteReply/"+replyNo,
				type: "GET",
				dataType: "json",
				contentType : "application/json",
				data : JSON,
			    success : function(JSONData , status) {
						$('#'+replyNo).remove();
		                }
			});
		};
		
				
	</script>
</html>

