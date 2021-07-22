<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- BootsWatch CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous">


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

<!-- ToolBar Start /////////////////////////////////////-->


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="text" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>












<!-- 	<div class="container"> -->

<!-- 		<!-- toolBar Button Start //////////////////////// --> -->
<!-- 		<div class="navbar-header"> -->
<!-- 			<button class="navbar-toggle collapsed" data-toggle="collapse" -->
<!-- 				data-target="#target"> -->
<!-- 				<span class="sr-only">Toggle navigation</span> <span> -->
<!-- 					class="icon-bar"></span> <span class="icon-bar"></span> <span> -->
<!-- 					class="icon-bar"></span> -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 		<!-- toolBar Button End //////////////////////// --> -->

<!-- 		<!--  dropdown hover Start --> -->
<!-- 		<div class="collapse navbar-collapse" id="target" -->
<!-- 			data-hover="dropdown" -->
<!-- 			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew"> -->

<!-- 			<!-- Tool Bar 를 다양하게 사용하면.... --> -->
<!-- 			<ul class="nav navbar-nav"> -->

<!-- 				<li><a href="/moim/listMoim">홈</a></li> -->
<!-- 				<li><a href="#">게시글</a></li> -->
<%-- 				<li><a href="javascript:fncListMeeting('${moim.mmNo}')">정모일정</a></li> --%>
<%-- 				<li><a id="choose" href="javascript:fncApply('${moim.mmNo}')">가입하기/탈퇴하기</a></li> --%>
<!-- 				<li><a href="/moim/listInvite">초대하기</a></li> -->
<%-- 				<li><a href="javascript:fncListMember('${moim.mmNo}')">유저목록</a></li> --%>
<!-- 			</ul> -->

			
	<!-- dropdown hover END -->

	<script type="text/javascript">
	$("a:contains('게시글')").on("click", function(){
		alert("게시글클릭");
		location.href = "/board/listBoard?category=4&mmNo=${moim.mmNo}";
	})
	

	</script>


<!-- </div> -->
<!-- </div> -->

