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
	alert(userId+"님을 초대하겠습니다.");
	//self.location ="/moim/updateMember?userId="+userId+"&mmNo="+mmNo+"&status=1"
}

function fncRefuse(memberNo, mmNo){
	alert("가입신청을 거절하겠습니다.");
	self.location ="/moim/refuseApply?memberNo="+memberNo+"&mmNo="+mmNo
}


</script>

<style>
body{
		padding-top: 50px;
		background-color:#f7f6f3;
		font-family: 'Nanum Gothic', sans-serif;
		font-size : 20px;
	}
	
	.userProfile {
	margin: 10px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	}
	
.container{
	font-family: 'Nanum Gothic', sans-serif;
}	
	
/* 코드펜 */
body { 
  font-size: 140%; 
}

h2 {
  text-align: center;
  padding: 20px 0;
}

table caption {
	padding: .5em 0;
}

table.dataTable th,
table.dataTable td {
  white-space: nowrap;
}

.p {
  text-align: center;
  padding-top: 140px;
  font-size: 14px;
}


#td1{
	vertical-align: middle;
	 text-align: center;
}
#td2{
	vertical-align: middle;
	 text-align: center;
}
#td3{
	vertical-align: middle;
	 text-align: center;
}
#td4{
	vertical-align: middle;
	 text-align: center;
}
#td5{
	vertical-align: middle;
	 text-align: center;
}
#td6{
	vertical-align: middle;
	 text-align: center;
}
#td7{
	vertical-align: middle;
	 text-align: center;
}

#th1{
	 text-align: center;
}
#th2{
	 text-align: center;
}
#th3{
	 text-align: center;
}
#th4{
	 text-align: center;
}
#th5{
	 text-align: center;
}
#th6{
	 text-align: center;
}
#th7{
	 text-align: center;
}
#th8{
	 text-align: center;
}


</style>

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
<button type="button" class="btn btn-default" onClick="fncAccept('${user.userId}', '${member.mmNo}')">초대</button>
<hr>
</c:forEach>


</body>
</html>