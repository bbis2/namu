<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fleamarket-cover {
    background-color: #EBDDCC;
}

.htext{
	padding-top: 100px;
	padding-left : 100px;
}
.cover-content {
	padding: 50px;
    position: relative;
    height: 100%;
    box-sizing: border-box;
    margin-left: 100px;
}

@media (min-width: 768px) {
    .fleamarket-cover {
        height: 315px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
        margin-bottom: 60px;
}
/* 전체 배경색 */


.cover-description {
    font-size: 1.2rem;
    color: #4A5A2C;
}

.cover-image {
    margin-top: 20px;
}

/* 검색 및 필터 컨테이너 */
.filter-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.filter-container .search-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #FFFFFF;
    margin-right: 10px;
    width: 500px;
    height: 40px;
}


.search-button {
    background-color: #74634F;
    color: white;
    border: none;
    padding: 10px 20px;
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
}

.card-body {
    padding: 20px;
    text-align: center;
}

.card-title {
    font-size: 1.25rem;
    font-weight: bold;
}

/* 카테고리 스타일 */
.categories {
    display: flex;
    justify-content: space-around;
    padding: 10px;
    background-color: #EBDDCC;
    border-radius: 10px;
    margin-bottom: 50px;
}

.categories span {
    font-weight: bold;
}
.body-left {
	padding-bottom: 40px;
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
    padding: 0.75rem;
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
    padding: 20px 0;
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="container">
<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">1대1<br>문의하기</h1>
		<span class="cover-description htext"></span><br>
		<span class="cover-description htext">문의하고 싶은 내용을 자유롭게 적어주세요!</span>
		<div class="cover-image"></div>
  	</section>
  	
	<div class="body-container">	
		
		
		<div class="body-main">

	        <div class="row board-list-header">
	            <div class="col-auto me-auto">
	            	${dataCount}개(${page}/${total_page} 페이지)
	            </div>
	            <div class="col-auto">&nbsp;</div>
	        </div>	
                
            <!-- 테이블 만들기 -->
            <table class="table table-hover board-list">
                <thead class="table-light">
                    <tr>
                        <th>게시글번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>닉네임</th>
                        <th>등록일</th>
                        <th>조회수</th>
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
            	${dataCount==0? "등록된 게시글이 없습니다." : paging }
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