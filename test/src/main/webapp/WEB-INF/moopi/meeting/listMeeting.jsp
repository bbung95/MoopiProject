<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- Toolbar CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://apis.google.com/js/api.js"></script>
<!-- 풀캘린더 -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<link href='/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/javascript/moment.min.js'></script>
<script src='/javascript/jquery.min.js'></script>
<script src='/javascript/fullcalendar.js'></script>
<script src='/javascript/theme-chooser.js'></script>
<script src='/javascript/locales-all.min.js'></script>
<script>
var mtNo ="";
var mtName="";
var mtContent="";
var userId="";
var mtStart="";
var mtStart2="";
var mtEnd="";
var mtEnd2="";
var mtMaxCount="";
var mtAddr="";
var mtConstructor="";
var mmNo="";
var mtMapX="";
var mtMapY="";


////////////////////////////////////////////구글캘린더 연동부 시작점
function authenticate() {
    return gapi.auth2.getAuthInstance()
        .signIn({scope: "https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/calendar.events"})
        .then(function() { console.log("Sign-in successful"); },
              function(err) { console.error("Error signing in", err); });
  }
  function loadClient() {
    gapi.client.setApiKey("AIzaSyAow_exiK7v12TdQlYOv1U-ttFlSpWlU2Q");
    return gapi.client.load("https://content.googleapis.com/discovery/v1/apis/calendar/v3/rest")
        .then(function() { console.log("GAPI client loaded for API"); },
              function(err) { console.error("Error loading GAPI client for API", err); });
  }
  // Make sure the client is loaded and sign-in is complete before calling this method.
  function execute() {
    return gapi.client.calendar.events.insert({
    	"calendarId": "primary",
    	"resource": {
            "end": {
              "dateTime": mtEnd2,
              "timeZone": "Asia/Seoul"
            },
            "start": {
              "dateTime": mtStart2,
              "timeZone": "Asia/Seoul"
            },
            "summary": mtName,
            "location": mtAddr,
            "description": mtContent
          }
        })
        .then(function(response) {
                // Handle the results here (response.result has the parsed body).
                console.log("Response", response);
              },
              function(err) { console.error("Execute error", err); });
  }
  gapi.load("client:auth2", function() {
    gapi.auth2.init({client_id: "674136097926-gmjcrr1v85j17s88t3pi2fodfp72hvk9.apps.googleusercontent.com"});
  });
////////////////////////////////////////////구글캘린더 연동부 종료


//맵보기//
$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#map" ).on("click" , function() {
				fncMap();
			});
		});	
		
function fncMap(){
		
	var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
	window.open("/meeting/map", "map", 'option');
}
//맵종료//



  
function fncAddMtView() {
	alert("정모를 생성합니다.");
	var displayValue = "<h6>"
	+"<form id='addMt' class='form-horizontal' name='detailForm'>"
	+"<input type='hidden' name='mmNo' value='${mmNo}'>" 
	+"정모이름 :" +"<input type='text' name='mtName'>" + "<br>"
	+"정모내용 :"+"<input type='text' name='mtContent'>" + "<br>"
	+"주최자 :"+ "<input type='text' name='userId' value='${dbUser.userId}'>" + "<br>"
	+"정모시작일 :" +"<input type='datetime-local'  name='mtStart'>"+"<br>"
	+"정모종료일 :" +"<input type='datetime-local' name='mtEnd'>"+"<br>"
	+"정모 총 인원 :"+ "<input type='text' name='mtMaxCount'>" + "<br>"
	+"<input type='hidden' name='mtCurrentCount' value='1'>" + "<br>"
	+"정모 장소 :"+"<input type='text' name='mtAddr'>" + "<br>"
	+"<a onClick='fncAddMap()' >장소등록</a><br>"
	+"<a onClick='fncAddMt()'>등록하기</a>"+ "<br>"
	+"<input type='hidden' id='lat' value=''>"
	+"<input type='hidden' id='lng' value=''>"
	+"<div class = 'mapView' ></div>"
	+"<button type='button' class='btn btn-primary' id='map' onClick='fncMap()'>지도</button>"
	+"</form>"
	+"</h6>";
	$("#getDate").slideUp('slow');
	$("#addDate").html(displayValue);
	$("#addDate").fadeIn('slow');
}

function fncUptMtView() {
	alert("정모를 수정합니다.");
	if(mtConstructor == userId){
		var displayValue = "<h6>"
			+"<form id='uptMt' class='form-horizontal' name='detailForm'>"
			+"<input type='hidden' name='mtNo' value=''>"
			+"<input type='hidden' name='mmNo' value=''>"
			+"정모이름 :" +"<input type='text' name='mtName' value=''>"+"<br>"
			+"정모내용 :"+"<input type='text' name='mtContent' value=''>"+"<br>"
			+"주최자 :"+ "<input type='text' name='userId' value=''>" + "<br>"
			+"정모시작일 :" +"<input type='datetime-local'  name='mtStart' value='' >"+"<br>"
			+"정모종료일 :" +"<input type='datetime-local' name='mtEnd' value='' >"+"<br>"
			+"정모 총 인원 :"+ "<input type='text' name='mtMaxCount' value=''>" + "<br>"
			//+"정모 현재 인원 :"+ "<input type='text' name=''>" + "<br>"
			+"정모 장소 :"+"<input type='text' name='mtAddr'>" + "<br>"
			+"<a onClick='fncUptMt()'>수정하기</a>"+ "<br>"
			+"</form>"
			+"</h6>";
			$("#getDate").slideUp('slow');
			$("#addDate").html(displayValue);
			$("#addDate").fadeIn('slow');
			$("input[name=mtNo]").val(mtNo);
			$("input[name=mmNo]").val(mmNo);
			$("input[name=mtName]").val(mtName);
			$("input[name=mtContent]").val(mtContent);
			$("input[name=userId]").val(mtConstructor);
			$("input[name=mtStart]").val(mtStart);
			$("input[name=mtEnd]").val(mtEnd);
			$("input[name=mtMaxCount]").val(mtMaxCount);
			$("input[name=mtAddr]").val(mtAddr);	
	}else{
		alert("정모 주최자 ID와 동일하지 않습니다.");
	}
}

function fncAddMap(){
	
	alert("click")
	popWin = window.open(
			"/moim/map",
			"popWin",
			"left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}

function fncParentsMapView(lat, lng){
	alert("부모 함수 실행 성공")
	
	$("div.mapView").append('<jsp:include page="../moim/mapView" />' )
	alert(lat)
	alert(lng)
	
}



function fncDeleteMt(userId) {
	if(mtConstructor == userId){
		self.location ="/meeting/deleteMeeting?mtNo="+mtNo
	}else{
		alert("정모 주최자 ID와 동일하지 않습니다.");
	}
	
	
	//$("form").attr("method", "POST").attr("action", "/meeting/addMeeting").submit();
}


function fncAddMt() {
	alert("등록완료");
	$("#addMt").attr("method", "POST").attr("action", "/meeting/addMeeting").submit();
}

function fncUptMt() {
	alert("정모를수정합니다");
	$("#uptMt").attr("method", "POST").attr("action", "/meeting/updateMeeting").submit();
}

function fncApplyMt(mtNo, userId){
	alert("해당 정모에 참가하겠습니다.");
	$.ajax( 
			{
				url : "/meeting/json/applyMeeting/"+mtNo+"/"+userId,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					alert("정모참여완료");
					$("#mtCurrentCount").val(JSONData.mtCurrentCount);
				}
		}); //ajax 종료
}//fncApplyMt 종료


function fncLeaveMt(mtNo, userId){
	alert("해당 정모에 참가를 취소하겠습니다. 한번 취소하시면 다시 참여하실수 없습니다. ");
	$.ajax( 
			{
				url : "/meeting/json/leaveMeeting/"+mtNo+"/"+userId,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					alert("정모참여 취소완료");
					$("#mtCurrentCount").val(JSONData.mtCurrentCount);
				}
		}); //ajax 종료
}//fncLeavMt 종료


function fncGetMEFL(mtNo){
	alert(mtNo);
	$.ajax( 
			{
				url : "/meeting/json/listMEFL/"+mtNo,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					alert(JSONData.list.length);
					$( "h5" ).remove();	
					let displayValue = '';
					for(var i=0;i < JSONData.list.length;i++){
					displayValue += "<h5>"
										+"유저ID	: "+JSONData.list[i].meflId.userId+"<br/>"
										+"이름  : "+JSONData.list[i].meflId.userName+"<br/>"
										+"나이  : "+JSONData.list[i].meflId.age+"<br/>"
										+"성별  : "+JSONData.list[i].meflId.gender+"<br/>"
										+"FullAddr  : "+JSONData.list[i].meflId.fullAddr+"<br/>"
										+"addr  : "+JSONData.list[i].meflId.addr+"<br/>"
										+"닉네임 		: "+JSONData.list[i].meflId.nickname+"<br/>"
										+"주소 		: "+JSONData.list[i].meflId.addr+"<br/>"
										+"프로필이미지 : "+JSONData.list[i].meflId.profileImage+"<br/>"
										+"자기소개 : "+JSONData.list[i].meflId.profileContent+"<br/>"
										+"뱃지   	   : "+JSONData.list[i].meflId.badge+"<br/>"
										+"MEFL넘버  : "+JSONData.list[i].meflNo+"<br/>"
										+"MEFL타입  : "+JSONData.list[i].meflType+"<br/>"
										+"타겟넘버   : "+JSONData.list[i].targetNo+"<br/>"
										+"참여일자   : "+JSONData.list[i].joinRegDate+"<br/>"
										+"</h5>";
							
						
						} //for문끝
						$( "#getMEFL" ).append(displayValue);
				}
		}); //ajax 종료
	
}


$(document).ready(function() {

    initThemeChooser({

      init: function(themeSystem) {
        $('#calendar').fullCalendar({
          themeSystem: themeSystem,
          googleCalendarApiKey: 'AIzaSyAow_exiK7v12TdQlYOv1U-ttFlSpWlU2Q',
          aspectRatio: 2,
          height:700,
          contentHeight:700,
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay,listMonth'
          },
          weekNumbers: true,
          //navLinks: true, // can click day/week names to navigate views
          editable: true,
          selectable: true,
          selectMirror: true,
          dateClick: function(info) {
        	  alert("정모를 생성합니다.")
          },
          eventClick: function(event) {
        	mmNo = event.no;
        	mtNo = event.id;
        	mtName = event.title;
        	mtStart = event.start;
        	mtStart2 = event.start2;
        	mtEnd = event.end;
        	mtEnd2 = event.end2;
        	mtContent = event.description;
        	mtMaxCount = event.maxCount;
        	mtConstructor = event.constructor;
        	mtAddr = event.addr;
        	console.log(mtConstructor);
			console.log(mtEnd2);
			console.log(mtStart2);
      	  $.ajax( 
    				{
    					url : "/meeting/json/getMeeting/"+mtNo,
    					method : "GET" ,
    					dataType : "json" ,
    					headers : {
    						"Accept" : "application/json",
    						"Content-Type" : "application/json"
    					},
    					success : function(JSONData , status) {
    						//alert(status);
    						//alert("JSONData : \n"+JSONData);
    						$( "h5" ).remove();	
    						$("#addDate").slideUp('slow');
    						$("#mtName").val(JSONData.mtName);
    						$("#userId").val(JSONData.mtConstructor.userId);
    						$("#mtContent").val(JSONData.mtContent);
    						$("#mtStart").val(JSONData.mtStart);
    						$("#mtStart2").val(JSONData.mtStart2);
    						mtStart2 = JSONData.mtStart2;
    						mtEnd2 = JSONData.mtEnd2;
    						$("#mtEnd").val(JSONData.mtEnd);
    						$("#mtEnd2").val(JSONData.mtEnd2);
    						$("#mtMaxCount").val(JSONData.mtMaxCount);
    						$("#mtCurrentCount").val(JSONData.mtCurrentCount);
    						$("#mtAddr").val(JSONData.mtAddr);
    						$("#mtMapX").val(JSONData.mtMapX);
    						$("#mtMapY").val(JSONData.mtMapY);
    						$("#getDate").slideDown('slow');
    					}
    			}); //ajax 종료
      	  },
          eventLimit: true, // allow "more" link when too many events
          events: [
        	  <c:forEach items="${list}" var="meeting">
              {
            	no:"${meeting.mmNo}",
            	id: "${meeting.mtNo}",
                title: "${meeting.mtName}",
                start: "${meeting.mtStart}",
                start2: "${meeting.mtStart2}",
                end: "${meeting.mtEnd}",
                end2: "${meeting.mtEnd2}",
                description: "${meeting.mtContent}",
                maxCount : "${meeting.mtMaxCount}",
                currentCount : "${meeting.mtCurrentCount}",
                constructor : "${meeting.mtConstructor.userId}",
                addr: "${meeting.mtAddr}"
                
              },
              </c:forEach>
          ],
          timeFormat: 'h(:mm)a'
        });
      },
      editable: true,
      change: function(themeSystem) {
        $('#calendar').fullCalendar('option', 'themeSystem', themeSystem);
      }

    });

  });

/*
function fncPopUp(){
	alert("팝업창생성");
	var url = "https://accounts.google.com/o/oauth2/v2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar.readonly&access_type=offline&include_granted_scopes=true&response_type=code&state=state_parameter_passthrough_value&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fmeeting%2FreceiveCode&client_id=674136097926-gmjcrr1v85j17s88t3pi2fodfp72hvk9.apps.googleusercontent.com";
    var name = "popup test";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
	
};
*/
function fncPopUp(){
	alert("팝업창생성");
	var url = "receiveCode";
    var name = "popup test";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
	
}
</script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-size: 14px;
    padding-top: 50px;
  }

  #top,
  #calendar.fc-unthemed {
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
    color: #000;
  }

  #top .selector {
    display: inline-block;	
    margin-right: 10px;
  }

  #top select {
    font: inherit; /* mock what Boostrap does, don't compete  */
  }

  .left { float: left }
  .right { float: right }
  .clear { clear: both }

  #calendar {
    max-width: 1000px;
    margin: 40px auto;
    padding: 0 10px;
    float: left;
  }
  
  #getDate {
  	float: left;
  	width: 500px;
  }

</style>
</head>
<body>

<!-- ToolBar Start ///////////////////////////////////// -->
<jsp:include page="../layout/toolbar.jsp" />
<jsp:include page="../layout/moimToolbar.jsp"/>
<!-- ToolBar End /////////////////////////////////////-->

<h3>정모일정 확인 캘린다입니다...${dbUser.userId}님 안녕하십니까..
<button type="button" class="btn btn-success" onClick="fncAddMtView()">정모 생성하기</button>
</h3>
  <div id='top'>

    <div class='left'>

      <div id='theme-system-selector' class='selector'>
        Theme System:

        <select>
          <option value='jquery-ui'>테마 변경 하기</option>
        </select>
      </div>

      <div data-theme-system="jquery-ui" class='selector' style='display:none'>
        Theme Name:

        <select>
          <option value='black-tie'>Black Tie</option>
          <option value='blitzer'>Blitzer</option>
          <option value='cupertino' selected>Cupertino</option>
          <option value='dark-hive'>Dark Hive</option>
          <option value='dot-luv'>Dot Luv</option>
          <option value='eggplant'>Eggplant</option>
          <option value='excite-bike'>Excite Bike</option>
          <option value='flick'>Flick</option>
          <option value='hot-sneaks'>Hot Sneaks</option>
          <option value='humanity'>Humanity</option>
          <option value='le-frog'>Le Frog</option>
          <option value='mint-choc'>Mint Choc</option>
          <option value='overcast'>Overcast</option>
          <option value='pepper-grinder'>Pepper Grinder</option>
          <option value='redmond'>Redmond</option>
          <option value='smoothness'>Smoothness</option>
          <option value='south-street'>South Street</option>
          <option value='start'>Start</option>
          <option value='sunny'>Sunny</option>
          <option value='swanky-purse'>Swanky Purse</option>
          <option value='trontastic'>Trontastic</option>
          <option value='ui-darkness'>UI Darkness</option>
          <option value='ui-lightness'>UI Lightness</option>
          <option value='vader'>Vader</option>
        </select>
      </div>

      <span id='loading' style='display:none'>잠시 기다려 주세요...</span>

    </div>


    <div class='clear'></div>
  </div>

  <div id='calendar'></div>
  
  <div id="addDate">
  </div>
  
  <div id="getDate">
	<!--  상세정보 div Start /////////////////////////////////////-->
	<div class="container">
	정모이름 : <input type='text' id='mtName'><br>
	정모내용 :<input type='text' id='mtContent'><br>
	주최자 : <input type='text' id='userId'><br>
	정모시작일 :<input type='text'  id='mtStart'><br>
	<input type='hidden' id='mtStart2'>
	정모종료일 :<input type='text' id='mtEnd'><br>
	<input type='hidden' id='mtEnd2'>
	정모 총 인원 :<input type='text' id='mtMaxCount'><br>
	정모 현재 인원 :<input type='text' id='mtCurrentCount'>
	<button type="button" class="btn btn-default" onClick="fncGetMEFL(mtNo)">참여한사람보기</button>
	<br>
	정모 장소 :<input type='text' id='mtAddr'><br>
	
	
	<button type="button" class="btn btn-success" onClick="fncApplyMt(mtNo, '${dbUser.userId}')">참가</button>
	<button type="button" class="btn btn-success" onClick="fncLeaveMt(mtNo, '${dbUser.userId}')">참가취소</button>
	<button type="button" class="btn btn-primary" onClick="fncUptMtView('${dbUser.userId}')">수정</button>
	<button type="button" class="btn btn-danger" onClick="fncDeleteMt('${dbUser.userId}')">삭제</button>	
	
	<a id = "connect" onClick="authenticate().then(loadClient)">구글캘린더와 연동하기</a>
	<a id = "insert" onClick="execute()">구글캘린더에 등록하기</a>
	

 	</div> <!-- 컨테이너 div종료 --> 
		<div id="getMEFL" style="padding-top: 30px"></div>
 </div> <!-- getDate div 종료 -->
<jsp:include page="../layout/searchbar.jsp"></jsp:include>

</body>
</html>
