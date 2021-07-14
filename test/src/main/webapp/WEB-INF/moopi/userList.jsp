<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<style>
body {
	padding-top: 50px;
}
</style>
</head>
<body>
	<jsp:include page="layout/toolbar.jsp"></jsp:include>
	<a href="#">user01<input type="hidden" value="user01"></a>
	<a href="#">user03<input type="hidden" value="user03"></a>
	<a href="#">user04<input type="hidden" value="user04"></a>
	<a href="#">user05<input type="hidden" value="user05"></a>

	<div style="height: 600px; width: 500px; border: 1px solid black;">
		<div>
			<button>모임무피</button>
			<button>번개무피</button>
			<button>포스팅</button>
			<button>유저</button>
		</div>
		<div>
			<li>
				<ul>dsdsdsds
				</ul>
				<ul>dsdsdsds
				</ul>
				<ul>dsdsdsds
				</ul>
				<ul>dsdsdsds
				</ul>
				<ul>dsdsdsds
				</ul>
			</li>
		</div>
	</div>
	<script>
		$('a:contains("user")')
				.on(
						'click',
						function() {

							let target = $(this).children('input').val();
							console.log(target);

							popWin = window
									.open(
											"http://localhost:3000/create_protocol/?userId=user02&target="
													+ target,
											"popWin",
											"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
						});
	</script>
</body>
</html>