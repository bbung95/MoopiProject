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
	
	function fncAddMoimView(){
		alert("모임생성하기");
		self.location ="/moim/addMoimView?userId=${user.userId}"	

	};

	function fncGetMoim(mmNo){
		alert("모임상세보기");
		self.location ="/moim/getMoim?mmNo="+mmNo
	};	






</script>
<style>
body {
	padding-top: 50px;
}
</style>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>모임메인페이지입니다...${user.userId}님 안녕하십니까...</h3>
<c:if test="${!empty user}">
<button type="button" class="btn btn-default" onClick="javascript:fncAddMoimView()">모임생성하기</button>
</c:if>
<c:forEach var="moim" items="${list}">
<hr>
<p>모임넘버:${moim.mmNo}</p>
<p>모임명: <div id="getMoim" onClick="fncGetMoim(${moim.mmNo})"><strong>${moim.mmName}</strong></div></p>
<p>모임소개글:${moim.mmContent}</p>
<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모임대표썸네일</strong></div>
			<div class="col-xs-8 col-md-4">
			<!--<img src="${pageContext.request.contextPath}/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  -->
			<img src="/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  
			</div>
		</div>
<p>모임가입정원:${moim.mmMaxCount}</p>
<p>모임현재정원:${moim.mmCurrentCount}</p>
<p>모임생성자:${moim.mmConstructor.userId}</p>
<p>모임생성일:${moim.mmRegDate}</p>
<p>모임관심사No:${moim.mmInterest}</p>
<p>모임거주지:${moim.mmAddr}</p>
<p>모임무피상태(1공개2비공개):${moim.mmState}</p>
<p>모임최소가입연령:${moim.mmMinAge}</p>
<p>모임최대가입연령:${moim.mmMaxAge}</p>
<p>모임가입유형(1일반2자유):${moim.mmType}</p>

</c:forEach>

<jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>