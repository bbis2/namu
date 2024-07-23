<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 900px;
}

.delete-file {
	cursor: pointer;
}

.delete-file:hover {
	color: #0d58ba;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<script type="text/javascript">
	function check() {
		const f = document.noticeForm;

		let str = f.subject.value;
		if (!str) {
			alert("제목을 입력하세요. ");
			f.subject.focus();
			return false;
		}

		str = f.content.value;
		if (!str || str === "<p><br></p>") {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/admin/noticeManage/${mode}";

		return true;
	}
</script>

<div class="body-container">
	<div class="body-title">
		<h3>
			<i class="bi bi-clipboard"></i> 공지사항
		</h3>
	</div>

	<div class="body-main">

		<form name="noticeForm" method="post" enctype="multipart/form-data">
			<table class="table mt-5 write-form">
				<tr>
					<td class="bg-light col-sm-2">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td><input type="text" name="subject" maxlength="100"
						class="form-control" value="${dto.subject}"></td>
				</tr>

				<tr>
					<td class="bg-light col-sm-2">카테고리</td>
					<td><select id="categoryNum" name="categoryNum"
						class="form-select">
							<option value="" selected>카테고리 선택</option>
							<c:forEach var="vo" items="${list}">
								<option value="${vo.categoryNum}"
									${categoryNum == vo.categoryNum?"selected" : ""}>${vo.categoryName}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>

				</tr>

				<tr>
					<td class="bg-light col-sm-2">공지여부</td>
					<td>
						<div class="form-check">
							<input type="checkbox" name="notice" id="notice"
								class="form-check-input" value="1"
								${dto.notice==1 ? "checked":"" }> <label for="notice"
								class="form-check-label">공지</label>
						</div>
					</td>
				</tr>

				<tr>
					<td class="bg-light col-sm-2">출력여부</td>
					<td>
						<div class="form-check">
							<input type="checkbox" name="showNotice" id="showNotice"
								class="form-check-input" value="1"
								${mode=="write" || dto.showNotice==1 ? "checked":"" }> <label
								for="showNotice" class="form-check-label">표시</label>
						</div>
					</td>
				</tr>

				<tr>
					<td class="bg-light col-sm-2">작성자</td>
					<td>
						<p class="form-control-plaintext">${sessionScope.member.nickName}</p>
					</td>
				</tr>

				<tr>
					<td class="bg-light col-sm-2">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top"><textarea name="content" id="ir1"
							class="form-control" style="width: 99%; height: 300px;">${dto.content}</textarea>
					</td>
				</tr>

				<tr>
					<td class="bg-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td><input type="file" name="selectFile" class="form-control"
						multiple></td>
				</tr>

				<c:if test="${mode=='update'}">
					<c:forEach var="vo" items="${listFile}">
						<tr>
							<td class="bg-light col-sm-2">첨부된파일</td>
							<td>
								<p class="form-control-plaintext">
									<span class="delete-file" data-fileNum="${vo.fileNum}"><i
										class="bi bi-trash"></i></span> ${vo.originalFilename}
								</p>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>

			<table class="table table-borderless">
				<tr>
					<td class="text-center">
						<button type="button" class="btn btn-dark"
							onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn btn-light">다시입력</button>
						<button type="button" class="btn btn-light"
							onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>

	</div>
</div>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$('.delete-file')
				.click(
						function() {
							if (!confirm('선택한 파일을 삭제 하시겠습니까 ? ')) {
								return false;
							}

							let $tr = $(this).closest('tr');
							let fileNum = $(this).attr('data-fileNum');
							let url = '${pageContext.request.contextPath}/admin/noticeManage/deleteFile';

							$.ajaxSetup({
								beforeSend : function(e) {
									e.setRequestHeader('AJAX', true);
								}
							});
							$.post(url, {
								fileNum : fileNum
							}, function(data) {
								$($tr).remove();
							}, 'json').fail(function() {
								alert('error');
							});
						});
	</script>
</c:if>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});

	function submitContents(elClickedObj) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			if (!check()) {
				return;
			}

			elClickedObj.submit();

		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 12;
		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>