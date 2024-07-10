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
    background-color: #d4c5f9;
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
	padding-top: 30px;
	padding-left : 50px;
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
        height: 180px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
    }
   
    
}

.bg-light {
    background-color: #f8f8f8 !important;
}

.card-title {
    font-size: 1.25rem;
    font-weight: bold;
}

.card {
    margin-bottom: 1rem;
}

.card img {
    object-fit: cover;
}


.profile-header {
    background-color: #d4c5f9;
    height: 100px;
    position: relative;
}

.profile-body {
    background-color: #fff;
}

.nickname {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-left: 130px;
}

.profile-img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border: 2px solid #d4c5f9;
    position: absolute;
    top: 30px;
    left: 20px;
}

.portfolio{
 	display: flex;
    align-items: center;
    justify-content: space-between;
}

.profile-stats {
    margin-top: 20px;
    padding: 15px;
    border-radius: 0.25rem;
}

.card-subtitle {
    font-size: 1.25rem;
    font-weight: bold;
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

.mt-3 {
    margin-top: 1rem;
}

.mb-2 {
    margin-bottom: 0.5rem;
}

.mb-4 {
    margin-bottom: 1.5rem;
}

.text-center {
    text-align: center;
}

.time {
 font-weight: bold;
 font-size: 16px;
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
	<div class="body-container my-5" style="max-width: 800px;">
		<div class="row">
            <div class="col-12">
                <h2 class="p-3">내 재능마켓프로필</h2>
            </div>
            <div class="col-12">
                <div class="card mb-4">
                    <div class="profile-header">
                        <img src="${pageContext.request.contextPath}/resources/images/bg.png" class="rounded-circle profile-img" alt="프로필">
                    </div>
                    <div class="card-body profile-body">
                        <h5 class="card-title nickname">그림그려주는 사람 <button class="btn btn-secondary ml-3 correction">내 프로필 편집</button></h5>
                        
                        <p class="mt-5">
                            <span class="time"><i class="bi bi-clock"></i> 연락 가능 시간: 9:00-23:00</span><br><br>
                            <span class="time"><i class="bi bi-chat-left-dots"></i> 평균 응답 시간: 30분 이내</span>
                        </p>
                        <div class="profile-stats card text-center" style="background-color: #d4c5f9;">
                            <div class="row no-gutters">
                                <div class="col-4">
                                    <div class="card-body">
                                        <h6 class="card-subtitle mb-2">4,300건</h6>
                                        <p class="card-text">거래 수</p>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card-body">
                                        <h6 class="card-subtitle mb-2">99%</h6>
                                        <p class="card-text">만족도</p>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card-body">
                                        <h6 class="card-subtitle mb-2">일반회원</h6>
                                        <p class="card-text">회원 구분</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-outline-primary btn-block mt-3">1:1 채팅</button>
                        <p class="mt-3">소개<br>그림 짱짱그림</p>
                    </div>
                </div>
                <h5 class="portfolio">포트폴리오 <button class="btn btn-secondary">포트폴리오 등록</button></h5>
                <div class="row mb-4">
                    <div class="col-3">
                        <img src="${pageContext.request.contextPath}/resources/images/bg.png" class="img-fluid" alt="포트폴리오 1">
                    </div>
                    <div class="col-3">
                        <img src="${pageContext.request.contextPath}/resources/images/bg.png" class="img-fluid" alt="포트폴리오 2">
                    </div>
                    <div class="col-3">
                        <img src="${pageContext.request.contextPath}/resources/images/bg.png" class="img-fluid" alt="포트폴리오 3">
                    </div>
                    <div class="col-3">
                        <img src="${pageContext.request.contextPath}/resources/images/bg.png" class="img-fluid" alt="포트폴리오 4">
                    </div>
                </div>
                
            </div>
        </div>
	</div>
</div>
    <main class="container my-5" style="max-width: 800px;">
        
    </main>
    <footer class="bg-light text-center py-3">
        회사 주소, 이메일 등 푸터 정보
    </footer>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>