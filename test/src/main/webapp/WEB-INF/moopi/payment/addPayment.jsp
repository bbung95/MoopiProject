<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- CDN(Content Delivery Network) 호스트 사용 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript"
	src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	
	<input type="hidden" id="userId" name="userId" value="${user.userId}">
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
 </div>


	<script>
	let userId = $('#userId').val();
	alert(userId);
	
		$("#check_module").click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp18633009');
			var price = $('input[name="cp_item"]:checked').val();
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
				buyer_tel : '010-1234-5678',
				//buyer_addr : '서울특별시',
				//buyer_postcode : '111-111'
				//m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			
				
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					$.ajax({ 
						type: "POST" ,
						url: "/payment/addPayment",//충전 금액값을 보낼 url
						data: {
							"amount" : price,
							"userId" : userId,
							
						},
					});
				
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '사유 : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href="/flash/listFlash";//아란트창 확인후 이동할 url
				
			});
		});
	</script>


</body>
</html>