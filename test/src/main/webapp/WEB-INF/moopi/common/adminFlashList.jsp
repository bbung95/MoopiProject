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

<!-- Css -->
<link rel="stylesheet" href="/css/admin/styles.css">
<link rel="stylesheet" href="/css/admin/all.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
	rel="stylesheet">
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
									번개무피목록</div>
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
												<th class="border px-4 py-2" width="6%">모집<br>상태</th>
												<th class="border px-4 py-2" width="5%">현재상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="flash" items="${list}">
												<tr>
													<td class="border px-4 py-2">${flash.flashNo}</td>
													<td class="border px-4 py-2">${flash.flashName}</td>
													<td class="border px-4 py-2">${flash.flashConstructor.userId}</td>
													<td class="border px-4 py-2">${flash.flashConstructor.nickname}</td>
													<td class="border px-4 py-2">${flash.flashRegdate}</td>
													<td class="border px-4 py-2">${flash.flashCurrentCount}</td>
													<td class="border px-4 py-2">${flash.flashMaxCount}</td>
													<td class="border px-4 py-2">${flash.flashAddr}</td>											
													<td class="border px-4 py-2">${flash.flashInterest}</td>
													<td class="border px-4 py-2">
													<c:if test="${flash.flashState eq '1'}">모집<br>완료</c:if>
													<c:if test="${flash.flashState eq '0'}"></c:if>
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


						<form class="form-inline" name="detailForm">

							<div class="form-group">
								<select name="searchCondition" class="form-control"
									style="width: 110px">
									<option value="0"
										${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>제목+내용</option>
									<option value="1"
										${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>제목</option>
									<option value="2"
										${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>작성자</option>
								</select>
							</div>

							<div class="form-group">
								<label class="sr-only" for="searchKeyword">검색어</label> <input
									type="text" class="form-control" id="searchKeyword"
									name="searchKeyword" placeholder="검색어"
									value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
							</div>

							<button type="button" class="btn btn-default">검색</button>

							<input type="hidden" id="currentPage" name="currentPage" value="" />
						</form>



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

</body>

</html>