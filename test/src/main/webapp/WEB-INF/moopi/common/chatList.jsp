<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
<title>무피채팅목록</title>
</head>
<body>
	<div class="chatList">
		<div>
			<div id="chatType">
				<div class="button active">유저</div>
				<div class="button">그룹</div>
			</div>
		</div>
		<div class="listOut" style="padding-top: 50px;"></div>
	</div>
	<script src="http://localhost:3030/socket.io/socket.io.js"></script>
	<!-- <script src="https://bbung95-rtc.herokuapp.com/sosocket.io/socket.io.js"></script> -->
	<script>
		let socket = io("http://localhost:3030");
		let dbUser = '<c:out value="${user.userId}"/>';

		socket.emit("roomlist", dbUser);

		socket.on("roomlist",function(data) {
				let display = '';
				for ( var i in data) {
					console.log(data[i]);
					display += '<div class="room" trgt="'+data[i].target+'" roomNo="'+data[i].roomNo
						+'"style="background: white; margin: 5px; height: 80px; border-radius: 10px;" >'
						+'<img style="margin: 5px; width:70px; height: 60px; border-radius: 50%;" src="/images/uploadFiles/poco.jpg"></img>'
						+'<span>'+data[i].name+'</span>'
				}
				$('.listOut').append(display);
				$('.room').on('click',function() {
					let trgt = $(this).attr('trgt');
					let roomNo = $(this).attr('roomNo');

					//alert("trgt : "+trgt+" userId : "+userId+" roomNo : "+roomNo); 
					location.href = "/chat/joinRoom?userId="+ dbUser+ "&trgt="+ trgt;
					})
				})
				
				
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

		// let list = document.querySelector('.list');
		// //let room = document.querySelector('.room');
		// let form = document.getElementById('form');
		// let input = document.getElementById('input');

		// form.addEventListener('submit', function (e) {
		//     e.preventDefault();
		//     // input value 존재시
		//     if (input.value) {
		//         //user.emit('create', input.value);
		//         //let item = document.createElement('div');
		//         //  item.className = "room";
		//         // item.textContent = msg;
		//         //  list.appendChild(item);

		//         input.value = '';
		//     }
		// });

		// user.on('create', function (msg) {
		//     let item = document.createElement('div');
		//     item.className = "room";
		//     item.textContent = msg;
		//     list.appendChild(item);
		// });
	</script>
	<style>
:root {
  --sc-color: #ebecf0;	/* 검색버튼 색상 */
  --sc-color2: #c7cbd4; /* 검색키워드입력 창*/
  --sc-color3: #f2f4fa; /* 검색리스트 border */
  --sc-color4: #fafbff;	/* 검색리스트 백그라운드 */
}

.chatList {
	margin: 0px;
	background: var(--sc-color4);
	overflow: auto;
	height: 600px;
}

.chatList {
	-ms-overflow-style: none;
}

.chatList::-webkit-scrollbar {
	display: none;
}

#chatType {
	position: fixed;
	height: 40px;
	top: 0;
	left: 0;
	right: 0;
	background: var(--sc-color3);
	display: flex;
	flex-wrap: nowrap;
	flex-direction: row;
	align-items: center;
	justify-content: space-evenly;
}

.button {
	width: 200px;
	height: 35px;
	line-height: 35px;
	margin-top: 5px;
	text-align: center;
	justify-content: center;
	border-radius: 6px 6px 0px 0px;
	background: var(--sc-color3);
}

.button:hover {
	background: var(--sc-color4);
}

.active {
	background: var(--sc-color4);
}
</style>
</body>

</html>