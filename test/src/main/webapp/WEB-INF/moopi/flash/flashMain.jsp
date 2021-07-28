<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap"
	rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>

<script>
function fncAddFlashView(){
	alert("번개생성");
	self.location ="/flash/addFlashView?userId=${dbUser.userId}"
}

function fncGetFlash(flashNo){
	alert("번개무피 상세보기");
	self.location ="/flash/getFlash?flashNo="+flashNo
}

function fncAddFlash(){
	alert("번개생성!.");
	$(".form-horizontal").attr("method", "POST").attr("action", "/flash/addFlash").submit();
	//console.log($('#userId').val());

}

</script>

<style>
.userEL9001096 { position: relative; }
.userEL9001096 .carousel { height: 560px; }
.userEL9001096 .bg-box {
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    width: 100%; height: 100%;
    background-color: #000;
    opacity: 0;
}
.userEL9001096 .slide .carousel-caption {
    top: 50%;
    bottom: inherit;
 -webkit-transform: translateY(-50%);
 -moz-transform: translateY(-50%);
 -ms-transform: translateY(-50%);
 -o-transform: translateY(-50%);
 transform: translateY(-50%);
}
.userEL9001096 .slide .item { height: 560px; background-color: #000000;}
.userEL9001096 h1.head_title { 
font-family: 'Lato', 'Nanum Gothic';
font-size: inherit;
font-weight: normal; 
letter-spacing: 0.1em;
text-overflow:  ellipsis; 
overflow: hidden;
-webkit-line-clamp:2; 
-webkit-box-orient: vertical; 
display: -webkit-box; 
margin-top: 0;
margin-bottom:20px;
}
.userEL9001096 h5 {
    font-family: 'Lato', 'Nanum Gothic';
    font-weight: normal; 
    text-overflow:  ellipsis;
    overflow: hidden;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical; 
    display: -webkit-box; 
    margin-top: 0;
    margin-bottom: 0;
}
.userEL9001096 .slide .carousel-inner { max-height: 100%; }
.userEL9001096 .slide .carousel-inner .item.bg {
 background-position: center center;
 background-repeat: no-repeat;
 background-size: cover;
}
.userEL9001096 .userEL9001096-bg1 {
 background-image: url(//storage.googleapis.com/i.addblock.net/sample/showcase_42_1.jpg);
}
.userEL9001096 .userEL9001096-bg2 {
 background-image: url(//storage.googleapis.com/i.addblock.net/sample/showcase_42_2.jpg);
}
.userEL9001096 .userEL9001096-bg3 {
 background-image: url(//storage.googleapis.com/i.addblock.net/sample/showcase_42_3.jpg);
}

.userEL9001096 .carousel-control.right, .userEL9001096 .carousel-control.left { background:none; }
.userEL9001096 .carousel-control .fa {
 position: absolute;
 top: 50%;
 z-index: 5;
 display: inline-block;
 -webkit-transform: translateY(-50%);
 -moz-transform: translateY(-50%);
 -ms-transform: translateY(-50%);
 -o-transform: translateY(-50%);
 transform: translateY(-50%);
}
.userEL9001096 .carousel-control .fa.fa-showcase-left { left: 50%; }
.userEL9001096 .carousel-control .fa.fa-showcase-right { right: 50%; }

@media only screen and (max-width: 768px) {
.userEL9001096 .carousel { height: 400px;}
 .userEL9001096 .slide .carousel-caption { top: 43%; }
 .userEL9001096 h1.head_title { margin-bottom: 16px; } 
}
@media only screen and (max-width: 480px) {
 .userEL9001096 h1.head_title { margin-bottom: 10px; } 
 .userEL9001096 .slide .carousel-caption { bottom:11%;}
 .userEL9001096 .carousel-control .fa { max-height: 30px; }
 .userEL9001096 .carousel-control .fa.fa-showcase-left { left: 30%; }
 .userEL9001096 .carousel-control .fa.fa-showcase-right { right: 30%; }
}




.userEL9001404 { padding: 30px 0; background-color: #ffffff; }

.userEL9001404 .table { margin-bottom: 10px; }
.userEL9001404 .table > .item { overflow: hidden; padding-bottom: 40px; }
.userEL9001404 .table > .item * { z-index: 1; position: relative; }
.userEL9001404 .table > .item > .thumb-wrap { line-height: 1; }
.userEL9001404 .table > .item > .thumb-wrap .tpl-forum-list-thumb img { min-width: 100%; }
.userEL9001404 .tpl-forum-list-num {
    display: inline-block;
    position: absolute !important;
    top: 0; left: 0;
    padding: 6px 4px;
    line-height: 1;
    min-width: 22px;
    text-align: center;
    background-color: rgba(0,0,0,0.2);
    color:#fff;
     font-size:13px;
}
.userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-content {
    margin-top: 15px;
    margin-bottom: 15px;
}
.userEL9001404 .tpl-forum-list-title {
    font-family: 'Lora','Nanum Gothic';
    line-height: 1.4;
    font-size: 16px;
    font-weight: 400; 
    color:#535353;
}
.userEL9001404 .tpl-forum-list-etc {
    font-family: 'Roboto','Nanum Gothic';
    font-size: 12px;
    color:#818181;
}
.userEL9001404 .tpl-forum-list-cont {
   font-family: 'Roboto','Nanum Gothic';
    text-overflow: ellipsis;
    overflow: hidden;
    -webkit-line-clamp: 6;
    -webkit-box-orient: vertical;
    display: block;
    display: -webkit-box; 
    margin-bottom: 15px;
    font-size: 12px;
    color:#818181;
}

.userEL9001404 .table > .item > div { 
    line-height: 1.8;
    vertical-align: top;   
}

.userEL9001404 .table > .item > .cont-wrap { margin-top: 20px; }
.userEL9001404 .table > .item > .cont-wrap > ul > li { display: inline-block; float: left; line-height: 1.4; }
.userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):not(:empty):before,
.userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):empty + li:not(.hidden):not(:empty):before,
.userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li:not(.hidden):not(:empty):before,
.userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li:not(.hidden):not(:empty):before {
    content: '|';
    margin: 0 10px;
    position: relative;
    display: inline-block;
    float: left;
}
.userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-hit:not(.hidden):not(:empty):after, 
.userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-comment:not(.hidden):not(:empty):after {
    display: inline-block;
    position: relative;
    top: 0; left: 0;
    float: left;
    font-family: 'FontAwesome';
    margin-right: 3px;
}
.userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-hit:not(.hidden):not(:empty):after { content: '\f06e'; }
.userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-comment:not(.hidden):not(:empty):after { content: '\f0e5'; }


.userEL9001404 .tpl-forum-write {
    position: relative;
    display: block;
    min-width: 102px;
    margin: 0 15px 15px auto;
    padding: 6px 15px;
    font-family: 'Montserrat', 'Nanum Gothic';
    font-size: 11px;
    min-height: 36px;
    letter-spacing: 0.1em;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    border: 1px solid #a3a3a3;
    background-color: #a3a3a3;
    color: #fff;
}


.userEL9001404 .search-box { overflow:hidden; clear: both; padding-right: 15px; padding-bottom: 30px; }
.userEL9001404 .search-box .input-group { float:right; max-width: 460px; }
.userEL9001404 .search-box .form-control,
.userEL9001404 .search-box .form-control:focus,
.userEL9001404 .search-box .form-control:hover,
.userEL9001404 .search-box .search-btn ,
.userEL9001404 .search-box .search-btn:hover, 
.userEL9001404 .search-box .search-btn:focus { 
    background-color: transparent;
    border: 1px solid #e9e9e9; 
    -webkit-border-radius: 0; 
    -moz-border-radius: 0; 
    border-radius: 0; 
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    height: 24px;
    vertical-align: top;
}
.userEL9001404 .search-box .form-control { font-family: 'Questrial', 'Nanum Gothic'; font-size: 12px; color: #737373; padding: 0 5px; }
.userEL9001404 .search-box .form-control#stx { border-right: none; }
.userEL9001404 .search-box select.form-control { width: 100px; text-transform: uppercase; margin-right: 5px; }
.userEL9001404 .search-box .search-btn { 
    border-left: 0! important; 
    color: #191919; 
    padding: 3px 7px; 
    -wekbit-transform: translateX(1px);
    -moz-transform: translateX(1px);
    -ms-transform: translateX(1px);
    -o-transform: translateX(1px);
    transform: translateX(1px);
}

.userEL9001404 .pagination > li > a {   
    font-family: 'Roboto', 'Nanum Gothic';
    font-size: 12px; 
    font-weight: 400;
    letter-spacing: 0.07em;
    color: #737373;
    border:none;
    background-color: transparent;
    padding: 5px 10px;
}
.userEL9001404 .pagination > li > a:hover,
.userEL9001404 .pagination > li > span:hover,
.userEL9001404 .pagination > li > a:focus,
.userEL9001404 .pagination > li > span:focus {
    background-color: transparent;
}
.userEL9001404 .pagination > .active > a,
.userEL9001404 .pagination > .active > span,
.userEL9001404 .pagination > .active > a:hover,
.userEL9001404 .pagination > .active > span:hover,
.userEL9001404 .pagination > .active > a:focus,
.userEL9001404 .pagination > .active > span:focus {
    z-index: 2;
    color: #fb4045;
    background-color: transparent;
    border: none;
}

.userEL9001404.colorSet .search-box .form-control,
.userEL9001404.colorSet .search-box .form-control:focus,
.userEL9001404.colorSet .search-box .form-control:hover,
.userEL9001404.colorSet .search-box .search-btn ,
.userEL9001404.colorSet .search-box .search-btn:hover, 
.userEL9001404.colorSet .search-box .search-btn:focus { border-color: rgba(25,25,25,0.15); }
.userEL9001404.colorSet .search-box .form-control { color: rgba(25,25,25,0.75); }
.userEL9001404.colorSet .search-box .search-btn { color: #191919; }
.userEL9001404.colorSet .pagination > li > a { color: rgba(25,25,25,0.6); }
.userEL9001404.colorSet .pagination > .active > a,
.userEL9001404.colorSet .pagination > .active > span,
.userEL9001404.colorSet .pagination > .active > a:hover,
.userEL9001404.colorSet .pagination > .active > span:hover,
.userEL9001404.colorSet .pagination > .active > a:focus,
.userEL9001404.colorSet .pagination > .active > span:focus { color: #191919; }


@media only screen and (max-width: 767px){
    .userEL9001404 .table { margin-bottom: 8px; }
    .userEL9001404 .table > .item { padding-bottom: 32px; }
    .userEL9001404 .table > .item > .cont-wrap { margin-top: 16px; }
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):not(:empty):before,
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):empty + li:not(.hidden):not(:empty):before,
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li:not(.hidden):not(:empty):before { margin: 0 8px; }
    .userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-content { margin-top: 12px; margin-bottom: 12px; }
    .userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-cont { margin-bottom: 12px; }
    .userEL9001404 .tpl-forum-write { margin-bottom: 12px; }
    .userEL9001404 .search-box { padding-bottom: 24px; }
}
@media only screen and (max-width:480px) {
    .userEL9001404 .table { margin-bottom: 5px; }
    .userEL9001404 .table > .item { padding-bottom: 20px; }
    .userEL9001404 .table > .item > .cont-wrap { margin-top: 10px; }
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):not(:empty):before,
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):empty + li:not(.hidden):not(:empty):before,
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL9001404 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li:not(.hidden):not(:empty):before { margin: 0 5px; }
    .userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-content { margin-top: 7.5px; margin-bottom: 7.5px; }
    .userEL9001404 .table > .item > .cont-wrap .tpl-forum-list-cont { -webkit-line-clamp: 4; margin-bottom: 7.5px; }
    .userEL9001404 .tpl-forum-write { margin-bottom: 7.5px; }
    .userEL9001404 .search-box { padding-bottom: 15px; }
}


</style>

</head>
<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	
	<div class="userEL9001096">
  <div id="carousel-userEL9001096" class="carousel slide" data-ride="carousel-userEL9001096">
   <ol class="carousel-indicators" data-nav="true">
    <li data-target="#carousel-userEL9001096" data-slide-to="0" class="active"></li>
   </ol>
   <div class="carousel-inner" data-loop="true">
    <div class="item bg userEL9001096-bg1 active" data-attach="true" data-target=".userEL9001096-bg1">
     <div class="bg-box" data-selector=".bg-box" data-obackground="true" data-title=""></div>
     <div class="container">
      <div class="carousel-caption">
       <h1 class="figure-title head_title" data-selector="h1.head_title" data-edit="true"><span class="fsize200"><strong>어서오세요 번개처럼 번쩍하는 번개무피 여러분!</strong></span></h1>
       <h5 class="figure-caption" data-selector="h5" data-edit="true"><span class="fsize48">번개무피는 번개 생성시 2개의 코인을 소모하고 참가시 1개의 코인을 소모한답니다 노쇼를 방지하기 위한 최소한의 금액입니다ㅠㅠ<br>그리고 번개 무피는 무피에서 제일 자유로운 공간이에요 신고 조차 불가능합니다 하지만 저희 무피 운영진이 항시 모니터링 중이니 선정적인 번개나 위법 모임은 즉각 제제를 받으실수 있습니다! </span></h5>
      </div>
     </div>
    </div>
   </div>
  </div>
</div>

<!-- 번개메인 -->

<!-- <button type="button" class="btn btn-default" id="myModal" data-target="#myModal" -->
<!-- 		onClick="fncAddFlashView()"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-file-plus-fill" viewBox="0 0 16 16"> -->
<!--   <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM8.5 6v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 1 0z"/> -->
<!-- </svg> </button> -->

<!-- <h3>
<span><img class="add" src="/images/plus.png" width="40" height="40" data-toggle="modal" data-target="#myModal"/></span>
</h3>id="myModal" 
-->

<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop">번개생성<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-file-plus-fill" viewBox="0 0 16 16">
  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM8.5 6v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 1 0z"/>
</svg></button>


<div class="userEL9001404 colorSet" data-forum-type="thumb" data-fcolor="#191919" >
    <div class="container">
        <div class="row multi-columns-row">

            <div class="col-xs-12 col-sm-12 col-md-12 search-box clearfix">
                <div class="input-group">
                    <div class="input-group-btn">
                        <select id="scate" class="form-control" name="scate" placeholder="Category">
                            <option value="">category</option>
                        </select>
                    </div>
                    <div class="input-group-btn">
                        <select id="sfl" class="form-control" name="sfl" placeholder="Search">
                            <option value="all">all</option>
                            <option value="title">title</option>
                            <option value="content">content</option>
                            <option value="name">name</option>
                        </select>
                    </div>
                    <input type="text" id="stx" class="form-control" name="stx"> 
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-default search-btn"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </div>

			<c:forEach var="flash" items="${list}">

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 table-wrap no-padding clearfix">

                <div class="table clearfix" data-loop="true" data-view="9">

                    <div class="col-xs-12 col-sm-6 col-md-12 col-lg-8 item">
                        <div class="thumb-wrap">
                            <div class="tpl-forum-list-thumb">
                                
                            	<img src="/images/uploadFiles/${flash.flashFile}" width="200" height="200 " class="img-responsive" >
                            	<div id="getFlash" onClick="fncGetFlash(${flash.flashNo})">${flash.flashName}</div>
                            </div>
                         
                        </div>
                        <div class="cont-wrap">
                            <div class="tpl-forum-list-content">
                                <span class="tpl-forum-list-title">좀 더 자세히 보고싶다면 번개명 을 클릭 해주세요!</span>
                            </div>
                            <div class="tpl-forum-list-cont">만남시간:${flash.flashTime}</div>
                            <div class="tpl-forum-list-name tpl-forum-list-etc">장소:${flash.flashAddr}</div>
                            <ul>
                                <li class="tpl-forum-list-category tpl-forum-list-etc">주최자:${flash.flashConstructor.userId}</li>
                                <li class="tpl-forum-list-date tpl-forum-list-etc">모집상태:${flash.flashState}</li>
                                <li class="tpl-forum-list-hit tpl-forum-list-etc">참가인원:${flash.flashCurrentCount}</li>
                                <li class="tpl-forum-list-comment tpl-forum-list-etc">모집인원:${flash.flashMaxCount}</li>
                            </ul>
                        </div>
                    </div>


             
			</div>
            </div>

			</c:forEach>

        </div>
    </div>
</div>



					
<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel">번개를 번개처럼생성!</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">
        <!-- 폼시작 -->
        
        <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		  <input type="hidden" id="userId" name="userId" value="${dbUser.userId}">
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개무피명</label>
		    <div class="col-sm-20">
		      <input type="text" class="form-control" id="flashName" name="flashName" placeholder="번개명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개썸네일</label>
		    <div class="col-sm-40">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="대표썸네일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-3 col-sm-3 control-label">번개소개</label>
		    <div class="col-sm-40">
		      <textarea  style="resize:none" class="form-control" id="flashContent" name="flashContent" placeholder="50자이내"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개장소</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="flashAddr" name="flashAddr" placeholder="지역구">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개모임인원</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="flashMaxCount" name="flashMaxCount" placeholder="최대참가인원">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">번개만남시간</label>
		    <div class="col-sm-20">
		      <input type="datetime-local" class="form-control" id="flashTime" name="flashTime" placeholder="만남시간">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
		    <div class="col-sm-20">
		      <select class="form-control" id="flashInterest" name="flashInterest" >
		      	 <option value="1">아웃도어/여행/사진/영상</option><option value="2">운동/스포츠</option><option value="3">인문학/책/글</option>
				  <option value="4">업종/직무</option><option value="5">외국/언어</option><option value="6">문화/공연/축제/음악/악기</option>
				  <option value="7">공예/만들기</option><option value="8">댄스/무용</option><option value="9">사교/인맥</option>
				  <option value="10">차/오토바이</option><option value="11">게임/오락</option><option value="12">맛집/카</option>
		      </select>
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
        <button type="button" class="btn btn-default" data-bs-dismiss="modal" aria-label="Close">Close</button>
        <button type="button" class="btn btn-primary" onClick="fncAddFlash()">Create</button>
      </div>
    </div>
  </div>
</div>






</body>
</html>