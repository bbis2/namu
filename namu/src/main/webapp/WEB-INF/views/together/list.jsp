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
.body-container {
	max-width: 800px;
}

.fleamarket-cover {
    background-color: #E3F1C5;
}

h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
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
    }   
}

main {
    font-family: 'Metro Sans', sans-serif;
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

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
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
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 20px;
    cursor: pointer;
}

.filter-container .search-button:hover {
    background-color: #4c3b2b;
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
			<h2>전체모임</h2>
		</div>
        <div class="row">
        
            <div class="col-md-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">정유진</h5>
                           <p>puedo_j</p>
            			   <p>서울특별시 마포구</p>
          				   <p>쪽지 | 스크랩 | 알림</p>
                    </div>
                </div>
                <div class="mb-4">
                    <input type="text" class="form-control mb-2" placeholder="나무일상">
                    <select class="form-control">
                        <option>나무모임</option>
                    </select>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">BEST TOP 10</h5>
                        <!-- 목록 추가 -->
                    </div>
                </div>
            </div>
            
              <div class="col-md-9">
                <div class="filter-container">
                    <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                    <button class="search-button">검색</button>
                </div>
                <div class="categories">
                    <span>동네친구</span>
                    <span>문화/예술</span>
                </div>
                <div class="filter-container">
                    <button class="search-button">모임등록</button>
                </div>
                <div class="grid-container">
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                    <div class="grid-item"></div>
                </div>
            </div>
        </div>
    </main>

</body>
</html>