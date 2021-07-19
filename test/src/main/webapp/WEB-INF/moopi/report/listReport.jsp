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
	alert("게시글작성");
	self.location ="/board/addBoardView";
}

function fncGetBoard(boardNo){
	alert("게시글조회");
	self.location ="/board/getBoard?boardNo="+boardNo;
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
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>신고 목록</h3>
 <table class="table table-hover table-striped" >
<thead>
          <tr>
            <th align="center">No</th>
            <th align="left">카테고리</th>
            <th align="left">유저 ID</th>
            <th align="left">닉 네 임</th>
            <th align="left">신고 유형</th>
            <th align="left">신고자닉네임</th>
            <th align="left">신고 접수일</th>
            <th align="left">신고 처리일</th>
            <th align="left">처리 여부</th>
          </tr>
        </thead>



		<tbody>
			
			<c:set var="i" value="0" />
				<c:forEach var="report" items="${ list }">
				<c:set var="i" value="${ i+1 }"/>
				
				<tr>
				<td align="center"> ${i}</td>
		 		<input type="hidden" id="reportNo" name="reportNo" value="${report.reportNo}"/>
				<td align="left"><div id="getReport" onClick="fncGetReport(${report.reportNo)">${report.reportTarget}</div></td>
				<td align="left">
				<c:if test="${empty board.boardUpdate }">
					${board.boardRegDate}
					</c:if>
					<c:if test="${!empty board.boardUpdate }">
					${board.boardUpdate}
					</c:if>
				<td align="left">${board.boardWriter.nickname} ${board.boardWriter.profileImage }</td>

			</tr>
			</c:forEach>
		
		</tbody>		
	
</table>

<jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>