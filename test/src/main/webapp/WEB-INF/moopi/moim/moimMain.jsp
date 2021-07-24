<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="/images/uploadFiles" >  
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/javascript/owl.carousel.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> 
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>
var k = 9;
var j = 0;
var t = 0;

$(document).ready(function () {
	  $(document).scroll(function() {
	    var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();

	    if (maxHeight <= currentScroll + 100) {
	    	
	    	 $.ajax({
   	        url: "/moim/json/listMoim/{dbUser.userId}",
   	     	method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
   	        success: function (JSONData, status) {
			 	var index = JSONData.list.length;
			 	if(k+8 >= index){
			 		for(var i= k; i < index; i++){
		   	        	  //k+=1;
						  $("#columns").append(
							"<figure>"
							+'<span onClick=\"fncGetMoim( '+JSONData.list[i].mmNo +')\"><strong><left>'+JSONData.list[i].mmName+'</left></strong></span>'
							+'<img src=\"/images/uploadFiles/'+JSONData.list[i].mmFile+ '\" >'
							+'<figcaption>'+JSONData.list[i].mmContent+'</figcaption>'
							+'</figure>'
						  );	  
					  }
			 		k=0;
			 		j=1;
			 	}else if(j==1){
			 		t = 8;
			 		for(var i= 0; i < t; i++){
		   	        	  k+=1;
						  $("#columns").append(
							"<figure>"
							+'<span onClick=\"fncGetMoim( '+JSONData.list[i].mmNo +')\"><strong><left>'+JSONData.list[i].mmName+'</left></strong></span>'
							+'<img src=\"/images/uploadFiles/'+JSONData.list[i].mmFile+ '\" >'
							+'<figcaption>'+JSONData.list[i].mmContent+'</figcaption>'
							+'</figure>'
						  );	  
					  }
			 		j=0;
			 	}else if(k+8 < index){
			 		for(var i= k; i < k+8; i++){
		   	        	  k+=1;
						  $("#columns").append(
							"<figure>"
							+'<span onClick=\"fncGetMoim( '+JSONData.list[i].mmNo +')\"><strong><left>'+JSONData.list[i].mmName+'</left></strong></span>'
							+'<img src=\"/images/uploadFiles/'+JSONData.list[i].mmFile+ '\" >'
							+'<figcaption>'+JSONData.list[i].mmContent+'</figcaption>'
							+'</figure>'
						  );	  
					  }
			 	}
   	        	
   	        }//success 종료
   	      })//ajax종료
   	      
	    }//if문 종료
	  })
	});
</script>


<script type="text/javascript">
	
	function fncAddMoimView(){	
			swal({
				title : "모임무피를 만들까요?",
			    icon  : "info",
			    closeOnClickOutside : false
			}).then(function(){
				self.location ="/moim/addMoimView?userId=${dbUser.userId}";
				}	
			)		
		}


	function fncGetMoim(mmNo){
		swal("모임상세보기");
		self.location ="/moim/getMoim?mmNo="+mmNo
	};	

	function fncGetMyMoim() {
		self.location ="/moim/myListMoim?userId=${dbUser.userId}"
	};
	
	function salert() {
		swal({
			  text: "Hello world!",
			});
	};

</script>

<script>

$(document).ready(function(){ 
	$(".owl-carousel").owlCarousel({
		  items: 1,
          margin: 10,
          center:true,
          loop: true,
          nav: false,
          autoplay: true,
          autoplayTimeout: 3000,
          autoplayHoverPause: true,
          autoHeight:true,
          autoWidth:true

	}); 
	
});

</script>


<style>
body {
	padding-top: 50px;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
}

#columns{
	column-width:350px;
/* 	border:5px solid green; */
	column-gap: 15px;
}

#columns figure{
	display: inline-block;
	border:1px solid rgba(0,0,0,0.2);
	margin:0;
	margin-bottom: 15px;
	padding:10px;
	box-shadow: 2px 2px 5px rgba(0,0,0,0.5);
}

#columns figure img{
	width:100%;
}

#columns figure figcaption{
	border-top:1px solid rgba(0,0,0,0.2);
	padding:10px;
	margin-top:11px;
}

.userProfile {
	margin: 10px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
}


</style>

</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
 <jsp:include page="../layout/toolbar.jsp" /> 
<!-- ToolBar End /////////////////////////////////////-->

<h3><img class="userProfile" src="/images/uploadFiles/${dbUser.profileImage}"> ${dbUser.nickname}님이 가입하신 모임들입니다.</h3>


<div class="owl-carousel">
  <c:forEach items="${list2}" var="moim" >
  <div>
  <img  onClick="fncGetMoim(${moim.mmNo})" class="picture" src="/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>
  </div> 
  </c:forEach>
</div>



<h3><img class="userProfile" src="/images/uploadFiles/${dbUser.profileImage}"> ${dbUser.nickname}님의 관심사 ${dbUser.interestFirst}, ${dbUser.interestSecond}, ${dbUser.interestThird}에 맞는 모임들입니다.</h3>

<span>
<img src="/images/plus.png" width="40" height="40"  onClick="javascript:fncAddMoimView()"/>
</span>

<c:if test="${!empty dbUser}">
<button type="button" class="btn btn-outline-success" onClick="javascript:fncGetMyMoim()">My Moopi</button>

<button type="button" class="btn btn-default" onClick="javascript:salert()">경고창확인</button>
</c:if>
<div id="columns">
	<c:forEach items="${list}" var="moim" end="8" >
				<figure>	
					<span id="mmName" onClick="fncGetMoim(${moim.mmNo})"><strong><left>${moim.mmName}</left></strong></span>
					<img id="mmFile" src="/images/uploadFiles/${moim.mmFile}" >
					<figcaption id="mmContent">${moim.mmContent}</figcaption>
				</figure>
	</c:forEach>
</div> 



<jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>

<!--   <div>  --> 
<!-- <div class="row"> -->
<!--   <div class="col-sm-6 col-md-4"> -->
<!--     <div class="thumbnail"> -->
<%--       <img src="/images/uploadFiles/${moim.mmFile}" alt="..."> --%>
<!--       <div class="caption"> -->
<%--         <h3>${moim.mmName}</h3> --%>
<%--         <p>${moim.mmContent}</p> --%>
<!--         <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- <div class="row"> -->
<!-- 	  		<div class="col-xs-4 col-md-2 "></div> -->
<!-- 			<div class="col-xs-8 col-md-4"> -->
<%-- 			<img src="${pageContext.request.contextPath}/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  --%>
<%-- 			<img src="/images/uploadFiles/${moim.mmFile}" width="400" height="200 "/>   --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- <p>모임장:${moim.mmConstructor.nickname}</p>		 --%>
<%-- <p>${moim.mmContent}</p>		 --%>
<%-- <p>모임가입정원:${moim.mmMaxCount}</p> --%>
<%-- <p>모임현재정원:${moim.mmCurrentCount}</p> --%>
<%-- <p>모임생성일:${moim.mmRegDate}</p> --%>
<%-- <p>모임관심사No:${moim.mmInterest}</p> --%>
<%-- <p>모임거주지:${moim.mmAddr}</p> --%>
<%-- <p>모임무피상태(1공개2비공개):${moim.mmState}</p> --%>
<%-- <p>모임최소가입연령:${moim.mmMinAge}</p> --%>
<%-- <p>모임최대가입연령:${moim.mmMaxAge}</p> --%>
<%-- <p>모임가입유형(1일반2자유):${moim.mmType}</p>  --%>
<!--   </div> -->