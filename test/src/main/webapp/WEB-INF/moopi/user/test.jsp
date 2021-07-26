<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 모바일 인증하기 페이지 </title>
	
<!-- 필수 Core theme CSS (includes Bootstrap)-->
	<link href="/css/admin/styles.css" rel="stylesheet" />
	
<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/styles.css">
<! -- jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->
	
	<!-- 구글폰트api -->	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">
	
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>	

	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	
<!-- 모달 왜 안돼 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	
	
<script>

//=====================================================사용자 정지를 하기위한 function===========================================================	

	

//=====================================================체크를 통하여 정지타입마다 정지일자가 구분됨===========================================================	

	

</script>

</head>
<body>

<tbody class="ct_list_pop">



										<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
												 <input type="hidden" name="email2" id="email2" value="${report.receiveReporter.email}"/>
												 정지
										</button>

<!-- =================================================사용자 정지 모달 시작================================================================== -->            
		<div class="modal fade" id="deleteUser" tabindex="-1" role="modal" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					
					<div class="modal-header">
						<button type="button" class="madal fade" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">회원탈퇴</h4>
					</div>
						
						<div class="modal-body">
							<form class="form-horizontal" method="post" name="updateSuspendUser">
								<input type="hidden" id="userId" name="userId" value=""/>   
									<div class = "form-group">
										  <fieldset>
								   				 <legend> 정말로 탈퇴하시겠어요? </legend>
								   				 <label for="radio-1 ">yes</label>
								    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="1">
								   				 <label for="radio-2">No</label>
								   				 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="2">
								  			</fieldset>
							        </div>
		        			</form>
		     			 </div>
		     			 
					<div class="modal-footer">
				      	<button id="btn1" class="btn btn-default" >정 지</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫 기</button>
					</div>
					
				</div>
			</div>
		</div>
		        
<!-- =================================================사용자 정지 모달 끝================================================================== -->        
</body>
</html>