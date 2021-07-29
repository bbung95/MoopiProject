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
var userLabels = new Array();
var userData = new Array();




</script>






<style>
  .chart-container {
    width: 60%;
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
									<button  onClick="monthChange()" class="bg-transparent hover:bg-blue-500 text-blue-dark font-semibold hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded">
                                    월간통계
                                </button>
									<button onClick="weekChange()" class="bg-transparent hover:bg-blue-500 text-blue-dark font-semibold hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded">
                                    주간통계
                                </button>
                                <button onClick="dayChange()" class="bg-transparent hover:bg-blue-500 text-blue-dark font-semibold hover:text-white py-2 px-4 border border-blue hover:border-transparent rounded">
                                    일간통계
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
									User Insight
									<button onClick="pathChange()" class="bg-transparent hover:bg-red-500 text-orange-dark font-semibold hover:text-white py-2 px-4 border border-red hover:border-transparent rounded">
                                    가입경로
                                </button>
                                <button  class="bg-transparent hover:bg-red-500 text-orange-dark font-semibold hover:text-white py-2 px-4 border border-red hover:border-transparent rounded">
                                    연령대
                                </button>
									<button onClick="genderChange()" class="bg-transparent hover:bg-red-500 text-orange-dark font-semibold hover:text-white py-2 px-4 border border-red hover:border-transparent rounded">
                                    성별
                                </button>
                                <button  class="bg-transparent hover:bg-red-500 text-orange-dark font-semibold hover:text-white py-2 px-4 border border-red hover:border-transparent rounded">
                                    관심사
                                </button>
									
									</div>
									<div class="chart-container">
									<canvas id="userChartOne"></canvas>
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
	
		//월별차트 시작
		let myChartOne = document.getElementById('myChartOne').getContext('2d');
		let myChartTwo = document.getElementById('myChartOne').getContext('2d');
		let myChartThree = document.getElementById('myChartOne').getContext('2d');
		
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

		//월별차트 종료
		
<!-- 차트스크립트 종료 -->


function weekChange(){
	
// 	alert("클릭");
	barChart.destroy();

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
					for(var i=0; i < JSONData.list2.length;i++){
						ctxlabels.push(JSONData.list2[i].start+"~"+JSONData.list2[i].end);
				 		ctxdata.push(JSONData.list2[i].paymentPrice);	 		

					} //포문 종료
		
// 다시로드

		
		
		var LineChart = new Chart(myChartTwo, {
			type : 'line',
			data : {
				labels : ctxlabels,
				datasets : [{
					label : ctxlabel,
					backgroundColor: [ 
			                'rgba(153, 102, 255, 0.2)',
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


<script>
function dayChange(){
	
	barChart.destroy();

	ctxlabels = [];
	ctxdata = [];
	console.log(ctxlabels);
	console.log(ctxdata);
	ctxlabel = "일간 매출액"
	$.ajax( 
			{
				url : "/common/json/getDay",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					console.log(JSONData);
					for(var i=0; i < JSONData.list3.length;i++){
						ctxlabels.push(JSONData.list3[i].date);
				 		ctxdata.push(JSONData.list3[i].paymentPrice);	
// 				 		myChartOne = document.getElementById('myChartOne').getContext('2d');	
					} //포문 종료
		
//다시로드

		
		
		LineChart = new Chart(myChartThree, {
			type : 'line',
			data : {
				labels : ctxlabels,
				datasets : [{
					label : ctxlabel,
					backgroundColor: [ 
			                'rgba(255, 159, 64, 0.2)'	
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
// 		myChartThree.clear();
//다시로드끝
				}
		}); //ajax 종료
}
//차트업데이트 종료
</script>

<script>
function monthChange(){
	
	barChart.destroy();
	LineChart.destroy();
	ctxlabels = [];
	ctxdata = [];
	console.log(ctxlabels);
	console.log(ctxdata);
	ctxlabel = "월간 매출액"
	$.ajax( 
			{
				url : "/common/json/getMonth",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					console.log(JSONData);
					for(var i=0; i < JSONData.list.length;i++){
						ctxlabels.push(JSONData.list[i].date+'월');
				 		ctxdata.push(JSONData.list[i].paymentPrice);	 		

					} //포문 종료
		
// 다시로드

		
		
		let barChart = new Chart(myChartOne, {
			type : 'bar',
			data : {
				labels : ctxlabels,
				datasets : [{
					label : ctxlabel,
					backgroundColor: [ 
						'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)',
						'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)'
						],
					borderColor: [
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
						'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)'
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


<script>
//유저 차트 시작

var userLabels = new Array();
var userData = new Array();

userLabels.push("무피", "구글", "네이버", "카카오");
userData.push("${userData.moopi}", "${userData.google}", "${userData.naver}", "${userData.kakao}");

console.log(userData);

let userChartOne = document.getElementById('userChartOne').getContext('2d');
let userChartTwo = document.getElementById('userChartOne').getContext('2d');

let userBarChart = new Chart(userChartOne, {
	type : 'radar',
	data : {
		labels : userLabels,
		datasets : [{
			label : '유저 가입 경로',
			borderColor: 'rgba(252, 139, 105, 1.0)',
			data : userData
		}]
	},
	options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    } 
});

		
function genderChange(){		

	userBarChart.destroy();
	userLabels = [];
	userData = [];
	userLabels.push("남성", "여성");
	
	$.ajax( 
			{
				url : "/common/json/getGender",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
						
				 		userData.push(JSONData.male, JSONData.female);	 		
		
		 userBarChart2 = new Chart(userChartTwo, {
			type : 'bar',
			data : {
				labels : userLabels,
				datasets : [{
					label : userLabels,
					backgroundColor: [ 
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 99, 132, 0.2)'
						],
					borderColor: [
						'rgba(54, 162, 235, 1)',
						'rgba(255,99,132,1)'		           
						],
					borderWidth: 1,	
					data : userData
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
		}); //다시로드끝
				}
		}); //ajax 종료
}

</script>

<script>
function pathChange(){

 	userBarChart2.destroy();
	userLabels = [];
	userData = [];
	userLabels.push("무피", "구글", "네이버", "카카오");	
	
	
	$.ajax( 
			{
				url : "/common/json/getJoinPath",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
						
				 		userData.push(JSONData.moopi, JSONData.google, JSONData.naver, JSONData.kakao);	 		
		
				 		userBarChart = new Chart(userChartOne, {
				 			type : 'radar',
				 			data : {
				 				labels : userLabels,
				 				datasets : [{
				 					label : '유저 가입 경로',
				 					borderColor: 'rgba(252, 139, 105, 1.0)',
				 					data : userData
				 				}]
				 			},
				 			options: {
				 		        scales: {
				 		            yAxes: [{
				 		                ticks: {
				 		                    beginAtZero:true
				 		                }
				 		            }]
				 		        }
				 		    } 
				 		});
				}
		}); //ajax 종료
	
}

</script>

</body>

</html>