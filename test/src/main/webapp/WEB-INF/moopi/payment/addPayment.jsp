<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript"
	src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	
	<input type="hidden" id="userId" name="userId" value="${user.userId}">
	<div class="card-body bg-white mt-0 shadow">
    <p style="font-weight: bold">�������� ����</p>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span>1,000��</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="2000"><span>2,000��</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="3000"><span>3,000��</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000��</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000��</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="100"><span>100��</span></label>
    <p  style="color: #ac2925; margin-top: 30px">�������� �ּ� �����ݾ��� 100���̸� <br/>�ִ� �����ݾ��� 10,000�� �Դϴ�.</p>
    <button type="button" class="btn btn-lg btn-block  btn-custom" id="check_module">�� �� �� ��</button>
 </div>


	<script>
	let userId = $('#userId').val();
	alert(userId);
	
		$("#check_module").click(function() {
			var IMP = window.IMP; // ��������
			IMP.init('imp18633009');
			var price = $('input[name="cp_item"]:checked').val();
		    console.log(price);
			
			
			IMP.request_pay({
				pg : 'inicis',
				//pg : 'kakao',
				/*
				'kakao':īī������,
				html5_inicis':�̴Ͻý�(��ǥ�ذ���)
				'nice':���̽�����
				'jtnet':����Ƽ��
				'uplus':LG���÷���
				'danal':�ٳ�
				'payco':������
				'syrup':�÷�����
				'paypal':������
				 */
				pay_method : 'card',
				/*
				'samsung':�Ｚ����,
				'card':�ſ�ī��,
				'trans':�ǽð�������ü,
				'vbank':�������,
				'phone':�޴����Ҿװ���
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				
				name : '�������� ����',
				
				amount : price,
				
				//buyer_email : 'nava@naver.com',
				buyer_name : userId,
				buyer_tel : '010-1234-5678',
				//buyer_addr : '����Ư����',
				//buyer_postcode : '111-111'
				//m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			
				
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '������ �Ϸ�Ǿ����ϴ�.';
					msg += '����ID : ' + rsp.imp_uid;
					msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
					msg += '���� �ݾ� : ' + rsp.paid_amount;
					msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
					$.ajax({ 
						type: "POST" ,
						url: "/payment/addPayment",//���� �ݾװ��� ���� url
						data: {
							"amount" : price,
							"userId" : userId,
							
						},
					});
				
				} else {
					var msg = '������ �����Ͽ����ϴ�.';
					msg += '���� : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href="/flash/listFlash";//�ƶ�Ʈâ Ȯ���� �̵��� url
				
			});
		});
	</script>


</body>
</html>