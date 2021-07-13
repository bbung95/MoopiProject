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
	<link href='/css/main.min.css' rel='stylesheet' />
    <script src='/javascript/main.min.js'></script>
    <script src='/javascript/locales-all.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


     document.addEventListener('DOMContentLoaded', function() { 
    
   
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
     //plugins: [ 'interaction', 'dayGrid',  'resourceTimeline' ],
     googleCalendarApiKey: 'AIzaSyAow_exiK7v12TdQlYOv1U-ttFlSpWlU2Q',
     aspectRatio: 2,
     height:700,
     contentHeight:700,
      headerToolbar: {
        //left: 'prev,next today',
        center: 'title',
        //right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      selectable: true,
      selectMirror: true,
      dateClick: function(info) {
    	    $(location).attr("href", "/calendar/addCalendar?date="+info.dateStr+"&somoimCode=5")
    	  },
      eventClick: function(arg) {
    	  calendarNo = arg.event.id;
    	  
    	  $.ajax( 
  				{
  					url : "/calendar/json/getCalendar/"+calendarNo,
  					method : "GET" ,
  					dataType : "json" ,
  					headers : {
  						"Accept" : "application/json",
  						"Content-Type" : "application/json"
  					},
  					success : function(JSONData , status) {
  						//alert(status);
  						//alert("JSONData : \n"+JSONData);
  						
  						$("#title").text(JSONData.title);
  						title=JSONData.title;
  						
  						$("#userId").text(JSONData.userId);
  						userId=JSONData.userId;
  						
  						$("#startDate").text(JSONData.startDate);
  						startDate=JSONData.startDate;
  						
  						$("#memo").text(JSONData.memo);
  						memo=JSONData.memo;
  						
  						$("#totalCount").text(JSONData.totalCount);
  						totalCount=JSONData.totalCount;
  						
  						$("#count").text(JSONData.count);
  						count=JSONData.count;
  					}
  			}); //ajax 종료
         },
      events: [
    	  <c:forEach items="${list}" var="meeting">
          {
        	id: "${meeting.mtNo}",
            title: "${meeting.mtName}",
            start: "${meeting.mtStart}",
            description: "${meeting.mtContent}"
          },
          </c:forEach>
        ],	
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
    });
    calendar.render();

  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    width: 900px;
    float: left;
  }
  
  #getDate {
  	float: right;
  	width: 500px;
  }
  
  

</style>
</head>

</head>
<body>

<!-- ToolBar Start ///////////////////////////////////// -->
<jsp:include page="../layout/toolbar.jsp" flush="false"/>
<jsp:include page="../layout/moimToolbar.jsp" flush="false"/>

<!-- ToolBar End /////////////////////////////////////-->
<h3>정모일정확인 캘린다입니다...</h3>


</body>
</html>