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
	<link rel="stylesheet" href="/images/uploadFiles" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	
<script type="text/javascript">

function fncAddBoardView(){
	alert("게시글작성");
	self.location ="/board/addBoardView?category=2";
}

function fncGetBoard(boardNo){
	alert("게시글조회");
	self.location ="/board/getBoard?boardNo="+boardNo;
}


function fncGetPassword(boardNo){
	alert("비번체크");
	var boardPassword = prompt("작성하실때 입력하신 비밀번호를 입력해주세요.");
	alert(boardPassword)
	
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
			             alert(status);
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
				};
	
		$(function(){
			
			$("button.btn.btn-default.search-btn").on("click", function(){
				
				alert("검색")
				alert($("#searchBar").html())
				
				$("#searchBar").attr("method", "GET").attr("action", "/board/listBoard").submit();
			})
			
		})			
		
				
</script>
  
<style>

.userEL8991295 { position: relative; padding: 30px 0; background-color: #ffffff; }

.userEL8991295 .table { margin-bottom: 25px;  }
.userEL8991295 .op_tableline10 {
    border-top: 3px solid #eef0f4;
}
.userEL8991295 .table > .item {
    clear: both;
    position: relative;
    overflow: hidden;
}
.userEL8991295 .op_itemline10 {
     border-bottom: 1px solid #eef0f4; 
}
.userEL8991295 .table > .item:before,
.userEL8991295 .table > .item:after {
    content: ' ';
    display: block;
    position: relative;
    clear: both;
}
.userEL8991295 .table > .item * { z-index: 1; position: relative; }

.userEL8991295 .table > .item > div {
    font-family: 'Libre Baskervile','Nanum Gothic';
    vertical-align: top;
    color:#848793;
    line-height: 1.8;
    font-size: 12px;
    padding: 20px 0;
}
.userEL8991295 .table > .item > .thumb-wrap { padding-right: 3.5%; text-align:right; line-height: 1; position: relative; }

.userEL8991295 .table > .item > .cont-wrap > ul > li { display: inline-block; float: left; line-height: 1.4; }
.userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):not(:empty):before,
.userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):empty + li:not(.hidden):not(:empty):before,
.userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li:not(.hidden):not(:empty):before,
.userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li:not(.hidden):not(:empty):before,
.userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:empty:not(.hidden)  + li.hidden + li:not(.hidden):not(:empty):before,
.userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li.hidden + li:not(.hidden):not(:empty):before {
    content: '|';
    margin: 0 10px;
    position: relative;
    display: inline-block;
    float: left;
}

.userEL8991295 .tpl-forum-list-title {
    font-family: 'Libre Baskervile','Nanum Gothic';
    display: inline-block;
    font-size: 24px;
    font-weight: 400; 
    line-height: 1.4;
    margin-right: 7px;
    color:#535353;
}

.userEL8991295 .tpl-forum-list-etc {
    font-family: 'Libre Baskervile','Nanum Gothic';
    color: #afafaf;
    font-size: 12px;
    margin-top: 5px;
}
.userEL8991295 .tpl-forum-list-cont {
    font-family: 'Libre Baskervile','Nanum Gothic';
    color: #818181;
    font-size: 12px;
    overflow: hidden;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
    display: block;
    display: -webkit-box; 
    margin-top: 12px;
    margin-bottom: 8px;
}



.userEL8991295 .table > .item > .cont-wrap .tpl-forum-list-hit:not(.hidden):not(:empty):after, 
.userEL8991295 .table > .item > .cont-wrap .tpl-forum-list-comment:not(.hidden):not(:empty):after {
    display: inline-block;
    position: relative;
    top: 0; left: 0;
    float: left;
    font-family: 'FontAwesome';
    margin-right: 3px;
}
.userEL8991295 .table > .item > .cont-wrap .tpl-forum-list-hit:not(.hidden):not(:empty):after { content: '\f06e'; }
.userEL8991295 .table > .item > .cont-wrap .tpl-forum-list-comment:not(.hidden):not(:empty):after { content: '\f0e5'; }


.userEL8991295 .table > .item > .thumb-wrap .tpl-forum-list-thumb img { min-width: 100%; }
.userEL8991295 .table > .item > .thumb-wrap .tpl-forum-list-num {
    display: inline-block;
    position: absolute;
    top: 20px; left: 0;
    padding: 6px 4px;
    line-height: 1;
    min-width: 22px;
    text-align: center;
    background-color: rgba(0,0,0,0.2);
    color:#fff;
    font-size:13px;
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
    color: #ffffff;
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



@media only screen and (max-width:768px) {
    .userEL8991295 .table { margin-bottom: 20px; }
    .userEL8991295 .table > .item > .cont-wrap,
    .userEL8991295 .table > .item > .thumb-wrap { padding-top: 16px; padding-bottom: 16px; }
    .userEL8991295 .table > .item > .thumb-wrap { padding-right: 5%; }
    .userEL8991295 .table > .item > .thumb-wrap .tpl-forum-list-num { top: 16px; }
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):empty + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:empty:not(.hidden)  + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li.hidden + li:not(.hidden):not(:empty):before { margin: 0 8px; }
    .userEL8991295 .table > .item > .cont-wrap .tpl-forum-list-cont { margin-top: 9.6px; margin-bottom: 6.4px; }
    .userEL8991295 .search-box { padding-bottom: 16px; }
}
@media only screen and (max-width:480px) {
    .userEL8991295 .table { margin-bottom: 12.5px; }
    .userEL8991295 .table > .item > .cont-wrap { width: 70%; padding: 10px 0; }
    .userEL8991295 .table > .item > .thumb-wrap { width: 30%; padding: 10px 5% 10px 0; }
    .userEL8991295 .table > .item > .thumb-wrap .tpl-forum-list-num { top: 10px; }
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:not(.hidden):empty + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li:empty:not(.hidden)  + li.hidden + li:not(.hidden):not(:empty):before,
    .userEL8991295 .table > .item > .cont-wrap > ul > li:not(.hidden):not(:empty) + li.hidden + li.hidden + li.hidden + li:not(.hidden):not(:empty):before { margin: 0 5px; }
    .userEL8991295 .table > .item > .cont-wrap .tpl-forum-list-cont { margin-top: 6px; margin-bottom: 4px; }
    .userEL8991295 .search-box { padding-bottom: 10px; }
}

</style>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="../../layout/toolbar.jsp"></jsp:include>
<!-- ToolBar End /////////////////////////////////////-->

<div class="userEL8991295 colorSet" data-forum-type="thumb" data-fcolor="#191919" >
    <div class="container">
        <div class="row">
			
			<div class="col-xs-12 col-sm-12 col-md-12">
			    <h3 class="head_title" data-edit="true" data-selector="h3.head_title" ><span class="fsize20" ><strong>문의 게시판</strong></span></h3>
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
                                 <c:if test="${  empty board.boardPassword}"> 
                                <span class="tpl-forum-list-title getBoard" data-selector=".tpl-forum-list-title" data-font="true" data-title="title font" name="boardNoame" onClick="fncGetBoard(${board.boardNo})">
                                ${board.boardName}
                                </c:if>
                                <c:if test="${ !empty board.boardPassword}"> 
                                <span class="tpl-forum-list-title checkPassword" data-selector=".tpl-forum-list-title" data-font="true" data-title="title font" "name=boardNoame" onClick="fncGetPassword(${board.boardNo})">
								${board.boardName} 
								</c:if>
                                <br><br>
                                
                                 </span>
                            </div>
<!--                             <div class="tpl-forum-list-cont" data-selector=".tpl-forum-list-cont" data-font="true" data-title="content font">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et nisl ex. Maecenas dignissim volutpat efficitur. Nullam hendrerit dui mattis sapien pulvinar blandit.</div> -->
                            <ul>
                                <li class="tpl-forum-list-name tpl-forum-list-etc config-font-etc" data-selector=".tpl-forum-list-etc" data-font="true" data-title="others">${board.boardWriter.nickname}</li>
                                <li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc">${board.boardRegDate}</li>
<!--                                 <li class="tpl-forum-list-hit tpl-forum-list-etc config-font-etc">1</li> -->
                                
                                <c:if test="${  empty board.boardPassword}"> 
                                <li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc" id="getBoard" onClick="fncGetBoard(${board.boardNo})">
                                공개
                                </c:if> 
								<c:if test="${ !empty board.boardPassword}"> 
								<li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc" id="checkPassword" name="checkPassword" onClick="fncGetPassword(${board.boardNo})">
								비공개 
								</c:if>
								</li>
								<li class="tpl-forum-list-date tpl-forum-list-etc config-font-etc">
								${ board.replyCount == 0 ? "답변대기중" : "답변완료"}
                            </ul>
                        </div>
                    </div>
				</c:forEach>






                </div>
                <button type="button" class="btn btn-default btn-sm tpl-forum-write" data-selector=".tpl-forum-write" data-button="true" data-title="button text" onClick="fncAddBoardView()">작성하기</button>
	
					<jsp:include page="../../common/pageNavigator.jsp"></jsp:include>	
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
	<jsp:include page="../../layout/searchbar.jsp"></jsp:include>
        </div>
    </div>
</div>


--------------------
</body>
</html>