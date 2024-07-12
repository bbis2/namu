<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
	<div class="title">
		<h3>🌳중고거래</h3>
		
		<form name="UsedForm" method="post" enctype="multipart/form-data">
			<table class="table mt-5 write-form">
			<tr>
				<td class="bg-light col-sm-2" scope="row">제목</td>
				<td>
					<input class="block" type="text" name="subject" value="${dto.subject}">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">작성자</td>
				<td>
					<p class="block">${sessionScope.member.nickName}</p>
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">금액</td>
				<td>
					<input class="block" type="number" name="price" value="${dto.price}">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">내용</td>
				<td>
					<textarea class="block" name="content" id="ir1"></textarea>
				</td>
			</tr>
			</table>
			
			<table class="btn3">
 					<tr>
						<td class="text-btn">
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/used/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
		</form>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js"
charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
		
	function submitContents(elClickedObj) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		if(! check()) {
		return;
	 }
	elClickedObj.submit();
		} catch(e) {
	  }
	}
	
	function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
	
</div>

<style>
.title {
margin-top: 100px;
}

.block {
	border: none;
}
</style>

<script type="text/javascript">
function check() {
	const f = document.UsedForm;
	let str;
 	str = f.subject.value.trim();
 	if(!str) {
 		alert("제목을 입력하세요.");
 		f.subject.focus();
 return false;
 	}
 str = f.content.value.trim();
 if(! str || str === "<p><br></p>") {
 alert("내용을 입력하세요. ");
 f.content.focus();
 return false;
 }
 f.action = "${pageContext.request.contextPath}/used/${mode}";
 return true;
}
</script>

