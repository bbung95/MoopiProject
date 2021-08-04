<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moopi</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />

<!-- CDN(Content Delivery Network) 호스트 사용 -->


<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</head>
<body>
	<jsp:include page="../layout/toolbar.jsp"></jsp:include>


	<div id="wrapper">
		<input type="hidden" id="userId" name="userId"
			value="${dbUser.userId}">
		<div id="wrapper">
			<section class="bg-light py-5">
				<div class="container px-5 my-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">무피코인 결제하기</h1>
						<p class="lead fw-normal text-muted mb-0">원하시는 충전 금액을 선택해주세요.</p>
					</div>
					<div class="row gx-5 justify-content-center">
						<!-- Pricing card free-->
						<div class="col-lg-6 col-xl-4">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">

									<div class="mb-3">
										<span class="display-5 fw-bold">1000</span> <span
											class="text-muted">원</span>
									</div>
									<ul class="list-unstyled mb-4">
										<li class="mb-2"><i class="bi bi-check text-primary"></i>
											<strong>10 코인</strong>
									</ul>
									<div class="d-grid">
										<button class="btn btn-outline-primary" type="button"
											id="check_module" onclick="javascript:pay(1000)"
											name="cp_item">선택</button>
										<!--    <input type="hidden" name="cp_item" value="1000"></div>  -->
										<!--<label class="box-radio-input"><input type="button" class="btn btn-outline-primary" name="cp_item" id="check_module" value="1000"><span>1,000원</span></label>-->
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 col-xl-4">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">

									<div class="mb-3">
										<span class="display-5 fw-bold">2000</span> <span
											class="text-muted">원</span>
									</div>
									<ul class="list-unstyled mb-4">
										<li class="mb-2"><i class="bi bi-check text-primary"></i>
											<strong>20 코인</strong>
									</ul>
									<div class="d-grid">
										<button class="btn btn-outline-primary" type="button"
											id="check_module" onclick="javascript:pay(2000)"
											name="cp_item">선택</button>
										<!--    <input type="hidden" name="cp_item" value="1000"></div>  -->
										<!--<label class="box-radio-input"><input type="button" class="btn btn-outline-primary" name="cp_item" id="check_module" value="1000"><span>1,000원</span></label>-->
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 col-xl-4">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">

									<div class="mb-3">
										<span class="display-5 fw-bold">3000</span> <span
											class="text-muted">원</span>
									</div>
									<ul class="list-unstyled mb-4">
										<li class="mb-2"><i class="bi bi-check text-primary"></i>
											<strong>30 코인</strong>
									</ul>
									<div class="d-grid">
										<button class="btn btn-outline-primary" type="button"
											id="check_module" onclick="javascript:pay(3000)"
											name="cp_item">선택</button>
										<!--    <input type="hidden" name="cp_item" value="1000"></div>  -->
										<!--<label class="box-radio-input"><input type="button" class="btn btn-outline-primary" name="cp_item" id="check_module" value="1000"><span>1,000원</span></label>-->
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 col-xl-4">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">

									<div class="mb-3">
										<span class="display-5 fw-bold">4000</span> <span
											class="text-muted">원</span>
									</div>
									<ul class="list-unstyled mb-4">
										<li class="mb-2"><i class="bi bi-check text-primary"></i>
											<strong>40 코인</strong>
									</ul>
									<div class="d-grid">
										<button class="btn btn-outline-primary" type="button"
											id="check_module" onclick="javascript:pay(4000)"
											name="cp_item">선택</button>
										<!--    <input type="hidden" name="cp_item" value="1000"></div>  -->
										<!--<label class="box-radio-input"><input type="button" class="btn btn-outline-primary" name="cp_item" id="check_module" value="1000"><span>1,000원</span></label>-->
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 col-xl-4">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">

									<div class="mb-3">
										<span class="display-5 fw-bold">5000</span> <span
											class="text-muted">원</span>
									</div>
									<ul class="list-unstyled mb-4">
										<li class="mb-2"><i class="bi bi-check text-primary"></i>
											<strong>50 코인</strong>
									</ul>
									<div class="d-grid">
										<button class="btn btn-outline-primary" type="button"
											id="check_module" onclick="javascript:pay(5000)"
											name="cp_item">선택</button>
										<!--    <input type="hidden" name="cp_item" value="1000"></div>  -->
										<!--<label class="box-radio-input"><input type="button" class="btn btn-outline-primary" name="cp_item" id="check_module" value="1000"><span>1,000원</span></label>-->
									</div>
								</div>
							</div>

						</div>

						<div class="col-lg-6 col-xl-4">
							<div class="card mb-5 mb-xl-0">
								<div class="card-body p-5">

									<div class="mb-3">
										<span class="display-5 fw-bold">10000</span> <span
											class="text-muted">원</span>
									</div>
									<ul class="list-unstyled mb-4">
										<li class="mb-2"><i class="bi bi-check text-primary"></i>
											<strong>100 코인</strong>
									</ul>
									<div class="d-grid">
										<button class="btn btn-outline-primary" type="button"
											id="check_module" onclick="javascript:pay(10000)"
											name="cp_item">선택</button>
										<!--    <input type="hidden" name="cp_item" value="1000"></div>  -->
										<!--<label class="box-radio-input"><input type="button" class="btn btn-outline-primary" name="cp_item" id="check_module" value="1000"><span>1,000원</span></label>-->
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 
	<input type="hidden" id="userId" name="userId" value="${dbUser.userId}">
	  <div class="card-body bg-white mt-0 shadow">
    <p style="font-weight: bold">무피코인 결제</p>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span>1,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="2000"><span>2,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="3000"><span>3,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="100"><span>100원</span></label>
    <p  style="color: #ac2925; margin-top: 30px">무피코인 최소 충전금액은 100원이며 <br/>최대 충전금액은 10,000원 입니다.</p>
    <button type="button" class="btn btn-lg btn-block  btn-custom" id="check_module">충 전 하 기</button>
 </div>	 -->

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<script>
		let userId = $('#userId').val();
		//alert(userId);

		function pay(price) {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp18633009');
			//var price = $(this).find('input').val()
			//var price = $('button[name="cp_item"]:checked').val();
			//var price = $(this).attr("price");
			console.log(price);

			IMP.request_pay({
				pg : 'inicis',
				//pg : 'kakao',
				/*
				'kakao':카카오페이,
				html5_inicis':이니시스(웹표준결제)
				'nice':나이스페이
				'jtnet':제이티넷
				'uplus':LG유플러스
				'danal':다날
				'payco':페이코
				'syrup':시럽페이
				'paypal':페이팔
				 */
				pay_method : 'card',
				/*
				'samsung':삼성페이,
				'card':신용카드,
				'trans':실시간계좌이체,
				'vbank':가상계좌,
				'phone':휴대폰소액결제
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),

				name : '무피코인 결제',

				amount : price,

				//buyer_email : 'nava@naver.com',
				buyer_name : userId,
			//buyer_tel : '010-1234-5678',
			//buyer_addr : '서울특별시',
			//buyer_postcode : '111-111'
			//m_redirect_url : 'https://www.yourdomain.com/payments/complete'

			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다. 감사합니다.';
					//msg += '고유ID : ' + rsp.imp_uid;
					//msg += '상점 거래ID : ' + rsp.merchant_uid;
					//msg += '결제 금액 : ' + rsp.paid_amount;
					//msg += '카드 승인번호 : ' + rsp.apply_num;
					document.location.href = "/flash/listFlash";//아란트창 확인후 이동할 url
					$.ajax({
						type : "POST",
						url : "/payment/addPayment",//충전 금액값을 보낼 url
						data : {
							"amount" : price,
							"userId" : userId,

						},

					});

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '사유 : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href = "/payment/addPaymentView";//아란트창 확인후 이동할 url

			});
		}
	</script>


</body>
</html>