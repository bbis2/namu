<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

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

.fleamarket-cover {
    background-color: #e3f1c5;
    padding: 20px;
    text-align: center;
}

.fleamarket-cover .cover-title {
    font-size: 2em;
    font-weight: bold;
    margin: 0;
}

 .profile-card {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            max-width: 300px;
            margin-bottom: 20px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .profile-header {
            background-color: #d4c5f9;
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
            position: relative;
            height: 50px;
        }
        .profile-img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            object-fit: cover;
            border: 2px solid #d4c5f9;
            position: absolute;
            top: 10px; /* 이미지가 경계에 걸치도록 설정 */
            left: 50px; /* 왼쪽 정렬 */
        }
        .profile-body {
            margin-top: 30px;
            text-align: left;
            padding: 20px;
        }
        .profile-body h5 {
            margin-top: 10px;
            font-weight: bold;
            text-align: left;
        }
        .profile-body p {
            margin: 5px 0;
        }
        .profile-info {
            margin-left: 100px; /* 텍스트를 이미지 옆으로 배치 */
        }
        .btn-custom {
            background-color: #d4c5f9;
            color: #fff;
            border: none;
            border-radius: 0.5rem;
            padding: 10px 20px;
            font-weight: bold;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #c0b0e2;
            color: #fff;
        }

.row {
    display: flex;
    flex-wrap: wrap;
}

.col-md-3 {
    flex: 0 0 20%;
    max-width: 20%;
}

.col-md-9 {
    flex: 0 0 80%;
    max-width: 80%;
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

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
    margin-bottom: 10px;
}

.categories {
    display: flex;
    justify-content: space-around;
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 4px;
    margin-bottom: 20px;
}

.categories span {
    font-weight: bold;
}

.filter-container {
    text-align: right;
    margin-bottom: 20px;
}

.search{
	text-align: left;
}

.filter-container select {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

.filter-container .search-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 20px;
    background-color: #f2f2f2;
    margin-right: 10px;
}

.filter-container .search-button {
    background-color: #d4c5f9;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 20px;
    cursor: pointer;
}

.filter-container .search-button:hover {
    background-color: #d4c5f9;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 20px;
}

.grid-item {
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    border-radius: 4px;
    height: 150px;
}

.bg-light {
    background-color: #f8f8f8 !important;
}

.text-center {
    text-align: center;
}

.py-3 {
    padding-top: 1rem;
    padding-bottom: 1rem;
}

.btn-secondary {
    background-color: #e6e1f0;
    border: none;
    color: #333;
}

.btn-secondary {
    background-color: #e6e1f0;
    border: none;
    color: #333;
}

.btn-outline-primary {
    border-color: #d4c5f9;
    color: #d4c5f9;
}

.btn-outline-primary:hover {
    background-color: #d4c5f9;
    color: #fff;
}

.btn-block {
    display: block;
    width: 100%;
}

.dropdown-width{
	width: 100%
}

  .filter-container-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

</style>
</head>
<body>
<div class="container">
	<section class="fleamarket-cover">
	    <div class="cover-content">
	      <h1 class="cover-title">믿을만한<br>나무 거래</h1>
	      <span class="cover-description">나: 나누고 싶은 마음을 담아<br>무: 무한한 가능성을 거래합니다.</span>
	      <div class="cover-image">
	      </div>
	    </div>
   </section>
   
</div>
    <main class="container">
    	<div class="body-title">
			<h2>재능 마켓</h2>
		</div>
        <div class="row">
        
            <div class="col-md-2">
             <div class="profile-card">
        <div class="profile-header">
            <img src="${pageContext.request.contextPath}/resources/images/bg.png" alt="프로필 이미지" class="profile-img">
        </div>
	        <div class="profile-body">
	            <h5>${sessionScope.member.nickName}</h5>
	            <p>회원 등급 : 일반</p>
	            <p>평균 평점 : <strong>4.9</strong></p>
	            <p>평균 만족도 : <strong>95%</strong></p>
	            <button class="btn btn-custom mt-3">내 정보 보기</button>
	        </div>
    	</div>
                <button class="btn btn-secondary btn-block mb-2">전체보기</button>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="categoryDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        카테고리
                    </button>
                    <div class="dropdown-menu dropdown-width" aria-labelledby="categoryDropdown">
                   		<c:forEach var="vo" items="${listCategory}">
                        <a class="dropdown-item" href="#" >${vo.categoryName}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            
              <div class="col-10">
              	<div class="filter-container-group">
                <div class="filter-container search">
                    <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                    <button class="search-button">검색</button>
                </div>
                <div class="filter-container">
                    <button class="search-button" onclick="location.href='${pageContext.request.contextPath}/talent/write';">글 등록</button>
                </div>
                </div>
               <div class="grid-container ">
				    <c:forEach var="dto" items="${list}" varStatus="status">
				        <div class="grid-item" onclick="location.href='${articleUrl}&num=${dto.tboardNum}';">
				            <div class="card" style="background-color: #fff">
				                <img src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" class="card-img-top img-fluid" style="height: 200px;">
				                <div class="card-body mb-10" style="height: 130px;">
				                    <h5 class="card-title">${dto.subject}</h5>
				                    <p>${dto.price}</p>
				                    <p>${dto.nickName}</p>
				                </div>
				            </div>
				        </div>
				    </c:forEach>
				</div>
            </div>
            <div class="page-navigation mt-5">
					${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
				</div>
        </div>
    </main>

</body>
</html>