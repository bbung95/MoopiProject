<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>
	
</script>

<style>
body {
	padding-top: 100px;
}

.inforhead{
	font-size: 24px;
	font-weight: bold;
	line-height: 34px;
	margin-bottom: 16px;
	}
</style>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div id="wrapper">

		<!-- 리스트 뷰 -->
		<div class="container">
			<div class="row multi-columns-row">
				<div class="row">
					<div class="col-xs-3 col-sm-3 col-md-3">
						<!-- [left toolbar] -------------------------------------------------------->
						<jsp:include page="../layout/userToolbar.jsp" />
						<!----------------------------------------------------------------->
					</div>
					<div class="col-xs-9 col-sm-9 col-md-9">
						
						<div class="inforhead">내 코인</div>
						
						<table class="table table-hover table-striped">
							<thead>
								<tr>
									<th align="center">번개무피명</th>
									<th align="left">번개무피방장</th>
									<th align="left">내아이디</th>
									<th align="left">사용일</th>
									<th align="left">참여/생성</th>
									<th align="left">사용한코인</th>
								</tr>
							</thead>


							<!-- <input type="text" id="coin" name="coin" value="${user.coin}"/> -->

							<tbody>

								<c:set var="i" value="0" />
								<c:forEach var="coin" items="${ coinList }">
									<c:set var="i" value="${ i }" />

									<tr>
										<td align="left">${coin.flash.flashName}</td>
										<td align="left">${coin.flash.flashConstructor.userId}</td>
										<td align="left">${coin.coinUser.userId}</td>
										<td align="left">${coin.coinRegdate}</td>
										<td align="left">${coin.coinRole}</td>
										<td align="left">${coin.coinCount}</td>

									</tr>
								</c:forEach>

							</tbody>


						</table>
					</div>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>

</body>
</html>