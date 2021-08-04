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
  	
<script type="text/javascript">
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#addReport" ).on("click" , function() {
		fncAddReport();
	});
});	

function fncAddReport(){
// 	alert("신고");
	
	
	var reportType			= $(".reportType").val();
	var reportContent		= $("#reportContent").val();
	var reportTarget		= $("#reportTarget").val();
	var reportTargetBd		= $("#reportTargetBd").val();
	var reportTargetRe		= $("#reportTargetRe").val();
	var reportTargetMm		= $("#reportTargetMm").val();
	var reportCategory 		= $("#reportCategory").val();
	var reportByUserId		= $("#reportByUser").val();
// 	alert($(".reportType").val())
// 	alert(reportType);
// 	alert(reportContent);
// 	alert(reportTarget);
// 	alert(reportTargetBd);
// 	alert(reportTargetRe);
// 	alert(reportTargetMm);
// 	alert(reportCategory);
// 	alert(reportByUserId);
	
	$.ajax({
		url: "/report/json/addReport",
		type: "POST",
		dataType: "json",
		contentType : "application/json",
		data :  JSON.stringify ({ "reportType": reportType, "reportContent": reportContent, "reportTarget": { "userId": reportTarget }, "reportTargetBd": {"boardNo" :reportTargetBd},
								 "reportTargetRe": { "replyNo" : reportTargetRe} , "reportTargetMm": { "mmNo" : reportTargetMm} , "reportCategory" : reportCategory, "reportByUser" : {"userId":reportByUserId} }),		
		success: function(data, state){
			
			
			close();
		
		}
	
	});
	
}





</script>
<style>
.modal-content {
    position: relative;
    display: flex;
    flex-direction: column;
    width: 700px;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 0.3rem;
    outline: 0;
}
img {
  height:300px;
  object-fit: scale-down;
}
</style>
</head>
<body>
 
 <div class="container">
	
		
		
		<!-- form Start /////////////////////////////////////-->
		<!-- 카테고리 1번에 해당하는 신고글. -->
		 
		  <div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">신고하기</h4>
				</div>
					<!-- 폼시작 -->

					<!-- form Start /////////////////////////////////////-->
					<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
						 <c:if test="${reportCategory == 1}">
						<input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
					    <input type="hidden" id="reportTargetBd" name="reportTargetBd.boardNo" value="${board.boardNo}">
					    <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글 제목</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"> ${board.boardName }</label>
						</div>

						<br>
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글 내용</label>
							<div for="ssn" class="col-sm-offset-1 col-sm-3 control-label">
								${board.boardContent }
							</div>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">게시글 작성자</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">
								${board.boardWriter.nickname }
							</label>
						</div>
						</c:if>  
						  <c:if test="${reportCategory == 2}">
						<input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
						  <input type="hidden" id="reportTargetRe" name="reportTargetRe.replyNo" value="${reply.replyNo}">
						  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">

						<br>
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">댓글 내용</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">
								${reply.replyContent }
							</label>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">댓글 작성자</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">
								${reply.replyWriter.nickname }
							</label>
						</div>
						</c:if>  
						<c:if test="${reportCategory == 3}">
						  <input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
		  <input type="hidden" id="reportTarget" name="reportTarget" value="${report.reportTarget.userId}">
		  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">유저 닉네임</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">${user.nickname}</label>
						</div>

						<br>
						</c:if>  <c:if test="${reportCategory == 4}">
						 <input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
		  <input type="hidden" id="reportTargetMm" name="reportTargetMm" value="${moim.mmNo}">
		  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임명</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"> ${moim.mmName}</label>
						</div>

						<br>
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임소개</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">
								${moim.mmContent}
							</label>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임장 아이디</label>
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">
								${moim.mmConstructor.userId }
							</label>
						</div>
						</c:if> 
						<br>
						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">신고사유</label>
								<select class="form-control reportType" style="width:300px;text-align: center;"  >
									<option>=====선택하세요=====</option>
									<option name="reportType" value="1">음란성 및 부적절한 요소</option>
									<option name="reportType" value="2">욕설 또는 공격적인 요소</option>
									<option name="reportType" value="3">광고 및 상업적인 요소</option>
									<option name="reportType" value="4">불법적인 요소</option>
								</select>
						</div>

						<br>

						<div class="form-group">
							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">추가 내용</label>
							<div class="col-sm-20">
								<input type="text" class="form-control" style="width:300px;height:70px" id="reportContent" placeholder="추가 내용을 입력해주세요.">
							</div>
						</div>

						<br>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="addReport">신고하기</button>
						</div>
					</form>
					<!-- 폼끝 -->
		</div>
				
				
</div>
           
		
</body>



</html>

