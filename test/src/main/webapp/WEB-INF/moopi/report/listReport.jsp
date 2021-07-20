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

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportBd" ).on("click" , function() {
		fncListReportBd();
	});
});	

function fncListReportBd(){
	alert("게시글 신고목록");
	
	
	self.location ="/report/listReport?searchCategory=1";
	
}


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportRe" ).on("click" , function() {
		fncListReportRe();
	});
});	

function fncListReportRe(){
	alert("리플 신고목록");
	
	self.location ="/report/listReport?searchCategory=2";	
}


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportU" ).on("click" , function() {
		fncListReportU();
	});
});	

function fncListReportU(){
	alert("유저 신고목록");
	
	self.location ="/report/listReport?searchCategory=3";
	
}
	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td.test" ).on("click" , function() {
// 			alert("1"+$(this).parent().html());
			
// 			alert($(this).parent().find("input.boardNo").val());
			
			var boardNo = $(this).parent().find("input.boardNo").val();
// 			alert(boardNo);
			window.location.href ="/board/getBoard?boardNo="+boardNo;
		});
	});	
	
// 	function fncGetBoard(){
// 		alert("게시글 조회");
// 		alert("1"+$(this).parent().html());
// 		var boardNo = $(this).parent().find("input.boardNo").val();
		
// 		alert(boardNo);
		
// 		window.location.href ="/board/getBoard?boardNo="+boardNo;
		
// 	}
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "button.btn.btn-primary:contains('처리')" ).on("click" , function() {
			
			alert("신고처리");
			
			alert("1"+$(this).parent().parent().html());
			console.log($(this).parent().parent().html());
			console.log($(this).parent().parent().find("select").val());
			
			var reportResultState	= $(this).parent().parent().find("select").val();
			var reportNo			= $(this).parent().parent().find("input.reportNo").val()
			var stateReason  		= prompt('처리사유를 입력해주세요.', '처리 사유');
			
			alert(reportResultState);
			alert(reportNo);
			alert(stateReason);
			
			$("form").attr("stateReason", stateReason).attr("report.stateReason", stateReason)
			
			
			$("form").attr("method" , "POST").attr("action" , "/report/processReport").submit();		
// 			self.location ="/report/processReport";
			
		});
	});	
	
	



</script>
  
<style>
body{
	padding-top: 100px;
}
</style>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

<c:if test="${ search.searchCategory == 1}">
<h3>게시글 신고 목록</h3>
</c:if>
<c:if test="${search.searchCategory == 2}">
<h3>리플 신고 목록</h3>
</c:if>
<c:if test="${search.searchCategory == 3}">
<h3>유저 신고 목록</h3>
</c:if>
<button type="button" class="btn btn-primary" id="listReportBd">게시글</button>
<button type="button" class="btn btn-primary" id="listReportRe">리플</button>
<button type="button" class="btn btn-primary" id="listReportU">유저</button>

<form class="form-horizontal" name="detailForm" >
<div class="container">
 <table class="table table-hover table-striped" >
		<thead>
          <tr>
            <th align="center">No</th>
            <th align="left">신고당한 ID</th>
            <c:if test="${search.searchCategory == 1}">
			<th align="left">신고당한 글제목</th>
			</c:if>
			 <c:if test="${search.searchCategory == 2}">
			<th align="left">신고당한 리플</th>
			</c:if>
            <th align="left">신고 유형</th>
            <th align="left">신고 내용</th>
            <th align="left">신고 접수일</th>
            <th align="left">신고 처리일</th>
            <th align="left">처리 여부</th>
            <th align="left">신고 처리</th>
            <th align="left"></th>
          </tr>
        </thead>



		<tbody>
			<c:set var="i" value="0" />
				<c:forEach var="report" items="${ list }">
				<c:set var="i" value="${ i+1 }"/>
				
				<tr>
				<div class="form-group">
				<td align="center"> ${i}</td>
				
					<c:if test="${search.searchCategory == 1}">	
		 				<input type="hidden" class="reportNo" name="reportNo" value="${report.reportNo}"/>		 		
		 				<input type="hidden" class="boardNo" name="boardNo" value="${report.reportTargetBd.boardNo}"/>		 		
						<td align="left">${report.reportTargetBd.boardWriter.userId }</td>
						<td class="test" id="getBoard" align="left">${report.reportTargetBd.boardName}</td>
					</c:if>
					
					<c:if test="${search.searchCategory == 2}">
						<input type="hidden" class="reportNo" name="reportNo" value="${report.reportNo}"/>		
						<input type="hidden" class="boardNo" name="boardNo" value="${report.reportTargetRe.boardNo}"/>
						<input type="hidden" id="replyNo" name="replyNo" value="${report.reportTargetRe.replyNo}"/>
						<td align="left">${report.reportTargetRe.replyWriter.userId }</td>
						<td class="test" id="getBoard" align="left">${report.reportTargetRe.replyContent}</td>
					</c:if>
				
				<td align="left">${report.reportType}</td>
				<td align="left">${report.reportContent}</td>
				<td align="left">${report.reportRegDate}</td>
				<td align="left">${report.reportResultUpdate}</td>
				<td align="left">${report.reportResultState}</td>
				
				
				<c:if test="${report.reportResultUpdate == null}">
					<td align="left">
						<select id="reportProcess${report.reportNo}" name="reportProcess"> 
							<option>선택하세요</option> 
							<option value="1">해당없음</option>
							<option value="2">유저 경고</option>
							<option value="3">해당글 삭제</option>
						</select> 
					</td>
				  <td align="left"><button type="button" class="btn btn-primary"}">처리하기</button></td>
				  </c:if>
				</div>
				</tr>
			</c:forEach>
		
		</tbody>		
	
</table>

<jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>