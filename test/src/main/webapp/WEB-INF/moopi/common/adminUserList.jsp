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
		$( '.adminUserInfo' ).on( 'click', function() {
			alert("진입");
			var userId = $(this).attr('value');
			alert("userId : " + userId);
			self.location = "/common/getUserInfo?userId=" + userId
		});
	});
	
	$( ".addReportMoim"  ).on("click" , function() {
			fncAddBoardMoim();
});

function fncAddBoardMoim(){
var reportTarget = $("#mmNo").val();

//	self.location ="/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget;
popWin = window.open(
		"/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget ,
		"popReport",
		"left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}
"  ).on("click" , function() {
		fncAddBoardReport();
	});

	function fncAddBoardReport(){
		var reportTarget = $("#boardNo").val();
		
	//		self.location ="/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget;
		popWin = window.open(
				"/report/addReportView?reportCategory=1&reportTargetBd.boardNo="+reportTarget ,
				"popReport",
				"left=460, top=300, width=900, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}

	
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
													<td class="border px-4 py-2"><c:if
															test="${user.userRole == 1 || user.userRole == 2}">
															<i class="fas fa-check text-green-500 mx-2"></i>
														</c:if> <c:if test="${user.userRole == 5 || user.userRole == 6}">
															<i class="fas fa-times text-red-500 mx-2"></i>
														</c:if></td>
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

	<script src="/js/admin/main.js"></script>

	<script>
		let searchState = $('#searchState').val();

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
	</script>
</body>

</html>






<div class="shadow-sm p-3 mb-1 bg-body rounded">
	<div class="toast-body">
		Hello, world! This is a toast message.
		<div class="mt-2 pt-2 border-top">
			<button type="button" class="btn btn-primary btn-sm">Take
				action</button>
			<button type="button" class="btn btn-secondary btn-sm"
				data-bs-dismiss="toast">Close</button>
		</div>
	</div>
</div>

<div class="shadow-sm p-3 mb-1 bg-body rounded">
	<div class="toast-header">
		<img src="..." class="rounded me-2" alt="..."> <strong
			class="me-auto">Bootstrap</strong> <small>11 mins ago</small>
		<button type="button" class="btn-close" data-bs-dismiss="toast"
			aria-label="Close"></button>
	</div>
	<div class="toast-body">Hello, world! This is a toast message.</div>
</div>
