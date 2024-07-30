<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
<style type="text/css">
/* 전체 배경 색상 */
.fleamarket-cover {
    background-color: #E3F1C5;
}

/* 전체 컨테이너 스타일 */
.introduce {
    width: 90%; /* 너비를 90%로 설정하여 넓게 사용 */
    max-width: 1200px; /* 최대 너비 설정 */
    margin: 0 auto;
}

/* 제목 텍스트 상단 패딩 조정 */
.htext {
    padding-top: 50px; /* 상단 패딩 조정 */
    padding-left: 20px; /* 좌측 패딩 조정 */
}

/* 커버 콘텐츠 스타일 */
.cover-content {
    padding: 20px; /* 패딩 조정 */
    position: relative;
    height: auto; /* 높이 자동 조정 */
    box-sizing: border-box;
}

/* 미디어 쿼리로 커버 높이 설정 */
@media (min-width: 768px) {
    .fleamarket-cover {
        height: 250px; /* 높이 조정 */
        padding: 0 16px;
        margin-top: 40px; /* 여백 조정 */
        margin-bottom: 40px;
    }
}

/* 커버 설명 텍스트 스타일 */
.cover-description {
    font-size: 1rem; /* 폰트 크기 조정 */
    color: #4A5A2C;
}

/* 이미지 여백 조정 */
.cover-image {
    margin-top: 10px; /* 상단 여백 조정 */
}

/* 검색 및 필터 컨테이너 */
.filter-container {
    display: flex;
    justify-content:flex-end;
    align-items: flex-end;
    margin-bottom: 20px; /* 여백 조정 */
}

.filter-container .search-input {
    flex: 1;
    padding: 10px; /* 패딩 조정 */
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #FFFFFF;
    margin-right: 10px;
    max-width: 600px; /* 최대 너비 조정 */
}

.search-button {
    background-color: #74634F;
    color: white;
    border: none;
    padding: 10px 20px; /* 패딩 조정 */
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.search-button:hover {
    background-color: #4c3b2b;
}

/* 카드 스타일 */
.card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

.card-body {
    padding: 20px; /* 패딩 조정 */
    align-content: center;
}

.card-title {
    font-size: 1.25rem; /* 폰트 크기 조정 */
    font-weight: bold;
    margin-bottom: 10px;
}

/* 카테고리 스타일 */
.categories {
    display: flex;
    flex-wrap: wrap; /* 플렉스 항목이 줄 바꿈됨 */
    justify-content: space-around;
    padding: 15px; /* 패딩 조정 */
    background-color: #EEF2E3;
    border-radius: 10px;
    margin-bottom: 30px; /* 여백 조정 */
    font-size: 1.2rem; /* 폰트 크기 조정 */
}

.categories span {
    font-weight: bold;
    cursor: pointer;
    transition: color 0.3s;
    margin: 0 5px; /* 항목 간 여백 조정 */
}

.categories span:hover {
    color: #74634F;
}

/* 테이블 스타일 */
.table {
    width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
    text-align: center;
}

.table th,
.table td {
    padding: 0.75rem; /* 패딩 조정 */
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}

.table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
    font-size: 1rem;
    color: #74634F;
}

.table-hover tbody tr:hover {
    background-color: rgba(0, 0, 0, 0.05);
}

/* 페이지 네비게이션 스타일 */
.page-navigation {
    text-align: center;
    padding: 20px 0; /* 패딩 조정 */
}

.page-navigation a {
    margin: 0 5px;
    padding: 8px 16px;
    border: 1px solid #ddd;
    border-radius: 4px;
    text-decoration: none;
    color: #74634F;
    transition: background-color 0.3s, color 0.3s;
}

.page-navigation a:hover {
    background-color: #74634F;
    color: #fff;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<div class="container">
	<main class="container">
		<div class="body-title">
			<form class="row" name="searchForm"
				action="${pageContext.request.contextPath}/admin/noticeManage/list"
				method="post">
				<div class="filter-container">
					<input type="text" class="search-input border border-2" name="kwd"
						value="${kwd}" placeholder="검색어를 입력하세요" /> <input type="hidden"
						name="categoryNum" value="${categoryNum}">
					<button type="button" class="search-button" onclick="searchList()"
						title="검색">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					<button class="btn reset"
						style="background-color: white; color: #74634F;" type="button"
						onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';">
						<i class="fa-solid fa-rotate-right"></i>
					</button>
					<button type="button" class="search-button"
						onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/write';">글올리기</button>
				</div>
			</form>
		</div>

		<div class="row introduce">
			<div class="col-md-12">
				

				<div class="row board-list-header">
					<div class="col-auto me-auto">${dataCount}개
						(${page}/${total_page} 페이지)</div>
					<div class="col-auto">&nbsp;</div>
				</div>

				<table class="table table-hover board-list">
					<thead class="table-light">
						<tr>
							<th width="100">분류</th>
							<th>제목</th>
							<th width="100">작성자</th>
							<th width="100">문의일자</th>
							<th width="100">처리결과</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.category}</td>
								<td class="left"><a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
								</td>
								<td>${dto.userName}</td>
								<td>${dto.reg_date}</td>
								<td>${(empty dto.answer_date)?"답변대기":"답변완료"}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="page-navigation">${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
				</div>
			</div>
		</div>
	</main>
</div>
</body>