<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .main-category-icon-container {
        display: flex;
        flex-direction: row;
		transition: 0.2s;
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

    .category-btn {
        background-color: white;
        width: 48px;
        height: 48px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
    }
	
	.category-btn:hover {
        cursor: pointer;
    }

	.category-btn-container {
        position: absolute;
        display: flex;
        top: 0;
        width: 120px;
        height: 120px;
		align-items: center;
	}

    .category-right-btn-container {
        right: 0;
        justify-content: right;
        background: linear-gradient(to left, #ffffff 30%, rgba(255, 0, 0, 0));
        padding-right: 10px;

    }

    .category-left-btn-container {
        left: -5px;
        justify-content: left;
        background: linear-gradient(to right, #ffffff 10%, rgba(255, 0, 0, 0));
        padding-left: 10px;
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

	<div class="category-left-btn-container category-btn-container">
		<div id="category-left-btn" class="category-btn shadow-sm">
			<i class="bi bi-chevron-left"></i>
		</div>
	</div>

	<div class="category-right-btn-container category-btn-container">
		<div id="category-right-btn" class="category-btn shadow-sm">
			<i class="bi bi-chevron-right"></i>
		</div>
	</div>
</div>

<script>
    let $categoryLeft = $('#category-left-btn');
    let $categoryRight = $('#category-right-btn');
    let $categoryLeftContainer = $('.category-left-btn-container');
    let $categoryRightContainer = $('.category-right-btn-container');

    $(function () {
        $categoryLeftContainer.hide()
    });

    $categoryRight.click(function () {
        document.getElementsByClassName('main-category-icon-container')[0].style.transform = 'translateX(-25%)';
        $categoryRightContainer.hide()
        $categoryLeftContainer.show()
    });

    $categoryLeft.click(function () {
        document.getElementsByClassName('main-category-icon-container')[0].style.transform = 'translateX(0)';
        $categoryLeftContainer.hide()
        $categoryRightContainer.show()
    });
</script>


