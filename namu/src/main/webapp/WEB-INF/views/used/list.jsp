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
<div class="cg-main">
  <div class="cg-one">
	<button type="button" class="btn-cg" onclick="${pageContext.request.contextPath}/">
	<div class="cg-text">디지털 &nbsp;|&nbsp;</div>
	</button>
  
  </div>
  <div class="cg-one">
	<button type="button" class="btn-cg" onclick="${pageContext.request.contextPath}/">
	<div class="cg-text">의류 &nbsp;|&nbsp;</div>
	</button>
  
  </div>
  <div class="cg-one">
	<button type="button" class="btn-cg" onclick="${pageContext.request.contextPath}/">
	<div class="cg-text">식품 &nbsp;|&nbsp;</div>
	</button>
  
  </div>
  <div class="cg-one">
	<button type="button" class="btn-cg" onclick="${pageContext.request.contextPath}/">
	<div class="cg-text">도서 &nbsp;|&nbsp;</div>
	</button>
	
	</div>
  <div class="cg-one">
	<button type="button" class="btn-cg" onclick="${pageContext.request.contextPath}/">
	<div class="cg-text">기타</div>
	</button>
    
  </div>
</div>

<div style="margin-top: 10px;">총 <span style="color: blue; font-weight: bold;" class="data-count">${dataCount}</span> 개</div>
<div class="search-container">
            <input type="text" class="searchInput" placeholder="검색어 입력" value="${kwd}">
            <button class="search-btn">검색</button>
            <input type="hidden" class="searchWord">
        <button class="submit-button" onclick="location.href='${pageContext.request.contextPath}/used/write';">
            <span>+</span>
            글쓰기
        </button>
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
					<button class="btn_like" title="찜">
					    <span class="like-count">${dto.likeCount}</span>
					</button>
				</div>

				<div class="list-subject" style="color: navy; margin-top: 10px; font-weight: bold;">${dto.subject}</div>
				<div class="list-content" style="display: none;">${dto.content}</div>
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
		<div class="sentinal" data-loading="false" style="height: 50px;"></div> <!-- 무한 스크롤을 위한 sentinal 요소 -->
	</div>


<script type="text/javascript">
$(document).ready(function () {
    // 검색 버튼 클릭 이벤트
    $('.search-btn').click(function () {
        let kwd = $('.searchInput').val().trim().toLowerCase();
        let count = 0; // 개수를 저장할 변수 초기화
        if (kwd) {
            $('.main-best-board-container1 .flex-col').each(function () {
                let subject = $(this).find('.list-subject').text().toLowerCase();
                let content = $(this).find('.list-content').text().toLowerCase();
                if (subject.includes(kwd) || content.includes(kwd)) {
                    $(this).show();
                    count++; // 검색된 것이 하나 생길 때마다 +1
                } else {
                    $(this).hide();
                }
            });
            document.querySelector('span.data-count').innerHTML = count; // 개수 표시
        } else {
            alert('검색어를 입력하세요.');
        }
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
	padding: 10px 10px;
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
   height: 200px;
   border-radius: 5px;
}

.cg-main {
    display: flex;
    flex-direction: row;
	transition: 0.2s;
	text-align: center;
	justify-content: center;
}

.cg-img {
	width: 64px;
	height: 64px;
}

.btn-cg {
	border: none;
	background-color: white;
	margin: 0 20px;
}

.cg-text {
text-align: center;
}
</style>