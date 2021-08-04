<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moopi Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="keywords"
	content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example">

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<!-------------------------------------------------------------------------------------------------------------------------->

<!-- Css -->
<link rel="stylesheet" href="/css/admin/styles.css">
<link rel="stylesheet" href="/css/admin/all.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
	rel="stylesheet">
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>

<body>
	<!--Container -->
	<div class="mx-auto bg-grey-lightest">
		<!--Screen-->
		<div class="min-h-screen flex flex-col">
			<!--Header Section Starts Here-->
			<jsp:include page="../layout/adminHeader.jsp" />
			<!--/Header-->

			<div class="flex flex-1">
				<!--Sidebar-->
				<jsp:include page="../layout/adminToolbar.jsp" />
				<!--/Sidebar-->
				<!--Main-->
				<main class="bg-white-500 flex-1 p-3 overflow-hidden">

					<div class="flex flex-col">
						<!--Grid Form-->

						<div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
							<div
								class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
								<div
									class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
									결제목록</div>
								<div class="p-3">
									<table class="table-responsive w-full rounded">
										<thead align="center">
											<tr>
												<th class="border px-4 py-2" width="20%">No</th>
												<th class="border px-4 py-2" width="10%">아이디</th>
												<th class="border px-4 py-2" width="10%">이름</th>
												<th class="border px-4 py-2" width="10%">닉네임</th>
												<th class="border px-4 py-2" width="20%">일자</th>
												<th class="border px-4 py-2" width="5%">가격</th>
												<th class="border px-4 py-2" width="5%">코인</th>
												<th class="border px-4 py-2" width="5%">유형</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="pay" items="${list}">
												<tr>
													<td class="border px-4 py-2">${pay.paymentNo}</td>
													<td class="border px-4 py-2">${pay.paymentUserId.userId}</td>
													<td class="border px-4 py-2">${pay.paymentUserId.userName}</td>
													<td class="border px-4 py-2">${pay.paymentUserId.nickname}</td>
													<td class="border px-4 py-2">${pay.paymentRegdate }</td>
													<td class="border px-4 py-2">${pay.paymentPrice }</td>
													<td class="border px-4 py-2">${pay.paymentCoinCount }</td>
													<td class="border px-4 py-2"><i
														class="fas fa-check text-green-500 mx-2"></i>${pay.paymentRole}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--/Grid Form-->


						<!-- SearchBar -->
						<form id="detailForm"
							class="form-inline d-flex justify-content-end" name="detailForm">
							
							<select class="option">
								<option value="PRICE_ASC">가격 낮은순</option>
								<option value="PRICE_DESC">가격 높은순</option>
								<option value="REGDATE_ASC">구매 오래된순</option>
								<option value="REGDATE_DESC">구매 최근순</option>
							</select>
							
							<div class="form-group">
								<select name="searchCondition" class="form-control"
									style="width: 110px">
									<option value="3"
										${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>아이디</option>
									<option value="5"
										${! empty search.searchCondition && search.searchCondition== 3 ? "selected" : ""  }>닉네임</option>
								</select>
							</div>

							<div class="form-group">
								<label class="sr-only" for="searchKeyword">검색어</label> <input
									type="text" class="form-control" id="searchKeyword"
									name="searchKeyword" placeholder="검색어"
									value="${! empty search.searchKeyword ? search.searchKeyword : '' }"
									style="width: 200px;">
							</div>

							<button type="button" class="btn btn-primary">검색</button>


							<input type="hidden" id="option" name="option"
								value="${option}" /> <input type="hidden" id="currentPage"
								name="currentPage" value="1" />
						</form>


						<!--  네비게이션  -->
						<jsp:include page="pageNavigator.jsp"></jsp:include>

					</div>
				</main>
				<!--/Main-->
			</div>

		</div>

	</div>

	<script src="/js/admin/main.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>

	<script>
		let searchState = $('#searchState').val();
		let userId;

		function paymentSearch() {

			$('#detailForm').attr("method", "POST").attr("action",
					"/common/getPaymentList").submit();
		}

		function fncGetList(currentPage) {

			$('#currentPage').val(currentPage);
			paymentSearch()
		}

		$('button:contains("검색")').on('click', function() {

			paymentSearch()
		})
		
		$('.option').on("change", function(){
			$('#option').val($(this).val());
			paymentSearch();
		})

	</script>

</body>

</html>