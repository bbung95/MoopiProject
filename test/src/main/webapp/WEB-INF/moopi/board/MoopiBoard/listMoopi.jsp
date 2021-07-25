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

function fncGetList(currentPage){
	
	alert("페이지이동");
	alert(currentPage);
	$("#currentPage").val(currentPage)
	$("form.inline").attr("method", "GET").attr("action", "/board/listBoard").submit();
}

// function fncGetProductList(currentPage){
// 	$("#currentPage").val(currentPage)
//    	//document.detailForm.submit();
// 	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?"+"${url}").submit();

// }




$(function(){
	
	$("button.btn.btn-default:contains('검색')").on("click", function(){
		
		alert("검색")
		alert($("form.form-inline").html())
		
		$("form.inline").attr("method", "GET").attr("action", "/board/listBoard").submit();
	})
	
})


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
<h3>무피 공지게시판</h3>

	<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-default">전체 ${totalCount} 건수</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="inline" name="detailForm">

					<div class="form-group">
					
						<select name="searchCondition" class="form-control"
							style="width: 110px">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>제목</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>내용</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>작성자</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>
					<input type="hidden" id="category" name="category" value="1"/>
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>
		</div>

 <table class="table table-hover table-striped" >
<thead>
          <tr>
            <th align="center">No</th>
            <th align="left" colspan="5">글 제목</th>
            <th align="left">작 성 일</th>
            <th align="left">작 성 자</th>
          </tr>
        </thead>



		<tbody>
			
			<c:set var="i" value="0" />
				<c:forEach var="board" items="${ list }">
				<c:set var="i" value="${ i+1 }"/>
				
				<tr>
				<td align="center"> ${i}</td>
		 		<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}"/>
				<td align="left" colspan="5"><div id="getBoard" onClick="fncGetBoard(${board.boardNo})">${board.boardName}</div></td>
				<td align="left">${board.boardWriter.nickname} ${board.boardWriter.profileImage }</td>
				<td align="left">
				<c:if test="${empty board.boardUpdate }">
					${board.boardRegDate}
					</c:if>
					<c:if test="${!empty board.boardUpdate }">
					${board.boardUpdate}
					</c:if>
				

			</tr>
			</c:forEach>
		</tbody>		
				

	
</table>
		<c:if test="user.userRole =1 ">
		<button type="button" class="btn btn-default" onClick="fncAddBoardView()">게시글작성</button>
		</c:if>
		
<jsp:include page="../../common/pageNavigator.jsp"/>
<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
</body>
</html>