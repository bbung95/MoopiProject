<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.inforbox {
	/* 	background: #4299e1;
	border-radius: 20px 20px 0px 0px; */
	padding: 5px;
}

.inforimg {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	display: inline-block;
	border: 0.1px solid white;
}

.informenu {
	padding-left:20px;
	font-size: 16px;
	font-weight: bold;
	height: 40px;
	cursor: pointer;
	line-height: 20px;
	align-items: center;
}
</style>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navmenu">
	<div class="inforbox">
		<img class="inforimg" src="/images/uploadFiles/${dbUser.profileImage}">
		<span class="h4" style="margin-left: 10px;">${dbUser.nickname}</span>
		<span>코인 : ${dbUser.coin}</span>
	</div>
	<hr / style="margin: 10px 0px 10px 0px;">
	<div class="informenu">내 정보</div>
	<div class="informenu">My모임무피</div>
	<div class="informenu">My결제내역</div>
	<div class="informenu">My코인내역</div>
</div>


<!-- ToolBar End /////////////////////////////////////-->
<script>
	$(".informenu:contains('내 정보')").on("click", function() {

		location.href = "/user/myInformation";
	})

	$(".informenu:contains('My모임무피')").on("click", function() {

		location.href = "/moim/myListMoim?userId=" + dbUser;
	})

	$(".informenu:contains('My결제내역')").on("click", function() {

		location.href = "/payment/paymentList?userId=" + dbUser;
	})

	$(".informenu:contains('My코인내역')").on("click", function() {

		location.href = "/payment/coinHistory?userId=" + dbUser;
	})
	
	$.ajax({
		url: "/user/getUser"
	})
</script>
