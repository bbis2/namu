<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</style>

<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
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
   	<div class="body-title">
		<h2>전체 게시글</h2>
            <div class="filter-container">
                <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                <button type="button" class="search-button" onclick="searchList()" title="검색" >검색</button>
                <button type="button" class="search-button" onclick="location.href='${pageContext.request.contextPath}/daily/write';">글올리기</button>
            </div>		
	</div>
	
        <div class="row">
            <div class="col-md-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">${sessionScope.member.nickName}</h5>
            			   <p>서울특별시 마포구</p>
          				   <p>쪽지 | 스크랩 | 알림</p>
                    </div>
                </div>
              
			   <div class="card">
					<ul class="list-group">
						<li class="list-group-item list-subject" data-lecturecode="L100001" data-lecturesubcode="S0100001">모임</li>
						<li class="list-group-item list-subject" data-lecturecode="L100001" data-lecturesubcode="S0100002">일상</li>
						<li class="list-group-item list-subject" data-lecturecode="L100001" data-lecturesubcode="S0100003">챌린지</li>
					</ul>
				</div>
			
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">BEST TOP 10</h5>
                        <!-- 목록 추가 -->
                    </div>
                </div>
            </div>
            <div class="col-md-9">
              <div class="categories">
                    <span><a href="">태그</a></span>         
                    <span><a href="">태그</a></span>         
                    <span><a href="">태그</a></span>         
                    <span><a href="">태그</a></span>         
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
                    	<td>${dto.categoryName}</td>
	                  	<td>${dataCount -(page-1) * size - status.index}</td>
	                    	<td class="left">
	                    		<c:url var="url" value="/daily/article">
	                    			<c:param name="num" value="${dto.num}"/>
	                    			<c:param name="page" value="${page}"/>
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