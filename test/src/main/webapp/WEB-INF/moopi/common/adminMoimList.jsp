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
			<jsp:include page="../layout/adminHeader.jsp"/>
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
									모임무피목록</div>
								<div class="p-3">
									<table class="table-responsive w-full rounded">
										<thead align="center">
											<tr>
												<th class="border px-4 py-2" width="5%">No</th>
												<th class="border px-4 py-2" width="10%">이름</th>
												<th class="border px-4 py-2" width="10%">대표아이디</th>
												<th class="border px-4 py-2" width="10%">대표닉네임</th>
												<th class="border px-4 py-2" width="10%">생성일</th>
												<th class="border px-4 py-2" width="5%">현재정원</th>
												<th class="border px-4 py-2" width="5%">최대정원</th>
												<th class="border px-4 py-2" width="10%">거주지</th>
												<th class="border px-4 py-2" width="20%">관심사</th>
												<th class="border px-4 py-2" width="5%">유형</th>
												<th class="border px-4 py-2" width="5%">현재상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="moim" items="${list}">
												<tr>
													<td class="border px-4 py-2">${moim.mmNo}</td>
													<td class="border px-4 py-2">${moim.mmName}</td>
													<td class="border px-4 py-2">${moim.mmConstructor.userId}</td>
													<td class="border px-4 py-2">${moim.mmConstructor.nickname}</td>
													<td class="border px-4 py-2">${moim.mmRegDate}</td>
													<td class="border px-4 py-2">${moim.mmCurrentCount}</td>
													<td class="border px-4 py-2">${moim.mmMaxCount}</td>
													<td class="border px-4 py-2">${moim.mmAddr}</td>
													<td class="border px-4 py-2">${moim.mmInterest}</td>
													<td class="border px-4 py-2">
														<c:if test="${moim.mmType == 1}">
															일반
														</c:if>
														<c:if test="${moim.mmType == 2}">
															자유
														</c:if>
													</td>
													<td class="border px-4 py-2"><i
														class="fas fa-check text-green-500 mx-2"></i></td>
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

							<div class="form-group">
								<select name="searchCondition" class="form-control"
									style="width: 110px">
									<option value="3"
										${! empty search.searchCondition && search.searchCondition== 3 ? "selected" : ""  }>모임명</option>
									<option value="5"
										${! empty search.searchCondition && search.searchCondition== 5 ? "selected" : ""  }>아이디</option>
									<option value="6"
										${! empty search.searchCondition && search.searchCondition== 6 ? "selected" : ""  }>닉네임</option>
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


							<input type="hidden" id="searchState" name="searchState"
								value="0" /> <input type="hidden" id="currentPage"
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

		function moimSearch() {

			$('#detailForm').attr("method", "POST").attr("action",
					"/common/getMoimList").submit();
		}

		function fncGetList(currentPage) {

			$('#currentPage').val(currentPage);
			moimSearch()
		}

		$('button:contains("검색")').on('click', function() {

			moimSearch()
		})

		$('.userState').on('click', function() {

			userId = $(this).parent().children('td:first-child').text().trim();
		})

		$('button:contains("처리")').on('click', function() {

			let reason = $('.reason').val();

			$.ajax({
				url : "/user/json/updateBlackUser",
				method : "POST",
				dataType : "JSON",
				contentType : "application/json",
				data : JSON.stringify({
					"userId" : userId,
					"stateReason" : reason
				}),
				success : function(data, state) {

					$('.reason').val('');
					$('button:contains("취소")').click();
				}
			})
		})

		$('button:contains("취소")').on('click', function() {
			$('.reason').val('');
		})
	</script>
</body>

</html>