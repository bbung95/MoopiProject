<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- BootStart -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Hello! Moopi!</title>

<!-- 타임픽커 -->
<link rel="stylesheet" href="/css/bootstrap-material-datetimepicker.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />

<!-- Bootstrap icons -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/scripts.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->
<!-- <link rel="stylesheet" href="/css/owl.carousel.min.css"> -->
<!-- <link rel="stylesheet" href="/css/owl.theme.default.min.css"> -->

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- (구) Toolbar CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->

<!-- 구글 API -->
<script src="https://apis.google.com/js/api.js"></script>
<!-- 풀캘린더 -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css'
	rel='stylesheet'>
<link href='/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' />
<script src='/javascript/moment.min.js'></script>
<script src='/javascript/jquery.min.js'></script>
<script src='/javascript/fullcalendar.js'></script>
<script src='/javascript/theme-chooser.js'></script>




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
var mtCurrentCount="";
var mtAddr="";
var mtConstructor="";
var constructor="";
var mmNo="";
var mtMapX="";
var mtMapY="";
var lat = "";
var lng = "";
var check = '${dbUser.userId}';





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
        .then(function() { 
        	swal("구글캘린더 연동이 완료되었습니다. 캘린더에 등록하시려면 구글캘린더에 등록하기 버튼을 눌러주세요.")
        	console.log("GAPI client loaded for API"); },
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
               	swal("구글 캘린더에 등록되었습니다.");
              },
              function(err) { console.error("Execute error", err); });
  }
  gapi.load("client:auth2", function() {
    gapi.auth2.init({client_id: "674136097926-gmjcrr1v85j17s88t3pi2fodfp72hvk9.apps.googleusercontent.com"});
  });
////////////////////////////////////////////구글캘린더 연동부 종료

$(function(){
    $('#uptButton').click(function(){
        swal("수정");
        $("#UmtName2").val(mtName);
        $("#UmtMaxCount2").val(mtMaxCount);
//         $("#mtStart4").val(mtStart);
//         $("#mtEnd4").val(mtEnd);
        $("#UmtAddr2").val(mtAddr);
        $("#UmtAddr2").val(mtAddr);
        $("#UmmNo").val(mmNo);
        $("#UmtNo").val(mtNo);
        $("#UmtCurrentCount2").val(mtCurrentCount);
        $("#UmtConstructor").val(mtConstructor);
        
    });
});

  
// function fncAddMtView() {
// 	swal("정모를 생성합니다.");
// 	var displayValue = "<h6>"
// 	+"<form id='addMt' class='form-horizontal' name='detailForm'>"
// 	+"<input type='hidden' name='mmNo' value='${moim.mmNo}'>" 
// 	+"정모이름 :" +"<input type='text'  name='mtName'>" + "<br>"
// 	+"정모내용 :"+"<input type='text' name='mtContent'>" + "<br>"
// 	+"<input type='hidden' name='userId' value='${dbUser.userId}'>" 
// 	+"정모시작일 :" +"<input type='text'  class='mtTime'  name='mtStart'>"+"<br>"
// 	+"정모종료일 :" +"<input type='text' class='mtTime' name='mtEnd'>"+"<br>"
// 	+"정모 총 인원 :"+ "<input type='text' name='mtMaxCount'>" 
// 	+"<input type='hidden' name='mtCurrentCount' value='1'>" + "<br>"
// 	+"정모 장소 :"+"<input type='text' id='mtAddr' name='`'>" + "<br>"
// 	+"<input type='hidden' id='lat'name='mtMapX' value=''>"
// 	+"<input type='hidden' id='lng'name='mtMapY' value=''>"
// 	+"<a onClick='fncAddMap()' >장소등록</a><br>"
// 	+"<a onClick='fncAddMt()'>등록하기</a>"+ "<br>"
// 	+"<button type='button' class='btn btn-primary' id='map' onClick='fncMap('"+#lat.value()+"', '"+lng.value()+"')'>지도</button>"
// 	+"</form>"
// 	+"</h6>";
// 	$("#getDate").slideUp('slow');
// 	$("#addDate").html(displayValue);
// 	$("#addDate").fadeIn('slow');
// }


//카카오 스크립트 시작
</script>


<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 80px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}
/*    인포창 디자인과 색깔. */
.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #c6cfff;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>







<script>

$('#event').click(function(){
       //id가 "followModal"인 모달창을 열어준다. 
    $('.modal-title').text("팔로우");    //modal 의 header 부분에 "팔로우"라는 값을 넣어준다. 
});




function fncUptMtView() {
	alert("정모를 수정합니다.");
// 	if(mtConstructor == ${dbUser.userId}){

// 		var displayValue = "<h6>"
// 			+"<form id='uptMt' class='form-horizontal' name='detailForm'>"
// 			+"<input type='hidden' name='mtNo' value=''>"
// 			+"<input type='hidden' name='mmNo' value=''>"
// 			+"정모이름 :" +"<input type='text' name='mtName' value=''>"+"<br>"
// 			+"정모내용 :"+"<input type='text' name='mtContent' value=''>"+"<br>"
// 			+"주최자 :"+ "<input type='text' name='userId' value=''>" + "<br>"
// 			+"정모시작일 :" +"<input type='text' id='uptStartTime' name='mtStart' value='' >"+"<br>"
// 			+"정모종료일 :" +"<input type='text' id='uptEndTime' name='mtEnd' value='' >"+"<br>"
// 			+"정모 총 인원 :"+ "<input type='text' name='mtMaxCount' value=''>" + "<br>"
// 			+"정모 장소 :"+"<input type='text' name='mtAddr'>" + "<br>"
// 			+"<a onClick='fncUptMt()'>수정하기</a>"+ "<br>"
// 			+"</form>"
// 			+"</h6>";
// 			$("#getDate").slideUp('slow');
// 			$("#addDate").html(displayValue);
// 			$("#addDate").fadeIn('slow');
// 			$("input[name=mtNo]").val(mtNo);
// 			$("input[name=mmNo]").val(mmNo);
// 			$("input[name=mtName]").val(mtName);
// 			$("input[name=mtContent]").val(mtContent);
// 			$("input[name=userId]").val(mtConstructor);
// 			$("input[name=mtStart]").val(mtStart);
// 			$("input[name=mtEnd]").val(mtEnd);
// 			$("input[name=mtMaxCount]").val(mtMaxCount);
// 			$("input[name=mtAddr]").val(mtAddr);	
// 	}else{
// 		alert("정모 주최자 ID와 동일하지 않습니다.");
// 	}
// 			$('#uptStartTime').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
// 			$('#uptEndTime').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
}

function fncAddMap(){
	
	mtAddr = $('.form-control.mtAddr').val()	
	popWin = window.open(
			"/meeting/map?mtAddr="+mtAddr,
// 			"/moim/map?mtAddr="+mtAddr,
			"popWin",
			"left=460, top=300, width=800, height=500, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
} 

$(function(){
	
	$("#map1").on("click", function (){
		
// 		alert("맵")
// 		console.log($(this).parent().html())	
// 		console.log(mtMapX)	
// 		var lat = mtMapX 주석풀기
// 		var lng = mtMapY 주석풀기
// 		alert(lat)
// 		alert(lng)
		fncMap(lat, lng)
	})
})





function fncMap(lat, lng){
// 	alert(lat)
// 	alert(lng)
	var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
// 	window.open("/moim/mapView", "map", 'option');
// 	window.open("/moim/mapView?lat="+lat+"&lng="+lng+"&mtAddr="+mtAddr +"&mtContent="+mtContent, "map", "option");
	
	$.ajax( 
			{
				url : "meeting/json/mapView?lat="+lat+"&lng="+lng+"&mtAddr="+mtAddr +"&mtContent="+mtContent,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
// 					alert(status);
				}
		}); //ajax 종료
// 	$(".frm").submit();
	}
	

// function fncParentsMapView(lat, lng, mtAddr){
function fncParentsMapView(lat, lng){
	
// 	alert("부모 함수 실행 성공")
	
//  	<script type=text/javascript src='/js/mapView.js'><\/script> 
// 	alert(lat)
// 	alert(lng)
// 	alert(mtAddr)
	
}



function fncDeleteMt(userId) {
	if(mtConstructor == userId){
		self.location ="/meeting/deleteMeeting?mtNo="+mtNo
	}else{
		swal("정모 주최자 ID와 동일하지 않습니다.");
	}
	
	
	//$("form").attr("method", "POST").attr("action", "/meeting/addMeeting").submit();
}


function fncAddMt() {
// 	alert("등록완료");
// 	alert($('#lat').value)
	$("#addMt").attr("method", "POST").attr("action", "/meeting/addMeeting").submit();
}

function fncUptMt() {
	alert("정모를수정합니다");
	$("#uptMt2").attr("method", "POST").attr("action", "/meeting/updateMeeting").submit();
}

function fncApplyMt(mtNo, userId){
	
	if(check == undefined){
		
		alert("로그인후 이용가능합니다.")
		return;
	}
	
	$.ajax( 
			{
				url : "/meeting/json/applyMeeting/"+mmNo+"/"+mtNo+"/"+userId,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
// 					alert(status);
					swal("정모참여완료");
					$("#mtCurrentCount").text(JSONData.mtCurrentCount);
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
					swal("정모참여 취소완료");
					$("#mtCurrentCount").text(JSONData.mtCurrentCount);
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
// 					alert(JSONData.list.length);
					$( "#mfllist" ).remove();	
// 					let displayValue = "<h3>" + "참여자 목록" + "</h3>";
					let displayValue = "";
					for(var i=0;i < JSONData.list.length;i++){
					displayValue += "<div id=\"mfllist\">"
										+ '<img class=\"userProfile\" src=\"/images/uploadFiles/'+JSONData.list[i].meflId.profileImage+'\">'
										+JSONData.list[i].meflId.nickname
										+"</div>";
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
        	  //alert("정모를 생성합니다.")
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
        	mtCurrentCount = event.currentCount;
        	mtConstructor = event.constructor;
        	mtAddr = event.addr;
        	mtMapX = event.mtMapX;
        	mtMapY = event.mtMapY;
		 	lat = mtMapX;
		 	lng = mtMapY;
		 	fncMap(lat, lng);
        	console.log(mtConstructor);
			console.log(mtMapX);
			console.log(mtStart2);
			
      	  $.ajax( 
    				{
    					url : "/meeting/json/getMeeting/"+mtNo+"/"+check,
    					method : "GET" ,
    					dataType : "json" ,
    					headers : {
    						"Accept" : "application/json",
    						"Content-Type" : "application/json"
    					},
    					success : function(data , status) {
    						//alert(status);
    						//alert("JSONData : \n"+JSONData);
    						
    						let meeting = data.meeting;
    						
    						$( "h5" ).remove();	
//     						$("#addDate").slideUp('slow');
    						$("#mtName").text(meeting.mtName);
    						$("#mtName7").val(meeting.mtName);
    						$("#mtContent7").val(meeting.mtContent);
    						$("#mtMaxCount7").val(meeting.mtMaxCount);
    						$("#mtCurrentCount7").val(meeting.mtCurrentCount);
    						$("#mtStart7").val(meeting.mtStart);
    						$("#mtEnd7").val(meeting.mtEnd);
    						console.log(mtName);
    						$("#UmtName2").text(meeting.mtName);
    						$("#uptMt2 > input[name='mtName']").val(meeting.mtName);
    						$("#userId").text(meeting.mtConstructor.nickname);
    						$("#mtContent").text(meeting.mtContent);
    						$("#UmtContent").text(meeting.mtContent);
    						$("#mtStart").text(meeting.mtStart);
    						$("#mtStart3").text(meeting.mtStart);
    						$("#mtStart2").val(meeting.mtStart2);
    						$("#UmtStart2").val(meeting.mtStart2);
    						mtStart2 = meeting.mtStart2;
    						mtEnd2 = meeting.mtEnd2;
    						$("#mtEnd").text(meeting.mtEnd);
    						$("#mtEnd3").text(meeting.mtEnd);
    						$("#mtEnd2").val(meeting.mtEnd2);
    						$("#UmtEnd2").val(meeting.mtEnd2);
    						$("#mtMaxCount").text(meeting.mtMaxCount);
    						$("#UmtMaxCount2").text(meeting.mtMaxCount);
    						$("#mtCurrentCount").text(meeting.mtCurrentCount);
    						$("#UmtCurrentCount").text(meeting.mtCurrentCount);
    						$("#mtAddr").text(meeting.mtAddr);
    						$("#UmtAddr").text(meeting.mtAddr);
    						$("#mtMapX").val(meeting.mtMapX);
    						$("#UmtMapX").val(meeting.mtMapX);
    						$("#mtMapY").val(meeting.mtMapY);
    						$("#UmtMapY").val(meeting.mtMapY);
    						$("#getDate").slideDown('slow');
    						
    						let btnlist = '';
    						let checkUserId = meeting.mtConstructor.userId;
    						
    						$('.btnlist').children().remove();
    						
    						if(data.check == 2){
    							btnlist += '<button type="button" class="btn btn-success"'
    	    						  	 +'onClick="fncLeaveMt('+mtNo+',\''+check+'\')">참가취소</button>'
    						}else if(data.check == 1){
    							btnlist += '<button type="button" class="btn btn-success"'
        								+'onClick="fncApplyMt('+mtNo+',\''+check+'\')">참가</button>'
    						}else if(data.check == 3){
    							btnlist += '<div>참가취소 회원입니다.</div>'
    						}
    						
    						if(check == checkUserId){
    							
    							btnlist += '<button type="button" class="btn btn-primary" id="uptButton"'
        								+'data-bs-target="#myModal2" data-bs-toggle="modal">수정</button>'
        								+'<button type="button" class="btn btn-danger"'
        								+'onClick="fncDeleteMt('+check+')">삭제</button>'
    						}
    						
    						$('.btnlist').append(btnlist);
    						
    						
    						relayout();
    						setMarker(meeting.mtMapX, meeting.mtMapY, meeting.mtAddr, meeting.mtContent);
//     						$('#myModal3').modal("show");

    					}
    			}); //ajax 종료
      	  },
          eventLimit: true, // allow "more" link when too many events
          events: [
        	  <c:forEach items="${list}" var="meeting">
              {
            	no:"${meeting.mmNo}",
            	id: "${meeting.mtNo}",
            	backgroundColor : "#1CD803",
                borderColor : "#FCF64A",
                textColor : "#FFFFFF",
                title: "${meeting.mtName}",
                start: "${meeting.mtStart}",
                start2: "${meeting.mtStart2}",
                end: "${meeting.mtEnd}",
                end2: "${meeting.mtEnd2}",
                description: "${meeting.mtContent}",
                maxCount : "${meeting.mtMaxCount}",
                currentCount : "${meeting.mtCurrentCount}",
                constructor : "${meeting.mtConstructor.userId}",
                addr: "${meeting.mtAddr}",
                mtMapX : "${meeting.mtMapX}",
                mtMapY : "${meeting.mtMapY}"
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
// function fncPopUp(){
// 	alert("팝업창생성");
// 	var url = "receiveCode";
//     var name = "popup test";
//     var option = "width = 500, height = 500, top = 100, left = 200, location = no"
//     window.open(url, name, option);
	
// }
</script>


<style>
body {
	margin: 0;
	padding: 0;
	font-size: 14px;
	padding-top: 100px;
	/* 	background-color: #f7f6f3; */
}

#top, #calendar.fc-unthemed {
	
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

.left {
	float: left
}

.right {
	float: left
}

.clear {
	clear: both
}

#calendar {
	max-width: 900px;
	max-height: 760px;
	/* 	margin: 40px auto; */
	margin-left: 100px;
	/* 	padding: 0 10px; */
	padding-top: 30px;
	float: left;
}

#getDate {
	padding-top: 30px;
	padding-left: 20px;
	margin-left: 20px;
	display: none;
	float: left;
	width: 380px;
	height: 800px;
	/*  	border: 1.5px solid rgba(0, 0, 0, 0.2);  */
	font-size: 16px;
	/* 	background-image: url("/images/background/back3.png") */
}

#addMt {
	border: 1.5px solid rgba(0, 0, 0, 0.2);
	/*   	font-family: 'Nanum Brush Script', cursive;	 */
	font-size: 20px;
}

#locate {
	float: left;
}

.userProfile {
	margin: 10px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
}

.add {
	cursor: pointer;
}

#insert {
	display: none;
}
</style>


</head>
<body>

	<!-- ToolBar Start ///////////////////////////////////// -->
	<jsp:include page="../layout/toolbar.jsp" />
	<%-- <jsp:include page="../layout/moimToolbar.jsp"/> --%>
	<!-- ToolBar End /////////////////////////////////////-->

		<center>
			<h3>
				Your Meeting Calendar
				<!-- <button type="button" class="btn btn-success" onClick="fncAddMtView()">정모 생성하기</button> -->
				<c:if test="${dbUser != ''}">
					<c:if test="${check.memberRole == 2 || check.memberRole == 3 ||check.memberRole == 4}">
					<span><img class="add" src="/images/plus2.png" width="40"
						height="40" data-bs-target="#myModal" data-bs-toggle="modal" /></span>
					</c:if>
				</c:if>
			</h3>
		</center>


		<div class="container">

			<!-- Modal 시작-->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">Meeting Create!</h4>
						</div>
						<div class="modal-body">
							<!-- 폼시작 -->

							<!-- form Start /////////////////////////////////////-->

							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
							<script type="text/javascript"
								src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
							<script type="text/javascript"
								src="/javascript/bootstrap-material-datetimepicker.js"></script>




							<form id="addMt" class="form-horizontal" name="detailForm">
								<input type="hidden" name="userId" value="${dbUser.userId}">
								<input type='hidden' name='mmNo' value='${moim.mmNo}'>
								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Title</label>
									<div class="col-sm-20">
										<input type="text" class="form-control" name="mtName"
											placeholder="모임명">
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Content</label>
									<div class="col-sm-40">
										<textarea style="resize: none" class="form-control"
											name="mtContent" placeholder="50자이내"></textarea>
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Number
										of People</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" name="mtMaxCount">
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Start
										Time</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" id="mtStart3"
											name="mtStart">
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">End
										Time</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" id="mtEnd3"
											name="mtEnd">
									</div>
								</div>


								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">정모장소</label>
									<div class="col-sm-40">
										<input type="text" class="form-control mtAddr" id="mtAddr"
											name="mtAddr" style="width: 250px; display: inline-block;">
										<button type="button" class="btn btn-info"
											onClick='fncAddMap()'>장소검색</button>
										<input type='hidden' id='lat' name='mtMapX' value=''>
										<input type='hidden' id='lng' name='mtMapY' value=''>

									</div>
								</div>


								<br>

							</form>

							<!-- 폼끝 -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onClick="fncAddMt()">Create</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 모달끝 -->


			<!-- 모달2 시작 -->

			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">Meeting Update!</h4>
						</div>
						<div class="modal-body">


							<form id="uptMt" class="form-horizontal" name="detailForm">
								<input type="hidden" name="userId" value="${dbUser.userId}">
								<input type='hidden' name='mmNo' value="${mmNo}"> <input
									type='hidden' name='mtNo'> <input type="hidden"
									name="mtCurrentCount">

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임명</label>
									<div class="col-sm-20">
										<input type="text" class="form-control" name="mtName">
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
									<div class="col-sm-40">
										<textarea style="resize: none" class="form-control"
											name="mtContent" placeholder="50자이내"></textarea>
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최대참가인원</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" name="mtMaxCount">
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Start
										Time</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" id="mtStart4"
											name="mtStart">
									</div>
								</div>

								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">End
										Time</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" id="mtEnd4"
											name="mtEnd">
									</div>
								</div>



								<br>

								<div class="form-group">
									<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">정모장소</label>
									<div class="col-sm-40">
										<input type="text" class="form-control" id="UmtAddr2"
											name="mtAddr">
									</div>
								</div>

								<br> <input type='hidden' id='lat' name='mtMapX' value=''>
								<input type='hidden' id='lng' name='mtMapY' value=''>
								<button type="button" class="btn btn-info" onClick='fncAddMap()'>장소등록</button>
								<br>

							</form>

							<!-- 폼끝 -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onClick="fncUptMt()">Update</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 모달끝 -->
			<!-- 모달2 끝 -->

			<div class="container2">

				<div id='top'>

					<div class='left'>

						<div id='theme-system-selector' class='selector'>
							Theme System: <select>
								<option value='jquery-ui'>choose theme</option>
							</select>
						</div>

						<div data-theme-system="jquery-ui" class='selector'
							style='display: none'>
							Theme Name: <select>
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

						<span id='loading' style='display: none'>잠시 기다려 주세요...</span>

					</div>


					<div class='clear'></div>
				</div>

				<div id='calendar'></div>


				<div id="addDate"></div>

			</div>
			<form class="frm">
				<div id="getDate">
					<a id="connect" onClick="authenticate().then(loadClient)"
						class="text-decoration-none" data-bs-toggle="tooltip"
						data-bs-placement="top" title="구글 캘린더 등록하기전 먼저 연동해주세요."> <svg
							xmlns="http://www.w3.org/2000/svg"
							style="margin-top: 5px; margin-left: 5px" width="16" height="16"
							fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
  <path
								d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
</svg>
					</a>
					<!--  상세정보 div Start /////////////////////////////////////-->

					<i class="bi bi-brightness-low"></i>정모명 : <span id='mtName'></span><br>
					<i class="bi bi-brightness-low"></i>모임내용 :<span id='mtContent'></span><br>
					<i class="bi bi-brightness-low"></i>주최자 : <span id='userId'></span><br>
					<i class="bi bi-brightness-low"></i>시작일 : <span id='mtStart'></span><br>
					<input type='hidden' id='mtStart2'> <i
						class="bi bi-brightness-low"></i>종료일 : <span id='mtEnd'></span><br>
					<input type='hidden' id='mtEnd2'> <i
						class="bi bi-brightness-low"></i><i class="bi bi-people-fill"></i>
					<span id='mtCurrentCount'></span> / <span id='mtMaxCount'></span>


					<!-- 				<button type="button" class="btn btn-info" -->
					<!-- 					>참여한사람보기</button> -->


					<button type="button" class="btn btn-light"
						onClick="fncGetMEFL(mtNo)">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="16"
							fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" /> 
  <path
								d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
</svg>
					</button>

					<br> <input type='hidden' id="mtMapX"> <input
						type='hidden' id="mtMapY">

					<div class="btnlist"></div>
					<div></div>
					<div>
						<button style="margin-top: 5px" id="insert " type="button"
							class="btn btn-warning" onClick="execute()">구글캘린더에 등록하기</button>
						<br>
					</div>
					<i class="bi bi-brightness-low" style="margin-top: 10px"></i>location
					<span id='mtAddr'></span>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<div id="getMEFL" style="padding-top: 30px"></div>
					<div></div>

					<br>

				</div>
				<!-- getDate div 종료 -->

			</form>
		</div>
	<!-- Modal3 -->
	<!-- Modal 시작-->
	<!-- 	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" -->
	<!-- 		aria-labelledby="myModalLabel"> -->
	<!-- 		<div class="modal-dialog modal-lg" role="document"> -->
	<!-- 			<div class="modal-content"> -->
	<!-- 				<div class="modal-header"> -->
	<!-- 					<h4 class="modal-title" id="myModalLabel">Meeting Detail!</h4> -->
	<!-- 				</div> -->
	<!-- 				<div class="modal-body"> -->

	<!-- 					<script -->
	<!-- 						src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script> -->
	<!-- 					<script -->
	<!-- 						src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script> -->
	<!-- 					<script type="text/javascript" -->
	<!-- 						src="http://momentjs.com/downloads/moment-with-locales.min.js"></script> -->
	<!-- 					<script type="text/javascript" -->
	<!-- 						src="/javascript/bootstrap-material-datetimepicker.js"></script> -->




	<!-- 					<form id="addMt" class="form-horizontal" name="detailForm"> -->
	<%-- 						<input type="hidden" name="userId" value="${dbUser.userId}"> --%>
	<%-- 						<input type='hidden' name='mmNo' value='${moim.mmNo}'> --%>
	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임명</label> -->
	<!-- 							<div class="col-sm-20"> -->
	<!-- 								<input type="text" class="form-control" id="mtName7" name="mtName"  -->
	<!-- 									placeholder="모임명"> -->
	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">내용</label> -->
	<!-- 							<div class="col-sm-40"> -->
	<!-- 								<textarea style="resize: none" class="form-control" id="mtContent7" -->
	<!-- 									name="mtContent" placeholder="50자이내"></textarea> -->
	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최대참가인원</label> -->
	<!-- 							<div class="col-sm-40"> -->
	<!-- 								<input type="text" class="form-control" id="mtMaxCount7" name="mtMaxCount"> -->
	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">현재참가인원</label> -->
	<!-- 							<div class="col-sm-40"> -->
	<!-- 								<input type="text" class="form-control" id="mtCurrentCount7" name="mtCurrentCount"> -->
	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Start -->
	<!-- 								Time</label> -->
	<!-- 							<div class="col-sm-40"> -->
	<!-- 								<input type="text" class="form-control" id="mtStart7" -->
	<!-- 									name="mtStart"> -->
	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">End -->
	<!-- 								Time</label> -->
	<!-- 							<div class="col-sm-40"> -->
	<!-- 								<input type="text" class="form-control" id="mtEnd7" name="mtEnd"> -->
	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">정모장소</label> -->
	<!-- 							<div class="col-sm-40"> -->
	<!-- 								<input type="text" class="form-control mtAddr" id="mtAddr" name="mtAddr" style="width: 250px; display:inline-block;"> -->
	<!-- 								<button type="button" class="btn btn-info" onClick='fncAddMap()'>장소검색</button> -->
	<!-- 								<input type='hidden' id='lat' name='mtMapX' value=''> -->
	<!-- 								<input type='hidden' id='lng' name='mtMapY' value=''> -->

	<!-- 							</div> -->
	<!-- 						</div> -->

	<!-- 						<br> -->

	<!-- 					</form> -->


	<!-- 				<div> -->
	<!-- 				<button type="button" class="btn btn-info" -->
	<!-- 					onClick="fncGetMEFL(mtNo)">참여한사람보기</button> -->
	<!-- 					 <input type='hidden' id="mtMapX"> <input -->
	<!-- 					type='hidden' id="mtMapY"> -->
	<!-- 					<button type='button' class='btn btn-primary' id='map1'>지도</button> -->
	<%-- 					<c:if test="${dbUser != constructor}"> --%>
	<!-- 						<button type="button" class="btn btn-success" -->
	<%-- 							onClick="fncApplyMt(mtNo, '${dbUser.userId}')">참가</button> --%>
	<%-- 					</c:if> --%>
	<!-- 					<button type="button" class="btn btn-success" -->
	<%-- 						onClick="fncLeaveMt(mtNo, '${dbUser.userId}')">참가취소</button> --%>
	<%-- 						<button type="button" class="btn btn-primary" onClick="fncUptMtView('${dbUser.userId}')">수정</button> --%>
	<!-- 					<button type="button" class="btn btn-primary" id="uptButton" -->
	<!-- 						data-bs-target="#myModal2" data-bs-toggle="modal" aria-label="Close">수정</button> -->
	<!-- 					<button type="button" class="btn btn-danger" -->
	<%-- 						onClick="fncDeleteMt('${dbUser.userId}')">삭제</button> --%>
	<!-- 				</div> -->
	<!-- 				<div> -->
	<!-- 					<a id="connect" onClick="authenticate().then(loadClient)">구글캘린더와 -->
	<!-- 						연동하기</a> -->
	<!-- 				</div> -->
	<!-- 				<div> -->
	<!-- 					<a id="insert" onClick="execute()">구글캘린더에 등록하기</a> -->
	<!-- 				</div> -->
	<!-- 				ㆍlocation :<span id='mtAddr'></span> -->
	<!-- 				<div id="map" style="width: 100%; height: 350px;"></div> -->

	<!-- 				<div> -->
	<!-- 				</div> -->

	<!-- 				<br> -->
	<!-- 				<div id="getMEFL" style="padding-top: 30px"></div> -->

	<!-- 				</div> -->
	<!-- 				<div class="modal-footer"> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

	<!-- 모달끝 -->
	<!-- 모달3끝 -->



	<jsp:include page="../layout/moimSidebar.jsp"></jsp:include>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e00cfe75ad365584acc76b588be8d74"></script>
<script>
	$('#mtStart4').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
	$('#mtEnd4').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
</script>
<script>
	$('#mtStart3').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
	$('#mtEnd3').bootstrapMaterialDatePicker({ format : 'YYYY-MM-DD HH:mm' });
</script>
<script>


var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표    lat lng 받아온것 여기에다 넣기.
        level: 3 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}



// 지도에 마커를 표시합니다 
	function setMarker(lat, lng, addr, mtContent){
	var marker = new kakao.maps.Marker({
	    map: map, 
	    position: new kakao.maps.LatLng(lat, lng, )  // 
	});
	
	//커스텀 오버레이에 표시할 컨텐츠 입니다
	//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	//별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">' + 
	         '    <div class="info">' + 
	         '        <div class="title">' + 
	                    addr +    // 모임 이름 혹은 장소이름
	         '            <div class="close" onclick="javascript:close(overlay)" title="닫기"></div>' + 
	         '        </div>' + 
	         '        <div class="body">' + 
	//             '            <div class="img">' +
	//             '                <img src="/images/uploadFiles/king.jpg" width="73" height="70">' +  // 모임이나 번개 사진있으면 넣으면 같이나옴.
	//             '           </div>' + 
	         '            <div> '+ mtContent+
	         '            </div>' +
	         '            <div >' + 
	         '                <div style="float:right;"><a href="https://map.kakao.com/link/to/'+addr+','+lat+','+lng+'" target="_blank" class="link">길찾기</a></div>' +  // 여기에 정보 더넣으면 더 추가로 넣기가능. 앞에 링크에 위도 + 경도 넣으면 지도이동가능. 
	         '            </div>' + 
	         '        </div>' + 
	         '    </div>' +    
	         '</div>';
	         
	        


	      // 마커 위에 커스텀오버레이를 표시합니다
	      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	      var overlay = new kakao.maps.CustomOverlay({
	           content: content,
	           map: map,
	           position: marker.getPosition()       
	      });

	      //지도에 확대 축소 컨트롤을 생성한다
	      var zoomControl = new kakao.maps.ZoomControl();
	      // 지도의 우측에 확대 축소 컨트롤을 추가한다
	      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	      // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	      kakao.maps.event.addListener(marker, 'click', function() {
	           overlay.setMap(map);
	      });
	      
	      var moveLatLon = new kakao.maps.LatLng(lat, lng);
	      
	      // 지도 중심을 부드럽게 이동시킵니다
	      // 만약 이동할 거거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	      map.panTo(moveLatLon);   
	      
	      $('.close').on('click',function(){
	    	  	    overlay.setMap(null);     
	    	  	
	      })
	      
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	
}

	 






</script>

</html>
