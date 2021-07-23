<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moopi</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />


	<script type="text/javascript">
			
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#listReport" ).on("click" , function() {
				fncListReport();
			});
		});	
		
		
		function fncListReport(){
			alert("신고관리");
			
			self.location ="/report/listReport?searchCategory=1";

		}

		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#map" ).on("click" , function() {
				fncGetMap();
			});
		});	
	
		function fncGetMap(){
			alert("1")
			self.location ="/board/map";

		}

		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#mapView" ).on("click" , function() {
				fncMap();
			});
		});	
	
		function fncMap(){
			
			self.location ="/board/mapView";

		}
	</script>


<style>
body {
/* 	padding-top: 50px;
 */	margin: auto;
	width: 960px;
	font-family: 'Gaegu', cursive;
}
</style>
</head>
<body>
<jsp:include page="layout/toolbar.jsp"></jsp:include>

		<div class="jumbotron jumbotron-fluid">
  		<div class="container">
   		 <h1 class="display-4">Moopi Project</h1>
   		 <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
  		</div>
		</div>
	</div>
	<center>
	<br> ‘단일로 귀착되지 않는 다수는 혼란이며, 다수에 의존하지 않는 단일은 압제이다’. <br>
		토론을 통해 나온 합리적 결정에는 토 달지 않고 따라가야 강력한 조직이 된다. <br>
			-블라즈 파스칼, 팡세 -
	</center>
<%-- 	<c:if test="${ dbuser.userRole} = 1"> --%>
<%-- 		<c:if test="$(dbUser.userId = admin)"> --%>
		<button type="button" class="btn btn-primary" id="listReport">신고관리</button>
<%-- 		</c:if> --%>
		<button type="button" class="btn btn-primary" id="map">지도</button>
		<button type="button" class="btn btn-primary" id="mapView">지도보기</button>

<%-- 	</c:if> --%>
<jsp:include page="layout/searchbar.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>