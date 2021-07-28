<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<title>Moopi</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<body>


		<div class="offcanvas-body noticeOut"></div>

	<script>
		var dbUser = "<c:out value='${dbUser.userId}'/>"

		if (dbUser !== "") {
			$
					.ajax({
						url : "/common/json/getListNotice/" + dbUser,
						method : "GET",
						dataType : "JSON",
						success : function(data, status) {

							let display = "";
							if (data.length > 0) {
								for (var i = 0; i < data.length; i++) {

									//채팅 알림 type 1
									if (data[i].noticeType == '6') {
										display += "<div style='height: 60px; '  class='notice "+data[i].noticeNo+"'>"
												+ "<span onclick='location.href=\"/cc/test\"'>"
												+ "sdsd"
												+ "</span>"
												+ "<span onclick='location.href=\"/user/getMyHome?userId="+data[i].toUserId+"\"'>"
												+ "dsdsds</span>"
												+ "</div>";
									}

									$('.noticeOut').append(display);
								}
							}
						}
					})
		}
	</script>

</body>
</html>