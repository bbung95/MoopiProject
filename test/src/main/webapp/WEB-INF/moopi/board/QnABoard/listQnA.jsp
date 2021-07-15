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
	self.location ="/board/addBoardView?category=2";
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
	<jsp:include page="../../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>무피 QnA게시판</h3>

<c:forEach var="board" items="${list}">
--------------------------------------------
<p>게시글번호 :${board.boardNo}</p>
<p>게시글이름 : <div id="getBoard" onClick="fncGetBoard(${board.boardNo})">${board.boardName} 
<c:if test="${ empty board.boardPassword}">  공개 </c:if> 
<c:if test="${ !empty board.boardPassword  }"> 비공개 </c:if> </div></p>
<c:if test="${empty board.boardUpdate }">
<p>작 성 일 : ${board.boardRegDate}</p> 
</c:if>
<c:if test="${!empty board.boardUpdate }">
<p>수 정 일 : ${board.boardUpdate}</p>
</c:if>
<p>작 성 자 : ${board.boardWriter.nickname} ${board.boardWriter.profileImage }</p>

<p>답변 여부 : ${ board.replyCount == 0 ? "미답변" : "답변완료"}

</p>
</c:forEach>

<button type="button" class="btn btn-default" onClick="fncAddBoardView()">게시글작성</button>
<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
</body>
</html>