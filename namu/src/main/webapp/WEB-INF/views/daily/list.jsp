<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
<style type="text/css">
.fleamarket-cover {
    background-color: #E3F1C5;
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
    background-color: #EEF2E3;
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

.myphoto {
 	width: 50px; 
    height: 50px; 
    object-fit: cover; 
     border-radius: 30%; 
    margin-right: 5px;
}
</style>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginatie-boot.js"> </script>

<c:url var="listUrl" value="/daily/list">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}"/>
		<c:param name="kwd" value="${kwd}"/>
	</c:if>
	<c:if test="${categoryNum != 0}">
		<c:param name="categoryNum" value="${categoryNum}"/>
	</c:if>	
</c:url>

<script type="text/javascript">
window.addEventListener('load', function() {
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let categoryNum = ${categoryNum};
	let url = '${listUrl}';
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector('.dataCount').innerHTML = dataCount + '개 ('
			+ page + '/' + total_page + '페이지)';
	
	document.querySelectot('.page-navigation').innerHTML=
		dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
});
</script>

<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	f.submit();
}

function searchCategory(categoryNum) {
	var f = document.searchForm;
	f.categoryNum.value = categoryNum;
	f.submit();
}

function filterByTown() {
    let town = document.getElementById("townFilter").value;
    var f = document.searchForm;
    f.town.value = town;
    f.submit();
}
</script>

<div class="container">
 	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">소통하는<br>일상 생활</h1>
		<span class="cover-description htext"></span><br>
		<span class="cover-description htext">동네주민과 함께 만들어가요!</span>
		<div class="cover-image"></div>
  	</section>


  <main class="container">
			<div class="d-flex">
				<h5 style="font-weight: bold;">${town}</h5>
				<h5 style="color: #b3b3b3;" class="bd">&nbsp;${dataCount}개</h5>
			</div>
   	<div class="body-title">
		<form class="row" name="searchForm" action="${pageContext.request.contextPath}/daily/list" method="post">
            <div class="filter-container">
                <input type="text" class="search-input border border-2"  name="kwd" value="${kwd}" style="width: 60%" placeholder="검색어를 입력하세요"/>
				<input type="hidden" name="categoryNum" value="${categoryNum}">
				<input type="hidden" name="town" value="${town}">    			
                <button type="button" class="search-button" onclick="searchList()" title="검색" ><i class="fa-solid fa-magnifying-glass"></i></button>
				<button class="btn reset" style="background-color: white; color:#74634F;"  type="button" onclick="location.href='${pageContext.request.contextPath}/daily/list';">
					<i class="fa-solid fa-rotate-right"></i>
				</button>
                <button type="button" class="search-button" onclick="location.href='${pageContext.request.contextPath}/daily/write';">글올리기</button>
            </div>
        </form>		
	</div>
	
        <div class="row introduce">
            <div class="col-md-3 ">
			<div class="card mb-4 d-flex align-items-center">
				<div style="margin-top: 10px;">
					<c:if test="${empty userdto.photo }">
						<img class="myphoto" src="${pageContext.request.contextPath}/resources/images/person.png">
					</c:if>
					<c:if test="${not empty userdto.photo }">
						<img class="myphoto" src="${pageContext.request.contextPath}/uploads/photo/${userdto.photo}">
					</c:if>	
				</div>
				<div class="card-body">
					<h5 class="card-title">${sessionScope.member.userId}</h5>
   				    <h6 class="bd">[<a style="color: green">${sessionScope.member.nickName}</a>]님의 동네</h6>
						<select id="townFilter" class="form-select border-2" aria-label="Default select example" onchange="filterByTown()">
							
							<option value="${sessionScope.member.town1}" <c:if test="${town == sessionScope.member.town1}">selected</c:if>>${sessionScope.member.town1}</option>
							<c:if test="${sessionScope.member.town2 != null}">
								<option value="${sessionScope.member.town2}" <c:if test="${town == sessionScope.member.town2}">selected</c:if>>${sessionScope.member.town2}</option>
							</c:if>
						</select>
				   		<br>
						
				</div>
			</div>
              
		    <div class="card mb-4">
				<div class="list-group">
					<a class="list-group-item list-subject" type="button" style="text-align: center; font-weight: bold;" onclick="location.href='${pageContext.request.contextPath}/daily/list';">일상</a>
					<a class="list-group-item list-subject" type="button" style="text-align: center; font-weight: bold;"  onclick="location.href='${pageContext.request.contextPath}/together/list';">모임</a>
				</div>
			</div>  
			
            </div>
            <div class="col-md-9">
              <div class="categories">
                    <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(1)">#일상</a></span>         
                    <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(2)">#맛집</a></span>         
                    <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(3)">#취미</a></span>         
                    <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(4)">#고민/사연</a></span>         
                    <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(5)">#생활/편의</a></span>         
                    <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(6)">#공공소식</a></span>         
                </div>
                
            <!-- 페이지 출력 -->
            <div class="row board-list-header">
	            <div class="col-auto me-auto">
	            	${dataCount}개(${current_page}/${total_page} 페이지)
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
                	<c:forEach var="dto" items="${list}" varStatus="status">
                    <tr>
                    	
	                  	<td>${dataCount -(page-1) * size - status.index}</td>
	                  	<td>${dto.categoryName}</td>
	                    	<td class="left">
	                    		<c:url var="url" value="/daily/article">
	                    			<c:param name="num" value="${dto.num}"/>
	                    			<c:param name="page" value="${page}"/>
									<c:if test="${categoryNum != 0}">
										<c:param name="categoryNum" value="${categoryNum}"/>
									</c:if>		                    			
	                    			<c:if test="${not empty kwd}">
	                    				<c:param name="schType" value="${schType}"/>
	                    				<c:param name="kwd" value="${kwd}"/>
	                    			</c:if>
	                    		</c:url>
	                    		<a href="${url}" class="text-rest">${dto.subject}</a>
	     
	                    </td>
                        <td>${dto.nickName}</td>
                        <td>${dto.regDate}</td>
                        <td>${dto.hitCount}</td>
                    </tr>
                    <!-- 더 많은 행 추가 가능 -->
                    </c:forEach>
                </tbody>
            </table>
            
            <div class="page-navigation">
            	${dataCount==0? "등록된 게시글이 없습니다." : paging }
            </div>
            
            </div>
        </div>
    </main>
</div>
</body>
</html>