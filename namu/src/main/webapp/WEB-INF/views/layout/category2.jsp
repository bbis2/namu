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
	 <div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/talent/list?categoryNum=1&town='">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_1.png" alt="디자인">
            <strong>디자인</strong>
        </div>
        <div class="main-icon-item flex-col" onclick="location.href='${pageContext.request.contextPath}/talent/list?categoryNum=2&town='">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_6.png" alt="IT·프로그래밍">
            <strong>IT·프로그래밍</strong>
        </div>
        <div class="main-icon-item flex-col" data-value="3">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_7.png" alt="영상·사진·음향">
            <strong>영상·사진·음향</strong>
        </div>
        <div class="main-icon-item flex-col" data-value="4">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_2.png" alt="마케팅">
            <strong>마케팅</strong>
        </div>
        <div class="main-icon-item flex-col" data-value="5">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_3.png" alt="번역·통역">
            <strong>번역·통역</strong>
        </div>
        <div class="main-icon-item flex-col" data-value="6">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_4.png" alt="문서·글쓰기">
            <strong>문서·글쓰기</strong>
        </div>
        <div class="main-icon-item flex-col" data-value="7">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_8.png" alt="창업·사업">
            <strong>창업·사업</strong>
        </div>
        <div class="main-icon-item flex-col" data-value="8">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_11.png" alt="주문제작">
            <strong>주문제작</strong>
        </div>
        <div class="main-icon-item" data-value="9">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_14.png" alt="세무·법무·노무">
            <strong>세무·법무·노무</strong>
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


