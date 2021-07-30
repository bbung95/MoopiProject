<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!--<link rel="stylesheet" href="/images/uploadFiles" >  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  	
<script type="text/javascript">
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#addReport" ).on("click" , function() {
		fncAddReport();
	});
});	

function fncAddReport(){
	alert("신고");
	
	var reportType			= $("input[name=reportType]:checked").val();
	var reportContent		= $("#reportContent").val();
	var reportTarget		= $("#reportTarget").val();
	var reportTargetBd		= $("#reportTargetBd").val();
	var reportTargetRe		= $("#reportTargetRe").val();
	var reportTargetMm		= $("#reportTargetMm").val();
	var reportCategory 		= $("#reportCategory").val();
	var reportByUserId		= $("#reportByUser").val();
	
	alert(reportType);
	alert(reportContent);
	alert(reportTarget);
	alert(reportTargetBd);
	alert(reportTargetRe);
	alert(reportTargetMm);
	alert(reportCategory);
	alert(reportByUserId);
	
	$.ajax({
		url: "/report/json/addReport",
		type: "POST",
		dataType: "json",
		contentType : "application/json",
		data :  JSON.stringify ({ "reportType": reportType, "reportContent": reportContent, "reportTarget": { "userId": reportTarget }, "reportTargetBd": {"boardNo" :reportTargetBd},
								 "reportTargetRe": { "replyNo" : reportTargetRe} , "reportTargetMm": { "mmNo" : reportTargetMm} , "reportCategory" : reportCategory, "reportByUser" : {"userId":reportByUserId} }),		
		success: function(data, state){
			
			
			close();
		
		}
	
	});
	
}




</script>
</head>
<body>
 
 <div class="container">
	
		
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" >
		<!-- 카테고리 1번에 해당하는 신고글. -->
		  <c:if test="${reportCategory == 1}">
		  
		  <h1 class="bg-primary text-center">게시글 신고</h1>
		  
		  <input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
		  <input type="hidden" id="reportTargetBd" name="reportTargetBd.boardNo" value="${board.boardNo}">
		  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
                <div>
					<p>작성자</p>
                    <p class="targetName">
                    <p id="targetName">${board.boardWriter.nickname}</p>
                </div>
                
                <div>
					<p>게시글 제목</p>
                    <p>${board.boardName}</p>
                </div>
                 <div>
					<p>게시글 내용</p>
                    <p>${board.boardContent}</p>
                </div>
           </c:if>      
           
           <!-- 카테고리 2번에 해당하는 신고글. -->
            <c:if test="${reportCategory == 2}">
            
            <h1 class="bg-primary text-center">댓글 신고</h1>
            
		  <input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
		  <input type="hidden" id="reportTargetRe" name="reportTargetRe.replyNo" value="${reply.replyNo}">
		  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
                <div>
					<p>작성자</p>
                    <p class="targetName">
                    <p id="targetName">${reply.replyWriter.nickname}</p>
                </div>
                
                 <div>
					<p>리플 내용</p>
                    <p>${reply.replyContent}</p>
                </div>
           </c:if>  
           
           <c:if test="${reportCategory == 3}">
            
            <h1 class="bg-primary text-center">유저 신고</h1>
            
		  <input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
		  <input type="hidden" id="reportTarget" name="reportTarget" value="${report.reportTarget.userId}">
		  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
                <div>
					<p>닉네임</p>
                    <p class="targetName">
                    <p id="targetName">${user.nickname}</p>
                </div>
                
           </c:if>  
           
           
           <c:if test="${reportCategory == 4}">
            
            <h1 class="bg-primary text-center">모임 신고</h1>
            
		  <input type="hidden" id="reportByUser" name="reportByUser.userId" value="${dbUser.userId}">
		  <input type="hidden" id="reportTargetMm" name="reportTargetMm" value="${moim.mmNo}">
		  <input type="hidden" id="reportCategory" name="reportCategory" value="${reportCategory}">
                <div>
					<p>모임명</p>
                    <p class="targetName">
                    <p id="targetName">${moim.mmName}</p>
                </div>
                
                 <div>
					<p>모임 소개</p>
                    <p>${moim.mmContent}</p>
                </div>
           </c:if>  
           
           
                <div class="c_rp_dtl">
                    <p>신고유형</p>
                </div>
            <div class="c_rp_lst" id= "reportType">
                <ul class="wp" >
                    <li class="itm" >
                        <input type="radio" name="reportType" value="1">
                        <label> 음란</label> 
                    </li>
                    <li class="itm">
                        <input type="radio" name="reportType" value="2">
                        <label> 욕설</label> 
                    </li>
                    <li class="itm">
                        <input type="radio" name="reportType" value="3">
                       <label>광고</label> 
                    </li>
                    <li class="itm">
                        <input type="radio" name="reportType" value="4">
                        <label> 불법</label> 
                    </li>
                </ul>
            </div>
            <div>
					<p>상세내용</p>
                    <p class="reportContent">
                    <input type="text" id="reportContent" name="reportContent" style="width:300px;height:200px;">
                    </p>
           
            <button type="button" class="btn btn-primary" onclick="javascript:fncAddReport()" >신고하기</button>
             </div>
        
        </form>
        </div>
        
		
</body>



</html>

