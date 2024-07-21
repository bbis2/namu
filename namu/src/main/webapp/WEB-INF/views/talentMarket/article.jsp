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
.seller{
	font-weight: bold;
}
.rating{
	margin-bottom: 10px;
}
.details{
	margin-bottom: 10px;
}
.product-image img {
      max-width: 100%;
      height: 600px;
      object-fit: contain;
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
  .custom-button-container {
    text-align: center;
    margin-top: 20px;
}
  .custom-button {
      background-color: #8e44ad;
      color: white;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
      font-size: 16px;
  }
  .modifydelete-button{
  	display: flex;
    justify-content: flex-end;
    margin-top: 20px;
  }
  .product-details {
      border: 1px solid #ddd;
      padding: 20px;
      border-radius: 10px;
  }
  
    .sub-images-container {
      display: flex;
      justify-content: center;
      gap: 10px;
  }
  .sub-images-container img {
      width: 70px;
      height: 70px;
      
  }
  @media (max-width: 768px) {
      .sub-images-container img {
          width: 50px;
  }
        
        
        
       
    </style>
     <script>
        function changeCarouselImage(index) {
            var carousel = document.getElementById('carouselExample');
            var carouselItems = carousel.getElementsByClassName('carousel-item');
            for (var i = 0; i < carouselItems.length; i++) {
                if (i === index) {
                    carouselItems[i].classList.add('active');
                } else {
                    carouselItems[i].classList.remove('active');
                }
            }
        }
        
        function validateAndSubmit() {
            var optionSelect1 = document.getElementsByName("option1")[0];
            var optionSelect2 = document.getElementsByName("option2")[0];
            var optionCount = ${dto.optionCount};
            
            if (optionCount > 0 && (optionSelect1.value === "" || optionSelect1.value === "선택")) {
                alert("첫번째 옵션을 선택하세요.");
                return false;
            }
            if (optionCount > 1 && (optionSelect2.value === "" || optionSelect2.value === "선택")) {
                alert("두번째 옵션을 선택하세요.");
                return false;
            }
            
            var tboardNum = ${dto.tboardNum};
            var url = "${pageContext.request.contextPath}/talent/buy?tboardNum=" + tboardNum;
            
            if (optionCount > 0) {
                url += "&option1=" + encodeURIComponent(optionSelect1.value);
            }
            if (optionCount > 1) {
                url += "&option2=" + encodeURIComponent(optionSelect2.value);
            }
            
            window.location.href = url;
        }
    </script>
</head>
<body>
    <div class="container my-4">
        <div class="header text-center py-3">
            <h1>&nbsp;</h1>
        </div>
        <div class="main-content row">
            <div class="col-md-8">
                <div class="row">
                    <div class="md-6">
                   			<div id="carouselExample" class="carousel slide">
						        <div class="carousel-inner">
						            <c:forEach var="vo" items="${listFile}" varStatus="status">
						                <div class="carousel-item ${status.index == 0 ? 'active' : ''} product-image">
						                    <c:choose>
						                        <c:when test="${vo.fileName != null && !vo.fileName.isEmpty()}">
						                            <img src="${pageContext.request.contextPath}/uploads/photo/${vo.fileName}" class="card-img-top mb-3 main-image" alt="메인 이미지">
						                        </c:when>
						                        <c:otherwise>
						                            <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="card-img-top mb-3 main-image">
						                        </c:otherwise>
						                    </c:choose>
						                </div>
						            </c:forEach>
						        </div>
						        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
						            <i class="bi bi-caret-left-fill" style="color: #8e44ad; font-size: 30px"></i>
						            <span class="visually-hidden">Previous</span>
						        </button>
						        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
						            <i class="bi bi-caret-right-fill" style="color: #8e44ad; font-size: 30px"></i>
						            <span class="visually-hidden">Next</span>
						        </button>
						    </div>
                      
                    </div>
                  
                </div>
                  <div class="row my-4">
				        <c:choose>
				            <c:when test="${dto.fileName != null && !dto.fileName.isEmpty()}">
				                <div class="sub-images-container">
				                    <c:forEach var="vo" items="${listFile}" varStatus="status">
				                        <img src="${pageContext.request.contextPath}/uploads/photo/${vo.fileName}" class="img-thumbnail" onclick="changeCarouselImage(${status.index})">
				                    </c:forEach>
				                </div>
				            </c:when>
				            <c:otherwise>
				                <div class="sub-images-container">
				                    <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="img-thumbnail">
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
                   ${dto.content}
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
	                            <h2>${dto.subject}</h2>
	                            
	                            <div class="rating">
	                                <span>★ 4.9</span> (3122)
	                            </div>
	                            <div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.town}</div>
	                            <div class="seller"><i class="bi bi-person-circle"></i>${dto.nickName}</div>
	                            <div class="price">8,000원</div>
	                            <form name="option" method="get" action="${pageContext.request.contextPath}/talent/buy">
	                            <div class="details">
	                                		<c:if test="${dto.optionCount > 0}">
												<div class="mt-2">
												<h4>${listOption[0].optionName}</h4>
													<select class="form-select requiredOption" data-optionNum="${listOption[0].optionNum}" name="option1">
														<option>선택</option>
														<c:forEach var="vo" items="${listOptionDetail}">
															<c:if test="${dto.optionCount == 1}">
																<option value="${vo.optionValue}">${vo.optionValue}</option>
															</c:if>
															<c:if test="${dto.optionCount != 1}">
																<option value="${vo.optionValue}">${vo.optionValue}</option>
															</c:if>
														</c:forEach>
													</select>
												</div>
											</c:if>
											<c:if test="${dto.optionCount > 1}">
												<div class="mt-2 border-bottom pb-2">
												<h4>${listOption[1].optionName}</h4>
													<select class="form-select requiredOption2" data-optionNum2="${listOption[1].optionNum}" name="option2">
													<option>선택</option>
														<c:forEach var="vo2" items="${listOptionDetail2}">
															<c:if test="${dto.optionCount == 2}">
																<option value="${vo2.optionValue}" >${vo2.optionValue}</option>
															</c:if>
														</c:forEach>
													</select>
												</div>
											</c:if>
	                            </div>
	                            <input type="hidden" value="${dto.tboardNum}">
	                             <div class="custom-button-container">
		                            <button type="button" class="btn custom-button" onclick="validateAndSubmit();">구매하기</button>
		                        </div>
	                            </form>
	                        </div>
	                        <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
	                        	<div class="modifydelete-button">
	                        	<c:if test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn custom-button" onclick="location.href='${pageContext.request.contextPath}/talent/update?tboardNum=${dto.tboardNum}&page=${page}';">수정</button><p>&nbsp;</p>
								</c:if>
								<button type="button" class="btn custom-button" onclick="deleteBoard();">삭제</button></div>
							</c:if>
							
						
                <div class="profile text-center mt-4">
                    <span class="profile-subtitle">일반회원</span>
                    <img src="profile_image.png" alt="프로필 이미지">
                    <div class="profile-title">${dto.nickName}</div>
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
    <c:if test="${sessionScope.member.membership>50 || dto.userId == sessionScope.member.userId}">
	<script type="text/javascript">
	function deleteBoard() {
		if(confirm("게시글을 삭제하시겠습니까 ? ")) {
			let url = "${pageContext.request.contextPath}/talent/delete";
			let query = "num=${dto.tboardNum}&${query}";
			location.href = url + "?" + query;
		}
	}
	</script>
	</c:if>
   
    <script>
        $(document).ready(function() {
            $('.tabs button').click(function() {
                var target = $(this).attr('id').replace('-btn', '-content');
                $('.tab-content').removeClass('active');
                $('#' + target).addClass('active');
                $('.tabs button').removeClass('active');
                $(this).addClass('active');

            });
            
            $('.thumbnail').click(function() {
                var index = $(this).index();
                $('#productCarousel').carousel(index);
                $('.thumbnail').removeClass('active');
                $(this).addClass('active');
            });

            $('#productCarousel').on('slide.bs.carousel', function (e) {
                var index = $(e.relatedTarget).index();
                $('.thumbnail').removeClass('active');
                $('.thumbnail').eq(index).addClass('active');
            });
        });
        
        function submitContents(elClickedObj) {
       	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
       	 try {
       		if(! check()) {
       			return;
       		}
       		
       		elClickedObj.submit();
       		
       	} catch(e) {
       		  console.error(e);
       	}
       	}
    </script>
</body>
</body>
</html>