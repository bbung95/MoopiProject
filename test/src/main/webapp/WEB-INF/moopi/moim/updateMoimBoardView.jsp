<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello! Moopi!</title>
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
<jsp:include page="../common/commonCDN.jsp"></jsp:include>


<script src="/javascript/summernote-lite.js"></script>
<script src="/javascript/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote-lite.css">

<script>
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary").on("click", function() {

			fncUpdateBoard();
		});
	});

	function fncUpdateBoard() {
		alert("게시글수정");

		alert($("input[name='boardNo']").val());
		alert($("input[name='boardName']").val());
		alert($("input[name='boardCategory']").val());

		$("form").attr("method", "POST").attr("action", "/moim/updateBoard")
				.submit();

	}
</script>

<style>
body {
	padding-top: 100px;
	margin: auto;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											height : 300, // 에디터 높이
											minHeight : null, // 최소 높이
											maxHeight : null, // 최대 높이
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											lang : "ko-KR", // 한글 설정
											placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
											callbacks : { //여기 부분이 이미지를 첨부하는 부분
												onImageUpload : function(files) {
													uploadSummernoteImageFile(
															files[0], this);
												},
												onPaste : function(e) {
													var clipboardData = e.originalEvent.clipboardData;
													if (clipboardData
															&& clipboardData.items
															&& clipboardData.items.length) {
														var item = clipboardData.items[0];
														if (item.kind === 'file'
																&& item.type
																		.indexOf('image/') !== -1) {
															e.preventDefault();
														}
													}
												}
											}
										});
					});

	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/board/uploadImage",
			contentType : false,
			processData : false,
			success : function(data) {
				//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}

	$("div.note-editable")
			.on(
					'drop',
					function(e) {
						for (i = 0; i < e.originalEvent.dataTransfer.files.length; i++) {
							uploadSummernoteImageFile(
									e.originalEvent.dataTransfer.files[i],
									$("#summernote")[0]);
						}
						e.preventDefault();
					})
</script>



</head>
<body>
	<jsp:include page="../layout/moimSidebar.jsp"></jsp:include>
	<jsp:include page="../layout/toolbar.jsp" />


	<div id="wrapper">
		<div class="container">

			<div class="col-xs-12 col-sm-12 col-md-12"
				style="padding-bottom: 50px;">
				<h3 class="head_title" data-edit="true"
					data-selector="h3.head_title">
					<span class="fsize20"><strong>
							${board.boardCategory eq 1 ? '공지 수정' : '소모임 게시글 수정' } </strong></span>
				</h3>

			</div>




			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal" name="detailForm"
				enctype="multipart/form-data">
				<input type="hidden" id="boardWriter.userId"
					name="boardWriter.userId" value="${dbUser.userId }"> <input
					type="hidden" id="boardCategory" name="boardCategory" value="4">
				<input type="hidden" id="boardNo" name="boardNo"
					value="${board.boardNo}">

				<div class="form-group">
					<div style="padding-bottom: 30px;">
						<input type="text" class="form-control" id="boardName"
							placeholder="${board.boardName}" style="width: 90%;"
							name="boardName">
					</div>

				</div>

				<div class="form-group">
					<div style="width: 90%;">
						<textarea id="summernote" name="boardContent">${board.boardContent}</textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-5  col-sm-4 text-center"
						style="float: right;">
						<button type="button" class="btn btn-primary">수정</button>
						<a class="btn btn-default btn" href="javascript:history.back();"
							role="button">취소</a>
					</div>
				</div>
			</form>

		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>



</html>