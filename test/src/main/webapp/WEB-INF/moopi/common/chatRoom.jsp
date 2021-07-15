<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>무피채팅방</title>
  <style>
    body {

      display: flex;
    }

    #main {
      margin: 0;
      padding-bottom: 3rem;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      width: 80%;
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

    #messages>li:nth-child(odd) {
      background: #efefef;
    }
  </style>
  <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"></script>
</head>

<body>
  <div id="main">
    <ul id="messages"></ul>
    <form id="form" action="">
      <input id="name" type="hidden" value="" />
      <input id="input" type="text" autocomplete="off" /><button>send</button>
    </form>
  </div>
  <!-- socket io 서버를 설정-->
  <script src="http://localhost:82/socket.io/socket.io.js"></script>
  <script>

    let roomNo;
    let userId = "<c:out value='${user.userId}'/>";
    let target = "<c:out value='${target}'/>";

    let form = document.getElementById('form');
    let input = document.getElementById('input');
    let messages = document.getElementById('messages');
    let list = document.getElementById('list');

    let socket = io("http://localhost:82");

    socket.emit('roomjoin', { userId: userId, target : target });
    socket.on('roomjoin', function(data){
    	roomNo = data;
    });
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

    // submit시 action이 아닌 행동(preventDefault)취소 
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      // input value 존재시

      if (input.value) {
        // user의 메세지를 'chat message'로 서버로 보낸다(?) 
        socket.emit('chat message', { userId: userId, msg: input.value, roomNo: roomNo ,target:target});
        input.value = '';    
      }
    });

    socket.on('loadchat',(data)=>{
      for (var i = 0; i < data.length; i++) {
        console.log(data[i]);
        let item = document.createElement('li');
        item.textContent = data[i].userId+" : "+data[i].msg;
        messages.appendChild(item);
        window.scrollTo(0, document.body.scrollHeight);
      }
    })
	
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
        success: function(data, state){
          //alert(state);
        }
      });
    });

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

    // 서버에서 다시 보내온 'chat message' 데이터를 읽어온다.
    socket.on('chat message', function (msg) {
      let item = document.createElement('li');
      item.textContent = msg;
      messages.appendChild(item);
      window.scrollTo(0, document.body.scrollHeight);
    });

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