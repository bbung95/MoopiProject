<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="keywords"
	content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Css -->
<link rel="stylesheet" href="/css/admin/styles.css">
<link rel="stylesheet" href="/css/admin/all.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
	rel="stylesheet">

<script>

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportBd" ).on("click" , function() {
		self.location ="/report/listReport?searchCategory=1";
	});
});	


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportRe" ).on("click" , function() {
		self.location ="/report/listReport?searchCategory=2";
	});
});	


$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportU" ).on("click" , function() {
		self.location ="/report/listReport?searchCategory=3";
	});
});	

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#listReportMm" ).on("click" , function() {
		self.location ="/report/listReport?searchCategory=4";
	});
});	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td.test" ).on("click" , function() {
			
			var boardNo = $(this).parent().find("input.boardNo").val();
			window.location.href ="/board/getBoard?boardNo="+boardNo;
		});
	});	
	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "button.btn.btn-primary:contains('처리')" ).on("click" , function() {
			
			//alert("신고처리");
			
			//alert($(this).parent().parent().html());
			
			var reportResultState	= $(this).parent().parent().find("select").val();
			var reportNo			= $(this).parent().parent().find("input.reportNo").val()
			var stateReason			= $(this).parent().parent().find("input.stateReason").val()
			var reportTargetBd		= $(this).parent().parent().find("input.boardNo").val()
			var reportTargetRe		= $(this).parent().parent().find("input.replyNo").val()
			
// 			//alert(reportResultState);
// 			//alert(reportNo);
// 			//alert(stateReason);
// 			//alert(reportTargetBd);
// 			//alert(reportTargetRe);
			
			$.ajax( 
					{
						url : "/report/json/processReport",
						method : "POST" ,
						dataType : "json" ,
						data :  JSON.stringify ({ "reportNo": reportNo, "reportResultState": reportResultState, "stateReason": stateReason, "reportTargetBd": {"boardNo" : reportTargetBd}, "reportTargetRe": {"replyNo" : reportTargetRe} }),
						contentType : "application/json",
					    success : function(JSONData , status) {
				               //alert(status);
// 				                //alert("JSONData : \n"+JSONData.boardPassword);
								//alert(JSONData)
								console.log(JSONData)
				               var displayValue = 
				            	   "<h4>"
				            	   +"<td align='left'>"+JSONData.reportResultUpdate+"</td>"
								   +"<td align='left'>"+JSONData.reportResultState+"</td>"
								   +"<td align='left'>"+JSONData.stateReason+"</td>"
								   +"<td align='left'>처리완료</td>"
									+"</h4>"
									
								//Debug...									
								//alert(displayValue);
								$(".reportUpdate"+JSONData.reportNo+"").remove();
								$(".reportUpdate"+JSONData.reportNo+"" ).append(displayValue);	
	
				               }
				               
			
				     })
			
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
            <th align="left">처리 사유</th>
            <th align="left">신고 처리</th>
            
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
						<input type="hidden" class="replyNo" name="replyNo" value="${report.reportTargetRe.replyNo}"/>
						<td align="left">${report.reportTargetRe.replyWriter.userId }</td>
						<td class="test" id="getBoard" align="left">${report.reportTargetRe.replyContent}</td>
					</c:if>
				
				<td align="left">${report.reportType}</td>
				<td align="left">${report.reportContent}</td>
				<td align="left">${report.reportRegDate}</td>
				<c:if test="${report.reportResultUpdate != null}">
				<td align="left">${report.reportResultUpdate}</td>
				<td align="left">${report.reportResultState}</td>
				<td align="left">${report.stateReason}</td>
				<td align="left">처리완료</td>
				<td></td>
				</c:if>
				
				<c:if test="${report.reportResultUpdate == null}">
				<input type="hidden" >
				<div class="abc${report.reportNo}">
				<td class="reportUpdate${report.reportNo}" name ="reportUpdate"></td>
				<td class="reportUpdate${report.reportNo}" name ="reportUpdate"></td>
				<td class="reportUpdate${report.reportNo}" name ="reportUpdate">
				<input type="text" class="stateReason"></input>	</td>
					<td class="reportUpdate${report.reportNo}" name ="reportUpdate" align="left">
						<select name="reportResultState"> 
							<option value="1">해당없음</option>
							<option value="2">유저경고</option>
							<option value="3">해당글삭제</option>
						</select> 
					</td>
					
					</div>
				  <td align="left"><button type="button" class="btn btn-primary">처리하기</button></td>
				  
				  </c:if>
				  
				</tr>
			</c:forEach>
		
		</tbody>		
	
</table>
</div>
<%-- <jsp:include page="../layout/searchbar.jsp"></jsp:include> --%>
</body>
</html>