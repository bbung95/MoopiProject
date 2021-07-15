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
function fncAccept(userId, mmNo){
	alert("가입신청을 수락하겠습니다.");
	self.location ="/moim/updateMember?userId="+userId+"&mmNo="+mmNo+"&status=1"
}

function fncRefuse(memberNo, mmNo){
	alert("가입신청을 거절하겠습니다.");
	self.location ="/moim/refuseApply?memberNo="+memberNo+"&mmNo="+mmNo
}


</script>


</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>인근 초대가능한 사람들입니다... 목록입니다...</h3>

<c:forEach var="user" items="${list}">
//////////////////////////
<p>회원ID:${user.userId}</p>
<p>회원이름: <div id="getMoim" onClick="fncGetMoim(${user.userId})">${user.userName}</div></p>
<p>회원성별:${user.gender}</p>
<p>회원폰:${user.phone}</p>
<p>회원닉네임:${user.nickname}</p>
<p>회원나이:${user.age}</p>
<p>회원fulladdress:${user.fullAddr}</p>
<p>회원addr:${user.addr}</p>
<button type="button" class="btn btn-default" onClick="fncAccept('${member.mmUser.userId}', '${member.mmNo}')">초대</button>
<hr>
</c:forEach>


</body>
</html>