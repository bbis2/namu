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
      .product-image img {
            width: 100%;
            height: auto;
        }
        .rating {
            color: #f4c150;
        }
        .price {
            font-size: 24px;
            color: #e74c3c;
            margin: 10px 0;
        }
        .buy-button {
            background-color: #8e44ad;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .profile {
            background-color: #f0e5ff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
        }
        .profile-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .profile-subtitle {
            background-color: #c8b5f1;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
            color: white;
            display: inline-block;
            margin-bottom: 10px;
        }
        .profile img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .profile-details p {
            margin: 5px 0;
        }
        .profile-stat {
            display: flex;
            justify-content: space-between;
            background-color: #e6d5ff;
            padding: 10px;
            border-radius: 10px;
            margin-top: 10px;
        }
        .profile-stat div {
            text-align: center;
        }
        .tabs {
            display: flex;
            justify-content: space-around;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            margin-top: 20px;
        }
        .tabs button {
            flex: 1;
            background-color: #f8f8f8;
            border: none;
            padding: 10px 0;
            cursor: pointer;
            font-size: 16px;
        }
        .tabs button.active {
            background-color: white;
            border-top: 2px solid #8e44ad;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: none;
        }
        .tabs button:not(.active) {
            border-bottom: 1px solid #ddd;
        }
        .tab-content {
            display: none;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-top: none;
        }
        .tab-content.active {
            display: block;
        }
        .section-divider {
            border-top: 1px solid #ddd;
            margin: 40px 0;
        }
        .custom-button {
            background-color: #8e44ad;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .product-details {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
        }
        
         .sub-images-container {
            display: flex;
            gap: 10px;
        }
        .sub-images-container img {
            width: 180px;
            height: 140px; 
        }
        @media (max-width: 768px) {
            .sub-images-container img {
                width: 50px;
        }
    </style>
</head>
<body>
    <div class="container my-4">
        <div class="header text-center py-3">
            <h1>재능마켓</h1>
        </div>
        <div class="main-content row">
            <div class="col-md-8">
                <div class="row">
                    <div class="md-6">
                    <div id="carouselExample" class="carousel slide">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							     <c:choose>
				                		<c:when test="${dto.thumbnail !=null && dto.thumbnail.isEmpty()}">
						                    <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" class="card-img-top mb-3 main-image" alt="메인 이미지">
						                    	</c:when>
						                    	 <c:otherwise>
						                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px"  src="${pageContext.request.contextPath}/resources/images/noimage.png">
						                        </c:otherwise>
				                    </c:choose>
							    </div>
							    <div class="carousel-item">
							      <img src="..." class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img src="..." class="d-block w-100" alt="...">
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
                        <div class="product-image mb-3">
                           <c:choose>
                		<c:when test="${dto.thumbnail !=null && dto.thumbnail.isEmpty()}">
		                    <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" class="card-img-top mb-3 main-image" alt="메인 이미지">
		                    	</c:when>
		                    	 <c:otherwise>
		                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px"  src="${pageContext.request.contextPath}/resources/images/noimage.png">
		                        </c:otherwise>
                    </c:choose>
                        </div>
                    </div>
                  
                </div>
                <div class="row my-4">
                	<c:choose>
                	<c:when test="${dto.fileName != null && dto.fileName.isEmpty()}">
	                	<c:forEach var="vo" items="${listFile}">
	                    <div class="sub-images-container">
	                        <img src="${pageContext.request.contextPath}/uploads/photo/${vo.listFile}" class="img-fluid">
	                   </div>
	                    </c:forEach>
                    </c:when>
                      <c:otherwise>
                      	<div class="sub-images-container">
                            <img src="${pageContext.request.contextPath}/resources/images/noimage.png">
                        </div>
                        </c:otherwise>
                    </c:choose>
                    
                </div>
                <div class="tabs">
                    <button id="detail-btn" class="active">상세 설명</button>
                    <button id="review-btn">리뷰 <span class="badge bg-secondary">3170</span></button>
                    <button id="inquiry-btn">상품 문의</button>
                    <button id="exchange-btn">교환/환불</button>
                </div>
                <div id="detail-content" class="tab-content active">
                    <!-- 상세 설명 콘텐츠 -->
                </div>
                <div id="review-content" class="tab-content">
                    <!-- 리뷰 콘텐츠 -->
                </div>
                <div id="inquiry-content" class="tab-content">
                    <!-- 상품 문의 콘텐츠 -->
                </div>
                <div id="exchange-content" class="tab-content">
                    <!-- 교환/환불 콘텐츠 -->
                </div>
            </div>
            <div class="col-md-4">
	            <div class="product-details">
	                            <h2>그림 그려드려요!</h2>
	                            <div class="rating">
	                                <span>★ 4.9</span> (3122)
	                            </div>
	                            <div class="price">8,000원</div>
	                            <div class="seller">그림그려주는 사람</div>
	                            <div class="details">
	                                <p>소요시간: 6H</p>
	                                <p>그림 그려드려요! 이쁘게 잘 그려드립니다!</p>
	                                <p>상세설명 참조</p>
	                            </div>
	                            <button class="btn custom-button">구매하기</button>
	                        </div>
                <div class="profile text-center mt-4">
                    <span class="profile-subtitle">일반회원</span>
                    <img src="profile_image.png" alt="프로필 이미지">
                    <div class="profile-title">그림그려주는 사람</div>
                    <div class="profile-details">
                        <p><i class="bi bi-clock"></i> 연락가능시간: 9:00-23:00</p>
                        <p><i class="bi bi-chat-dots"></i> 평균 응답시간: 30분 이내</p>
                    </div>
                    <div class="profile-stat">
                        <div>
                            <p>4,300건</p>
                            <p>거래 수</p>
                        </div>
                        <div>
                            <p>99%</p>
                            <p>만족도</p>
                        </div>
                        <div>
                            <p>일반회원</p>
                            <p>회원 구분</p>
                        </div>
                    </div>
                    <button class="btn custom-button mt-3">1:1 채팅</button>
                </div>
            </div>
        </div>
    </div>
   
    <script>
        $(document).ready(function() {
            $('.tabs button').click(function() {
                var target = $(this).attr('id').replace('-btn', '-content');
                $('.tab-content').removeClass('active');
                $('#' + target).addClass('active');
                $('.tabs button').removeClass('active');
                $(this).addClass('active');

                $.ajax({
                    url: target + '.html',
                    method: 'GET',
                    success: function(response) {
                        $('#' + target).html(response);
                    }
                });
            });
        });
    </script>
</body>
</body>
</html>