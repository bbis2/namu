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
body {
    font-family: 'Metro Sans', sans-serif;
}

.navbar {
    background-color: #f8f8f8;
    padding: 1rem;
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

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #495057;
    background-color: #fff;
    border-color: #dee2e6 #dee2e6 #fff;
}

.nav-tabs .nav-link {
    border: 1px solid #dee2e6;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
}

.img-fluid {
    max-width: 100%;
    height: auto;
}

.tab-content {
    padding-top: 10px;
}

.main-image-card {
    display: flex;
    align-items: center;
    justify-content: center;
}

</style>
</head>
<body>
       <main class="container my-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="card mb-4">
                	<c:choose>
                		<c:when test="${dto.thumbnail !=null && dto.thumbnail.isEmpty()}">
                    <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" class="card-img-top mb-3 main-image" alt="메인 이미지">
                    	</c:when>
                    	 <c:otherwise>
                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px"  src="${pageContext.request.contextPath}/resources/images/noimage.png">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="row mb-4">
                <div class="additional-images">
                <c:choose>
                	<c:when test="${dto.fileName != null && dto.fileName.isEmpty()}">
	                	<c:forEach var="vo" items="${listFile}">
	                    
	                        <img src="${pageContext.request.contextPath}/uploads/photo/${vo.listFile}" class="img-fluid">
	                   
	                    </c:forEach>
                    </c:when>
                      <c:otherwise>
                      		
                            <img src="${pageContext.request.contextPath}/resources/images/noimage.png">
                        </c:otherwise>
                    </c:choose>
                  </div>
                </div>
                <div class="card mb-4">
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">상세 설명</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">리뷰</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="inquiry-tab" data-toggle="tab" href="#inquiry" role="tab" aria-controls="inquiry" aria-selected="false">상품 문의</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="exchange-tab" data-toggle="tab" href="#exchange" role="tab" aria-controls="exchange" aria-selected="false">교환/환불</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                <p>상품 소개 내용</p>
                            </div>
                            <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                <p>리뷰 내용</p>
                            </div>
                            <div class="tab-pane fade" id="inquiry" role="tabpanel" aria-labelledby="inquiry-tab">
                                <p>상품 문의 내용</p>
                            </div>
                            <div class="tab-pane fade" id="exchange" role="tabpanel" aria-labelledby="exchange-tab">
                                <p>교환/환불 내용</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card mb-4 main-image-card">
                    <div class="card-body text-center">
                        <h5 class="card-title">그림그려드려요!</h5>
                        <p> 조회수 : ${dto.hitCount} </p>
                        <span class="badge badge-warning">★ 4.9 (3122)</span><br>
                        <p>8,000원<br>
                        그림그려주는 사람<br>
                        소요시간: 6H<br>
                        그림 그려드려요! 예쁘게 잘 그려드립니당<br>
                        상세설명 참조</p>
                        <button class="btn btn-primary btn-block">구매하기</button>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">그림그려주는 사람</h5>
                        <img src="profile.png" class="rounded-circle mb-2" alt="프로필" width="50">
                        <p class="card-text">연락 가능한 시간: 9:00-23:00</p>
                        <p class="card-text">평균 응답 시간: 30분 이내</p>
                        <button class="btn btn-outline-primary btn-block">1:1 채팅</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
        $(document).ready(function() {
            function adjustHeight() {
                var mainImageHeight = $('.main-image').height();
                $('.main-image-card').height(mainImageHeight);
            }
            adjustHeight();
            $(window).resize(function() {
                adjustHeight();
            });
        });
    </script>
</body>
</html>