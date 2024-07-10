<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
    max-width: 800px;
}

.fleamarket-cover {
    background-color: #E3F1C5;
    padding: 50px;
    text-align: center;
    position: relative;
    margin-top: 60px;
}

.cover-title {
    font-size: 2em;
    font-weight: bold;
}

.cover-description {
    display: block;
    font-size: 1.2em;
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
            color: #000;
            border: none;
            border-radius: 0.5rem;
            padding: 10px 20px;
            font-weight: bold;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #c0b0e2;
            color: #000;
        }

.badge-light {
    color: #000;
    font-weight: bold;
}

.rating {
    color: gold;
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

.text-right {
    text-align: right;
    padding-bottom: 10px;
}

.btncolor{
background-color: #e6e1f0;
}
</style>

<div class="container">

<section class="fleamarket-cover">
      <h1 class="cover-title htext">믿을만한<br>나무 거래</h1>
      <span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>	
      <span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
      <div class="cover-image">
      </div>
  </section>
  
	 <div class="container my-5">
	  <div class="text-right">
                    <button class="btn btncolor mt-3">글 등록</button>
      </div>
        <div class="row mb-4">
            <div class="col-md-2">
             <div class="profile-card">
        <div class="profile-header">
            <img src="${pageContext.request.contextPath}/resources/images/bg.png" alt="프로필 이미지" class="profile-img">
        </div>
	        <div class="profile-body">
	            <h5>그림그려주는 사람</h5>
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
                    <div class="dropdown-menu" aria-labelledby="categoryDropdown">
                        <a class="dropdown-item" href="#">카테고리1</a>
                        <a class="dropdown-item" href="#">카테고리2</a>
                        <a class="dropdown-item" href="#">카테고리3</a>
                    </div>
                </div>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-center">
                            <img src="img1.png" alt="그림그려드려요!">
                            <div class="card-body">
                                <h5 class="card-title">그림그려드려요!</h5>
                                <p class="rating">★ 4.9 <span>(3122)</span></p>
                                <p>8,000원</p>
                                <p>그림그려주는 사람</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-center">
                            <img src="img2.png" alt="탁구알려드림">
                            <div class="card-body">
                                <h5 class="card-title">탁구알려드림</h5>
                                <p class="rating">★ 4.1 <span>(30)</span></p>
                                <p>18,000원</p>
                                <p>탁신</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-center">
                            <img src="img3.png" alt="전프로연습생 롤 강의">
                            <div class="card-body">
                                <h5 class="card-title">전프로연습생 롤 강의</h5>
                                <p class="rating">★ 4.8 <span>(330)</span></p>
                                <p>28,000원</p>
                                <p>페이커</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-center">
                            <img src="img4.png" alt="박지성의 축구교실">
                            <div class="card-body">
                                <h5 class="card-title">박지성의 축구교실</h5>
                                <p class="rating">★ 5.0 <span>(33)</span></p>
                                <p>28,000원</p>
                                <p>박지성</p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>