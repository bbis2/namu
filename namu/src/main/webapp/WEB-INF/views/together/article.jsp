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
	padding-top: 20px;
}

.fleamarket-cover {
    background-color: #E3F1C5; /* 이부분이 초록상자*/
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
    } 
}
/* 여기까지 리스트 */

main {
    font-family: 'Metro Sans', sans-serif;
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

body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.header {
    background-color: #e3f1c5;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h1 {
    margin: 0;
    font-size: 1.5em;
}

.header-image img {
    width: 100px;
    height: auto;
}

.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    display: flex;
    justify-content: space-between;
}

.profile-container {
    width: 25%;
}

.profile-card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.search-container .form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
    margin-bottom: 10px;
}

.content-container {
    width: 70%;
}

.content-header {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.image-placeholder {
    width: 150px;
    height: 150px;
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-right: 20px;
}

.content-details h2 {
    margin: 0 0 10px 0;
    font-size: 1.5em;
}

.content-description {
    margin-bottom: 20px;
}

.content-description .form-control {
    width: 100%;
    height: 150px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

.actions {
    display: flex;
    justify-content: space-between;
}

.actions .btn {
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

.actions .btn:hover {
    background-color: #4c3b2b;
}

</style>
</head>
<body>
<div class="container">
	<section class="fleamarket-cover">
	      <h1 class="cover-title htext">믿을만한<br>나무 거래</h1>
	      <span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>	
	      <span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
	      <div class="cover-image">
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
            
              <div>
            <div class="content-header">
                <div class="image-placeholder"></div>
                <div class="content-details">
                    <h2>모임이름</h2>
                    <p>태그</p>
                    <p>모임장</p>
                    <p>멤버수</p>
                    <p>등록일</p>
                </div>
            </div>
            <div class="content-description">
                <textarea class="form-control" placeholder="모임소개" readonly></textarea>
            </div>
            
            <div class="actions">
                <button class="btn">참가신청</button>
                <button class="btn">리스트</button>
            </div>
        </div>
    </div>
    </main>

</body>
</html>