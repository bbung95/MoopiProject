<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="/images/uploadFiles" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script>
function fncAddMoimView(){
	alert("���ӻ���");
	self.location ="/moim/addMoimView?userId=user01"
}

function fncGetMoim(mmNo){
	alert("���ӻ󼼺���");
	self.location ="/moim/getMoim?mmNo="+mmNo
}


</script>





</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>���Ӹ����������Դϴ�...</h3>

<c:forEach var="moim" items="${list}">
//////////////////////////
<p>���ӳѹ�:${moim.mmNo}</p>
<p>���Ӹ�: <div id="getMoim" onClick="fncGetMoim(${moim.mmNo})">${moim.mmName}</div></p>
<p>���ӼҰ���:${moim.mmContent}</p>
<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ӵ�ǥ�����</strong></div>
			<div class="col-xs-8 col-md-4">
			<!--<img src="${pageContext.request.contextPath}/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  -->
			<img src="/images/uploadFiles/${moim.mmFile}" width="200" height="200 "/>  
			</div>
		</div>
<p>���Ӱ�������:${moim.mmMaxCount}</p>
<p>������������:${moim.mmCurrentCount}</p>
<p>���ӻ�����:${moim.mmConstructor.userId}</p>
<p>���ӻ�����:${moim.mmRegDate}</p>
<p>���Ӱ��ɻ�No:${moim.mmInterest}</p>
<p>���Ӱ�����:${moim.mmAddr}</p>
<p>���ӹ��ǻ���(1����2�����):${moim.mmState}</p>
<p>�����ּҰ��Կ���:${moim.mmMinAge}</p>
<p>�����ִ밡�Կ���:${moim.mmMaxAge}</p>
<p>���Ӱ�������(1�Ϲ�2����):${moim.mmType}</p>
</c:forEach>

<button type="button" class="btn btn-default" onClick="fncAddMoimView()">�����</button>
</body>
</html>