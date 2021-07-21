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
<h3>무피 게시판조회</h3>

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

</form>
<%-- <jsp:include page="../../layout/searchbar.jsp"></jsp:include> --%>

</body>
</html>

