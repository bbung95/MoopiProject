<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOOPI</title>

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

.thumbnail-wrapper {
	width: 200px;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.thumbnail {
	position: relative;
	padding-top: 200px;
	overflow: hidden;
}

.thumbnail-centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	transform: translate(-50%, -50%);
}

thumbnail-img {
	/*   max-width: 100%; */
	/*   height: 박스의 height와 같아야 한다. */
	transform: translate(-50%, -50%);
}

.inforhead {
	font-size: 24px;
	font-weight: bold;
	line-height: 34px;
	margin-bottom: 16px;
}

.span-round{
	background: #f5f6f7;
	color: black;	
	font-size: 15px;	
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

						<div class="inforhead">내 모임</div>

						<div class="myMoimList">
							<c:forEach var="moim" items="${ list2 }">

								<div class="card mb-3 moim-item" style="max-width: 540px;"
									type="${moim.mmNo}">
									<div class="row g-0 ">
										<div class="col-md-4">
											<div class="thumbnail-wrapper ">
												<div class="thumbnail">
													<div class="thumbnail-centered ">
														<img src="/images/uploadFiles/${moim.mmFile }"
															class="img-fluid rounded-start thumbnail-img">'
													</div>
												</div>
											</div>

										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title">${moim.mmName}</h5>
												<p class="card-text">${moim.mmContent}</p>
												<p class="card-text">
													<small class="text-muted">${moim.mmConstructor.nickname}
														<div
															class="inline-block rounded-3 shadow-sm p-1 h7 span-round">
															<i class="bi bi-people-fill"></i> ${ moim.mmCurrentCount}
															/ ${moim.mmMaxCount}
														</div>
													</small>
												</p>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>
						</div>
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
	<script>
		$(".moim-item").on('click', function() {

			let mmNo = $(this).attr('type');

			location.href = "/moim/getMoim?mmNo=" + mmNo;
		})
	</script>

</body>
</html>