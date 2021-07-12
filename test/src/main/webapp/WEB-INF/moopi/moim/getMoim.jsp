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

</script>





</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/toolbar.jsp" />
	<jsp:include page="../layout/moimToolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<h3>���ӻ��������Դϴ�...</h3>


//////////////////////////
<p>���ӳѹ�:${moim.mmNo}</p>
<p>���Ӹ�:${moim.mmName}</p>
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



</body>
</html>