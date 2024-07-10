<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body {
    font-family: 'Metro Sans', sans-serif;
}

.navbar {
    background-color: #f8f8f8;
    padding: 1rem;
}

.navbar-brand img {
    margin-right: 10px;
}

.bg-light {
    background-color: #f8f8f8 !important;
}

.header-title {
    font-size: 1.5rem;
    font-weight: bold;
}

.card-title {
    font-size: 1.25rem;
    font-weight: bold;
}

.table th, .table td {
    text-align: center;
    vertical-align: middle;
}

footer {
    background-color: #f8f8f8;
    padding: 1rem;
    text-align: center;
    font-size: 0.875rem;
    color: #666;
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

    <main class="container my-5">
        <div class="row">
            <div class="col-md-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">정유진</h5>
                        <p class="card-text">puedo_j<br>서울특별시 마포구</p>
                    </div>
                </div>
                <div class="mb-4">
                    <input type="text" class="form-control mb-2" placeholder="Title">
                    <select class="form-control">
                        <option>Title</option>
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
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">전체게시글</h5>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>게시글번호</th>
                                    <th>태그</th>
                                    <th>제목</th>
                                    <th>닉네임</th>
                                    <th>등록일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>#여행</td>
                                    <td>제주도 맛집 추천해주세요~</td>
                                    <td>짱짱짱</td>
                                    <td>2024-07-06</td>
                                    <td>100</td>
                                </tr>
                                <!-- 더 많은 행 추가 가능 -->
                            </tbody>
                        </table>
                        <button class="btn btn-primary">글올리기</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="bg-light text-center py-3">
        회사 주소, 이메일 등 푸터 정보
    </footer>

</body>
</html>