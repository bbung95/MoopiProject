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
	
	function fncAddMoim(){
		swal("모임을 생성합니다.");
		$("#addMoim").attr("method", "POST").attr("action", "/moim/addMoim").submit();

	}

	$('.content')
	.on("dragover", dragOver)
	.on("dragleave", dragOver)
	.on("drop", uploadFiles);

	function dragOver(e){
	e.stopPropagation();
	e.preventDefault();
	if (e.type == "dragover") {
	  $(e.target).css({
	    "background-color": "black",
	    "outline-offset": "-20px"
	  });
	} else {
	    $(e.target).css({
	    "background-color": "gray",
	    "outline-offset": "-10px"
	  });
	  }
	}

	function uploadFiles(e) {
	  e.stopPropagation();
	  e.preventDefault();
	  dragOver(e);

	  e.dataTransfer = e.originalEvent.dataTransfer;
	  var files = e.target.files || e.dataTransfer.files;
	  if (files.length > 1) {
	      alert('하나만 올려라.');
	      return;
	  }
	  if (files[0].type.match(/image.*/)) {
	              $(e.target).css({
	          "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
	          "outline": "none",
	          "background-size": "100% 100%"
	      });
	  }else{
	    alert('이미지가 아닙니다.');
	    return;
	  }
	}

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
	background-color:#f7f6f3;
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

.add { cursor: pointer; }

.content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
    background-color: gray;
}

.content{
	margin-bottom: 20px;
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



<h3>
<img class="userProfile" src="/images/uploadFiles/${dbUser.profileImage}"> ${dbUser.nickname}님의 관심사 ${dbUser.interestFirst}, ${dbUser.interestSecond}, ${dbUser.interestThird}에 맞는 모임들입니다.
<!-- <span><img class="add" src="/images/plus.png" width="40" height="40"  onClick="javascript:fncAddMoimView()"/></span> -->
<span><img class="add" src="/images/plus.png" width="40" height="40" data-toggle="modal" data-target="#myModal"/></span>
</h3>

<!-- Modal 시작-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">모임 무피 만들기!</h4>
      </div>
      <div class="modal-body">
        <!-- 폼시작 -->
        
        <!-- form Start /////////////////////////////////////-->
		<form id = "addMoim" class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="userId" name="userId" value="${dbUser.userId}">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임무피명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmName" name="mmName" placeholder="모임명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">대표썸네일</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="대표썸네일">
		    </div>
		  </div>
		  
		  <center>
		  <p>drag and drop your image!</p>
			<div class="content">
			</div>
		  </center>		
		    
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">간단소개글</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmContent" name="mmContent" placeholder="50자이내">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="mmAddr" name="mmAddr">
				  <option>종로구</option><option>중구</option><option>용산구</option><option>성동구</option>
				  <option>광진구</option><option>동대문구</option><option>중랑구</option><option>성북구</option>
				  <option>강북구</option><option>도봉구</option><option>노원구</option><option>은평구</option><option>서대문구</option>
				  <option>마포구</option><option>양천구</option><option>강서구</option><option>구로구</option>
				  <option>금천구</option><option>영등포구</option><option>동작구</option><option>관악구</option>
				  <option>서초구</option><option>강남구</option><option>송파구</option><option>강동구</option>				  
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmMaxCount" name="mmMaxCount" placeholder="가입가능정원">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
		    <div class="col-sm-4">
		    	<select class="form-control" id="mmInterest" name="mmInterest">
				  <option value="1">아웃도어/여행/사진/영상</option><option value="2">운동/스포츠</option><option value="3">인문학/책/글</option>
				  <option value="4">업종/직무</option><option value="5">외국/언어</option><option value="6">문화/공연/축제/음악/악기</option>
				  <option value="7">공예/만들기</option><option value="8">댄스/무용</option><option value="9">사교/인맥</option>
				  <option value="10">차/오토바이</option><option value="11">게임/오락</option><option value="12">맛집/카</option>	  
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최소연령</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmMinAge" name="mmMinAge" placeholder="최소연령">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최대연령</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mmMaxAge" name="mmMaxAge" placeholder="최대연령">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상태</label>
		  <div class="col-sm-4">
		  <div class="radio">
			  <label>
			    <input type="radio" name="mmState" id="mmState1" value="1" checked>
			    공개
			  </label>
			</div>
			<div class="radio">
			  <label>
			    <input type="radio" name="mmState" id="mmState2" value="2">
			    비공개
			  </label>
			</div>
			</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">유형</label>
		  <div class="col-sm-4">
		  <div class="radio">
			  <label>
			    <input type="radio" name="mmType" id="mmType1" value="1" checked>
			    일반 모임무피
			  </label>
			</div>
			<div class="radio">
			  <label>
			    <input type="radio" name="mmType" id="mmType" value="2">
			    자유 모임무피
			  </label>
			</div>
			</div>
		  </div>
		  
<!-- 		  <div class="form-group"> -->
<!-- 		    <div class="col-sm-offset-4  col-sm-4 text-center"> -->
<!-- 		      <button type="button" class="btn btn-primary" onClick="fncAddMoim()" >등록</button> -->
<!-- 			   <a class="btn btn-default btn" role="button"  onclick="history.back()">취소</a> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
		</form>
        
        <!-- 폼끝 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onClick="fncAddMoim()">Create</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달끝 -->


<c:if test="${!empty dbUser}">

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