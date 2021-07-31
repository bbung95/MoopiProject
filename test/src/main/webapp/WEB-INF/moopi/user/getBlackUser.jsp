<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 모바일 인증하기 페이지 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>
	
</script>

<style>
	.blackUserContent {
		text-align: center;
		font-size : 18px;
	}
	
	.delete_p {
		font-weight: 340;
		color : black;
	}
	
	.regDateContent {
		text-align: center;
	}
	
	.regDate {
		text-align: center;
		font-size : 24px;
	}
	
	.stateReason {
		text-align: center;
		font-size : 24px;
	}
	
	.modal-footer{
		text-align: center;
		font-size : 18px;
		text-decoration:none 
		color: inherit;
	}
	
	.emailing{
		text-align: center;
	}
	
</style>

</head>
<body>
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel">회원님께서는 현재 블라인드 상태입니다.</h2>
				</div>

				<div class="modal-body">
					<form id="deleteUser">
							<!-- !!!! -->				
							<input type="hidden" id="deleteId" name="userId" value="${userId}" />
							<input type="hidden" id="userRole" name="userRole" value="${userRole}" />
							<input type="hidden" id="stateReason" name="stateReason" value="${stateReason}" />
								<h4 class="blackUserContent" style="center;"> ${userId} 님께서는 하단의 사유로 블라인드 처리되신 회원입니다 </h4>
								<div class="regDateContent">블랙일자 및 사유</div>
								<div class="regDate">${stateRegDate}2021-07-31</div>
								<div class="stateReason">${stateReason}</div>
								
								<div class="delete_p" style="margin-top: 10px;">
								<hr>
									<p> &nbsp;저희 무피 운영진들은 쾌적하고 원활한 무피사용를 위하여 회원님들의 의견을 적극 반영하고 있습니다.
									혹, 해당 내용과 관련하여 상이한 내용 또는 문의사항이 있으시다면 하단의 이메일로 문의 부탁드리겠습니다.</p>	
									<hr>
									<div>
										<p class="emailing"><a href="mailto:hello@norgianclue.com">hello@norgianclue.com</a></p>
									</div>								          
								</div>							
					</form>
				</div>

				<div class="modal-footer">		
					<button type="button" class="btn btn-light" onclick="javascript:window.close()">확인</button></div>
				</div>
			</div>
		</div>

<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->

</body>
</html>