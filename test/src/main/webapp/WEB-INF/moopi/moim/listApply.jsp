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
<style>
	body{
		padding-top: 50px;
	}
</style>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	<jsp:include page="../layout/moimToolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>가입신청자 목록입니다...</h3>

<c:forEach var="member" items="${list}">
//////////////////////////
<p>멤버넘버:${member.memberNo}</p>
<p>회원ID: <div id="getMoim" onClick="fncGetMoim(${member.memberNo})">${member.mmUser.userId}</div></p>
<p>모임넘버:${member.mmNo}</p>
<p>회원닉네임:${member.mmUser.userName}</p>
<p>회원뱃지:${member.mmUser.badge}</p>
<p>회원프로필:${member.mmUser.profileImage}</p>
<p>회원프로필소개:${member.mmUser.profileContent}</p>
<p>회원주소지:${member.mmUser.addr}</p>
<button type="button" class="btn btn-default" onClick="fncAccept('${member.mmUser.userId}', '${member.mmNo}')">수락</button>
<button type="button" class="btn btn-default" onClick="fncRefuse('${member.memberNo}', '${member.mmNo}')">거절</button>
<hr>
</c:forEach>


</body>
</html>