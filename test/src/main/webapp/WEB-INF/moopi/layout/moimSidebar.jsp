<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
 		
        $(document).ready(function(){
            var target = $("#sidebar");
 
            // 버튼을 클릭하면 사이드바 열림
            $(document).on("click", "#side", function (e){
                target.show();
                target.addClass('emphasized');
            });
 
            // 사이드바 외부를 클릭하면 사이드바 닫힘
            $(document).mouseup(function (e){
                if(target.has(e.target).length==0) {
                    target.hide();
                    target.removeClass('emphasized');
                } 
            });
        });
        

        $(function(){
        	//alert('유저아이디:${user.userId}' +  '모임번호:${moim.mmNo}');
        	/* <c:if test="${empty dbUser}">
        	$("#choose").text('가입하기');
        	</c:if> */
        	
        	$.ajax( 
        			{
        				url : "/moim/json/checkMember/${dbUser.userId}/${moim.mmNo}",
        				method : "GET" ,
        				dataType : "json" ,
        				headers : {
        					"Accept" : "application/json",
        					"Content-Type" : "application/json"
        				},
        				success : function(JSONData , status) {
//         					alert(JSONData.memberRole);
//         					alert(status);
//             				alert("JSONData : \n"+JSONData);
        					if(JSONData.memberRole == 1 || JSONData.memberRole == 7){
        						$("#choose").text('Plz Wait..');
        					}else if(JSONData.memberRole == 5 || JSONData.memberRole == 6){
        						$("#choose").text('Disapprove');
        					}else if(JSONData.memberRole >= 2 && JSONData.memberRole <= 4){
        						$("#choose").text('Withdraw');
        						$('#sidebar').append('<h1>Chat</h1>');
        					}else {
        						$("#choose").text('Join Us');
        					}
        				}
        		}); //ajax 종료
        });


        function fncUptMoimView(mmNo){
        	self.location ="/moim/updateMoimView?mmNo="+mmNo
        }
        
    	function fncUptMoim(){
    		
    		
    		let mmName = $('#mmName').val();
    		let uploadFile = $('#uploadFile').val();
    		let mmContent = $('#mmContent').val();
    		let mmMaxCount = $('#mmMaxCount').val();
    		
    		if(mmName == '' || mmName.length < 1 ){
    			
    			swal({
    				  title: "모임무피명을 입력해주세요",
    				  icon: "warning",
    				  dangerMode: true,
    			})
    			
    			return;
    		}
    		if(uploadFile == '' || uploadFile.length < 1 ){
    			
    			swal({
    				  title: "대표 썸네일을 등록해주세요",
    				  icon: "warning",
    				  dangerMode: true,
    			})
    			
    			return;
    		}
    		if(mmContent == '' || mmContent.length < 1 ){
    			
    			swal({
    				  title: "간단 소개글을 입력해주세요",
    				  icon: "warning",
    				  dangerMode: true,
    			})
    			
    			return;
    		}
    		if(mmMaxCount == '' || mmMaxCount.length < 1 ){
    			
    			swal({
    				  title: "최대정원을 입력해주세요",
    				  icon: "warning",
    				  dangerMode: true,
    			})
    			
    			return;
    		}
    		
    		
    		swal({
    			  title: "모임무피를 수정하시겠습니까?",
    			  icon: "warning",
    			  buttons: true,
    			  dangerMode: true,
    		})
    		.then((willDelete) => {
    			  if (willDelete) {
    				   swal("모임무피가 수정되었습니다.", {
    				     icon: "success",
    				   });
    				   $("#uptMoim").attr("method", "POST").attr("action", "/moim/updateMoim").submit();
    			  } else {
    				   return;
    			 }
    		})
    		
    	}

//         function fncApply(mmNo){
//         	<c:if test = "${null ne dbUser.userId}">
//         		alert("가입하기");
//         		alert("가입신청이 완료되었습니다.");
//         		self.location ="/moim/applyMoim?userId=${dbUser.userId}&mmNo="+mmNo	
//         	</c:if>
//         	<c:if test = "${empty dbUser.userId}">
//         	swal("회원가입이 필요한 페이지입니다.");
//         	</c:if>
//         }

        function fncApplyList(mmNo){
        	self.location ="/moim/listMember?status=1&mmNo="+mmNo
        }

        function fncListMember(mmNo){
        	self.location ="/moim/listMember?userId=${dbUser.userId}&status=2&mmNo="+mmNo
        }

        function fncListMeeting(mmNo){
        	self.location ="/meeting/listMeeting?userId=${dbUser.userId}&mmNo="+mmNo
        }

        function fncGetMoim(mmNo){
        	self.location ="/moim/getMoim?mmNo="+mmNo
        };	
        
        function fncGetBoard(){
        	self.location ="/moim/listMoimBoard?category=4&boardMoimNo=${moim.mmNo}"
        }
        
        function fncInvite(mmNo){
        	self.location= "/moim/listInvite?mmNo="+mmNo
        }
</script>



<style>
#side {
	margin: 10px;
	width: 120px;
	height: 120px;
	border-radius: 50%;
	/* 	border: 4px solid #fff;; */
	/* 	border-color: #05D4EB; */
	float: right;
}

img.whale {
	position: fixed;
	bottom: 20px;
	right: 20px;
	animation: rotate_image 10s linear infinite;
	transform-origin: 50% 50%;
	vertical-align: middle;
	z-index: 2;
}

@
keyframes rotate_image { 100% {
	transform: rotate(360deg);
}

}
.emphasized {
	box-shadow: rgba(0, 0, 0, 0.5) 0 0 0 9999px;
}

#sidebar {
	display: none;
	position: fixed;
	top: 0;
	font-size: 36px;
	right: 0;
	background-color: #63B3F8;
	color: #fff;
	text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #0fa,
		0 0 82px #0fa, 0 0 92px #0fa, 0 0 102px #0fa, 0 0 151px #0fa;
	width: 250px;
	height: 100vh;
	text-align: center;
	padding-top: 150px;
	z-index: 2;
	background-image: url("/images/uploadFiles/${moim.mmFile}");
}

#listMember {
	display: none;
}
</style>

<!-- BootsWatch CDN 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous">
-->

<!-- Google Font CDN 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&display=swap" rel="stylesheet">


<style>
	#container {
	font-family: 'Gaegu', cursive; 
	}
</style>

onClick="fncUptMoimView(${moim.mmNo})" 
-->

<!-- 종이비행기 -->
<img id="side" class="whale" src="/images/air2.png" width="400"
	height="300 " />

<!-- SideBar Start-->
<div id="sidebar">
	<h1 onClick="fncGetMoim(${moim.mmNo})">Home</h1>
	<h1 onClick="fncGetBoard()">Board</h1>
	<c:if test="${!empty dbUser}">
		<h1 id="choose">Join Us</h1>
	</c:if>
	<h1 onClick="fncListMeeting(${moim.mmNo})">Meeting</h1>
	<h1 onClick="fncListMember(${moim.mmNo})">Member</h1>
	<c:if test="${dbUser.userId eq moim.mmConstructor.userId}">
		<h1 onClick="fncInvite(${moim.mmNo})">Invite</h1>
		<h3>
			<div data-bs-target="#myModal" data-bs-toggle="modal">Update</div>
		</h3>
		<h3>
			<dic onClick="fncApplyList(${moim.mmNo})">List Apply 
</div>
</h3>
</c:if>
</div>
<!-- SideBar End -->


<script type="text/javascript">
	
	var mmNo6 = ${moim.mmNo};
	var userId6 = "<c:out value='${dbUser.userId}'/>";
	
    $("h1#choose").on("click", function(){
		
		if($("#choose").text() == 'Join Us'){
			//alert("가입신청 완료");
			swal("가입신청이 완료되었습니다", 'success');
		        	$.ajax( 
        			{
        				url : "/moim/json/applyMoim",
        				method : "POST" ,
        				dataType : "json" ,
       					contentType : "application/JSON",
        				data: JSON.stringify( {"mmUser" : {"userId" : userId6 },
        					"mmNo" : mmNo6 , "memberRole": 1} ),
        				
        				success : function(JSONData , status) {
        					//alert(status);
        				}
        		}); //ajax 종료 
		} else if($("#choose").text() == 'Plz Wait..')	{
			
			swal("가입 승인 대기중입니다.", 'success');
        	
			return;
			
		}else if($("#choose").text() == 'Disapprove')	{
			
			swal("가입이 불가능합니다.", 'success');
			
			return;
			
		}else if($("#choose").text() == 'Withdraw')	{
			
			swal("모임을 탈퇴합니다.", 'success');
			
        	location.href = "/moim/leaveMoim?userId="+userId6+"&mmNo="+mmNo6; 
		}
		
	});

	$("h1:contains('Home')").on("click", function(){
// 		alert("홈클릭");
		location.href = "/moim/getMoim?mmNo=${moim.mmNo}";
	})
	
	$("h1:contains('Board')").on("click", function(){
// 		alert("게시글클릭");
		location.href = "/moim/listMoimBoard?category=4&boardMoimNo=${moim.mmNo}";
	})
		
	
	$("h1:contains('Meeting')").on("click", function(){
// 		alert("정모클릭");
		location.href = "/meeting/listMeeting?userId=${dbUser.userId}&mmNo=${moim.mmNo}";
		
	})
	
	$('h1:contains("Chat")').on('click', function(){
		
		$.ajax({
			url: "/common/chat/joinRoom/"+userId6+"/"+mmNo6+"/2",
			method: "GET",
			dataType: "JSON",
			success: function(data,state){

				let	url = "https://bbung95-rtc.herokuapp.com/chat?userId="+data.user.userId+"&trgt="+data.target.mmNo+"&type="+data.type
					+"&name="+data.user.nickname+"&profile="+data.user.profileImage+"&trgtName="+data.target.mmName
					+"&trgtProfile="+data.target.mmFile+"&roomNo="+data.target.mmNo;
		
				popWin = 
					window.open(
							url,
							"popWin"+mmNo6,
							"left=460, top=300, width=460, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
				}
			})
			
	})
	
// 	$("h1:contains('Invite')").on("click", function(){
// 		alert("초대하기클릭");
// 		location.href = "/moim/listInvite"
// 	})
	
	$("h1:contains('Member')").on("click", function(){
// 		alert("멤버목록클릭");
// 		self.location = "/meeting/listMeeting?userId=${dbUser.userId}&mmNo=${moim.mmNo}";
		
	})
	
	
	</script>

<!-- Modal 시작-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">모임 무피 업데이트</h4>
			</div>
			<div class="modal-body">
				<!-- 폼시작 -->

				<!-- form Start /////////////////////////////////////-->
				<form id="uptMoim" class="form-horizontal" name="detailForm"
					enctype="multipart/form-data">
					<input type="hidden" name="userId" value="${dbUser.userId}">
					<input type="hidden" name="mmNo" value="${moim.mmNo}">
					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임무피명</label>
						<div class="col-sm-20">
							<input type="text" class="form-control" id="mmName" name="mmName"
								value="${moim.mmName}">
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">대표썸네일</label>
						<div class="col-sm-40">
							<input type="file" class="form-control" id="uploadFile"
								name="uploadFile">
						</div>
					</div>

					<br>

					<center>
						<p>drag and drop your image!</p>
						<div class="content"></div>
					</center>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">간단소개글</label>
						<div class="col-sm-40">
							<textarea style="resize: none" class="form-control"
								id="mmContent" name="mmContent" >${moim.mmContent}</textarea>
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">지역구</label>
						<div class="col-sm-40">
							<select class="form-control" id="mmAddr" name="mmAddr">
								<option>종로구</option>
								<option>중구</option>
								<option>용산구</option>
								<option>성동구</option>
								<option>광진구</option>
								<option>동대문구</option>
								<option>중랑구</option>
								<option>성북구</option>
								<option>강북구</option>
								<option>도봉구</option>
								<option>노원구</option>
								<option>은평구</option>
								<option>서대문구</option>
								<option>마포구</option>
								<option>양천구</option>
								<option>강서구</option>
								<option>구로구</option>
								<option>금천구</option>
								<option>영등포구</option>
								<option>동작구</option>
								<option>관악구</option>
								<option>서초구</option>
								<option>강남구</option>
								<option>송파구</option>
								<option>강동구</option>
							</select>
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인원</label>
						<div class="col-sm-40">
							<input type="text" class="form-control" id="mmMaxCount"
								name="mmMaxCount" value="${moim.mmMaxCount}">
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심사선택</label>
						<div class="col-sm-40">
							<select class="form-control" id="mmInterest" name="mmInterest">
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
								<option value="12">맛집/카</option>
							</select>
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최소연령</label>
						<div class="col-sm-40">
							<input type="text" class="form-control" id="mmMinAge"
								name="mmMinAge" value="${moim.mmMinAge}">
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">최대연령</label>
						<div class="col-sm-40">
							<input type="text" class="form-control" id="mmMaxAge"
								name="mmMaxAge" value="${moim.mmMaxAge}">
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상태</label>
						<div class="col-sm-40">
							<div class="radio">
								<label> <input type="radio" name="mmState" id="mmState1"
									value="1" checked> 공개
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="mmState" id="mmState2"
									value="2"> 비공개
								</label>
							</div>
						</div>
					</div>

					<br>

					<div class="form-group">
						<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">유형</label>
						<div class="col-sm-4">
							<div class="radio">
								<label> <input type="radio" name="mmType" id="mmType1"
									value="1" checked> 일반 모임무피
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="mmType" id="mmType"
									value="2"> 자유 모임무피
								</label>
							</div>
						</div>
					</div>
				</form>

				<!-- 폼끝 -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onClick="fncUptMoim()">Update</button>
			</div>
		</div>
	</div>
</div>

