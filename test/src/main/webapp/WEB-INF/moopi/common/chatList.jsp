<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-2.2.4.js"
        integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
    <title>무피채팅목록</title>
    <style>
    	
    	body{
    		
    		margin: auto;
    	}
    	
        #main {

            background: grey;
            width: 460px;
            height: 600px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header {

            font-size: 70px;
            text-align: center;
            background-color: slategrey;
        }


        .list {

            font-size: 50px;
            background: floralwhite;
            list-style: none;
            text-align: center;
        }

        .room {
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <div id="main">
        <div class="header">무피채팅목록</div>
        <div class="list"></div>
    </div>
    <script src="http://localhost:3030/socket.io/socket.io.js"></script>
    <!-- <script src="https://bbung95-rtc.herokuapp.com/sosocket.io/socket.io.js"></script> -->
	<script>
		
		let socket = io("http://localhost:3030");
		let dbUser = '<c:out value="${user.userId}"/>';
		
		socket.emit("roomlist", dbUser);
		
		socket.on("roomlist", function(data){
			let display = '';
	        for(var i in data){
				display += '<div class="room" trgt="'+data[i].target+'" roomNo="'+data[i].roomNo+'">'+data[i].target+'</div>';
	        	//display += '<div class="room">'+data[i].target+'</div>';
	        }
			$('.list').append(display);
			$('.room').on('click', function(){
				
				let trgt = $(this).attr('trgt');
				let roomNo = $(this).attr('roomNo');
				
	            //alert("trgt : "+trgt+" userId : "+userId+" roomNo : "+roomNo); 
 				location.href = "/chat/joinRoom?userId="+dbUser+"&trgt="+trgt; 
			})
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
</body>

</html>