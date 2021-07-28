<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<header class="bg-nav">
	<div class="flex justify-between">
		<div class="p-1 mx-3 inline-flex items-center">
			<i class="fas fa-bars pr-2 text-white" onclick="sidebarToggle()"></i>
			<h1 class="text-white p-2">Moopi</h1>
		</div>
		<div class="p-1 flex flex-row items-center">
			<a href="https://github.com/bbung95/MoopiProject"
				class="text-white p-2 mr-2 no-underline hidden md:block lg:block">Github</a>


			<img onclick="profileToggle()"
				class="inline-block h-8 w-8 rounded-full"
				src="/images/uploadFiles/${dbUser.profileImage }" alt=""> 
				<a href="#" class="text-white p-2 no-underline hidden md:block lg:block">${dbUser.nickname}</a>
		</div>
	</div>
</header>