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
        	<c:if test="${empty dbUser}">
        	$("#choose").text('가입하기');
        	</c:if>
        	
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
        					if(JSONData.memberRole == 1){
        						//alert('일반멤버');
        						$("#choose").text('Plz Wait..');
        					}else if(JSONData.memberRole == 5){
        						$("#choose").text('Disapprove');
        					}else if(JSONData.memberRole >= 2 && JSONData.memberRole <= 4){
        						$("#choose").text('Withdraw');
        					}else {
        						$("#choose").text('Join Us');
        					}
        					
        				}
        		}); //ajax 종료
        });


        function fncUptMoimView(mmNo){
        	swal("모임수정");
        	self.location ="/moim/updateMoimView?mmNo="+mmNo
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
        	swal("가입신청목록보기");
        	self.location ="/moim/listMember?status=1&mmNo="+mmNo
        }

        function fncListMember(mmNo){
        	swal("유저목록보기");
        	self.location ="/moim/listMember?status=2&mmNo="+mmNo
        }

        function fncListMeeting(mmNo){
        	swal("정모일정보기");
        	self.location ="/meeting/listMeeting?userId=${dbUser.userId}&mmNo="+mmNo
        }

        function fncGetMoim(mmNo){
        	swal("모임상세보기");
        	self.location ="/moim/getMoim?mmNo="+mmNo
        };	
        
        function fncGetBoard(){
        	swal("게시글보기");
        	self.location ="/moim/listMoimBoard?category=4&boardMoimNo=${moim.mmNo}"
        }
        
        function fncInvite(mmNo){
        	swal("초대목록보기");
        	console.log(mmNo);
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

img.whale{
	position: fixed;
	bottom: 20px;
	right: 20px;
    animation: rotate_image 10s linear infinite;
    transform-origin: 50% 50%;
    vertical-align:middle;
}
 
@keyframes rotate_image{
	100% {
    	transform: rotate(360deg);
    }
}

.emphasized {
    box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
}	

#sidebar {
    display: none;
    position: fixed;
    top: 0;      
    right: 0;
    background-color: #63B3F8;
    color: #fff;
 	text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #0fa,
    0 0 82px #0fa, 0 0 92px #0fa, 0 0 102px #0fa, 0 0 151px #0fa;
    width: 250px;
    height: 100vh;
    text-align: center;
    padding-top : 150px;
    z-index:1;
    background-image:url("/images/uploadFiles/${moim.mmFile}");
}

#listMember{
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
-->

<!-- 종이비행기 -->
<img id="side" class="whale" src="/images/air2.png" width="400" height="300 "/>

<!-- SideBar Start-->	
		<div id="sidebar">
        <h1 onClick="fncGetMoim(${moim.mmNo})">Home</h1>
        <h1 onClick="fncGetBoard()">Board</h1>
        <h1 id="choose">Join Us</h1>
        <h1 onClick="fncListMeeting(${moim.mmNo})">Meeting</h1>
        <h1 onClick="fncInvite(${moim.mmNo})">Invite</h1>
        <h1 onClick="fncListMember(${moim.mmNo})">Member</h1>
        <c:if test = "${dbUser.userId eq moim.mmConstructor.userId}">
        <br>
		<h3><div onClick="fncUptMoimView(${moim.mmNo})" >Update</div></h3>
		<h3><dic onClick="fncApplyList(${moim.mmNo})" >List Apply</div></h3>
		</c:if>
		</div>
<!-- SideBar End -->


	<script type="text/javascript">
	
	var mmNo6 = ${moim.mmNo};
	var userId6 = "<c:out value='${dbUser.userId}'/>";
	
    $("h1#choose").on("click", function(){
		
		if($("#choose").text('Join Us')){
			alert("가입신청 완료");
		        	$.ajax( 
        			{
        				url : "/moim/json/applyMoim",
        				method : "POST" ,
        				dataType : "json" ,
       					contentType : "application/JSON",
        				data: JSON.stringify( {"mmUser" : {"userId" : userId6 },
        					"mmNo" : mmNo6 , "memberRole": 1} ),
        				
        				success : function(JSONData , status) {
        					alert(status);
        				}
        		}); //ajax 종료
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
	
// 	$("h1:contains('Invite')").on("click", function(){
// 		alert("초대하기클릭");
// 		location.href = "/moim/listInvite"
// 	})
	
	$("h1:contains('Member')").on("click", function(){
// 		alert("멤버목록클릭");
// 		self.location = "/meeting/listMeeting?userId=${dbUser.userId}&mmNo=${moim.mmNo}";
		
	})
	
	
	</script>



