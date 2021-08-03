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
	height: 40px;
	margin: 10px 2px 10px 0px;
	background: white;
}

.srchbtn {
	width: 80px;
	height: 40px;
	background: #ebf2f7;
	color: #9699ab;
	font-size: 16px;
}

header {
	background-image: linear-gradient(120deg, #4299e1 50%, 60%, #b8d2ff 50%);
}
</style>
</head>
<body>

	<jsp:include page="layout/toolbar.jsp"></jsp:include>

	<header class=" py-5">
		<div class="container px-5">
			<div class="row gx-5 align-items-center justify-content-center">
				<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
					<img id="mainlogo" class="img-fluid rounded-3 my-5 "
						src="/images/logo.png" alt="..." />
				</div>
				<div class="col-lg-8 col-xl-7 col-xxl-6">
					<div class="my-5 text-center text-xl-start">
						<h1 class="display-6 fw-bolder text-white mb-2">Moopi</h1>
						<p class="lead fw-normal text-white-50 mb-4">
							Moopi는 나와 같은 관심사 및 지역구의 소모임과 번개모임을 큐레이팅 해주고, 매칭시켜 주는 모임 플랫폼입니다.<br />
							부담없이 편하게 만나고 헤어질 수 있는 일시적인 만남부터, 정기적인 정모활동을 통한 책임감 있고 끈끈한 교류까지
							취향에 맞게 선택 할 수 있습니다.<br /> 함께하는, 보다 행복한 삶을 지금 당장 시작해 보세요.
						</p>
						<div>

							<form id="mainSearch">
								<input type="hidden" class="interest" name="interestNo"
									value="0"> <input type="hidden" class="addr"
									name="addr" value=""> <input type="hidden"
									class="order" name="type" value=""> <input
									type="hidden" class="searchCondition" name="searchCondition"
									value="">
								<div class="dropdown mt-3" style="margin-bottom: 10px;">
									<button class="btn btn-light dropdown-toggle selectbtn"
										type="button" data-bs-toggle="dropdown" id="interestbtn"
										style="width: 200px;">
										<span>Category</span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"
										id="interest" style="height: 200px; overflow: auto;">
										<c:forEach var="interest" items="${interest}">
											<li><a class="dropdown-item" href="#"
												type="${interest.interestNo}">${interest.interestName}</a></li>
										</c:forEach>
									</ul>

									<button class="btn btn-light dropdown-toggle selectbtn "
										type="button" data-bs-toggle="dropdown" id="addrbtn"
										style="width: 100px;">Addr</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"
										id="addr" style="height: 200px; overflow: auto;">

									</ul>
									<span>
										<button class="btn btn-light srchbtn" type="button" order="1"
											style="margin-left: 5px;">모임</button>
										<button class="btn btn-light srchbtn" type="button" order="2"
											style="margin-right: 5px;">번개</button>
									</span>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</header> 

	<jsp:include page="layout/footer.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	<script>
		let addrs = [ "종로구", "중구", "용산", "성동구", "광진구", "동대문구", "중랑구", "성북구",
				"강북구", "도봉구", "노원구", "은평구", "마포구", "양천구", "강서구", "구로구", "금천구",
				"영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구" ];

		for (var i = 0; i < addrs.length; i++) {

			let display = '<li><a class="dropdown-item" href="#">' + addrs[i]
					+ '</a></li>';
			$('#addr').append(display);
		}

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

					let addr = $('.addr').val();
					let interest = $('.interest').val();

					if (interest != 0 && addr != '') {
						$('.searchCondition').val("4");
					} else if (interest != 0) {
						$('.searchCondition').val("1");
					} else if (addr != '') {
						$('.searchCondition').val("2");
					} else {
						$('.searchCondition').val("0");
					}

					$('.order').val($(this).attr('order'));
					$('#mainSearch').attr('method', "Get").attr("action",
							"/common/mainSearch").submit();
				})
	</script>
</body>
</html>