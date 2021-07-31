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

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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
</head>

<script>
	$(function() {
		$('.adminUserInfo').on('click', function() {
			var userId = $(this).attr('value');
			self.location = "/common/getUserInfo?userId=" + userId
		});
	});
</script>
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
									유저목록</div>
								<div class="p-3">
									<table class="table-responsive w-full rounded">
										<thead align="center">
											<tr>
												<th class="border px-4 py-2" width="20%">아이디</th>
												<th class="border px-4 py-2" width="10%">이름</th>
												<th class="border px-4 py-2" width="10%">닉네임</th>
												<th class="border px-4 py-2" width="20%">생년월일</th>
												<th class="border px-4 py-2" width="5%">연령</th>
												<th class="border px-4 py-2" width="5%">가입경로</th>
												<th class="border px-4 py-2" width="20%">가입일자</th>
												<th class="border px-4 py-2" width="5%">코인</th>
												<th class="border px-4 py-2" width="5%">현재상태</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="user" items="${list}">
												<tr>
													<td class="border px-4 py-2 adminUserInfo"
														value="${user.userId}">${user.userId}</td>
													<td class="border px-4 py-2">${user.userName}</td>
													<td class="border px-4 py-2">${user.nickname}</td>
													<td class="border px-4 py-2">${user.regDate}</td>
													<td class="border px-4 py-2">${user.age}</td>
													<td class="border px-4 py-2">${user.joinPath}</td>
													<td class="border px-4 py-2">${user.regDate}</td>
													<td class="border px-4 py-2">${user.coin}</td>
													<td class="border px-4 py-2 userState text-center"><a href="#"
														data-bs-toggle="modal" data-bs-target="#exampleModal">
															<c:if test="${user.userRole == 1 || user.userRole == 2}">
																<i class="fas fa-check text-green-500 mx-2"></i>
															</c:if>
															<c:if test="${user.userRole == 3 }">
															<i class="bi bi-circle-fill" style="color: orange;"></i>
															</c:if>
															<c:if test="${user.userRole == 4 || user.userRole == 6}">
																<i class="fas fa-times text-red-500 mx-2"></i>
															</c:if>
															<c:if test="${user.userRole == 5}">
																<i class="bi bi-diamond-fill" style="color: blue"></i>
															</c:if>
															</a></td>
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
									<option value="1"
										${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>아이디</option>
									<option value="2"
										${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>닉네임</option>
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


						<!-- Button trigger modal -->




						<!--  네비게이션  -->
						<jsp:include page="pageNavigator.jsp"></jsp:include>

					</div>
				</main>
				<!--/Main-->
			</div>


			<!--Footer-->
			<footer class="bg-grey-darkest text-white p-2">
				<div class="flex flex-1 mx-auto">&copy; My Design</div>
			</footer>
			<!--/footer-->

		</div>

	</div>


	<!-- 블랙 처리 Modal -->
	<div class="modal fade modal-center" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">블랙처리</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<textarea class="overflow-auto text-break reason"
						style="width: 300px; resize: none; min-height: 100px; border: 0.5px solid gray; border-radius: 10px; outline: none;"></textarea>
					<div class="d-flex ">
						<button
							class="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded">
							처리</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
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

		function userSearch() {

			$('#detailForm').attr("method", "POST").attr("action",
					"/common/getUserList?searchState=" + searchState).submit();
		}

		function fncGetList(currentPage) {

			$('#currentPage').val(currentPage);
			userSearch()
		}

		$('button:contains("검색")').on('click', function() {

			userSearch()
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
