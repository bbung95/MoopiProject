<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
	rel="stylesheet">

<div class="wrapper">
	<div id="searchList" style="display: none; height: 600px; width: 450px; border: 1px solid black; background: gray; overflow:auto;" >
			<div style="position: absolute; background: gray;">
				<button>모임무피</button>
				<button>번개무피</button>
				<button>포스팅</button>
				<button>유저</button>
			</div>
			<div class="searchOut" style="padding-top: 30px">
				
			</div>
	</div>
	<div class="searchBar" type="1">
		<input id="searchkeyword" type="text" name="searchkeyword"
			placeholder="Search" value="" />
		<button id="searchQuerySubmit" type="submit" name="searchQuerySubmit">
			<svg style="width: 24px; height: 24px" viewBox="0 0 24 24">
				<path fill="#666666"
					d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" />
      </svg>
		</button>
	</div>
</div>

<script>
	
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

	$('#searchQuerySubmit').on('click', function() {
		let searchKeyword = $('#searchkeyword').val();
		let searchType = $('.searchBar').attr('type');
		if (searchKeyword != "") {
			$.ajax({
			url: "common/json/searchList/"+searchType,	
			method: "POST",
			data: JSON.stringify({searchKeyword : searchKeyword}),
			contentType : "application/JSON",		
				type : "JSON",
				success: function(data, state){
				console.log(data.list);
				let display = '';
				for(var i in data.list){
					display += '<div style="background: white; margin: 5px; height: 100px">'
								+'<img style="margin: 5px; height:90px; width: 90px;" src="/images/uploadFiles/'+data.list[i].mmFile+'"></img>'
								+'<span>'+data.list[i].mmName+'</span><span> / '+data.list[i].mmContent+'</span>'
								+'<span> / '+data.list[i].mmCurrentCount+':'+data.list[i].mmMaxCount+'</span>'
								+'</div>';
				}
				$('.searchOut').append(display);
			}
			})
		}
	})
	
	// 요소 밖 클릭시 display none
	$(document).on('click', (e)=>{
			if(!$('.wrapper').has(e.target).length){
				console.log(e.target.id);
				$('#searchList').css('display', 'none');
			}
	})
	
	// 채팅 클릭시 display block
	$('.wrapper').on('click', function(){
		console.log('click');
		$('#searchList').css('display', 'block');
	})
	
</script>
<style>

.wrapper {
	font-family: 'Roboto', Arial, sans-serif;
	width: 100%;
	max-width: 500px;
	margin: 6rem auto;
	position: absolute;
	bottom: 0px;
	right: 0px;
}

.label {
	font-size: .625rem;
	font-weight: 400;
	text-transform: uppercase;
	letter-spacing: +1.3px;
	margin-bottom: 1rem;
}

.searchBar {
	width: 100%;
	display: flex;
	flex-direction: row;
	align-items: center;
}

#searchQueryInput {
	width: 100%;
	height: 2.8rem;
	background: #f5f5f5;
	outline: none;
	border: none;
	border-radius: 1.625rem;
	padding: 0 3.5rem 0 1.5rem;
	font-size: 1rem;
}

#searchQuerySubmit {
	width: 3.5rem;
	height: 2.8rem;
	margin-left: -3.5rem;
	background: none;
	border: none;
	outline: none;
}

#searchQuerySubmit:hover {
	cursor: pointer;
}
</style>