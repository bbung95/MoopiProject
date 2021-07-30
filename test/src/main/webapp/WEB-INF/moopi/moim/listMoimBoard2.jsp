<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Favicon --> 
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />

<!-- Bootstrap icons -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
<script type="text/javascript">

function fncAddBoardView(boardMoimNo){
	swal("게시글작성");
	self.location ="/moim/addBoardView?category=4&boardMoimNo="+boardMoimNo;
}

function fncGetBoard2(boardNo){
	swal("게시글조회");
	self.location ="/moim/getBoard?boardNo="+boardNo;
}


function fncGetList(currentPage){
	
	alert("페이지이동");
	alert(currentPage);
	$("#currentPage").val(currentPage)
	$("form.inline").attr("method", "GET").attr("action", "/board/listBoard").submit();
}

	
	$(function(){
		
		$("button.btn.btn-default.search-btn").on("click", function(){
			
			alert("검색")
			alert($("#searchBar").html())
			
			$("#searchBar").attr("method", "GET").attr("action", "/board/listBoard").submit();
		})
		
	})			
		
				
</script>
  
<style>

body {
	padding-top: 100px;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	background-color:#f7f6f3;
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
  padding:22px 7px;
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
 .userEL9022878 .table > tbody > tr > td { padding: 10px; }
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




</style>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../layout/toolbar.jsp"></jsp:include>
<!-- ToolBar End /////////////////////////////////////-->

<div class="userEL8991295 colorSet" data-forum-type="thumb" data-fcolor="#191919" >
    <div class="container">
        <div class="row">
			
			<div class="col-xs-12 col-sm-12 col-md-12">
			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>The Board</strong></span></h3>
		   </div>
   		<form id="searchBar">
            <div class="col-xs-12 col-sm-12 col-md-12 search-box clearfix">
                <div class="input-group">
                    <div class="input-group-btn">
                        <select id="scate" class="form-control" name="scate" placeholder="Category">
                            <option value="">category</option>
                        </select>
                    </div>
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
                    <input type="hidden" id="category" name="category" value="2"/>
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
                </div>
            </div>
        </form>

            <div class="col-xs-12 col-sm-12 col-md-12 table-wrap clearfix">

                <div class="table op_tableline10" data-loop="true" data-view="7">

				<c:forEach var="board" items="${list}">
                    <div class="col-xs-12 col-sm-12 col-md-12 no-padding item op_itemline10">
                        <div class="thumb-wrap col-xs-3 col-sm-2 col-md-2">
                            <div class="tpl-forum-list-thumb">
                                <img src="//storage.googleapis.com/i.addblock.net/sample/forum_thumb_8_1.jpg" class="img-responsive">
                            </div>
                            <div class="tpl-forum-list-num"><i class="tpl-forum-list-notice-icon cl-icon notice01" aria-hidden="true"></i></div>
                        </div>
                        <div class="cont-wrap col-xs-9 col-sm-10 col-md-10">
                            <div class="tpl-forum-list-content">
                                <span class="tpl-forum-list-title getBoard" data-selector=".tpl-forum-list-title" data-font="true" data-title="title font" name="boardNoame" onClick="fncGetBoard2(${board.boardNo})">
                                ${board.boardName}
                                </span>
                                <br><br>
                                
                                 
                            </div>
<!--                             <div class="tpl-forum-list-cont" data-selector=".tpl-forum-list-cont" data-font="true" data-title="content font">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et nisl ex. Maecenas dignissim volutpat efficitur. Nullam hendrerit dui mattis sapien pulvinar blandit.</div> -->
                            <ul>
                                <li class="tpl-forum-list-name tpl-forum-list-etc config-font-etc" data-selector=".tpl-forum-list-etc" data-font="true" data-title="others">${board.boardWriter.nickname}</li>
                                <li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc">${board.boardRegDate}</li>
<!--                                 <li class="tpl-forum-list-hit tpl-forum-list-etc config-font-etc">1</li> -->                            
                            </ul>
                        </div>
                    </div>
				</c:forEach>


                </div>
                <button type="button" class="btn btn-default btn-sm tpl-forum-write" data-selector=".tpl-forum-write" data-button="true" data-title="button text" onClick="fncAddBoardView(${boardMoimNo})">작성하기</button>
	
					<jsp:include page="../common/pageNavigator.jsp"></jsp:include>	
<!--                 <nav class="text-center clear"> -->
<!--                     <ul class="pagination pagination-sm tpl-forum-pagination"> -->
<!--                         <li><a href="#" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-angle-left"></i></span></a></li> -->
<!--                         <li class="active"><a href="#">1</a></li> -->
<!--                         <li><a href="#">2</a></li> -->
<!--                         <li><a href="#">3</a></li> -->
<!--                         <li><a href="#">4</a></li> -->
<!--                         <li><a href="#">5</a></li> -->
<!--                         <li><a href="#" aria-label="Next"><span aria-hidden="true"><i class="fa fa-angle-right"></i></span></a></li> -->
<!--                     </ul> -->
<!--                 </nav> -->

            </div>
    <jsp:include page="../layout/moimSidebar.jsp"></jsp:include>        
	<jsp:include page="../layout/searchbar.jsp"></jsp:include>
        </div>
    </div>
</div>



</body>
</html>