<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드받기</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://apis.google.com/js/api.js"></script>

<script>

  /**
   * Sample JavaScript code for calendar.events.insert
   * See instructions for running APIs Explorer code samples locally:
   * https://developers.google.com/explorer-help/guides/code_samples#javascript
   */

	  
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
	              "dateTime": "2021-07-19T15:00:00",
	              "timeZone": "Asia/Seoul"
	            },
	            "start": {
	              "dateTime": "2021-07-19T14:00:00",
	              "timeZone": "Asia/Seoul"
	            },
	            "summary": "구글캘린더테스트"
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
	   
    
   
 function test(){
	 console.log("test");
 } 
  
  
//$(function() {
	//var uu = window.location.href
	//var url = new URL(uu);

	//var urlParams = url.searchParams;

	//var code = urlParams.get('code');
	//document.write(code);
	//$('#code').val(code);
	//});
	
$(document).ready(function(){
	var param = $("form[name=form1]").serialize();
	$.ajax({
		type: 'post',
		url : "https://oauth2.googleapis.com/token",
		data: param,
		dataType: 'json' , 
		success: function(JSONData , status){
			alert(JSONData.access_token);
			alert(JSONData.expires_in);
			alert(JSONData.scope);
			alert(JSONData.token_type);
			
		},
		error:function(){  
            alert("에러발생");
		}
	})
});

</script>
</head>
<body>
	<a href="login.html">login</a>
	<form name="form1" action="https://oauth2.googleapis.com/token" method="post"
		enctype="application/x-www-form-urlencoded">
	
	<input type="hidden" name="code" value="${param.code}" ><br>
	<input type="hidden" name="client_id" value="674136097926-gmjcrr1v85j17s88t3pi2fodfp72hvk9.apps.googleusercontent.com"><br>
	<input type="hidden" name="client_secret" value="aVM_EIcdkciwTwLtR7TjCQmg"><br>
	<input type="hidden" name="redirect_uri" value="http://localhost:8080/meeting/receiveCode"><br>
	<input type="hidden" name="grant_type" value="authorization_code"><br>
	<input type="submit">
	</form>
	
	<button onclick="authenticate().then(loadClient)">authorize and load</button>
	<button onclick="execute()">execute</button>
</body>
</html>