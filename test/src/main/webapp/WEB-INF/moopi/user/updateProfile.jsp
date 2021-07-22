<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 프로필 수정 </title>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<!-------------------------------------------------------------------------------------------------------------------------->

<script>

// 수정버튼 --------------------------------------------------------------------------------------------------------------------------
	
	// [2021-07-19 400Error 발생 : Required request part 'profileImage' is not present
	// 0. 프로필이미지수정 버튼 실행시 uploadFile 실행

	function updateProfileImage() {
		
		var userId=$('input[name=userId]').val();
		var profileImage=$('input[name=profileImage]').val();
		
		console.log("프로필이미지 Ajax 실행");
	
		// formData Object 생성 + form 가져오기
		let form = $('#upload');
		var formData = new FormData(form[0]);
		
		console.log("formData : "+formData);
		
		for (var key of formData.keys()) {
    	  console.log("key : "+key);
    	}
    	for (var value of formData.values()) {
    	  console.log("value : "+value);
    	} 
    	$.ajax({
                url : "/user/json/uploadProfileImage"
                    , method : "POST"
                    , processData : false
                    , contentType : false
                    , data : formData
                    , dataType: 'text'
                    , success:function(result) {
                        alert(" ajax success! ");
                        alert(result);	// 확인              
                    } 
		});
    }

/*	
	// 1. 닉네임수정
	function updateNickname() {
	
	
		var nickname=$("input[name='nickname'").val();
		$.ajax({
					url : "/user/updateNickname"
					, type : "POST"
					, dataType : "text"
					, data : nickname
					, error : function() {
						alert("실패");
					},
					success : function(data) {
						$('#Context').html(data);
					}
				});
	}
		var userId=$("input[name='userId'").val();
		var nickname=$("input[name='nickname'").val();

		$("form").attr("method" , "POST").attr("action" , "/user/updateNickname").submit();
	}
*/	

	// 1. 닉네임수정
	function updateNickname() {
		
		var userId=$("input[name='userId'").val();
		var nickname=$("input[name='nickname'").val();

		$("form").attr("method" , "POST").attr("action" , "/user/updateNickname").submit();
	}
	
	// 2. 프로필소개 수정
	
	function updateContent() {

		var userId=$("input[name='userId']").val();
		var profileContent=$("input[name='profileContent']").val();
		
		$.ajax({
					url : "/user/json/updateContent/"+userId
					,method : "GET" 	
					,dataType : "json"
					,headers : {
						"Accept" : "application/json"
						,"Content-Type" : "application/json"
					},
				success : function(JSONData, status){
					alert("성공");				
				}				
			});
		}
		
		$("button[name='ProfileContent']").on("click", function(){
			alert("asd");
			updateContent();
		});
	
	// 3. 관심사 수정
/*	function updateContent() {
		alert("수정시작");		
		var userId=$("input[name='userId'").val();
		var int1=$("select[name='interestFirst'").val();
		var int2=$("select[name='interestSecond'").val();
		var int3=$("select[name='interestThird'").val();
		
		$("form").attr("method" , "POST").attr("action" , "/user/updateInterest").submit();		
	}
*/
<!-------------------------------------------------------------------------------------------------------------------------->

//-- 닉네임 중복체크 --------------------------------------------------------------------------------------------------------------------------

	$(function() {	

		$("#nickname").keyup(function() {
			var nickname = $('#nickname').val();
		
			$.ajax({				
				url : '${pageContext.request.contextPath}/user/nicknameCheck?nickname='+nickname,
				type : 'get',
				success : function(data) {			
							
					if (data == 1) {							
							// 닉네임이 중복일 경우								
								$("#NNCheck").text("해당 닉네임은 이미 사용중입니다.");
								$("#NNCheck").css("color", "red");
								$("#joinButton").attr("disabled", true);
						
					} else if (data == 0) {
								
								$("#NNCheck").text("사용가능한 닉네임 입니다.");
								$("#NNCheck").css("color", "black");
								$("#joinButton").attr("disabled", false);						
					
					} 
				}, error : function() {
					console.log("실패");
				}
			});
		});
	});
<!-------------------------------------------------------------------------------------------------------------------------->

// # 주소 Event--------------------------------------------------------------------------------------------------------------------------	

		$('#adrSearch').on('click', function(){		
			new daum.Postcode({	
				oncomplete: function(data) {
					$('#fullAddr').val(data.address);
					$('#addr').val(data.bname);
				}
			}).open();
		})
		
</script>

<style>
body{
	padding-top: 50px;
}
</style>

</head>
<body>

<!-- Tool Bar ---------------------------------------------------------------------------------------------------------------->
	<jsp:include page="../layout/toolbar.jsp" />
<!---------------------------------------------------------------------------------------------------------------------------->

<h3> 프로필수정 </h3>
	
<!-- 화면구성 div Start ---------------------------------------------------------------------------------------------------------------->

	<div class="container">
	
		<h1 class="bg-primary text-center">프로필수정</h1>

<!-- FORM START ---------------------------------------------------------------------------------------------------------------->
	
	<!-- 아이디[숨김표시] -->
	<input type="hidden" class="userId" name="userId" value="${dbUser.userId}"/>

	<!-- 프로필이미지[파일업로드] -->
	<form id="upload" class="form-horizontal" method="post" enctype="multipart/form-data">		
		<div class="form-group">
			<label for="profileImage" class="col-sm-offset-1 col-sm-3 control-label">프로필이미지</label>
			<div class="col-sm-4">					
				<input type="file" name="profileImage" type="text" value="${dbUser.profileImage}" accept="image/*" />
				<button class="uploadbtn" type="button" onclick="javascript:updateProfileImage()">업로드</button>
			</div>
		</div>		
	</form>
	
	
	<!-- 닉네임 -->
	<form class="form-horizontal">
	<div class="form-group">
		<label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="nickname" name="nickname" value="${dbUser.nickname}">
			<div class="check_font" id="NNCheck"></div>
		</div>
		<div>
			<button type="button" class="NNedit" id="img_btn" onclick="updateNickname()">수정</button>
		</div>
  
	</div>

	<!-- 프로필소개 -->
	<div class="form-group">
		<label for="profileContent" class="col-sm-offset-1 col-sm-3 control-label">프로필소개</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="profileContent" name="profileContent" value="${dbUser.profileContent}">
		</div>
		<div>
			<button type="button" name="ProfileContent" class="ProfileContent" >수정</button>
		</div>
	</div>
	
	<!-- 뱃지 -->
	<div class="form-group">
		<label for="badge" class="col-sm-offset-1 col-sm-3 control-label">뱃지</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="badge" name="badge" value="${dbUser.badge}" readonly>
		</div>
		<div>
			<button type="button" class="badge" id="img_btn">수정</button>
		</div>
	</div>
	
	<!-- 관심사 : 마우스 Hover 이벤트구현예정 -->
<!--
	<div class="form-group">
		<label for="interest" class="col-sm-offset-1 col-sm-3 control-label">관심사</label>
		<div class="col-sm-3"> 
				
				<select name="interestFirst">
						<option>관심사1</option> 
						<option value="1">아웃도어/여행/사진/영상</option>
						<option value="2">운동/스포츠</option>
						<option value="3">인문학/책/글</option>
						<option value="4">업종/직무</option>
						<option value="5">외국/언어</option>
						<option value="6">문화/공연/축제/음악/악기</option>
						<option value="7">공예/만들기</option>
						<option value="8">댄스/무용</option>
						<option value="9">사교/인맥</option>                                    
						<option value="10">차/오토바이</option>
						<option value="11">게임/오락</option>
						<option value="12">맛집/카페</option>
				</select> 
				
				수정 전 : ${dbUser.interestFirst}
				
				<select name="interestSecond">
						<option>관심사2</option>
						<option value="1">아웃도어/여행/사진/영상</option>
						<option value="2">운동/스포츠</option>
						<option value="3">인문학/책/글</option>
						<option value="4">업종/직무</option>
						<option value="5">외국/언어</option>
						<option value="6">문화/공연/축제/음악/악기</option>
						<option value="7">공예/만들기</option>
						<option value="8">댄스/무용</option>
						<option value="9">사교/인맥</option>                                    
						<option value="10">차/오토바이</option>
						<option value="11">게임/오락</option>
						<option value="12">맛집/카페</option>
				</select>
				
				수정 전 : ${dbUser.interestSecond}
				
				<select name="interestThird">
						<option>관심사3</option>
						<option value="1">아웃도어/여행/사진/영상</option>
						<option value="2">운동/스포츠</option>
						<option value="3">인문학/책/글</option>
						<option value="4">업종/직무</option>
						<option value="5">외국/언어</option>
						<option value="6">문화/공연/축제/음악/악기</option>
						<option value="7">공예/만들기</option>
						<option value="8">댄스/무용</option>
						<option value="9">사교/인맥</option>                                    
						<option value="10">차/오토바이</option>
						<option value="11">게임/오락</option>
						<option value="12">맛집/카페</option>
				</select>
				
				수정 전 : ${dbUser.interestThird}
		</div>
			<div class="form-group">
		<div>
			<button type="button" class="Int1" id="img_btn" onclick="updateContent()">수정</button>
		</div>
	</div>
-->
	
	
	<!-- 거주지 : API 데려와야함 -->	
	<div class="form-group">
		<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="fullAddr" name="fullAddr" value="${dbUser.fullAddr}" readonly>			
		</div>
		<button type="button" class="btn btn-info" id="adrSearch" name="addr">주소지검색</button>
	</div>
	<div class="form-group">
		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label" value="${dbUser.addr}">동</label>					
		<div class="col-sm-2">
			<input type="text" class="form-control" id="addr" name="addr" placeholder="차후 hidden 예정">
		</div>
		<button type="button" class="Int1" id="img_btn" onclick="updateContent()">수정</button>			
	</div>
	
	<!-- 마이홈 공개, 비공개 설정-->
	<div class="form-group">
	
		<label for="MHopen" class="col-sm-offset-1 col-sm-3 control-label">마이홈공개여부</label>	
			<input type="radio" id="MHopen" name=MHopen" value="${dbUser.myhomeState}">공개<br>
			<input type="radio" id="MHopen" name=MHopen" value="${dbUser.myhomeState}">비공개
			<button type="button" id="img_btn">수정</button>

	</div>
	
	<!-- 회원탈퇴 -->
	<div class="form-group">
		<label for="deleteUser" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		<div class="col-sm-3">
			<input type="button" class="form-control" id="fullAddr" name="fullAddr" value="${dbUser.fullAddr}" readonly>			
		</div>
		<button type="button" class="btn btn-info" id="adrSearch" name="addr">주소지검색</button>
	</div>
	</form>

	<!-- 프로필이미지 (버튼누르면 수정되게끔 설정) 차후 추가 수정,보완해야 함 -->	
	<p>프로필이미지 : ${dbUser.profileImage}</p>
	<p>닉네임 : ${dbUser.nickname}</p>
	<p>프로필소개 : ${dbUser.profileContent}</p>
	<p>뱃지 : ${dbUser.badge}</p>
	<p>관심사1 : ${dbUser.interestFirst}</p>
	<p>관심사2 : ${dbUser.interestSecond}</p>
	<p>관심사3 : ${dbUser.interestThird}</p>
	<p>거주지 전체주소 : ${dbUser.fullAddr}</p>	
	<p>거주지 간략주소 : ${dbUser.addr}</p>	
	
</body>
</html>