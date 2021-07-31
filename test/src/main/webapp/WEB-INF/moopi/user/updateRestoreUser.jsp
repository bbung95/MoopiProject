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
<!-- 스윗얼럿 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script>

	function restore() {
		var userId=$('input[name=userId]').val();
		$.ajax({
			url : "/user/json/restoreUser",
			method : "POST",
			contentType : "application/JSON",
			dataType : "text",
			data : JSON.stringify({"userId" : userId}),
			success : function(data, state) {
					swal(userId+" 회원님의 복구가 완료되었습니다.","로그인을 진행해주세요","success");
					close();
			}
		})//End ajax		
	}//End restore();
	
</script>

<style>
	.leaveUserContent {
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
	
	.modal-footer{
		text-align: center;
		font-size : 18px;
		text-decoration:none 
		color: inherit;
	}
	
</style>

</head>
<body>
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel">무피로 다시 돌아와주실건가요?</h2>
				</div>

				<div class="modal-body">
					<form id="deleteUser">
							<!-- !!!! -->				
							<input type="hidden" id="deleteId" name="userId" value="${userId}" />
							<input type="hidden" id="userRole" name="userRole" value="${userRole}" />
							<input type="hidden" id="stateReason" name="stateReason" value="${stateReason}" />
								<h4 class="leaveUserContent" style="center;"> ${userId} 님께서는 탈퇴처리 진행중인 회원입니다 </h4>
								<div class="regDateContent">탈퇴신청일자</div>
								<div class="regDate">${stateRegDate}2021-07-31</div>
								
								<div class="delete_p" style="margin-top: 10px;">
								<hr>
									<p> &nbsp;다시 뵙게되어 반갑습니다. ${nickname}님 😊 </p>
									<p> &nbsp;탈퇴신청일부터 30일 이전 재로그인시 회원복구처리가 가능하며, 기존에 가지고 계셨던 정보 그대로 저희 무피 이용이 가능합니다.</p>
									<p> &nbsp;고객님께서 탈퇴신청하신 날짜로부터 30일 이후로는 복구처리가 절대 불가하오니 이 점 다시 한번 참고 부탁드리겠습니다.</p>												          
								</div>							
					</form>
				</div>

				<div class="modal-footer">		
					<div><button type="button" class="btn btn-light" onclick="javascript:restore()">복원하기</button>
					<button type="button" class="btn btn-light" onclick="javascript:window.close()">복원취소</button></div>
				</div>
			</div>
		</div>

<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------->

</body>
</html>