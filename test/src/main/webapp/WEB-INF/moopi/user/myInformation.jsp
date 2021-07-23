<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moopi</title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap"
	rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<!-------------------------------------------------------------------------------------------------------------------------->

<style>
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->

	<div class="container main">
		<div class="row">
			<div class="col-xl-2 ">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">내 정보수정</li>
					<li class="list-group-item">My모임무피</li>
					<li class="list-group-item">My번개무피</li>
					<li class="list-group-item">My결제내역</li>
					<li class="list-group-item">My코인내역</li>
				</ul>
			</div>
			<div class="col-xl-10"></div>
		</div>
	</div>

	<jsp:include page="../layout/searchbar.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<script>
	
		$("li:contains('내 정보수정')").on("click", function() {

			location.href = "/user/updateProfile?userId=" + dbUser;
		})
		
		$("li:contains('My결제내역')").on("click", function() {

			location.href = "/payment/paymentList?userId=" + dbUser;
		})

		$("li:contains('My코인내역')").on("click", function() {

			location.href = "/coin/coinHistory?userId=" + dbUser;
		})
	</script>
</body>
</html>