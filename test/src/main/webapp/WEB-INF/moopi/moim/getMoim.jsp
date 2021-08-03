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
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->
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

// $(function(){
// 	//alert('유저아이디:${user.userId}' +  '모임번호:${moim.mmNo}');
// 	<c:if test="${empty dbUser}">
// 	$("#choose").text('가입하기');
// 	</c:if>
	
// 	$.ajax( 
// 			{
// 				url : "/moim/json/checkMember/${dbUser.userId}/${moim.mmNo}",
// 				method : "GET" ,
// 				dataType : "json" ,
// 				headers : {
// 					"Accept" : "application/json",
// 					"Content-Type" : "application/json"
// 				},
// 				success : function(JSONData , status) {
// // 					alert(JSONData.memberRole);
// // 					alert(status);
// //     				alert("JSONData : \n"+JSONData);
// 					if(JSONData.memberRole == 1){
// 						//alert('일반멤버');
// 						$("#choose").text('Plz Wait..');
// 					}else if(JSONData.memberRole == 5){
// 						$("#choose").text('Disapprove');
// 					}else if(JSONData.memberRole >= 2 && JSONData.memberRole <= 4){
// 						$("#choose").text('Withdraw');
// 					}else {
// 						$("#choose").text('Join Us');
// 					}
					
// 				}
// 		}); //ajax 종료
// });


// function fncUptMoimView(mmNo){
// 	alert("모임수정");
// 	self.location ="/moim/updateMoimView?mmNo="+mmNo
// }

// function fncApply(mmNo){
// 	<c:if test = "${null ne dbUser.userId}">
// 		alert("가입하기");
// 		alert("가입신청이 완료되었습니다.");
// 		self.location ="/moim/applyMoim?userId=${dbUser.userId}&mmNo="+mmNo	
// 	</c:if>
// 	<c:if test = "${empty dbUser.userId}">
// 	alert("회원가입이 필요한 페이지입니다.");
// 	</c:if>
// }

// function fncApplyList(mmNo){
// 	alert("가입신청목록보기");
// 	self.location ="/moim/listMember?status=1&mmNo="+mmNo
// }

// function fncListMember(mmNo){
// 	alert("유저목록보기");
// 	self.location ="/moim/listMember?status=2&mmNo="+mmNo
// }

// function fncListMeeting(mmNo){
// 	alert("정모일정보기");
// 	self.location ="/meeting/listMeeting?userId=${dbUser.userId}&mmNo="+mmNo
// }

// function fncGetMoim(mmNo){
// 	swal("모임상세보기");
// 	self.location ="/moim/getMoim?mmNo="+mmNo
// };	


</script>


 <script>
//         $(document).ready(function(){
//             var target = $("#sidebar");
 
//             // 버튼을 클릭하면 사이드바 열림
//             $(document).on("click", "#side", function (e){
//                 target.show();
//                 target.addClass('emphasized');
//             });
 
//             // 사이드바 외부를 클릭하면 사이드바 닫힘
//             $(document).mouseup(function (e){
//                 if(target.has(e.target).length==0) {
//                     target.hide();
//                     target.removeClass('emphasized');
//                 } 
//             });
//         });
    </script>


</head>
<style>
	body{
		padding-top: 100px;
/* 		background-color:#f7f6f3; */
	}
	
	main{
font-size: 16px;
}

#moimThumbnail{
	margin-top: 8px;
	border:3px solid rgba(0,0,0,0.2);
	display: inline-block;
/* 	margin: 0px auto; */
}

#left{
/* 	border:1.5px solid rgba(0,0,0,0.2); */
	width:350px;
	font-size:18px;
	margin-top:10px;
	margin-bottom:10px;
/* 	padding-left : 59px; */
	text-align: center;
}

.right{
/* 	border:1.5px solid rgba(0,0,0,0.2); */
	width:650px;
}

#moimName{
	font-size: 40px;
	font-style:italic;
	font-weight: bold;
	padding-left : 5px;
}

#moimContent{
	font-size : 20px;
 	padding-left : 28px; 
 	
}


/*멤버프로필시작*/
/*  body {  */
/*    height: 100vh;  */
/*    background-size: cover;   */
/*    background-position: center;   */
/*     display: flex;   */
/*    align-items: center;  */
/*  }  */

.our-team {
  padding: 30px 0 40px; 
  margin-bottom: 30px;
  background-color: #f7f5ec;
  text-align: center; 
  overflow: hidden;
  position: relative; 
}

.our-team .picture {
  display: inline-block;
  height: 100px;
  width: 100px;
  margin-bottom: 50px;
  z-index: 1;
  position: relative; 
}

.our-team .picture::before {
  content: "";
  width: 100%;
  height: 0;
  border-radius: 50%;
  background-color: #1369ce;
  position: absolute;
  bottom: 135%;
  right: 0;
  left: 0;
  opacity: 0.9;
  transform: scale(3);
  transition: all 0.3s linear 0s;
}

.our-team:hover .picture::before {
  height: 100%;
}

.our-team .picture::after {
  content: "";
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background-color: #1369ce;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
}

.our-team .picture img {
  width: 100%;
  height: 100%; 
  border-radius: 50%;
  transform: scale(1);
  transition: all 0.9s ease 0s;
}

.our-team:hover .picture img {
  box-shadow: 0 0 0 14px #f7f5ec;
  transform: scale(0.7);
}

.our-team .title {
  display: block;
  font-size: 14px;
  color: #4e5052;
  text-transform: capitalize;
}

.our-team .social {
  width: 100%;
  padding: 0;
  margin: 0;
  background-color: #1369ce;
  position: absolute;
  bottom: -100px;
  left: 0;
  transition: all 0.5s ease 0s;
}

.our-team:hover .social {
  bottom: 0;
}

.our-team .social li {
  display: inline-block;
}

.our-team .social li span {
  display: block;
  padding: 10px;
  font-size: 14px;
  color: white;
  transition: all 0.3s ease 0s;
  text-decoration: none;
}

.our-team .social li a:hover {
  color: #1369ce;
  background-color: #f7f5ec;
}

/*멤버프로필끝*/

#information{
	padding-top:20px;
	
}

.name{
	font-size:18px;
 	font-weight: bold; 
}

@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 1000px;
	}
}

/*사실 이 블럭은 없어도 된다*/
@media ( min-width : 1200px) {
	.container {
		width: 1000px;
	}
}

.name {
	font-size:16px;
}

.jumbotron {
  margin-top: 1rem;
  padding: 2rem 1rem;
  margin-bottom: 2rem;
  background-color: #e9ecef;
  border-radius: .3rem;
}

.jumbotrons {
  margin-top: 10px;
  margin-right: 8px;
  margin-left: 8px;
  padding: 2px 1px;
  margin-bottom: 10px;
  background-color: #e9ecef;
  border-radius: .4rem;
}
</style>
<body>

<!-- ToolBar Start ///////////////////////////////////// -->
<jsp:include page="../layout/toolbar.jsp" /> 

<main>
<!-- ToolBar End ///////////////////////////////////// -->

<!-- SideBar Start-->	
<!-- 		<div id="sidebar"> -->
<%--         <h1><a href="javascript:fncGetMoim(${moim.mmNo})">Home</a></h1> --%>
<!--         <h1>Board</h1> -->
<%--         <h1><a id="choose" href="javascript:fncApply('${moim.mmNo}')">Register</a></h1> --%>
<!--         <h1>Meeting</h1> -->
<!--         <h1>Invite</h1> -->
<!--         <h1>Member</h1> -->
<%--         <c:if test = "${dbUser.userId eq moim.mmConstructor.userId}"> --%>
<%-- 		<button type="button" class="btn btn-default" onClick="fncUptMoimView(${moim.mmNo})">Update</button> --%>
<%-- 		<button type="button" class="btn btn-default" onClick="fncApplyList(${moim.mmNo})">List Apply</button> --%>
<%-- 		</c:if> --%>
<!-- 		</div> -->
<!-- SideBar End -->

<div class="container">

<div class="row">
    <div id="left" class="col-xs-3 col-md-3">
    <div style="text-align : center;">
	<img id="moimThumbnail" src="/images/uploadFiles/${moim.mmFile}" 
	data-attach="true" data-fixedsize="true" data-fixed-width="300" style="width: 300px;"/>
	</div>
<%-- 	<p>모임넘버:${moim.mmNo}</p> --%>
	
	<div id="information">Information</div><br>
	<span class="jumbotrons"><i class="bi bi-people-fill"></i> ${moim.mmMaxCount} / ${moim.mmCurrentCount}</span>
	<br>
	<span class="jumbotrons">창립일 &nbsp&nbsp ${moim.mmRegDate}</span>
	<br>
	<span class="jumbotrons">최소 연령 &nbsp&nbsp ${moim.mmMinAge}세</span>
	<br>
	<span class="jumbotrons">최대 연령 &nbsp&nbsp ${moim.mmMaxAge}세</span>
	<br>
	<span class="jumbotrons">관심사 &nbsp&nbsp ${moim.mmInterest}</span>
	<br>
	<c:if test = "${moim.mmType == 1}">
	<span class="jumbotrons">일반 무피</span>
	</c:if>
	<c:if test = "${moim.mmType == 2}">
	<span class="jumbotrons">자유 무피</span>
	<br>
	
	</c:if>
	<br>
	<button type="button" class="btn btn-primary addReportMoim" style="margin-top: 10px">신고</button>
	</div>

	<!-- 점보트론 시작 -->
	<div class="right" >
	<div class="jumbotron">
<!-- 		<img id="side" class="whale" src="/images/air2.png" width="400" height="300 "/> -->
		<div id="moimName">${moim.mmName}</div>
		<div id="moimContent">${moim.mmContent}</div>
  		
	</div>
	<!-- 점보트론끝 -->
	
	<!-- 멤버썸네일 시작-->
<!-- 	<div class="container"> -->
	
		 <div class="row">

		 <c:forEach items="${list}" var="member">
		 <div class="col-xs-8 col-sm-6 col-md-5 col-lg-3">

	      <div class="our-team" >
	        <div class="picture">
	        <a href="/user/getMyHome?userId=${member.mmUser.userId}">
	          <img class="img-fluid" src="/images/uploadFiles/${member.mmUser.profileImage}">
	         </a>
	        </div>
	        <div class="team-content">
	          <h3 class="name">${member.mmUser.nickname}</h3>
	          <h4 class="title">${member.mmUser.profileContent}</h4>
	        </div>
	        <ul class="social">
	          <c:if test = "${member.memberRole eq '4'}">	
	          <li><span>모임장</span></li>
	          </c:if>
	          <c:if test = "${member.memberRole eq '3'}">
	          <li><span>운영진</span></li>
	          </c:if>
	          <c:if test = "${member.memberRole eq '2'}">
	          <li><span>멤버</span></li>
	          </c:if>
	        </ul>
	      </div>
	   
	   </div>
		</c:forEach>
		
		 </div>
		
		

		
<!-- 	</div> -->

	</div>

</div>

</div> <!-- 컨테이너끝 -->
</main>
<jsp:include page="../layout/moimSidebar.jsp"></jsp:include>
<jsp:include page="../layout/searchbar.jsp"></jsp:include>	

</body>
	
	<script type="text/javascript">
	
	$(  ".addReportMoim"  ).on("click" , function() {
		alert(${moim.mmNo})
		fncAddBoardMoim();
		
	});

	function fncAddBoardMoim(){
		var reportTarget = ${moim.mmNo}
		
	//		self.location ="/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget;
		popWin = window.open(
				"/report/addReportView?reportCategory=4&reportTargetMm.mmNo="+reportTarget ,
				"popReport",
				"left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}


	</script>



</html>