<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container body-container">
	<div class="main1">
	중고거래
	</div>
<div style="margin-top: 20px">
   <select>
     <option>주소1</option>
     <option>주소2</option>
</select>
</div>
<div style="margin-top: 10px; margin-bottom: 10px">총 <span style="color: blue; font-weight: bold;">${dataCount}</span> 개
<div class="search-container">
            <input type="text" class="searchInput" placeholder="검색어 입력">
            <button class="search-btn">검색</button>
        <button class="submit-button" onclick="location.href='${pageContext.request.contextPath}/used/write';">
            <span>+</span>
            글쓰기
        </button>
        </div>
    </div>
		<div class="flex-row" style="justify-content: space-between; align-items: center">
		</div>
	
		<div class="main-best-board-container1">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="flex-col banner-card-container">
				<div class="home-img-container">
				<a href="${pageContext.request.contextPath}/used/article?num=${dto.num}">
					<c:choose>
                        <c:when test="${dto.imageFile != null && !dto.imageFile.isEmpty()}">
                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" 
                                 src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFile}">
                        </c:when>
                        <c:otherwise>
                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" 
                                 src="${pageContext.request.contextPath}/resources/images/noimage.png">
                        </c:otherwise>
                    </c:choose>
				</a>
				</div>

				<div class="list-subject" style="color: navy; margin-top: 10px; font-weight: bold;">${dto.subject}</div>
				<div>현재 입찰가 : <fmt:formatNumber value="${dto.price}"/>원
					<div style="float: right;">
						<c:if test="${dto.state == 1}" >
							<span style="color: #D24F04; font-weight: bold;">예약중</span>
						</c:if>	
						<c:if test="${dto.state == 2}">
							<span style="color: #2E8B1F; font-weight: bold;">판매완료</span>
						</c:if>	
						<c:if test="${dto.state == 0}">
						</c:if>				
					</div>
				</div>
				<div class="half">조회수 ${dto.hitCount} &nbsp;|&nbsp; ${dto.regDate}</div>
			</div>
		</c:forEach>
		</div>
	</div>

<script type="text/javascript">
$(function () {
	$('.search-btn').click(function () {
		
		let kwd = $('.searchInput').val().trim();
		
		location.href='${pageContext.request.contextPath}/used/list?kwd=' + encodeURIComponent(kwd);
		
				
		
	});
});
</script>

<style>
.main1 {
    background: #C3FF9A;
    height: 300px;
    width: 100%;
    margin-top: 80px;
    border-radius: 5px;
}

.main-best-board-container1 {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 15px;
}

.flex-col.banner-card-container1 {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}


.main-best-board-container1 div {
    overflow: hidden;
    position: relative;
}

 .main-best-board-container1 img {
    transition: 0.2s;
}

.search-container {
    display: flex;
    align-items: center;
    justify-content: flex-end; /* 오른쪽 정렬 */
}

.searchInput-container {
    text-align: center;
    align-content: center;
}

.searchInput {
    border: 1px solid #ccc;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 12px;
    outline: none;
    width: 120px; 
    height: 30px;
}

.search-btn{
 border: 1px solid #ccc;
 border-radius: 25px;
 font-size: 12px;
 outline: none;
 width: 60px; 
 height: 30px;
 text-align: center;
}

.searchInput::placeholder {
    color: #999;
}

.submit-button {
    background-color: #61ac2d;
    color: white;
    border: none;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 14px;
    margin-left: 10px;
    cursor: pointer;
    align-items: center;
    height: 30px;
    text-align: center;
    justify-content: center;
}

.submit-button span {
    margin-left: 5px;
}

.home-img-container {
   width: 100%;
   height: 180px;
   border-radius: 5px;
}
</style>