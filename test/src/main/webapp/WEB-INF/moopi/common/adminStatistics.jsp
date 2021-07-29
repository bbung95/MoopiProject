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

<!-- ChartJS -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" /> -->

<!-- Css -->
<link rel="stylesheet" href="/css/admin/styles.css">
<link rel="stylesheet" href="/css/admin/all.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
	rel="stylesheet">
</head>


<!-- 차트 -->
<!-- <link rel="stylesheet" -->
<!--     href="https://cdn.jsdelivr.net/npm/cdbootstrap@1.0.0/css/bootstrap.min.css"/> -->
<!--   <link -->
<!--     rel="stylesheet" -->
<!--     href="https://cdn.jsdelivr.net/npm/cdbootstrap@1.0.0/css/cdb.min.css" /> -->
<!--   <script -->
<!--     src="https://cdn.jsdelivr.net/npm/cdbootstrap@1.0.0/js/cdb.min.js"></script> -->
<!--   <script -->
<!--     src="https://cdn.jsdelivr.net/npm/cdbootstrap@1.0.0/js/bootstrap.min.js"> -->
<!--   </script> -->
<!--   <script src="https://kit.fontawesome.com/9d1d9a82d2.js" -->
<!--   crossorigin="anonymous"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script>

var ctxlabels = new Array();
var ctxdata = new Array();
var ctxlabel = "월간 매출액";



</script>

<style>
  .chart-container {
    width: 50%;
    height: 50%;
    margin: auto;
  }

</style>

<body>
	<!--Container -->
	<div class="mx-auto bg-grey-lightest">
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
									Payment Insight
									<button onClick="weekChange()" class="bg-transparent hover:bg-blue-500 text-blue-dark font-semibold hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded">
                                    주간통계
                                </button>
									</div>
								<div class="chart-container">
									<canvas id="myChartOne"></canvas>
								</div>
							</div>
						</div>
						<!--/Grid Form-->
						
						<!--Grid Form-->

						<div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
							<div
								class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
								<div
									class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
									User Insight</div>
								<div class="p-3">

								</div>
							</div>
						</div>
						<!--/Grid Form-->
						
						<div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
							<div
								class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
								<div
									class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
									Report Insight</div>
								<div class="p-3">

								</div>
							</div>
						</div>
						<!--/Grid Form-->

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
	<!-- 차트스크립트 시작 -->
	<script>

	<c:forEach items="${list}" var="chartData" >
		ctxlabels.push("${chartData.date}"+'월');
		ctxdata.push("${chartData.paymentPrice}");
	</c:forEach>

// 	var labels2 = new Array();
// 	var data2 = new Array();

// 	<c:forEach items="${list2}" var="chartData2" >
// 		labels2.push("${chartData2.start}"+"~"+"${chartData2.end}");
// 		data2.push("${chartData2.paymentPrice}");
// 	</c:forEach>

//차트업데이트 시작

	
		//월별차트 시작
		let myChartOne = document.getElementById('myChartOne').getContext('2d');
// 		let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
		let myChartTwo = document.getElementById('myChartOne').getContext('2d');
		
		
		let barChart = new Chart(myChartOne, {
			type : 'bar',
			data : {
				labels : ctxlabels,
				datasets : [{
					label : ctxlabel,
					backgroundColor: [ 
						'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
						],
					borderColor: [
						'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
						],
					borderWidth: 1,	
					data : ctxdata
				}]
			},
			options: {
		        maintainAspectRatio: true,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    } 
		});
		myChartOne.clear();
		//월별차트 종료
		
		//주간차트 시작
		
		
// 		let barChartTwo = new Chart(myChartTwo, {
// 			type : 'bar',
// 			data : {
// 				labels : labels2,
// 				datasets : [{
// 					label : '주간 매출액',
// 					backgroundColor: [ 
// 						'rgba(255, 99, 132, 0.2)',
// 		                'rgba(54, 162, 235, 0.2)',
// 		                'rgba(255, 206, 86, 0.2)',
// 		                'rgba(75, 192, 192, 0.2)',
// 		                'rgba(153, 102, 255, 0.2)',
// 		                'rgba(255, 159, 64, 0.2)'
// 						],
// 					borderColor: [
// 						'rgba(255,99,132,1)',
// 		                'rgba(54, 162, 235, 1)',
// 		                'rgba(255, 206, 86, 1)',
// 		                'rgba(75, 192, 192, 1)',
// 		                'rgba(153, 102, 255, 1)',
// 		                'rgba(255, 159, 64, 1)'
// 						],
// 					borderWidth: 1,	
// 					data : data2
// 				}]
// 			},
// 			options: {
// 		        maintainAspectRatio: true,
// 		        scales: {
// 		            yAxes: [{
// 		                ticks: {
// 		                    beginAtZero:true
// 		                }
// 		            }]
// 		        }
// 		    } 
// 		});
		//주간차트 종료
		</script>
<!-- 차트스크립트 종료 -->

<script>
function weekChange(){
	
	alert("클릭");
	ctxlabels = [];
	ctxdata = [];
	console.log(ctxlabels);
	console.log(ctxdata);
	ctxlabel = "주간 매출액"
	$.ajax( 
			{
				url : "/common/json/getWeek",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					console.log(JSONData);
					for(var i=0; i < JSONData.list.length;i++){
						ctxlabels.push(JSONData.list[i].start+"~"+JSONData.list[i].end);
				 		ctxdata.push(JSONData.list[i].paymentPrice);	
// 				 		myChartOne = document.getElementById('myChartOne').getContext('2d');	
					} //포문 종료
		
//다시로드

		
		
		barChart = new Chart(myChartTwo, {
			type : 'bar',
			data : {
				labels : ctxlabels,
				datasets : [{
					label : ctxlabel,
					backgroundColor: [ 
						'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
						],
					borderColor: [
						'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
						],
					borderWidth: 1,	
					data : ctxdata
				}]
			},
			options: {
		        maintainAspectRatio: true,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    } 
		});

//다시로드끝
				}
		}); //ajax 종료
}
//차트업데이트 종료
</script>



</body>

</html>