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


<script type="text/javascript">
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#listReport").on("click", function() {
			fncListReport();
		});
	});

	function fncListReport() {
		alert("신고관리");

		self.location = "/report/listReport?searchCategory=1";

	}

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#map").on("click", function() {
			fncGetMap();
		});
	});

	function fncGetMap() {
		alert("1")
		self.location = "/board/map";

	}

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#mapView").on("click", function() {
			fncMap();
		});
	});

	function fncMap() {

		self.location = "/board/mapView";

	}
</script>


<style>
body {
	padding-top: 50px;
	margin: auto;
}

body>#mainlogo {
	height: 200px;
	width: 200px;
}

.selectbtn {
	width: 250px;
	height: 50px;
	margin: 5px;
}
</style>
</head>
<body>
<jsp:include page="layout/moimSidebar.jsp"></jsp:include>
	<jsp:include page="layout/toolbar.jsp"></jsp:include>

	<header class="bg-dark py-5">
		<div class="container px-5">
			<div class="row gx-5 align-items-center justify-content-center">
				<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
					<img id="mainlogo" class="img-fluid rounded-3 my-5 "
						src="/images/logo.png" alt="..." />
				</div>
				<div class="col-lg-8 col-xl-7 col-xxl-6">
					<div class="my-5 text-center text-xl-start">
						<h1 class="display-5 fw-bolder text-white mb-2">Moopi Project</h1>
						<p class="lead fw-normal text-white-50 mb-4">무피프로젝트 2021-06-06
							~ 2021-08-06</p>
						<div>

							<form id="mainSearch">
								<input type="hidden" class="interest" name="interestNo" value="">
								<input type="hidden" class="addr" name="addr" value="">
								<input type="hidden" class="order" name="type" value="">
								<div class="dropdown mt-3" style="margin-bottom: 10px;">
									<button class="btn btn-light dropdown-toggle selectbtn"
										type="button" data-bs-toggle="dropdown" id="interestbtn">
										<span>Category</span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"
										id="interest">
										<c:forEach var="interest" items="${interest}">
											<li><a class="dropdown-item" href="#"
												type="${interest.interestNo}">${interest.interestName}</a></li>
										</c:forEach>
									</ul>

									<button class="btn btn-light dropdown-toggle selectbtn"
										type="button" data-bs-toggle="dropdown" id="addrbtn">
										Addr</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"
										id="addr">
										<li><a class="dropdown-item" href="#">Action</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><a class="dropdown-item" href="#">Something else
												here</a></li>
									</ul>
								</div>
								<div>
									<button class="btn btn-secondary srchbtn" type="button"
										order="1">모임</button>
									<button class="btn btn-secondary srchbtn" type="button"
										order="2">번개</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<button type="button" class="btn btn-primary" id="listReport">신고관리</button>
	<%-- 		</c:if> --%>
	<button type="button" class="btn btn-primary" id="map">지도</button>
	<button type="button" class="btn btn-primary" id="mapView">지도보기</button>

	<%-- 	</c:if> --%>
	<jsp:include page="layout/searchbar.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<script>
		$('#addr > li > a').on('click', function() {

			$('#addrbtn').text($(this).text());
			$('.addr').val($(this).text().trim());
		})

		$('#interest > li > a').on('click', function() {

			$('#interestbtn').text($(this).text());
			$('.interest').val($(this).attr('type'));
		})

		$('.srchbtn').on(
				'click',
				function() {
					$('.order').val($(this).attr('order'));
					$('#mainSearch').attr('method', "Get").attr("action",
							"/common/mainSearch").submit();
				})
	</script>
</body>
</html>