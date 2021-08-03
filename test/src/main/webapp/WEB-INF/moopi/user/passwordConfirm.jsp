<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>계정정보조회(모바일번호,비밀번호수정)</title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap"
	rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<!-- 템플릿 관련 CDN -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="stylesheet" href="../css/admin/styles.css">
 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">


<!-------------------------------------------------------------------------------------------------------------------------->

<script>
	function confirm() {

		var userId = $('input[name="userId"]').val();
		var password = $('#nowPwd').val();
		var dbPwd = $('#password').val();
		console.log(password + ":" + dbPwd)
		if (password == dbPwd) {
			$.ajax({
				url : "/user/json/passwordConfirm",
				method : "POST",
				processData : false,
				contentType : 'application/json',
				data : JSON.stringify({
					"userId" : userId,
					"password" : password
				}),
				dataType : 'text',
				success : function(result) {
					swal("SUCCESS!", "확인 완료되었습니다", "success");
					$("form").attr("method", "POST").attr("action",
							"/user/updateUserView").submit();
				}
			});
		} else {
			swal("FAIL!", "회원님의 정보와 비밀번호가 일치하지 않습니다.", "error");
		}

	}
</script>
<style>
body {
	padding-top: 100px;
}

.confirmPWD {
	position: relative;
	font-size: 28px;
}

//
회원님의 안전한 개인정보를 ~ .etcContent {
	position: relative;
	font-size: 18px;
	text-align: center;
	font-weight: 340;
	padding-down: 100px;
}

.pwdInsert {
	padding-top: 5px;
	padding-down: 15px;
}

.nowPwd1 {
	font-family: "NanumGothic";
	text-align: left;
	font-size: 16px;
	display: inline-block;
}

.PWDconfirm {
	left: 400px;
	top: -39px;
}

.etcName {
	position: relative;
	font-size: 15px;
	text-align: left;
	font-weight: 340;
}

x
	.updateUserAccount {
	font-family: "NanumGothic";
	text-align: center;
	font-size: 30px;
	padding: 15px;
}

.LabelId {
	font-family: "NanumGothic";
	text-align: left;
	font-size: 20px;
	padding-top: -15px;
}

.LabelName, .LabelPhone {
	font-family: "NanumGothic";
	text-align: left;
	font-size: 20px;
	padding-top: 5px;
}

.LabelBirth {
	font-family: "NanumGothic";
	text-align: left;
	font-size: 20px;
	padding-top: -10px;
	display: inline-block
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

	<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
	<!---------------------------------------------------------------------------------------------------------------------------->


	<input type="hidden" id="userId" name="userId" value="${dbUser.userId}" />

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

						<div class="inforhead">내 정보</div>
						<div
							class="h-full flex flex-1 justify-center items-center font-sans login">
							<div class="w-full max-w-lg">
								<div class="leading-loose">
									<form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">

										<input type="hidden" class="form-control" id="userId"
											name="userId" value="${dbUser.userId}"> <input
											type="hidden" class="form-control" id="password"
											name="password" value="${dbUser.password}">

										<div class="confirmPWD">비밀번호 확인</div>
										<hr>

										<div class="etcContent" style="font-size: 16px">
											<p>회원님의 안전한 개인정보 보호를 위해 비밀번호를 다시 한번 확인합니다.</p>
										</div>

										<div>
											<h6 class="LabelPwdNum block text-sm text-gray-00"
												style="padding-top: 15px">
												비밀번호</label>
											</h6>
										</div>

										<div class="pwdInsert">
											<div>
												<input
													class="nowPwd1 w-full px-3 py-1 text-gray-700 bg-gray-200 rounded"
													id="nowPwd" name="password" type="password"
													placeholder="현재 비밀번호를 입력해주세요">
											</div>
											<div class="PWDconfirm d-flex justify-content-end">
												<button type="button"
													class="px-4 py-0 text-white font-light tracking-wider bg-gray-900 rounded button"
													style="height: 40px" onclick="javascript:confirm()">확인</button>
											</div>
										</div>
									</form>
								</div>
							</div>
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
</body>
</html>