<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<nav class="d-flex justify-content-center"
							aria-label="Page navigation example" style="padding-bottom: 30px;" >
							<ul class="pagination">

								<!--  <<== 謝難 nav -->
								<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
									<li class="disabled">
								</c:if>
								<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
									<li class="page-item"><a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								</c:if>
									</li>
								
								
								<!--  醞懈  -->
								<c:forEach var="i" begin="${resultPage.beginUnitPage}"
									end="${resultPage.endUnitPage}" step="1">

									<c:if test="${ resultPage.currentPage == i }">
										<!--  ⑷營 page 陛腦鑒唳辦 : active -->
										<li class="page-item active pagebtn"><a class="page-link"
											href="javascript:fncGetList('${ i }')">${i }</a></li>
									</c:if>
									<c:if test="${ resultPage.currentPage != i}">
										<li class="page-item pagebtn"><a class="page-link"
											href="javascript:fncGetList('${ i }')">${i }</a></li>
									</c:if>
								</c:forEach>
								
								
								<!--  辦難 nav==>> -->
								<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
									<li class="disabled">
								</c:if>
								<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
									<li class="page-item "><a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
								</li>

							</ul>
						</nav>