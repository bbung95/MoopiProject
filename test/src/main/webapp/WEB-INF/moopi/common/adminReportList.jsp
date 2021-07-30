<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moopi Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="keywords"
	content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<! ------------------------------------------------ Bootstrap, jQuery CDN -------------------------------------------------->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<!-------------------------------------------------------------------------------------------------------------------------->

<!-- Css -->
<link rel="stylesheet" href="/css/admin/styles.css">
<link rel="stylesheet" href="/css/admin/all.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
	rel="stylesheet">
</head>

<body>
	<!--Container -->
	<div class="mx-auto bg-	grey-lightest">
		<!--Screen-->
		<div class="min-h-screen flex flex-col">
			<!--Header Section Starts Here-->
						<jsp:include page="../layout/adminHeader.jsp" />

			<!--/Header-->

			<div class="flex flex-1">
				<!--Sidebar-->
				<jsp:include page="../layout/adminToolbar.jsp" />
				<!--/Sidebar-->
				<!--Main-->
				<main class="bg-white-500 flex-1 p-3 overflow-hidden">

					<div class="flex flex-col">
						<!--Grid Form-->

						<div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
							<div
								class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
								<div
									class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
									신고목록</div>
								<div class="p-3">
								
								<div class="list_button" style="float:right; padding-bottom: 10px;">
								<button class="bg-blue-500 hover:bg-blue-800 text-white font-light py-1 px-2 rounded-full" id="listReportBd">게시글</button>
								<button class="bg-primary hover:bg-primary-dark text-white font-light py-1 px-2 rounded-full" id="listReportRe">리플</button>
								<button class="bg-success hover:bg-success-dark text-white font-light py-1 px-2 rounded-full" id="listReportU">유저</button>
								<button class="bg-blue-500 hover:bg-blue-800 text-white font-light py-1 px-2 rounded-full" id="listReportMm">모임</button>
								</div>
								
									<table class="table-responsive w-full rounded">
										<thead align="center">
											<tr>
												<th class="border px-4 py-2" width="4%">No</th>
												<th class="border px-4 py-2" width="8%">신고된 타겟</th>
												
												<c:if test="${search.searchCategory == 1}">
												<th class="border px-4 py-2" width="10%">글제목</th>
												<th class="border px-4 py-2" width="10%">아이디</th>
												</c:if>
												<c:if test="${search.searchCategory == 2}">
												<th class="border px-4 py-2" width="10%">리플내용</th>
												<th class="border px-4 py-2" width="10%">아이디</th>
												</c:if> 
												<c:if test="${search.searchCategory == 4}">
												<th class="border px-4 py-2" width="10%">모임명</th>
												<th class="border px-4 py-2" width="5%">모임장아이디</th>
												</c:if>
												
												<th class="border px-4 py-2" width="10%">닉네임</th>
												<th class="border px-4 py-2" width="10%">이름</th>
												<th class="border px-4 py-2" width="8%">신고 유형</th>
												<th class="border px-4 py-2" width="20%">신고 내용</th>
												<th class="border px-4 py-2" width="7%">신고접수일</th>
												<th class="border px-4 py-2" width="7%">신고처리일</th>
												<th class="border px-4 py-2" width="5%">처리 결과</th>
												<th class="border px-4 py-2" width="5%">처리 사유</th>
												<th class="border px-4 py-2" width="5%"></th>
												
											</tr>   
										</thead>
										<tbody>
											<c:forEach var="report" items="${list}">
												<tr>
													<td class="border px-4 py-2 reportNo">${report.reportNo}</td>
													
													<c:if test="${search.searchCategory == 1}">
														<td class="border px-4 py-2 boardNo get_board" >${report.reportTargetBd.boardNo}</td>
														<td class="border px-4 py-2 ">${report.reportTargetBd.boardName}</td>
														<td class="border px-4 py-2 boardwriter">${report.reportTargetBd.boardWriter.userId}</td>
														<td class="border px-4 py-2">${report.reportTargetBd.boardWriter.nickname}</td>
														<td class="border px-4 py-2">${report.reportTargetBd.boardWriter.userName}</td>
													</c:if>
													<c:if test="${search.searchCategory == 2}">
														<td class="border px-4 py-2 replyNo get_board">${report.reportTargetRe.replyNo}</td>
														<td class="border px-4 py-2">${report.reportTargetRe.replyContent}</td>
														<td class="border px-4 py-2 replywriter">${report.reportTargetRe.replyWriter.userId}</td>
														<td class="border px-4 py-2">${report.reportTargetRe.replyWriter.nickname}</td>
														<td class="border px-4 py-2">${report.reportTargetRe.replyWriter.userName}</td>
														<td style="display: none;" class="boardNo" value="${ report.reportTargetRe.boardNo}">${ report.reportTargetRe.boardNo}</td>
													</c:if> 
													<c:if test="${search.searchCategory == 3}">
														<td class="border px-4 py-2 rp_userId">${report.reportTarget.userId}</td>
														<td class="border px-4 py-2">${report.reportTarget.nickname}</td>
														<td class="border px-4 py-2">${report.reportTarget.userName}</td>
														
													</c:if>
													<c:if test="${search.searchCategory == 4}">
														<td class="border px-4 py-2 mmNo">${report.reportTargetMm.mmNo}</td>
														<td class="border px-4 py-2">${report.reportTargetMm.mmName}</td>
														<td class="border px-4 py-2 moimuserid">${report.reportTargetMm.mmConstructor.userId}</td>
														<td class="border px-4 py-2">${report.reportTargetMm.mmConstructor.nickname}</td>
														<td class="border px-4 py-2">${report.reportTargetMm.mmConstructor.userName}</td>
													</c:if>
													<td class="border px-4 py-2">${report.reportType}</td>
													<td class="border px-4 py-2">${report.reportContent}</td>
													<td class="border px-4 py-2">${report.reportRegDate}</td>
													
													
													<c:if test="${report.reportResultUpdate != null}">
													<td class="border px-4 py-2 ">${report.reportResultUpdate}</td>
													<td class="border px-4 py-2">${report.reportResultState}</td>
													<td class="border px-4 py-2">${report.stateReason}</td>
													<td class="border px-4 py-2">처리완료</td>
													</c:if>
													<c:if test="${report.reportResultUpdate == null}">
														<td class="border px-4 py-2 reportResultUpdate${report.reportNo }" ></td>
														<td class="border px-4 py-2 reportResultState${report.reportNo }" align="left">
															<select> 
																<option value="1">해당없음</option>
																<c:if test="${report.reportCategory eq '1' or report.reportCategory eq '2' }">
																<option value="2">해당글삭제</option>
																</c:if>
																<option value="3">${ report.reportCategory == '4' ? "모임폐쇄" : "유저경고" }</option>
															</select> 
														</td>
															<td class="border px-4 py-2 stateReason${report.reportNo }" >
																<input type="text" class="stateReason"></input>	
															</td>
													  	<td class="border px-4 py-2 process${report.reportNo }" align="left">
													  	<button type="button" class="btn btn-primary">처리하기</button>
													  	</td>
												  </c:if>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--/Grid Form-->


						<form id="detailForm"
							class="form-inline d-flex justify-content-end" name="detailForm">
							
							<div class="form-group">
								<select name="searchCondition" class="form-control"
									style="width: 110px">
									<option value="0"
										${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>아이디</option>
									<option value="1"
										${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>닉네임</option>
									<c:if test="${search.searchCategory == 4}">
									<option value="2"
										${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>모임명</option>
									</c:if>
								</select>
							</div>

							<div class="form-group">
								<label class="sr-only" for="searchKeyword">검색어</label> <input
									type="text" class="form-control" id="searchKeyword"
									name="searchKeyword" placeholder="검색어"
									value="${! empty search.searchKeyword ? search.searchKeyword : '' }"
									style="width: 200px;">
							</div>

							<button type="button" class="btn btn-primary">검색</button>
							<input type="hidden" class="searchCategory" name="searchCategory" value="${search.searchCategory}">

							<input type="hidden" id="searchState" name="searchState"
								value="0" /> 
								<input type="hidden" id="currentPage" name="currentPage" value="1" />
						</form>
						
						<jsp:include page="pageNavigator.jsp"></jsp:include>

					</div>
				</main>
				<!--/Main-->
			</div>
			<!--Footer-->
			<footer class="bg-grey-darkest text-white p-2">
				<div class="flex flex-1 mx-auto">&copy; My Design</div>
			</footer>
			<!--/footer-->

		</div>

	</div>

	<script src="/js/admin/main.js"></script>
	
</body>
	<script>

		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#listReportBd" ).on("click" , function() {
				self.location ="/common/getReportList?searchCategory=1";
			});
		});	
		
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#listReportRe" ).on("click" , function() {
				self.location ="/common/getReportList?searchCategory=2";
			});
		});	
		
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#listReportU" ).on("click" , function() {
				self.location ="/common/getReportList?searchCategory=3";
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#listReportMm" ).on("click" , function() {
				self.location ="/common/getReportList?searchCategory=4";
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td.get_board" ).on("click" , function() {
				alert($(this).parent().parent().find(".boardNo").html())
				var boardNo = $(this).parent().parent().find(".boardNo").html();
				window.location.href ="/report/getReportBoard?boardNo="+boardNo;
			});
		});	
		
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			$( "button.btn.btn-primary:contains('처리')" ).on("click" , function() {
				
				alert("신고처리");
				var reportResultState	= $(this).parent().parent().find("select").val();
				var reportNo			= $(this).parent().parent().find("td.reportNo").html()
				var stateReason			= $(this).parent().parent().find("input.stateReason").val()
				var reportTargetBd		= $(this).parent().parent().find("td.boardNo").html()
				var reportTargetRe		= $(this).parent().parent().find("td.replyNo").html()
				var reportTarget		= $(this).parent().parent().find("td.rp_userId").html()
				var reportTargetMm		= $(this).parent().parent().find("td.mmNo").html()
				var boardwriter		= $(this).parent().parent().find("td.boardwriter").html()
				var replywriter		= $(this).parent().parent().find("td.replywriter").html()
				var moimuserid		= $(this).parent().parent().find("td.moimuserid").html()
				
				alert($(this).parent().parent().html())
				
				$.ajax( 
						{
							url : "/report/json/processReport",
							method : "POST" ,
							dataType : "json" ,
							data :  JSON.stringify ({ "reportNo": reportNo, "reportResultState": reportResultState, "stateReason": stateReason,
													"reportTargetBd": {"boardNo" : reportTargetBd , "boardWriter" : { "userId" : boardwriter} },
													"reportTargetRe": {"replyNo" : reportTargetRe , "replyWriter" : {"userId" : replywriter}},
													"reportTargetMm" : {"mmNo" : reportTargetMm , "mmConstructor" :   {"userId" : moimuserid} }, 
													"reportTarget" : { "userId" : reportTarget } }),
							contentType : "application/json",
						    success : function(data , status) {
									console.log(data)
					               var process = '처리완료'
								   
									$(".reportResultUpdate"+data.reportNo).empty();
									$(".reportResultState"+data.reportNo).empty();
									$(".stateReason"+data.reportNo).empty();
									$(".process"+data.reportNo).empty();
									$(".reportResultUpdate"+data.reportNo).append(data.reportResultUpdate);
									$(".reportResultState"+data.reportNo).append(data.reportResultState);
									$(".stateReason"+data.reportNo).append(data.stateReason);
									$(".process"+data.reportNo).append(process);
		
					               }
					               
				
					     })
				
			});
		});	
		
		
		
		
	</script>
</html>