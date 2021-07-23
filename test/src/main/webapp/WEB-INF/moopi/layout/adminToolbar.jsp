<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<aside id="sidebar"
	class="bg-side-nav w-1/2 md:w-1/6 lg:w-1/6 border-r border-side-nav hidden md:block lg:block">

	<ul class="list-reset flex flex-col">
		<li
			class=" w-full h-full py-3 px-2 border-b border-light-border">
			<a
			class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
				<i class="fas fa-tachometer-alt float-left mx-2"></i> 회원목록 <span><i
					class="fas fa-angle-right float-right"></i></span>
		</a>
		</li>
		<li class="w-full h-full py-3 px-2 border-b border-light-border">
			<a
			class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
				<i class="fab fa-wpforms float-left mx-2"></i> 모임목록 <span><i
					class="fa fa-angle-right float-right"></i></span>
		</a>
		</li>
		<li class="w-full h-full py-3 px-2 border-b border-light-border">
			<a
			class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
				<i class="fas fa-grip-horizontal float-left mx-2"></i> 번개목록 <span><i
					class="fa fa-angle-right float-right"></i></span>
		</a>
		</li>
		<li class="w-full h-full py-3 px-2 border-b border-light-border">
			<a
			class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
				<i class="fas fa-table float-left mx-2"></i> 신고목록 <span><i
					class="fa fa-angle-right float-right"></i></span>
		</a>
		</li>
		<li class="w-full h-full py-3 px-2 border-b border-light-border">
			<a
			class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
				<i class="fab fa-uikit float-left mx-2"></i> 결제목록 <span><i
					class="fa fa-angle-right float-right"></i></span>
		</a>
		</li>
	</ul>

</aside>

<script>
	$('a:contains("회원목록")').on('click', function(){
		
		location.href = "/common/getUserList";
	})
	$('a:contains("모임목록")').on('click', function(){
		
		location.href = "/common/getMoimList";
	})
	$('a:contains("번개목록")').on('click', function(){
		
		location.href = "/common/getFlashList";
	})
	$('a:contains("신고목록")').on('click', function(){
		
		location.href = "/common/getFlashList";
	})
	$('a:contains("결제목록")').on('click', function(){
		
		location.href = "/common/getFlashList";
	})
</script>