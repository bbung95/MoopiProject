<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!--  -->

<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
	rel="stylesheet">

<div class="searchBar">	
	<div class="searchList" >
		<div>
		<div id="searchType">
			<div class="button active">모임무피</div>
			<div class="button">번개무피</div>
			<div class="button">포스팅</div>
			<div class="button">유저</div>
		</div>
		</div>
		<div class="searchOut" style="padding-top: 50px;"></div>
	</div>
	<form class="searchbtn" action="" >
		<input type="hidden" class='type' value="1"> <input
			type="search" id="searchkeyword" name="searchkeyword" autocomplete="off"> 
			<i class="fa fa-search"></i>
	</form>
</div>

<script>
	
	var dbUser = '<c:out value="${dbUser.userId}"/>';
	/* var loading = false;
	
	$(window).scroll(
		function() {
			console.log(page);
			if ($(document).height() - $(window).height() == $(window).scrollTop()) {
				if (!loading) {
					loading = true;
					mainProduct();
				} else {
					alert("로딩중입니다.");
				}
			}
	}); */
	
	// 통합검색 ajax
	function searchList(searchKeyword , searchType){
		
		let currentPage = 1;
		
		$.ajax({
			url: "/common/json/searchList/"+searchType,	
			method: "POST",
			data: JSON.stringify({searchKeyword : searchKeyword,
							  	currentPage : currentPage}),
			contentType : "application/JSON",		
				type : "JSON",
				success: function(data, state){
					// type에 따라 리셋
					$('.searchOut').children().remove();
					let display = '';
					
					// moim
					if(searchType == 1){
						for(var i in data.list){
							display += '<div><span style="background: white; margin: 5px; height: 100px; border-radius: 10px;" onclick="location=\'moim/getMoim?mmNo='+data.list[i].mmNo+'\'">'
									+'<img style="margin: 5px; height:90px; width: 90px; border-radius: 10px;" src="/images/uploadFiles/'+data.list[i].mmFile+'"></img>'
									+'<span>'+data.list[i].mmName+'</span><span> / '+data.list[i].mmContent+'</span>'
									+'<span> / '+data.list[i].mmCurrentCount+':'+data.list[i].mmMaxCount+'</span></span>'
									if(dbUser == '' || dbUser == data.list[i].userId){
										display += '</div>';
									}else{
										display += '<button target="'+data.list[i].mmNo+'" type="2">채팅</button></div>'
									} 
						}
						$('.searchOut').append(display);
					// flash
					}else if(searchType == 2){
						for(var i in data.list){
							display += '<div style="background: white; margin: 5px; height: 100px; border-radius: 10px;" onclick="location=\'flash/getFlash?flashNo='+data.list[i].flashNo+'\'">'
									+'<img style="margin: 5px; height:90px; width: 90px; border-radius: 10px;" src="/images/uploadFiles/'+data.list[i].flashFile+'"></img>'
									+'<span>'+data.list[i].flashName+'</span><span> / '+data.list[i].flashContent+'</span>'
									+'<span> / '+data.list[i].flashCurrentCount+':'+data.list[i].flashMaxCount+'</span>'
									+'</div>';
						}
						$('.searchOut').append(display);
					// postting
					}else if(searchType == 3){
						for(var i in data.list){
							let fileArry = data.list[i].boardFile.split("/");
							
							display += '<div style="background: white; margin: 5px; height: 400px; border-radius: 10px;" >'
								+'<img style="margin: 5px; width: 40px; height: 40px; border-radius: 50%;" src="/images/uploadFiles/'+data.list[i].boardWriter.profileImage+'"></img>'
								+'<span>'+data.list[i].boardWriter.nickname+'</span>'
								+'<div align="center"><img style="margin: 5px; height: 250px;" src="/images/uploadFiles/'+fileArry[0]+'"></img></div>'
								+'<div>'+data.list[i].boardContent+'</div>'
								+'</div>';
						}
						$('.searchOut').append(display);
					// user
					}else{
						for(var i in data.list){
							 display += '<div><span style="background: white; margin: 5px; height: 80px; border-radius: 10px;" onclick="location=\'/user/getMyHome?userId='+data.list[i].userId+'\'">'
									+'<img style="margin: 5px; width:70px; height: 60px; border-radius: 50%;" src="/images/uploadFiles/poco.jpg"></img>'
									+'<span>'+data.list[i].nickname+'</span></span>'
									if(dbUser == '' || dbUser == data.list[i].userId){
										display += '</div>';
									}else{
										display += '<button target="'+data.list[i].userId+'" type="1">채팅</button>'
												+'<button target="'+data.list[i].userId+'">팔로우</button></div>';
									} 
						}
						$('.searchOut').append(display);
						
					}	
					// 채팅 버튼
					$('button:contains("채팅")').on('click', function(){
						
						let target = $(this).attr('target');
						let type = $(this).attr('type');
						
						$.ajax({
								url: "/common/chat/joinRoom/"+dbUser+"/"+target+"/"+type,
								method: "GET",
								dataType: "JSON",
								success: function(data,state){
									let url;
									if(data.type == 1){
										/* url = "http://localhost:82/chat?userId="+data.user.userId+"&trgt="+data.target.userId+"&type="+data.type
												+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname
												+"&trgtProfile="+data.target.profileImage; */
										
										url = "https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.userId+"&type="+data.type
										+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.nickname
										+"&trgtProfile="+data.target.profileImage;
									}else{
										/* url = "http://localhost:82/chat?userId="+data.user.userId+"&trgt="+data.target.mmNo+"&type="+data.type
										+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.mmName
										+"&trgtProfile="+data.target.mmFile+"&roomNo="+data.target.mmNo; */
										
										url = "https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.mmNo+"&type="+data.type
										+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.mmName
										+"&trgtProfile="+data.target.mmFile+"&roomNo="+data.target.mmNo;
									}
								popWin = window.open(
									url,
 									"popWin"+target,
									"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
								}
								
							
						})
						
					})
					
					// 채팅 버튼
					$('button:contains("팔로우")').on('click', function(){
						
						let button = $(this);
						let target = $(this).attr('target');
						$.ajax({
							url: "/user/json/follow/"+target,
							method: "GET",
							dataType: "JSON",
							success: function(data,state){
								if(data){
									button.css('background', 'gray');
								}else{
									button.css('background', '');
								}
							}
						});
					});
				}
			})
	}
	/* let searchKeyword = $('#searchkeyword').val();
	let searchType = $('.type').val(); 
	
	 $('#searchQuerySubmit').on('click', function() {
		
		if ($('#searchList').css('display') !== 'block') {
			searchList(searchKeyword , searchType);
		 } 
	}) */
	
	$('.button:contains("모임무피")').on('click', function(){
		$('.type').val('1');
		$('.active').attr('class', 'button');
		$(this).attr('class', 'button active');
		searchList($('#searchkeyword').val() , $('.type').val());
	})
	
	$('.button:contains("번개무피")').on('click', function(){
		$('.type').val('2');
		$('.active').attr('class', 'button');
		$(this).attr('class', 'button active');
		searchList($('#searchkeyword').val() , $('.type').val());
	})
	
	$('.button:contains("포스팅")').on('click', function(){
		$('.type').val('3');
		$('.active').attr('class', 'button');
		$(this).attr('class', 'button active');
		searchList($('#searchkeyword').val() , $('.type').val());
	})
	
	$('.button:contains("유저")').on('click', function(){
		$('.type').val('4');
		$('.active').attr('class', 'button');
		$(this).attr('class', 'button active');
		searchList($('#searchkeyword').val() , $('.type').val());
	})
	
	
	function unhover(){
		$('#searchkeyword').css('display', 'none');
		$('.searchbtn').css('width', '50px');
		$('.fa').css('background', '#ebecf0').css('color', '#07051a');
		$('.searchList').css('display', 'none');
	}
	
	// ajax search
	$('#searchkeyword').on('keypress', function(){
		searchList($('#searchkeyword').val() , $('.type').val());
		$('.searchList').css('display', 'block');
	})
	$('#searchkeyword').on('keyup', function(){
		searchList($('#searchkeyword').val() , $('.type').val());
		$('.searchList').css('display', 'block');
	})
	
	// hover 효과
	$('.searchbtn').hover(function() {
		if($('#searchkeyword').val().length != 0){
			$('.searchList').css('display', 'block');
		}
		$('#searchkeyword').css('display', 'block');
		$('.searchbtn').css('width', '400px').css('cursor','pointer');
		$('.fa').css('background', '#c7cbd4').css('color', 'white');
	},function(){
		console.log($('#searchkeyword').val().length);
		if($('#searchkeyword').val().length == 0){
			unhover()
		}
	})

	//요소 밖 클릭시 display none
	 $(document).on('click', (e)=>{
			if(!$('.searchBar').has(e.target).length){
				//console.log(e.target.id);
				unhover();
			}
	}) 
	
</script>
<style>
:root {
  --sc-color: #ebecf0;	/* 검색버튼 색상 */
  --sc-color2: #c7cbd4; /* 검색키워드입력 창*/
  --sc-color3: #f2f4fa; /* 검색리스트 border */
  --sc-color4: #fafbff;	/* 검색리스트 백그라운드 */
}

.searchBar{
	bottom: 20px;
	right: 20px;
	position: fixed;
}

.searchList{
	display : none;
	height: 400px;
	width: 400px;
	border: 1px solid var(--sc-color3);
	background: var(--sc-color4);
	margin-bottom: 50px;
	border-radius: 20px;
	overflow: auto;
	-ms-overflow-style: none; 
}

.searchList::-webkit-scrollbar{ 
	display:none; 
}

#searchType{
	position: fixed;
	width: 400px;
	height : 40px;	
	background: var(--sc-color3);
	display:  flex;
	margin-left : -1px;
	margin-top: -1px;
	border-radius: 20px 20px 0px 0px;
	flex-wrap: nowrap;
	flex-direction: row;
	align-items:center;
	justify-content: space-evenly;
}

.button{
	width: 90px;
	height: 35px;
	line-height: 35px;
	margin-top: 5px;
	text-align: center;
	justify-content: center;
	border-radius: 6px 6px 0px 0px;
	background: var(--sc-color3);
}

.button:hover{
	background: var(--sc-color4);
}

.active{
	background : var(--sc-color4);
}

.searchbtn {
	position: fixed;
	transition: all 0.5s;
	bottom: 20px;
	right: 20px;
	width: 50px;
	height: 50px;
	background: var(--sc-color);
	box-sizing: border-box;
	border-radius: 25px;
	border: 4px solid white;
	padding: 5px;
}

#searchkeyword {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;;
	height: 42.5px;
	line-height: 30px;
	outline: 0;
	border: 1px solid var(--sc-color2);
	display: none;
	font-size: 1em;
	border-radius: 20px;
	padding: 0 20px;
}

.fa {
	box-sizing: border-box;
	padding: 10px;
	width: 42.5px;
	height: 42.5px;
	position: absolute;
	top: 0;
	right: 0;
	border-radius: 50%;
	color: #07051a;
	text-align: center;
	font-size: 1.2em;
	transition: all 0.5s;
}

/* .searchBar:hover form{
	width: 400px;
	cursor: pointer;
}

.searchBar:hover input {
	display: block;
}

 .searchBar:hover .searchList{
	visibility: visible;
} 

.searchBar:hover .fa {
	background: var(--sc-color2);
	color: white;
}

 */


</style>