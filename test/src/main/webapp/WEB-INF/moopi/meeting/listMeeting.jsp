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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


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
var mtEnd="";
var mtMaxCount="";
var mtAddr="";


function fncAddMtView() {
	alert("정모를 생성합니다.");
	var displayValue = "<h6>"
	+"<form class='form-horizontal' name='detailForm'>"
	+"<input type='hidden' name='mmNo' value='1'>" +
	+"정모이름 :" +"<input type='text' name='mtName'>" + "<br>"
	+"정모내용 :"+"<input type='text' name='mtContent'>" + "<br>"
	+"주최자 :"+ "<input type='text' name='userId' value='user01'>" + "<br>"
	+"정모시작일 :" +"<input type='datetime-local'  name='mtStart'>"+"<br>"
	+"정모종료일 :" +"<input type='datetime-local' name='mtEnd'>"+"<br>"
	+"정모 총 인원 :"+ "<input type='text' name='mtMaxCount'>" + "<br>"
	+"정모 현재 인원 :"+ "<input type='text' name='mtCurrentCount'>" + "<br>"
	+"정모 장소 :"+"<input type='text' name='mtAddr'>" + "<br>"
	+"<a onClick='fncAddMt()'>등록하기</a>"+ "<br>"
	+"</form>"
	+"</h6>";
	$("#getDate").slideUp('slow');
	$("#addDate").html(displayValue);
	$("#addDate").fadeIn('slow');
}

function fncUptMtView() {
	alert("정모를 수정합니다.");
	var displayValue = "<h6>"
	+"<form class='form-horizontal' name='detailForm'>"
	+"<input type='hidden' name='mmNo' value='1'>" +
	+"정모이름 :" +"<input type='text' name='mtName' value='mtName'>" +mtName+ "<br>"
	+"정모내용 :"+"<input type='text' name='mtContent' value='mtContent'>" +mtContent+ "<br>"
	+"주최자 :"+ "<input type='text' name='userId' value='user01'>" + "<br>"
	+"정모시작일 :" +"<input type='datetime-local'  name='mtStart' value='mtStart'>"+"<br>"
	+"정모종료일 :" +"<input type='datetime-local' name='mtEnd' value='mtEnd'>"+"<br>"
	+"정모 총 인원 :"+ "<input type='text' name='mtMaxCount' value='mtMaxCount'>" + "<br>"
	+"정모 현재 인원 :"+ "<input type='text' name='mtCurrentCount'>" + "<br>"
	+"정모 장소 :"+"<input type='text' name='mtAddr'>" + "<br>"
	+"<a onClick='fncAddMt()'>수정하기</a>"+ "<br>"
	+"</form>"
	+"</h6>";
	$("#getDate").slideUp('slow');
	$("#addDate").html(displayValue);
	$("#addDate").fadeIn('slow');
}

function fncAddMt() {
	alert("등록완료");
	$("form").attr("method", "POST").attr("action", "/meeting/addMeeting").submit();
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


$(document).ready(function() {

    initThemeChooser({

      init: function(themeSystem) {
        $('#calendar').fullCalendar({
          themeSystem: themeSystem,
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
        	mtNo = event.id;
        	mtName = event.title;
        	mtStart = event.start;
        	mtEnd = event.end;
        	mtContent = event.description;
        	mtMaxCount = event.maxCount;
        	mtConstructor = event.constructor;
        	mtAddr = event.addr;
      	    //alert(mtNo);
      	    
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
    						$("#addDate").slideUp('slow');
    						$("#mtName").val(JSONData.mtName);
    						$("#userId").val(JSONData.mtConstructor.userId);
    						$("#mtContent").val(JSONData.mtContent);
    						$("#mtStart").val(JSONData.mtStart);
    						$("#mtEnd").val(JSONData.mtEnd);
    						$("#mtMaxCount").val(JSONData.mtMaxCount);
    						$("#mtCurrentCount").val(JSONData.mtCurrentCount);
    						$("#mtAddr").val(JSONData.mtAddr);
    						$("#getDate").slideDown('slow');
    					}
    			}); //ajax 종료
      	  },
          eventLimit: true, // allow "more" link when too many events
          events: [
        	  <c:forEach items="${list}" var="meeting">
              {
            	id: "${meeting.mtNo}",
                title: "${meeting.mtName}",
                start: "${meeting.mtStart}",
                end: "${meeting.mtEnd}",
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
<jsp:include page="../layout/toolbar.jsp" flush="false"/>
<jsp:include page="../layout/moimToolbar.jsp" flush="false"/>
<!-- ToolBar End /////////////////////////////////////-->

<h3>정모일정 확인 캘린다입니다...
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

      <span id='loading' style='display:none'>loading theme...</span>

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
	정모종료일 :<input type='text' id='mtEnd'><br>
	정모 총 인원 :<input type='text' id='mtMaxCount'><br>
	정모 현재 인원 :<input type='text' id='mtCurrentCount'>
	<button type="button" class="btn btn-default">참여한사람보기</button>
	<br>
	정모 장소 :<input type='text' id='mtAddr'><br>
	
	
	<button type="button" class="btn btn-success" onClick="fncApplyMt(2007, 'user02')">참가</button>
	<button type="button" class="btn btn-success" onClick="fncLeaveMt(2007, 'user02')">참가취소</button>
	<button type="button" class="btn btn-primary" onClick="fncUptMtView()">수정</button>
	<button type="button" class="btn btn-danger">삭제</button>
		
 	</div> <!-- 컨테이너 div종료 --> 
		
 </div> <!-- getDate div 종료 -->
<jsp:include page="../layout/searchbar.jsp"></jsp:include>

</body>
</html>
