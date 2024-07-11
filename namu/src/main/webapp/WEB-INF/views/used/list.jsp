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
<div style="margin-top: 10px; margin-bottom: 10px">총 0 개
<div class="search-container">
            <input type="text" class="search-input" placeholder="검색어 입력">
            <button class="search-btn">검색</button>
        <button class="submit-button">
            <span>+</span>
            글쓰기
        </button>
        </div>
    </div>
		<div class="flex-row" style="justify-content: space-between; align-items: center">
		</div>

		<div class="main-best-board-container">
			<div class="flex-col banner-card-container">
				<div class="home-img-container">
					<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
				</div>

				<div style="color: navy; margin-top: 10px">제목</div>
				<div>현재 입찰가 : 원</div>
			</div>

			<div class="flex-col banner-card-container">
				<div class="home-img-container">
					<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
				</div>

				<div style="color: navy; margin-top: 10px">제목</div>
				<div>현재 입찰가 : 원</div>
			</div>

			<div class="flex-col banner-card-container">
				<div class="home-img-container">
					<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
				</div>

				<div style="color: navy; margin-top: 10px">제목</div>
				<div>현재 입찰가 : 원</div>
			</div>
			
			<div class="flex-col banner-card-container">
				<div class="home-img-container">
					<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
				</div>

				<div style="color: navy; margin-top: 10px">제목</div>
				<div>현재 입찰가 : 원</div>
			</div>

			<div class="flex-col banner-card-container">
				<div class="home-img-container">
					<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
				</div>

				<div style="color: navy; margin-top: 10px">제목</div>
				<div>현재 입찰가 : 원</div>
			</div>
		</div>
	</div>


<style>
.main1 {
    background: #C3FF9A;
    height: 300px;
    width: 100%;
    margin-top: 80px;
    border-radius: 5px;
}

.main-best-board-container {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 15px;
	height: 237px;
}

.main-best-board-container div {
    overflow: hidden;
    position: relative;
}

 .main-best-board-container img {
    transition: 0.2s;
}

.search-container {
    display: flex;
    align-items: center;
    justify-content: flex-end; /* 오른쪽 정렬 */
}

.search-input-container {
    text-align: center;
    align-content: center;
}

.search-input {
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

.search-input::placeholder {
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
</style>