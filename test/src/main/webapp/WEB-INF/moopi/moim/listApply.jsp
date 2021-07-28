<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>

<!-- Favicon --> 
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />

<!-- Bootstrap icons -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
<!-- <link rel="stylesheet" href="/images/uploadFiles" >   -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script src="/javascript/owl.carousel.min.js"></script> -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/scripts.js"></script>
<!-- <link rel="stylesheet" href="/css/owl.carousel.min.css"> -->
<!-- <link rel="stylesheet" href="/css/owl.theme.default.min.css"> -->

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

<script>
function fncAccept(userId, mmNo){
	swal("가입신청을 수락하겠습니다.");
	self.location ="/moim/updateMember?userId="+userId+"&mmNo="+mmNo+"&status=1"
}

function fncRefuse(memberNo, mmNo){
	swal("가입신청을 거절하겠습니다.");
	self.location ="/moim/refuseApply?memberNo="+memberNo+"&mmNo="+mmNo
}


</script>
<style>
	body{
		padding-top: 100px;
		background-color:#f7f6f3;
		font-family: 'Nanum Gothic', sans-serif;
		font-size : 16px;
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
#td8{
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

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	
<!-- ToolBar End /////////////////////////////////////-->
<body>

<h2>Apply List</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <caption class="text-center">An example of a responsive table based on <a href="https://datatables.net/extensions/responsive/" target="_blank">DataTables</a>:</caption>
        <thead>
          <tr>
            <th id="th1">profile</th>
            <th id="th2">nickName</th>
            <th id="th3">introduce</th>
            <th id="th4">addr</th>
            <th id="th5">interest first</th>
            <th id="th6">interest second</th>
            <th id="th7">interest third</th>
            <th id="th8">apply</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="member">
          <tr>
            <td id="td1"><img class="userProfile" src="/images/uploadFiles/${member.mmUser.profileImage}"></td>
            <td id="td2">${member.mmUser.nickname}</td>
            <td id="td3">${member.mmUser.profileContent}</td>
            <td id="td4">${member.mmUser.addr}</td>
            <td id="td5">${member.mmUser.interestFirst}</td>
            <td id="td6">${member.mmUser.interestSecond}</td>
            <td id="td7">${member.mmUser.interestThird}</td>
            <td id="td8">
            <button type="button" class="btn btn-success" onClick="fncAccept('${member.mmUser.userId}', '${member.mmNo}')">Accept</button>
			<button type="button" class="btn btn-danger" onClick="fncRefuse('${member.memberNo}', '${member.mmNo}')">reject</button>
            </td>
          </tr>
        </c:forEach>  
        </tbody>
        <tfoot>
          <tr>
            <td colspan="5" class="text-center">Data retrieved from <a href="http://www.infoplease.com/ipa/A0855611.html" target="_blank">infoplease</a> and <a href="http://www.worldometers.info/world-population/population-by-country/" target="_blank">worldometers</a>.</td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</div>



<jsp:include page="../layout/moimSidebar.jsp"></jsp:include>
</body>



<%-- <c:forEach var="member" items="${list}"> --%>

<%-- <p>멤버넘버:${member.memberNo}</p> --%>
<%-- <p>회원ID: <div id="getMoim" onClick="fncGetMoim(${member.memberNo})">${member.mmUser.userId}</div></p> --%>
<%-- <p>모임넘버:${member.mmNo}</p> --%>
<%-- <p>회원닉네임:${member.mmUser.userName}</p> --%>
<%-- <p>회원뱃지:${member.mmUser.badge}</p> --%>
<%-- <p>회원프로필:${member.mmUser.profileImage}</p> --%>
<%-- <p>회원프로필소개:${member.mmUser.profileContent}</p> --%>
<%-- <p>회원주소지:${member.mmUser.addr}</p> --%>
<%-- <button type="button" class="btn btn-default" onClick="fncAccept('${member.mmUser.userId}', '${member.mmNo}')">수락</button> --%>
<%-- <button type="button" class="btn btn-default" onClick="fncRefuse('${member.memberNo}', '${member.mmNo}')">거절</button> --%>
<!-- <hr> -->
<%-- </c:forEach> --%>


</html>