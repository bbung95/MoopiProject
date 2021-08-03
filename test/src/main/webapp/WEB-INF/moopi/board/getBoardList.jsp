<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Moopi!</title>

<jsp:include page="../common/commonCDN.jsp"></jsp:include>
		
		<script src="/javascript/summernote-lite.js"></script>
		<script src="/javascript/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="/css/summernote-lite.css">
	
<script type="text/javascript">

function fncAddBoardView(){
// 	alert("게시글작성");
	self.location ="/board/addBoardView?category=2";
}
function fncAddBoardView2(){
// 	alert("게시글작성");
	
	self.location ="/board/addBoardView?category=1";
}

function fncGetBoard(boardNo){
// 	alert("게시글조회");
	self.location ="/board/getBoard?boardNo="+boardNo;
}

function fncGetList(currentPage){
	$("#currentPage").val(currentPage)
	$("#searchBar").attr("method", "GET").attr("action", "/board/listBoard").submit();
}

function fncGetPassword(boardNo){
// 	alert("비번체크");

// 	alert(${dbUser.userRole})
	
	if(${dbUser.userRole == 1}){
		self.location ="/board/getBoard?boardNo="+boardNo;
	}else{
	
	var boardPassword = prompt("작성하실때 입력하신 비밀번호를 입력해주세요.");
// 	alert(boardPassword)
	
	var jsonPassword;
	
	$.ajax( 
			{
				url : "/board/json/checkPassword/"+boardNo+"/"+boardPassword,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
					},
				    success : function(JSONData , status) {
			             //alert(JSONData.memberRole);	
// 			             alert(status);
// 			              alert("JSONData : \n"+JSONData.boardPassword);
		                jsonPassword = JSONData.boardPassword
// 		                alert(boardPassword+ ": 값비교 : "+ jsonPassword);
// 		                alert(JSONData.boardNo);
		                if(boardPassword== jsonPassword){
// 		                	alert(JSONData.boardNo);
		                	self.location ="/board/getBoard?boardNo="+JSONData.boardNo;
		                }
            }
          })
	}
	}
		$(function(){
			
			$("button.btn.btn-default.search-btn").on("click", function(){
				
// 				alert("검색")
// 				alert($("#searchBar").html())
				
				$("#searchBar").attr("method", "GET").attr("action", "/board/listBoard").submit();
			})
			
		})			
		
				
</script>
  
<style>


.userEL8991295 .tpl-forum-write {
    position: relative;
    display: block;
    min-width: 95px;
    margin: 0 0 5px auto;
    padding: 7px 15px;
    font-family: 'Montserrat', 'Nanum Gothic';
    font-size: 11px;
     min-height: 36px;
    letter-spacing: 0.1em;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
    border: 1px solid #a3a3a3;
    background-color: #a3a3a3;
    color: #0c2133;
}

.userEL8991295 .search-box { overflow:hidden; clear: both; padding-bottom: 20px; }
.userEL8991295 .search-box .input-group { float:right; max-width: 460px; }
.userEL8991295 .search-box .input-group-btn > select,
.userEL8991295 .search-box .input-group-btn > select:focus,
.userEL8991295 .search-box .input-group-btn > select:hover {
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;
    border-radius: 20px;
}
.userEL8991295 .search-box .form-control,
.userEL8991295 .search-box .form-control:focus,
.userEL8991295 .search-box .form-control:hover,
.userEL8991295 .search-box .search-btn ,
.userEL8991295 .search-box .search-btn:hover, 
.userEL8991295 .search-box .search-btn:focus { 
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
.userEL8991295 .search-box .form-control { font-family: 'Questrial', 'Nanum Gothic'; font-size: 12px; color: #737373; padding: 0 5px; }
.userEL8991295 .search-box select.form-control { width: 100px; text-transform: uppercase; margin-right: 5px; }
.userEL8991295 .search-box .form-control#stx { 
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;
    border-radius: 20px;
    padding: 0 25px 0 10px;
}
.userEL8991295 .search-box .form-control#stx + .input-group-btn {
    position: absolute;
    top: 0;
    right: 23px;
}
.userEL8991295 .search-box .search-btn { 
    border: 0! important; 
    color: #191919; 
  padding: 3px 7px; 
    -wekbit-transform: translateX(1px);
    -moz-transform: translateX(1px);
    -ms-transform: translateX(1px);
    -o-transform: translateX(1px);
    transform: translateX(1px);
}

.img-responsive{

	width:150px;
}


.userEL8991295 .pagination > li > a {   
    font-family: 'Roboto', 'Nanum Gothic';
    font-size: 12px; 
    font-weight: 400;
    letter-spacing: 0.07em;
    color: #737373;
    border:none;
    background-color: transparent;
    padding: 5px 10px;
}
.userEL8991295 .pagination > li > a:hover,
.userEL8991295 .pagination > li > span:hover,
.userEL8991295 .pagination > li > a:focus,
.userEL8991295 .pagination > li > span:focus {
    background-color: transparent;
}
.userEL8991295 .pagination > .active > a,
.userEL8991295 .pagination > .active > span,
.userEL8991295 .pagination > .active > a:hover,
.userEL8991295 .pagination > .active > span:hover,
.userEL8991295 .pagination > .active > a:focus,
.userEL8991295 .pagination > .active > span:focus {
    z-index: 2;
    color: #fb4045;
    background-color: transparent;
    border: none;
}


.userEL8991295.colorSet .op_tableline10 { border-color: rgba(25,25,25,0.1); }
.userEL8991295.colorSet .op_itemline10 {border-color: rgba(25,25,25,0.1);}
.userEL8991295.colorSet .search-box .form-control,
.userEL8991295.colorSet .search-box .form-control:focus,
.userEL8991295.colorSet .search-box .form-control:hover,
.userEL8991295.colorSet .search-box .search-btn ,
.userEL8991295.colorSet .search-box .search-btn:hover, 
.userEL8991295.colorSet .search-box .search-btn:focus { border-color: rgba(25,25,25,0.15); }
.userEL8991295.colorSet .search-box .form-control { color: rgba(25,25,25,0.75); }
.userEL8991295.colorSet .search-box .search-btn { color: #191919; }
.userEL8991295.colorSet .pagination > li > a { color: rgba(25,25,25,0.6); }
.userEL8991295.colorSet .pagination > .active > a,
.userEL8991295.colorSet .pagination > .active > span,
.userEL8991295.colorSet .pagination > .active > a:hover,
.userEL8991295.colorSet .pagination > .active > span:hover,
.userEL8991295.colorSet .pagination > .active > a:focus,
.userEL8991295.colorSet .pagination > .active > span:focus { color: #191919; }




.userEL9022878 {
  padding: 30px 0; background-color: #ffffff;
}
.userEL9022878 .table { margin-bottom:0; }
.userEL9022878 .op_topBtLine50 { border-top: 1px solid #b3b5b7; } 
.userEL9022878 .table-bottom-line { margin-bottom:20px; } 
.userEL9022878 .table > thead > tr > th,
.userEL9022878 .table > tbody > tr > td  {
  line-height: 2;
  letter-spacing: 0.07em;
  text-align: center; 
  border-bottom: none;
}

.userEL9022878 .table > tbody > tr.active > td, 
.userEL9022878 .table > tbody > tr > td.active { background-color: transparent; }
.userEL9022878 .table > thead > tr > th {
  font-weight:400;
  text-transform:uppercase;
}
.userEL9022878 .table > thead > tr > th.tpl-forum-num { width: 60px; }
.userEL9022878 .table > thead > tr > th.tpl-forum-category { width: 150px; }
.userEL9022878 .table > thead > tr > th.tpl-forum-name { width: 150px; }
.userEL9022878 .table > thead > tr > th.tpl-forum-date { width: 100px; }
.userEL9022878 .table > thead > tr > th.tpl-forum-hit { width: 60px; }
.userEL9022878 .op_itemline10 {border-top: 1px solid #e0e0e0;}
.userEL9022878 .table > tbody > tr > td.tpl-forum-list-content { padding-left:20px; padding-right:20px; text-align:left; }
.userEL9022878 .table > tbody > tr > td.tpl-forum-list-content i { margin-right:5px; }
.userEL9022878 .table > tbody > tr > td.tpl-forum-list-hit { margin-left: 7px; }

.userEL9022878 .tpl-forum-header-row {
    font-family: 'Lato', 'Nanum Gothic';
    font-size: 12px;
    color: #333;
}

.userEL9022878 .tpl-forum-list-etc {
    color: #535353;
    font-size: 12px;
     font-family: 'Lato', 'Nanum Gothic';
}
.userEL9022878 .tpl-forum-list-content {
 font-family: 'Lato', 'Nanum Gothic';
    margin-top: 12px;
    font-size: 12px;
    line-height: 1.6;
    color:#191919;
}

.userEL9022878 .tpl-forum-write {
  min-width: 160px;
  font-family: 'Raleway', 'Nanum Gothic';
  font-size: 12px;
  min-height: 36px;
  letter-spacing: 0.07em;
  text-transform:uppercase;
  -webkit-box-shadow: none;
  box-shadow: none;
  -moz-border-radius: 0;
  border-radius: 0;
  border: 1px solid #191919;
  background-color: transparent;
  color: #191919;
}

.userEL9022878 .search-box { overflow:hidden; clear: both; padding-bottom: 20px; }
.userEL9022878 .search-box .input-group { float:right; max-width:460px; }
.userEL9022878 .search-box .form-control,
.userEL9022878 .search-box .form-control:focus,
.userEL9022878 .search-box .form-control:hover,
.userEL9022878 .search-box .search-btn ,
.userEL9022878 .search-box .search-btn:hover, 
.userEL9022878 .search-box .search-btn:focus { 
 background-color: transparent;
 border: 1px solid #e9e9e9; 
 -moz-border-radius: 0; 
 border-radius: 0; 
 -webkit-box-shadow: none;
 box-shadow: none;
 height: 24px;
 vertical-align: top;
}
.userEL9022878 .search-box .form-control { font-family: 'Raleway', 'Nanum Gothic'; font-size: 12px; color: #737373; padding: 0 5px; }
.userEL9022878 .search-box .form-control#stx { border-right: none; }
.userEL9022878 .search-box select.form-control { width: 100px; text-transform: uppercase; margin-right: 5px; }
.userEL9022878 .search-box .search-btn { 
 border-left: 0! important; 
 color: #191919; 
padding: 3px 7px; 
 -wekbit-transform: translateX(1px);
 -moz-transform: translateX(1px);
 -ms-transform: translateX(1px);
 -o-transform: translateX(1px);
  transform: translateX(1px);
}

.userEL9022878 .pagination > li > a { 
 font-family:  'Open sans', 'Nanum Gothic';
 font-size: 12px; 
 color: #737373;
 letter-spacing: 0.07em;
 border:none;
 background: transparent;
}
.userEL9022878 .pagination > li > a:hover,
.userEL9022878 .pagination > li > span:hover,
.userEL9022878 .pagination > li > a:focus,
.userEL9022878 .pagination > li > span:focus {
 background: transparent;
}
.userEL9022878 .table > tbody > tr > td.active, 
.userEL9022878 .table > tbody > tr > th.active, 
.userEL9022878 .table > tbody > tr.active>td, 
.userEL9022878 .table > tbody > tr.active>th { background:none; }
.userEL9022878 .pagination > .active > a,
.userEL9022878 .pagination > .active > span,
.userEL9022878 .pagination > .active > a:hover,
.userEL9022878 .pagination > .active > span:hover,
.userEL9022878 .pagination > .active > a:focus,
.userEL9022878 .pagination > .active > span:focus {
 z-index: 2;
 color: #fb4045;
 cursor: default;
 background: none;
 border-color: none;
}


.userEL9022878.colorSet .op_topBtLine50 { border-color: rgba(25,25,25,0.5); } 
.userEL9022878.colorSet .op_itemline10 { border-color: rgba(25,25,25,0.1); }
.userEL9022878.colorSet .search-box .form-control,
.userEL9022878.colorSet .search-box .form-control:focus,
.userEL9022878.colorSet .search-box .form-control:hover,
.userEL9022878.colorSet .search-box .search-btn ,
.userEL9022878.colorSet .search-box .search-btn:hover, 
.userEL9022878.colorSet .search-box .search-btn:focus { border-color: rgba(25,25,25,0.15); }
.userEL9022878.colorSet .search-box .form-control { color: rgba(25,25,25,0.75); }
.userEL9022878.colorSet .search-box .search-btn { color: #191919; }
.userEL9022878.colorSet .pagination > li > a { color: rgba(25,25,25,0.6); }
.userEL9022878.colorSet .pagination > .active > a,
.userEL9022878.colorSet .pagination > .active > span,
.userEL9022878.colorSet .pagination > .active > a:hover,
.userEL9022878.colorSet .pagination > .active > span:hover,
.userEL9022878.colorSet .pagination > .active > a:focus,
.userEL9022878.colorSet .pagination > .active > span:focus { color: #191919; }



@media only screen and (min-width:992px) {
.userEL9022878 .tpl-forum-write { position: absolute; bottom: 5px; right: 15px; }
}
@media only screen and (max-width:991px) {
 .userEL9022878 .container > .row > .table-wrap { text-align: right; }
 .userEL9022878 .container > .row > .table-wrap > .table { text-align: left; }
 .userEL9022878 .table > tbody > tr > th,
 .userEL9022878 .table > tbody > tr > td { padding:16px 10px; }
 .userEL9022878 .table > tbody > tr > td.tpl-fourm-list-content { padding-left:16px; padding-right:16px; }
}
@media only screen and (max-width:767px) {
 .userEL9022878 .table > thead > tr > th.tpl-forum-num,
 .userEL9022878 .table > thead > tr > th.tpl-forum-category,
 .userEL9022878 .table > thead > tr > th.tpl-forum-date,
 .userEL9022878 .table > thead > tr > th.tpl-forum-hit,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-num,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-category,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-date,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-hit { display: none; }
 .userEL9022878 .table > tbody > tr > th,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-content { padding-left: 10px; padding-right: 10px; }
 .userEL9022878 .table > thead > tr > th.tpl-forum-name,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-name { width: 110px; }
 .userEL9022878 .table > tbody > tr > td.tpl-fourm-list-content,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-list-name { line-height: 1.8; }
 .userEL9022878 .search-box select.form-control { width: 80px; }
}
@media only screen and (max-width:480px) {
 .userEL9022878 .table > thead > tr > th.tpl-forum-name,
 .userEL9022878 .table > tbody > tr > td.tpl-forum-name { width: 100px; }
 .userEL9022878 .tpl-forum-write { width: 100%; }
 .userEL9022878 .search-box { width: 100%; margin-left: 0; }
 .userEL9022878 .search-box select.form-control { width: 70px; }
}

.profileImg {
    border-radius: 50%;
    width :40px;
    height: 40px;
}
img, svg {
    vertical-align: middle;
}

body {
	padding-top: 50px;
	margin: auto;
}

.carousel-item>img {
	max-height: 500px;
	opacity: 0.7;
}
</style>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../layout/toolbar.jsp"></jsp:include>
<!-- ToolBar End /////////////////////////////////////-->

<!-- 메인 헤더 -->
	<div id="carouselExampleSlidesOnly"
		class="carousel slide carousel-fade" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="6000">
				<img src="/images/background/${boardCategory eq 'Moopi' ? 'notice1':'QnA2' }.jpg"
					class="d-block w-100" alt="...">
<!-- 				<div class="carousel-caption d-none d-md-block"> -->
<!-- 					<h4 class="word">Dale Carnegie</h4> -->
<!-- 					<p class="word">The royal road to a man's heart is to talk to him about the things he treasures most.</p> -->
<!-- 				</div> -->
			</div>
<!-- 			<div class="carousel-item" data-bs-interval="6000"> -->
<!-- 				<img src="/images/background/moim3.jpg" -->
<!-- 					class="d-block w-100" alt="..."> -->
<!-- 				<div class="carousel-caption d-none d-md-block"> -->
<!-- 					<h4 class="word">Tennesse Williams</h4> -->
<!-- 					<p class="word">Life is partly what we make it, and partly what it is made by the friends we choose.</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item" data-bs-interval="6000"> -->
<!-- 				<img src="/images/background/moim5.jpg" -->
<!-- 					class="d-block w-100" alt="..."> -->
<!-- 				<div class="carousel-caption d-none d-md-block"> -->
<!-- 					<h4 class="word">Albert Camus</h4> -->
<!-- 					<p class="word">Don't walk in front of me, I may not follow. Don't walk behine me, I may not lead. Walk beside me and just be my friend</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>



<div class="userEL8991295 colorSet" data-forum-type="thumb" data-fcolor="#191919" >
    <div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12">
			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>
			    
			    <br>
			    </strong></span></h3>
		   </div>
   		<form id="searchBar">
            <div class="col-xs-12 col-sm-12 col-md-12 search-box clearfix">
                <div class="input-group">
                    <div class="input-group-btn">
                        <select id="sfl" class="form-control" name="searchCondition" placeholder="Search">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>제목</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>내용</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>작성자</option>
						</select>
                    </div>
                    <input type="text" id="stx" class="form-control" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-default search-btn"><i class="fa fa-search"></i></button>
                    </span>
                    <input type="hidden" id="category" name="category" value="${boardCategory eq 'Moopi' ? '1' : '2' }"/>
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
                </div>
            </div>
        </form>
		
			<c:if test="${boardCategory eq 'QnA' }">
                <button type="button" class="btn btn-default btn-sm tpl-forum-write" data-selector=".tpl-forum-write" data-button="true" data-title="button text" onClick="fncAddBoardView()">작성하기</button>
			</c:if>
			<c:if test="${boardCategory eq 'Moopi' and dbUser.userRole eq '1' }">
				<button type="button" class="btn btn-default btn-sm tpl-forum-write" data-selector=".tpl-forum-write" data-button="true" data-title="button text" onClick="fncAddBoardView2()">작성하기</button>
			</c:if>
			
			<div class="userEL9022878 colorSet" data-fcolor="#191919">
			    <div class="container">
			        <div class="row">
			
			
			            <div class="col-xs-12 col-sm-12 col-md-12 table-wrap clearfix">
			                <div class="table-top-line op_topBtLine50"></div>
			                <table class="table">
			                    <thead>
			                        <tr class="thead-bottom-line tpl-forum-header-row" data-selector=".tpl-forum-header-row" data-font="true" data-title="header row font">
			                            <th class="ntpl-forum-num tpl-forum-num tpl-forum-header-row">no</th>
			                            <th class="ntpl-forum-content tpl-forum-content tpl-forum-header-row">제목</th>
			                            <th class="ntpl-forum-name tpl-forum-name tpl-forum-header-row">작성자</th>
			                            <th class="ntpl-forum-date tpl-forum-date tpl-forum-header-row">작성일</th>
			                            <c:if test="${boardCategory eq 'QnA' }">
			                            <th class="ntpl-forum-date tpl-forum-date tpl-forum-header-row">공개/비공개</th>
			                            <th class="ntpl-forum-date tpl-forum-date tpl-forum-header-row">답변여부</th>
			                            
			                            </c:if>
			                            <th class="ntpl-forum-date tpl-forum-date tpl-forum-header-row">조회수</th>
			                        </tr>
			                    </thead>
			                    <tbody data-loop="true" data-view="8">
			                        <c:forEach var="board" items="${list}">
			                        <c:set var="i" value="${ i+1 }"/>
			                        <tr>
			                            <td scope="row" class="tpl-forum-list-num tpl-forum-list-etc op_itemline10" style=" align-items: center !important;">${i }</td>
			                            
			                             
		                                <c:if test="${ !empty board.boardPassword}"> 
		                                <td class="tpl-forum-list-content op_itemline10"  onClick="fncGetPassword(${board.boardNo})" style=" align-items: center !important;">${board.boardName}</td>
										</c:if>
			                             <c:if test="${  empty board.boardPassword}"> 
			                            <td class="tpl-forum-list-content op_itemline10"  onClick="fncGetBoard(${board.boardNo})" style=" align-items: center !important;">${board.boardName}</td>
			                            </c:if>
			                            
			                            
			                            <td class="tpl-forum-list-name tpl-forum-list-etc op_itemline10" style="display: flex !important; align-items: center !important;"> 
			                            <img src="/images/uploadFiles/${board.boardWriter.profileImage}" class="img-responsive profileImg">
			                            <div style="margin: 5px 5px 5px 5px;">${board.boardWriter.nickname}</div></td>
			                            <td class="tpl-forum-list-date tpl-forum-list-etc op_itemline10">${board.boardRegDate}</td>
			                            
			                            <c:if test="${boardCategory eq 'QnA' }">
			                            
			                              <c:if test="${  empty board.boardPassword}"> 
			                              <td class="tpl-forum-list-date tpl-forum-list-etc op_itemline10">  
		                                  공개
		                                  </c:if> 
										  <c:if test="${ !empty board.boardPassword}"> 
										  <td class="tpl-forum-list-date tpl-forum-list-etc op_itemline10">  
										  비공개 
										  </c:if>
										</td>
			                            <td class="tpl-forum-list-date tpl-forum-list-etc op_itemline10">${ board.replyCount == 0 ? "답변대기중" : "답변완료"}</td>
			                            </c:if>
			                            </td>
			                            <td class="tpl-forum-list-date tpl-forum-list-etc op_itemline10">${ board.boardHit}</td>
			                        </tr>
			                        </c:forEach>
			                        
			                        
			                    </tbody>
			                </table>
			
			            </div> 
			
			        </div>
			    </div>
			</div>

                </div>
                
				
					<jsp:include page="../common/pageNavigator.jsp"/>	
            </div>

<%-- <div id="wrapper"><jsp:include page="../layout/footer.jsp"></jsp:include></div> --%>


</body>
</html>