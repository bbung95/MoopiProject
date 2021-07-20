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

<script>


</script>
  
<style>
body{
	padding-top: 50px;
}
</style>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" /> 
<!-- ToolBar End /////////////////////////////////////-->
<h3>MY 무피코인</h3>
 <table class="table table-hover table-striped" >
<thead>
          <tr>
            <th align="center">결제No</th>
            <th align="left" >회원아이디</th>
            <th align="left">결 제 일</th>
            <th align="left">결제금액</th>
            <th align="left">충전된코인</th>
          </tr>
        </thead>


		<input type="text" id="coin" name="coin" value="${user.coin}"/>

		<tbody>
			
			<c:set var="i" value="0" />
				<c:forEach var="payment" items="${ list }">
				<c:set var="i" value="${ i+1 }"/>
				
				<tr>
				<td align="center"> ${payment.paymentNo}</td>
		 		
		 		
		 		
				<!--<td align="left"><div id="paymentList" onClick="fncpaymentList(${paymentNo})">${paymentUserId.userId}</div></td> -->
				
				<!--<c:if test="${empty board.boardUpdate }">
					${board.boardRegDate}
					</c:if>
					<c:if test="${!empty board.boardUpdate }">
					${board.boardUpdate}
					</c:if>-->
				<td align="left">${payment.paymentUserId.userId} </td>
				<td align="left">${payment.paymentRegdate}</td>
				<td align="left">${payment.paymentPrice}</td>
				<td align="left">${payment.paymentCoinCount}</td>
					
			</tr>
			</c:forEach>
		
		</tbody>		
	
	
</table>
<!-- <button type="button" class="btn btn-default" onClick="fncAddBoardView()">게시글작성</button> -->
 <jsp:include page="../layout/searchbar.jsp"></jsp:include>
</body>
</html>