<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fleamarket-cover {
    background-color: #E3F1C5;
    background-image: url('${pageContext.request.contextPath}/resources/images/forest1.jpg');
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

@media ( min-width : 768px) {
	.fleamarket-cover {
		height: 315px;
		padding: 0 16px 0 16px;
		margin-top: 60px;
		margin-bottom: 60px;
	}
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f2f2f2;
}

textarea.form-control {
	height: 100px;
	resize: none;
}

.content-meta {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}

.navigation, .actions, .comments {
	margin: 10px 0;
}

.navigation .btn, .actions .btn, .comments .btn {
	background-color: #5d4734;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
}

.navigation .btn:hover, .actions .btn:hover, .comments .btn:hover {
	background-color: #4c3b2b;
}

.comments input[type="text"] {
	margin-bottom: 10px;
}
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<script type="text/javascript">
	function deleteInquiry() {
		if (confirm("문의를 삭제 하시겠습니까 ?")) {
			let query = "num=${dto.num}&${query}";
			let url = "${pageContext.request.contextPath}/inquiry/delete?"
					+ query;
			location.href = url;
		}
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

			<table class="table mt-5 mb-0">
				<tbody>
					<tr>
						<td colspan="2" class="px-0 pb-0">
							<div class="row gx-0">
								<div class="col-sm-1 bg-primary me-1">
									<p class="form-control-plaintext text-white text-center">Q.</p>
								</div>
								<div class="col bg-primary">
									<p class="form-control-plaintext text-white ps-2">${dto.subject}</p>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td width="50%">카테고리 : ${dto.category}</td>
						<td align="right">작성자 : ${dto.userName}</td>
					</tr>

					<tr>
						<td width="50%">문의일자 : ${dto.reg_date}</td>
						<td align="right">처리결과 : ${(empty dto.answer_date)?"답변대기":"답변완료"}
						</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200">${dto.content}</td>
					</tr>
				</tbody>
			</table>

			<c:if test="${not empty dto.answer}">
				<table class="table mb-0">
					<tbody>
						<tr>
							<td colspan="2" class="p-0">
								<div class="row gx-0">
									<div class="col-sm-1 bg-success me-1">
										<p class="form-control-plaintext text-white text-center">A.</p>
									</div>
									<div class="col bg-success">
										<p class="form-control-plaintext text-white ps-2">[답변]
											${dto.subject}</p>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td width="50%">담당자 : 관리자</td>
							<td align="right">답변일자 : ${dto.answer_date}</td>
						</tr>

						<tr>
							<td colspan="2" valign="top" height="150">${dto.answer}</td>
						</tr>
					</tbody>
				</table>
			</c:if>

			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%">
						<button type="button" class="btn btn-light"
							onclick="deleteInquiry();">질문삭제</button>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light"
							onclick="location.href='${pageContext.request.contextPath}/inquiry/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>

		</div>
	</div>
</div>