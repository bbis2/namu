<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.fleamarket-cover {
	background-color: #E3F1C5;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/forest1.jpg');
	background-size: cover; /* 이미지를 커버 전체에 맞춤 */
	background-position: center; /* 이미지를 중앙에 위치시킴 */
	position: relative;
}

.htext {
	padding-top: 100px;
	padding-left: 100px;
	color: black; /* 배경 이미지와 대비되도록 텍스트를 흰색으로 설정 */
	position: relative;
	z-index: 1; /* 텍스트를 배경 위에 표시되도록 함 */
}

.cover-content {
	padding: 50px;
	position: relative;
	height: 100%;
	box-sizing: border-box;
	margin-left: 100px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<script type="text/javascript">
	function sendOk() {
		const f = document.myForm;
		let str;

		str = f.subject.value.trim();
		if (!str) {
			alert("제목을 입력하세요. ");
			f.subject.focus();
			return;
		}

		str = f.content.value.trim();
		if (!str) {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/inquiry/${mode}";
		f.submit();
	}
</script>

<div class="container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			1대1<br>물어 보기
		</h1>
		<span class="cover-description htext"></span><br> <span
			class="cover-description htext">궁금한점은 마음껏 물어보세요!</span>
		<div class="cover-image"></div>
	</section>

	<div class="body-container">


		<div class="body-main">

			<form name="myForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="bg-light col-sm-2" scope="row">구 분</td>
						<td><select name="category" class="form-select">
								<option value="일반질문" ${dto.category=="일반질문"?"selected":"" }>일반질문</option>
								<option value="계정관리" ${dto.category=="계정관리"?"selected":"" }>계정관리</option>
								<option value="결제및청구" ${dto.category=="결제및청구"?"selected":"" }>결제및청구</option>
								<option value="신고관리" ${dto.category=="신고관리"?"selected":"" }>신고관리</option>
						</select></td>
					</tr>

					<tr>
						<td class="bg-light col-sm-2" scope="row">제 목</td>
						<td><input type="text" name="subject" class="form-control"
							value="${dto.subject}"></td>
					</tr>

					<tr>
						<td class="bg-light col-sm-2" scope="row">작성자명</td>
						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-sm-2" scope="row">내 용</td>
						<td><textarea name="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
				</table>

				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i
									class="bi bi-check2"></i>
							</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light"
								onclick="location.href='${pageContext.request.contextPath}/inquiry/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
									class="bi bi-x"></i>
							</button> <c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</div>