<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>무피채팅방</title>
<style>
#main {
	margin: 0px;
	padding-bottom: 3rem;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif;
}

#form {
	background: rgba(0, 0, 0, 0.15);
	padding: 0.25rem;
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	display: flex;
	height: 3rem;
	box-sizing: border-box;
	backdrop-filter: blur(10px);
}

#input {
	border: none;
	padding: 0 1rem;
	flex-grow: 1;
	border-radius: 2rem;
	margin: 0.25rem;
}

#input:focus {
	outline: none;
}

#form>button {
	background: #333;
	border: none;
	padding: 0 1rem;
	margin: 0.25rem;
	border-radius: 3px;
	outline: none;
	color: #fff;
}

#messages {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#messages>li {
	padding: 0.5rem 1rem;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>

</head>

<body>
	<div id="main">
		<img id="backbtn" src="/images/back_btn.png"
			style="height: 40px; margin-left: -5px;">
		<ul id="messages"></ul>
		<form id="form" action="">
			<button class="uploadbtn" type="button">+</button>
			<button class="videobtn" type="button">call</button>
			<input id="name" type="hidden" value="" /> <input id="input"
				type="text" autocomplete="off" />
			<button>send</button>
		</form>
		<form id="upload" action="" method="post"
			enctype="multipart/form-data">
			<input type="file" id="uploadFile" name="uploadFile"
				style="display: none;" accept="image/*" />
		</form>
	</div>
	<!-- socket io 서버를 설정-->
	<script src="http://localhost:3030/socket.io/socket.io.js"></script>
	<!-- <script src="https://bbung95-rtc.herokuapp.com/sosocket.io/socket.io.js"></script> -->
	<script>

    let userId = "<c:out value='${user.userId}'/>";
	let nickname = "<c:out value='${user.nickname}'/>"
	let profile = "<c:out value='${user.profileImage}'/>";
    let target = "<c:out value='${target}'/>"; // 알림대상 - 대화상대
    let roomNo;
    
	/* ajax({
		url: "common/json/getUser/"+userId,
		method: "GET",
		dataType: "JSON",
		success: function(data, state){
			alert(state);
		}
	}) */
    
    let input = document.getElementById('input');

    let socket = io("http://localhost:3030");

    socket.emit('roomjoin', { userId: userId, target : target });
    socket.on('roomjoin', function(data){
    	roomNo = data;
    });

    // submit시 action이 아닌 행동(preventDefault)취소 
    $('#form').on('submit', function (e) {
      e.preventDefault();
      // input value 존재시

      if (input.value) {
        // user의 메세지를 'chat message'로 서버로 보낸다(?) 
        socket.emit('chat message', { userId: userId, nickname: nickname, profile: profile, msg: input.value, img: "0", roomNo: roomNo ,target:target});
        input.value = '';    
      }
    });
	
   // 메시지 출력 함수
    function message (data){
    	let output = '';
        if(data.userId == userId){
            output += "<li align='right'>";
          	  output += "<div style='margin-left: 10px; margin-top: 10px;"
                output += "padding: 10px; border: 0.5px solid black; display: inline-block; border-radius: 5px;'>";
            if(data.img != 0){
                output += "<img src='/images/uploadFiles/chat/"+data.img+"' width='200' height='200'/>";          
            }else{
          	  output += data.msg;
            }
        }else{
       	 output += "<li>";
       	 output += "<div style='display:flex; align-items: center'><img src='/images/uploadFiles/"+data.profile+"' style='width:40px; height:40px; border-radius: 50%; margin-right: 5px;' >"
       	 output += data.nickname+"</div><div style='margin-left: 10px; margin-top: 10px;"
       	 output += "padding: 10px; border: 0.5px solid black; display: inline-block; border-radius: 5px;'>";	
     	   if(data.img != 0){
      	      output += "<img src='/images/uploadFiles/chat/"+data.img+"' width='200'/>";          
      	  }else{
      		  output += data.msg;
       	 }
        }
        output += "</div></li>";
        $(output).appendTo('#messages');
        window.scrollTo(0, document.body.scrollHeight);
      }
   
    socket.on('loadchat',(datas)=>{
        for (var i = 0; i < datas.length; i++) {
        	let data = datas[i];
        		message(data);
        }
     });
    	
     socket.on('chat message', function (data) {
    	 message (data)
    });
    
     // 메세지 보낼시 알림
    socket.on('chat notice', (msg)=>{
      console.log("알림입니다~");
      $.ajax({
        url: "/common/json/addNotice",
        method : "POST",
        contentType : "application/JSON",
        data : JSON.stringify({"toUserId" : msg.target,
                "noticeContent" : msg.msg,
                "noticeUser" : {"userId": msg.userId},
                "noticeType" : "1"}),
        dataType : "text",
        success: function(form, state){
          //alert(state);
        }
      });
    });
    
    function upload(formData){
    	// formData key &value 확인
    	/* for (var key of formData.keys()) {
    	  console.log(key);
    	}
    	for (var value of formData.values()) {
    	  console.log(value);
    	} */
    	$.ajax({
                url : "/common/json/fileUpload"
                    , method : "POST"
                    , processData : false
                    , contentType : false
                    , data : formData
                    , dataType: 'text'
                    , success:function(data, state) {
                        socket.emit('chat message', { userId: userId, nickname: nickname, profile: profile, msg: "이미지를 보냈습니다", img: data, roomNo: roomNo ,target:target});
                    }
          });
    }
    
    $('.uploadbtn').on('click', function(){
    	$('#uploadFile').click();
    });
    
    $('#uploadFile').change(function(){
    	//alert("업로드");
    	let form = $('#upload');
    	let formData = new FormData(form[0]);
    	upload(formData);
    });
    
    /////// drag & drop event
    
    $(document).on("dragenter", function(e){
     	 e.preventDefault();
     	 e.stopPropagation();
 	}).on("dragover", function(e){
     	 e.preventDefault();
     	 e.stopPropagation();
     	 $(this).css("background-color", "#FFD8D8");
 	}).on("dragleave", function(e){
     	 e.preventDefault();
     	 e.stopPropagation();
    	  $(this).css("background-color", "#FFF");
	 }).on("drop", function(e){
		  e.preventDefault();
     	 $(this).css("background-color", "#FFF");
      	let file = e.originalEvent.dataTransfer.files[0];
     	 if(file != null){
     		 if(file.length < 1){
     			 alert("파일이 존재하지 않습니다.");
     			 return;
     		 }else{
     		 	if(confirm("이미지를 업로드 하시겠습니까")){
     		    	let formData = new FormData();
     		    	formData.append("uploadFile", file);
     				upload(formData);
     		 	}
     		 }
     	 }
	 });
    ///////
    
    $('.videobtn').on('click', function(){
    	popWin = window.open(
				"https://bbung95-rtc.herokuapp.com/"+roomNo,
				//"http://localhost:3030/"+roomNo,
				"videoChat",
		"left=1000, top=300, width=1000, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

    })
    
    $('#backbtn').on('click', function(){
    	location.href="/chat/chatList";
    })
    
    // 이미지 다중 업로드 //////////////////////////////
    /* socket.on('loadchat',(data)=>{
    for (var i = 0; i < data.length; i++) {
      let item = document.createElement('li');
     console.log(data[i]);
      if(data[i].img != 0){
      	let imgs = data[i].img.split("/");
      	console.log(imgs.length);
      	item.textContent = data[i].userId+" : ";
      	for(var j = 0; j<imgs.length; j++){
      		item.textContent += "<img src='/images/uploadFiles/"+imgs[j]+"' width='100' height='100'/>;
      	}
      }else{
     	 	item.textContent = data[i].userId+" : "+data[i].msg;
      }
      messages.appendChild(item);
      window.scrollTo(0, document.body.scrollHeight);
    }
  }) */
	
  // 서버에서 다시 보내온 'chat message' 데이터를 읽어온다.
 /*  socket.on('chat message', function (msg) {
  	let item = document.createElement('li');
  	/if(data[i].img == null || data[i].img != ""){
      	let img = data[i].img.split("/");
      	item.textContent = data[i].userId+" : ";
      	for(var j = 0; j<img.length; j++){
      		item.textContent += "<img src='/images/uploadFiles/"+img[j]+"' width='100' height='100'/>;
      	}
      }else{ 
     	 	item.textContent = data.userId+" : "+data[i].msg;
      }
    messages.appendChild(item);
    window.scrollTo(0, document.body.scrollHeight);
  }); */
    //////////////////////////////////
    
    // 알림
    // function notify(msg) {
    //   if (Notification.permission !== "denied") {
    //     Notification.requestPermission(permission => {
    //       if (permission === "granted") {
    //         new Notification(`${msg}`);
    //       } else {
    //         alert('Notification denied');
    //       }
    //     });
    //   }
    // }
    // socket.on('loadlist', data => {
    //   $('#list *').remove();
    //   for (var i = 0; i < data.length; i++) {
    //     console.log(data[i]);
    //     let item = document.createElement('li');
    //     item.textContent = data[i].userId;
    //     list.appendChild(item);
    //   }
    // })

    // socket.on('addlist', function (msg) {
    //   let item = document.createElement('li');
    //   item.textContent = msg.userId;
    //   list.appendChild(item);
    // })

    // socket.on('removelist', function (msg) {
    //   $(list).children(`li:contains("${msg.userId}")`).remove();
    // })


    // socket.on('notice', (msg)=>{
    //   if (Notification.permission !== "denied") {
    //     Notification.requestPermission(permission => {
    //       if (permission === "granted") {
    //         new Notification(`${msg}`);
    //       } else {
    //         alert('Notification denied');
    //       }
    //     });
    //   }
    // })

    //  채팅
    // join.addEventListener('submit', function (e) {
    //   e.preventDefault();
    //   // input value 존재시
    //   user.emit('roomleave', { name: userName, room: roomName });
    //   roomName = room.value;
    //   user.emit('roomjoin', { name: userName, room: roomName });
    //   input.value = '';
    // });

    // socket.on('roomjoin', function (msg) {
      //   let item = document.createElement('li');
      //   item.textContent = `${msg.name}님이 ${msg.room}에 입장하셨습니다.`;
      //   messages.appendChild(item);
    //   window.scrollTo(0, document.body.scrollHeight);
    // })

    // socket.on('roomleave', function (msg) {
    //   let item = document.createElement('li');
    //   item.textContent = `${msg.name}님이 퇴장하셨습니다.`;
    //   messages.appendChild(item);
    //   window.scrollTo(0, document.body.scrollHeight);
    // })

    // socket.on('chating', function (msg) {
      //   let item = document.createElement('li');
      //   item.textContent = msg;
      //   messages.appendChild(item);
      //   window.scrollTo(0, document.body.scrollHeight);
      // });

    //  삭제
    //  user.on('delete', function(msg){
    //    $('li:contains("'+msg+'")').remove();
    //  })

    // 사용자가 입력중입니다.
    // var ing = 0;
    // function keyCheck(){
    //   if(input.value){
    //     if(ing === 0){
    //       socket.emit('chating', '가 입력중입니다....');
    //       ing++;
    //     } 
    //   }else{
    //     socket.emit('delete', '가 입력중입니다....');
    //     ing = 0;
    //   }
    // }
  </script>
</body>

</html>