<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-question-diamond"></i> 1:1 문의 </h3>
		</div>
		
		<div class="body-main">

	        <div class="row board-list-header">
	            <div class="col-auto me-auto">
	            	${dataCount}개(${page}/${total_page} 페이지)
	            </div>
	            <div class="col-auto">&nbsp;</div>
	        </div>				
			
			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th width="100">분류</th>
						<th>제목</th>
						<th width="100">작성자</th>
						<th width="90">문의일자</th>
						<th width="90">처리결과</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.category}</td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.reg_date}</td>
							<td>${(empty dto.answer_date)?"답변대기":"답변완료"}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/inquiry/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/inquiry/list" method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
								<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
								<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
								<option value="content" ${schType=="content"?"selected":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/inquiry/write';">질문등록</button>
				</div>
			</div>

		</div>
	</div>
</div>