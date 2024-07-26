<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .main-category-icon-container {
        display: flex;
        flex-direction: row;
		transition: 0.2s;
		justify-content: space-between;
    }

    .main-category-icon-container:hover {
        cursor: pointer;
    }

    .main-category-icon-container::-webkit-scrollbar {
        display: none;
    }

    .main-icon-item {
        text-align: center;
        height: 120px;
        width: 114px;
        flex-shrink: 0;
    }

    .category-icon-img {
        margin: 0 auto;
        width: 80px;
        height: 80px;
        object-fit: cover;
    }

    .category-icon-text {
        margin-top: 8px;
    }

    .category-container {
		position: relative;
        overflow-x: hidden;
    }
    
</style>


<div class="category-container">
	<div class="main-category-icon-container">
		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/used/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/used2.png">
			<div class="category-icon-text">중고거래</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/auction/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/auction1.png">
			<div class="category-icon-text">중고경매</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/talent/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/talent2.png">
			<div class="category-icon-text">재능마켓</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/borrow/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/borrow2.png">
			<div class="category-icon-text">빌려줘요</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/rent/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/rent1.png">
			<div class="category-icon-text">빌려드림</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/daily/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/daily2.png">
			<div class="category-icon-text">나무일상</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/together/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/together2.png">
			<div class="category-icon-text">나무모임</div>
		</div>

		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/delivery/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/delivery3.png">
			<div class="category-icon-text">배달해요</div>
		</div>
		
		<div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/notice/list'">
			<img class="category-icon-img" src="${pageContext.request.contextPath}/resources/images/notice1.png">
			<div class="category-icon-text">공지사항</div>
		</div>
	</div>

</div>

