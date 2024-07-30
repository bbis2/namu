<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fleamarket-cover {
    position: relative;
    width: 100%;
    height: 315px; /* 커버 높이를 고정 */
    overflow: hidden;
    background-image: url('${pageContext.request.contextPath}/resources/images/bicycle.jpg');
    background-size: cover; /* 이미지를 커버 전체에 맞춤 */
    background-position: center; /* 이미지를 중앙에 위치시킴 */
    color: white; /* 텍스트가 더 잘 보이도록 색상을 흰색으로 설정 */
    text-align: center; /* 텍스트를 가운데 정렬 */
}

.cover-title {
    position: absolute;
    top: 30%;
    left: 20%;
    transform: translate(-50%, -50%);
    font-weight: bold;
    padding: 10px;
    border-radius: 10px;
    background-color: rgba(0, 0, 0, 0.5); /* 텍스트 배경을 반투명 검은색으로 설정 */
}

.cover-description {
    position: absolute;
    bottom: 10%;
    left: 22%;
    transform: translateX(-50%);
    font-size: 1.2em;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.5); /* 텍스트 배경을 반투명 검은색으로 설정 */
    border-radius: 10px;
}

.cover-image {
    display: none; /* 이미지 요소를 숨김 */
}

@media (min-width: 768px) {
    .fleamarket-cover {
        padding: 0 16px;
        margin-top: 60px;
        margin-bottom: 60px;
    }

	/*여기까지 초록 박스*/
	.body-left {
		padding-bottom: 20px;
	}
	.table {
		text-align: center;
	}
	.categories {
		display: flex;
		justify-content: space-around;
		padding: 10px;
		background-color: #EEF2E3;
		border-radius: 10px;
		margin-bottom: 50px;
	}
	.categories span {
		font-weight: bold;
	}
	.filter-container {
		text-align: right;
		margin-bottom: 20px;
	}
	.filter-container .search-input {
		flex: 1;
		padding: 10px;
		border: 1px solid #ddd;
		border-radius: 20px;
		background-color: #FFFFFF;
		margin-right: 10px;
	}
	.filter-container .search-button {
		background-color: #74634F;
		color: white;
		border: none;
		padding: 10px 20px;
		border-radius: 20px;
		cursor: pointer;
	}
	.filter-container .search-button:hover {
		background-color: #4c3b2b;
	}
	h2 {
		font-weight: bold;
	}
	.card {
		background-color: #fff;
		border: 1px solid #ddd;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	.card-body {
		padding: 20px;
	}
	.card-title {
		font-size: 1.25rem;
		font-weight: bold;
	}
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js">
	
</script>

<c:url var="listUrl" value="/delivery/list">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}" />
		<c:param name="kwd" value="${kwd}" />
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener('load', function() {
    let page = ${page};
    let pageSize = ${size};
    let dataCount = ${dataCount};
    let url = '${listUrl}';

    let total_page = pageCount(dataCount, pageSize);
    let paging = pagingUrl(page, total_page, url);

    document.querySelector('.dataCount').innerHTML = dataCount + '개 (' + page + '/' + total_page + '페이지)';

    document.querySelector('.page-navigation').innerHTML = dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
});

</script>

<script type="text/javascript">
	function searchList() {
		var f = document.searchForm;
		f.submit();
	}

	function filterByTown() {
		document.getElementById("townFilterForm").submit();
	}
</script>

<div class="container">
    <section class="fleamarket-cover">
        <h1 class="cover-title htext bd">
            둘러보는<br>우리 동네
        </h1>
        <span class="cover-description htext">심부름하고 포인트를 얻어가세요!</span>
        <div class="cover-image">
            <img src="${pageContext.request.contextPath}/resources/images/bicycle.jpg">
        </div>
    </section>


	<main class="container">
		<div class="body-title">
			<h2>전체 게시글</h2>
			<form class="row" name="searchForm"
				action="${pageContext.request.contextPath}/delivery/list"
				method="post">
				<div class="filter-container">
					<input type="text" name="kwd" class="search-input" value="${kwd}"
						placeholder="검색어를 입력하세요">
					<button type="button" class="search-button" onclick="searchList()"
						title="검색">검색</button>
					<button type="button" class="search-button"
						onclick="location.href='${pageContext.request.contextPath}/delivery/write';">글올리기</button>
				</div>
			</form>

			<div class="col">
				<form id="townFilterForm"
					action="${pageContext.request.contextPath}/delivery/list"
					method="get">
					<h6 class="bd">나의 동네</h6>
					<select name="town" class="form-select mb-4 border border-2"
						aria-label="Default select example" onchange="filterByTown()">
						<option value="${sessionScope.member.town1}"
							<c:if test="${town == sessionScope.member.town1}">selected</c:if>>${sessionScope.member.town1}</option>
						<c:if test="${sessionScope.member.town2 != null}">
							<option value="${sessionScope.member.town2}"
								<c:if test="${town == sessionScope.member.town2}">selected</c:if>>${sessionScope.member.town2}</option>
						</c:if>
					</select>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<div class="card mb-4">
					<div class="card-body">
						<h5 class="card-title">${sessionScope.member.nickName}</h5>
						<p>${sessionScope.member.town1}</p>
						<p>쪽지 | 스크랩 | 알림</p>
					</div>
				</div>

			</div>
			<div class="col-md-9">
				<div class="categories">
					<span><a href="">태그</a></span> <span><a href="">태그</a></span> <span><a
						href="">태그</a></span> <span><a href="">태그</a></span>
				</div>

				<!-- 페이지 출력 -->
				<div class="row board-list-header">
					<div class="col-auto me-auto dataCount">
						${dataCount}개(${current_page}/${total_page} 페이지)</div>
					<div class="col-auto">&nbsp;</div>
				</div>

				<!-- 테이블 만들기 -->
				<table class="table table-hover board-list">
					<thead class="table-light">
						<tr>
							<th>게시글번호</th>
							<th>보상 포인트</th>
							<th>제목</th>
							<th>닉네임</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>진행상태</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>

								<td>${dataCount -(page-1) * size - status.index}</td>
								<td class="left"><c:url var="url" value="/delivery/article">
										<c:param name="num" value="${dto.num}" />
										<c:param name="page" value="${page}" />
										<c:if test="${not empty kwd}">
											<c:param name="schType" value="${schType}" />
											<c:param name="kwd" value="${kwd}" />
										</c:if>
									</c:url> <a href="${url}" class="text-rest">${dto.point}</a></td>
								<td>${dto.subject}</td>
								<td>${dto.nickname}</td>
								<td>${dto.regDate}</td>
								<td>${dto.hitCount}</td>
								<c:if test="${dto.state == 0}">
									<td>미진행</td>
								</c:if>
								<c:if test="${dto.state == 1}">
									<td>배달중</td>
								</c:if>
								<c:if test="${dto.state == 2}">
									<td>배달완료</td>
								</c:if>
							</tr>
							<!-- 더 많은 행 추가 가능 -->
						</c:forEach>
					</tbody>
				</table>

				<div class="page-navigation">${dataCount==0? "등록된 게시글이 없습니다." : paging }
				</div>

			</div>
		</div>
	</main>
</div>
</body>
</html>