<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootStart -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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


$(function(){
	$('.success').click(function () {
		swal("초대 알림을 보내겠습니다..");
    	invite($(this).next().val(), ${moim.mmNo})
    	 $(this).text("초대완료");
    });	
})

function invite(userId, mmNo){
	console.log(userId);
	console.log(mmNo);
	$.ajax( 
			{
				url : "/moim/json/inviteYou/"+userId+"/"+mmNo,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					alert(status);
					$(this).val("초대완료");
					
				}
		}); //ajax 종료
}

</script>

<style>
body{
		padding-top: 100px;
/* 		background-color:#f7f6f3; */
	}
	
		main{
font-family: 'Open Sans', sans-serif;
font-size: 16px;
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




<h2>Invite List</h2>
<main>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <caption class="text-center">An example of a responsive table based on <a href="https://datatables.net/extensions/responsive/" target="_blank">DataTables</a>:</caption>
        <thead>
          <tr>
            <th id="th1">profile</th>
            <th id="th2">nickName</th>
            <th id="th3">gender</th>
            <th id="th4">addr</th>
            <th id="th5">introduce</th>
            <th id="th6">invite</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user">
          <tr>
            <td id="td1">
            <a href="/user/getMyHome?userId=${user.userId}">
            <img class="userProfile" src="/images/uploadFiles/${user.profileImage}">
            </a>
            </td>
            <td id="td2">${user.nickname}</td>
            <td id="td3">
			<c:if test = "${user.gender eq '1'}">
			남자
			</c:if>
			<c:if test = "${user.gender eq '2'}">
			여자
			</c:if>
			</td>
            <td id="td4">${user.addr}</td>
            <td id="td5">${user.profileContent}</td>
			<td id="td6">
<%-- 			<button type="button" id="${user.userId}" class="btn btn-success" onClick="invite('${user.userId}', '${moim.mmNo}')">초대</button> --%>
			<button type="button" class="success">초대</button>
			<input type="hidden" value="${user.userId}">
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
<%-- <c:forEach var="user" items="${list}"> --%>
<%-- <img class="userProfile" src="/images/uploadFiles/${user.profileImage}"></td> --%>
<%-- <p>회원ID:${user.userId}</p> --%>
<%-- <p>회원이름: <div id="getMoim" onClick="fncGetMoim(${user.userId})">${user.userName}</div></p> --%>
<%-- <c:if test = "${user.gender eq '2'}"> --%>
<!-- <p>회원성별:여자</p> -->
<%-- </c:if> --%>
<%-- <c:if test = "${user.gender eq '1'}"> --%>
<!-- <p>회원성별:남자</p> -->
<%-- </c:if> --%>
<%-- <p>회원폰:${user.phone}</p> --%>
<%-- <p>회원닉네임:${user.nickname}</p> --%>
<%-- <p>회원나이:${user.age}</p> --%>
<%-- <p>회원fulladdress:${user.fullAddr}</p> --%>
<%-- <p>회원addr:${user.addr}</p> --%>
<%-- <p>회원소개:${user.profileContent}</p> --%>
<%-- <button type="button" class="btn btn-default" onClick="fncAccept('${user.userId}', '${member.mmNo}')">초대</button> --%>
<%-- </c:forEach> --%>
</main>
<jsp:include page="../layout/moimSidebar.jsp"></jsp:include>
</body>
</html>