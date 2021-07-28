<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.navmenu{

	position : fixed;
}
</style>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="container main navmenu">
		<div class="row">
			<div class="col-xl-2 ">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">내 정보수정</li>
					<li class="list-group-item">My모임무피</li>
					<li class="list-group-item">My번개무피</li>
					<li class="list-group-item">My결제내역</li>
					<li class="list-group-item">My코인내역</li>
				</ul>
			</div>
			<div class="col-xl-10"></div>
		</div>
</div>


<!-- ToolBar End /////////////////////////////////////-->
<script>
	
		$("li:contains('내 정보수정')").on("click", function() {

			location.href = "/user/updateUserView?userId=" + dbUser;
		})
		
		$("li:contains('My모임무피')").on("click", function() {

			location.href = "/moim/myListMoim?userId=" + dbUser;
		})
		
		$("li:contains('My결제내역')").on("click", function() {

			location.href = "/payment/paymentList?userId=" + dbUser;
		})

		$("li:contains('My코인내역')").on("click", function() {

			location.href = "/coin/coinHistory?userId=" + dbUser;
		})
	</script>
