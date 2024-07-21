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
  
.profile-card {
	margin-top : 30px;
    border: 1px solid #ddd;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 600px;
    background-color: white;
}

.profile-card-header {
    background-color: #d7bce8;
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;
}

.profile-card-header .left-section {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.profile-card-header .profile-subtitle {
    background-color: white;
    color: #d7bce8;
    padding: 5px 10px;
    border-radius: 5px;
    margin-bottom: 10px;
    display: inline-block;
}

.profile-card-header h2 {
    color: black;
    margin: 0;
    display: flex;
    align-items: center;
    height: 100%;
}

.profile-card-header img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border: 2px solid white;
    background-color: white;
    position: absolute;
    right: 20px;
    bottom: -50px;
}

.profile-card-header .profile-subtitle {
    background-color: #8e44ad; 
    padding: 10px;
    border-radius: 5px;
    font-weight: bold;
    color: white; 
    display: inline-flex; 
    align-items: center; 
    justify-content: center; 
    height: 30px; 
}

.profile-card-body {
    padding: 20px;
    padding-top: 50px;
}

.profile-card-body p {
    margin: 10px 0;
    font-size: 14px;
}

.profile-card-body .profile-stat {
    display: flex;
    justify-content: space-around;
    background-color: #f0e5ff;
    padding: 10px;
    border-radius: 10px;
}

.profile-card-body .profile-stat div {
    text-align: center;
    font-weight: bold;
}

.custom-button-container {
    margin-top: 20px;
}

.profile-card-footer {
    padding: 20px;
    border-top: 1px solid #ddd;
}

.profile-card-footer {
    padding: 20px;
    border-top: 1px solid #ddd;
}



.custom-button {
    background-color: #8e44ad;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    border-radius: 5px;
}

.custom-button2 {
    background-color: #8e44ad;
    color: white;
    border: 2px solid #8e44ad; 
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
    margin: 10px 5px; 
}

.custom-button-container {
    margin-top: 20px;
}

.profile-card-footer {
    padding: 20px;
    border-top: 1px solid #ddd;
}

.custom-button-container {
    margin-top: 20px;
}

.profile-card-footer {
    padding: 20px;
    border-top: 1px solid #ddd;
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
  
  .badge-custom {
    background-color: #9147C5; 
    color: white; 
    padding: 5px 10px; 
    border-radius: 5px; 
    font-size: 14px; 
    font-weight: bold; 
}
  @media (max-width: 768px) {
      .sub-images-container img {
          width: 50px;
      }
  }

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #f54a4c; }
.review-rate .p-1 {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.review-rate .graph {
    flex: 1;
    display: flex;
}

.review-rate .graph-title {
    flex: 0 0 30px;
}

.review-rate .graph-rate {
    flex: 0 0 50px;
    text-align: left;
}

.review-rate .one-space {
    flex: 1;
    background: #eee;
    margin: 0 1px;
    height: 10px;
    border-radius: 5px;
}

.review-rate .one-space.on {
    background: #f54a4c;
}

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }

.qna-form textarea { width: 100%; height: 75px; resize: none; }
.qna-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.qna-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 2px solid #e3c9ff;
	cursor: pointer;
}

.deleteQuestion, .notifyQuestion { cursor: pointer; padding-left: 5px; }
.deleteQuestion:hover, .notifyQuestion:hover { font-weight: 500; color: #2478FF; }

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
                    <button id="review-btn">리뷰 <span class="badge badge-custom">${dto.reviewCount}</span></button>
                    <button id="inquiry-btn">상품 문의</button>
                    <button id="exchange-btn">교환/환불</button>
                </div>
                <div id="detail-content" class="tab-content active">
                   ${dto.content}
                </div>
                <div id="review-content" class="tab-content">
                    <div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">상품 리뷰</p> 
					</div>

					<div class="row border-bottom">
						<div class="col p-3 text-center">
							<div class="fs-6 fw-semibold">상품만족도</div>
							<div class="score-star review-score-star">
								<c:forEach var="n" begin="1" end="5">
									<c:set var="score" value="${dto.score + ((dto.score%1>=0.5) ? (1-dto.score%1)%1 : -(dto.score%1))}"/>
									<span class="item fs-2 ${dto.score>=n?'on':''}"><i class="bi bi-star-fill"></i></span>
								</c:forEach>
							</div>
							
							<div class="fs-2">
								<label class="review-score">${dto.score}</label> 
							</div>
						</div>
						
						<div class="col p-3 text-center">
							<div class="fs-6 fw-semibold">리뷰수</div>
							<div class="fs-2"><i class="bi bi-chat-right-text"></i></div>
							<div class="fs-2 review-reviewCount">${dto.reviewCount}</div>
						</div> 
						
						<div class="col p-3 text-center review-rate">
						    <div class="fs-6 fw-semibold">평점비율</div>
						    <div class="p-1 score-5">
						        <span class="graph-title">5점</span>
						        <span class="graph">
						            <c:forEach var="n" begin="1" end="10">
						                <label class="one-space"></label>
						            </c:forEach>
						        </span>
						        <span class="graph-rate">0%</span>
						    </div>
						    <div class="p-1 score-4">
						        <span class="graph-title">4점</span>
						        <span class="graph">
						            <c:forEach var="n" begin="1" end="10">
						                <label class="one-space"></label>
						            </c:forEach>
						        </span>
						        <span class="graph-rate">0%</span>
						    </div>
						    <div class="p-1 score-3">
						        <span class="graph-title">3점</span>
						        <span class="graph">
						            <c:forEach var="n" begin="1" end="10">
						                <label class="one-space"></label>
						            </c:forEach>
						        </span>
						        <span class="graph-rate">0%</span>
						    </div>
						    <div class="p-1 score-2">
						        <span class="graph-title">2점</span>
						        <span class="graph">
						            <c:forEach var="n" begin="1" end="10">
						                <label class="one-space"></label>
						            </c:forEach>
						        </span>
						        <span class="graph-rate">0%</span>
						    </div>
						    <div class="p-1 score-1">
						        <span class="graph-title">1점</span>
						        <span class="graph">
						            <c:forEach var="n" begin="1" end="10">
						                <label class="one-space"></label>
						            </c:forEach>
						        </span>
						        <span class="graph-rate">0%</span>
						    </div>
						</div>
					</div>

					<div class="row mt-3 reviewSort-area">
						<div class="col">&nbsp;</div>
						<div class="col-auto text-end">
							<select class="form-select reviewSortNo">
								<option value="0"> 출력 순서 </option>
								<option value="1"> 최신 글 </option>
								<option value="2"> 평점 높은순 </option>
								<option value="3"> 평점 낮은순 </option>
							</select>
						</div>
					</div>
					
					<div class="mt-2 list-review"></div>
                </div>
                <div id="inquiry-content" class="tab-content">
              
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="questionDialogModalLabel">상품 문의 하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="qna-form p-2">
					<form name="questionForm">
						<div class="row">
							<div class="col">
								<span class="fw-bold">문의사항 쓰기</span><span> - 상품 및 상품 구매 과정과 관련없는 글은 삭제 될 수 있습니다.</span>
							</div>
							<div class="col-3 text-end">
								<input type="checkbox" name="secret" id="secret1" class="form-check-input" 
									value="1">
								<label class="form-check-label" for="secret1">비공개</label>
							</div>
						</div>
						<div class="p-1">
							<input type="hidden" name="productNum" value="${dto.tboardNum}">
							<textarea name="question" id="question" class="form-control"></textarea>
						</div>
						<div class="p-1">
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</div>
							<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
						</div>							
					</form>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn custom-button2 btnQuestionSendOk">문의등록 <i class="bi bi-check2"></i> </button>
				<button type="button" class="btn custom-button2 btnQuestionSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
                </div>
                <div id="exchange-content" class="tab-content">
                   <div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">교환 및 환불정책</p> 
					</div>
					<div class="mt-3">
						<p> ${dto.guidelines} </p>
					</div>	
                </div>
            </div>
            <div class="col-md-4">
	            <div class="product-details">
	                            <h2>${dto.subject}</h2>
	                            
	                            <div class="rating">
	                                <span>★ ${dto.score}</span> (${dto.reviewCount})
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
							
						
                      <div class="profile-card">
						        <div class="profile-card-header">
						            <div class="left-section">
						                <div class="profile-subtitle">일반회원</div>
						                <h2>${dto.nickName}</h2>
						            </div>
						            <img src="${pageContext.request.contextPath}/resources/images/noimage.png" alt="Profile Image">
						        </div>
						        <div class="profile-card-body">
						            <p><i class="bi bi-clock"></i> 연락가능시간: 9:00-23:00</p>
						            <p><i class="bi bi-chat-dots"></i> 평균 응답시간: 30분 이내</p>
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
						            <div class="custom-button-container">
						                <button class="custom-button">1:1 채팅</button>
						            </div>
						        </div>
						        <div class="profile-card-footer">
						            <h3>소개</h3>
						            <p>그림 짱잘그림</p>
						        </div>
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
   
    <script type="text/javascript">
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
        
        $(function(){
        	$('.reviewSortNo').change(function(){
        		listReview(1);
        	});
        });

        function listReview(page) {
        	let productNum = '${dto.tboardNum}';
        	let sortNo = $('.reviewSortNo').val();
        	let url = '${pageContext.request.contextPath}/review/list';
        	let query = 'productNum='+productNum+'&pageNo='+page+'&sortNo='+sortNo;
        	
        	const fn = function(data) {
        		printReview(data);
        	};
        	ajaxFun(url, 'get', query, 'json', fn);
        }
         
        function printReview(data) {
        	let dataCount = data.dataCount;
        	let pageNo = data.pageNo;
        	let total_page = data.total_page;
        	let size = data.size;
        	let paging = data.paging;
        	
        	if(dataCount > 0) {
        		$('.reviewSort-area').show();
        	} else {
        		$('.reviewSort-area').hide();
        	}
        	
        	let summary = data.summary;
        	printSummary(summary);
        	
        	let out = '';
        	for(let item of data.list) {
        		let num = item.num;
        		let userName = item.userName;
        		let score = item.score;
        		let review = item.review;
        		let review_date = item.review_date;
        		let answer = item.answer;
        		let answer_date = item.answer_date;
        		let listFilename = item.listFilename;
        		// let deletePermit = item.deletePermit;

        		out += '<div class="mt-3 border-bottom">';
        		out += '  <div class="row p-2">';
        		out += '     <div class="col-auto fs-2"><i class="bi bi-person-circle text-muted icon"></i></div>';
        		out += '     <div class="col pt-3 ps-0 fw-semibold">'+nickName+'</div>';
        		out += '     <div class="col pt-3 text-end"><span>'+review_date+'</span>';
        		out += '       |<span class="notifyReview" data-num="' + num + '">신고</span></div>';
        		out += '  </div>';
        		out += '  <div class="row p-2">';
        		out += '    <div class="col-auto pt-0 ps-2 pe-1 score-star">';
        		for(let i=1; i<=5; i++) {
        			out += '  <span class="item fs-6 ' + (score>=i ? 'on' : '') + '"><i class="bi bi-star-fill"></i></span>';
        		}
        		out += '    </div>';
        		out += '    <div class="col-auto ps-0 fs-6"><span>' + score + '점<span></div>';
        		out += '  </div>';
        		out += '  <div class="mt-2 p-2">' + review + '</div>';

        		if(listFilename && listFilename.length > 0) {
        			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
        				for(let f of listFilename) {
        					out += '<div class="col-md-auto md-img">';
        					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/review/'+f+'">';
        					out += '</div>';
        				}
        			out += '</div>';
        		}
        		
        		if(answer) {
        			out += '  <div class="p-3 pt-0">';
        			out += '    <div class="bg-light">';
        			out += '      <div class="p-3 pb-0">';
        			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
        			out += '      </div>';
        			out += '      <div class="p-3 pt-1">' + answer + '</div>';
        			out += '    </div>';
        			out += '  </div>';
        		}
        		out += '</div>';
        	}
        	if(dataCount > 0) {
        		out += '<div class="page-navigation">' + paging + '</div>';
        	}
        	
        	$('.list-review').html(out);
        }

        function printSummary(summary) {
            let count = summary.count;
            let ave = summary.ave;

            let score1 = summary.score1;
            let score2 = summary.score2;
            let score3 = summary.score3;
            let score4 = summary.score4;
            let score5 = summary.score5;
            let scoreRate1 = summary.scoreRate1;
            let scoreRate2 = summary.scoreRate2;
            let scoreRate3 = summary.scoreRate3;
            let scoreRate4 = summary.scoreRate4;
            let scoreRate5 = summary.scoreRate5;

            $(".product-reviewCount").text(count);
            $(".product-score").text("(" + ave + " / 5)");
            $(".product-star .item").removeClass("on");
            let roundAve = Math.round(ave);
            for (let i = 1; i <= roundAve; i++) {
                $(".product-star .item").eq(i - 1).addClass("on");
            }

            $(".title-reviewCount").text("(" + count + ")");

            $(".review-score-star .item").removeClass("on");
            for (let i = 1; i <= roundAve; i++) {
                $(".review-score-star .item").eq(i - 1).addClass("on");
            }
            $(".review-score").text(ave + " / 5");
            $(".review-reviewCount").text(count);

            $(".review-rate .one-space").removeClass("on");

            for (let i = 1; i <= Math.floor(scoreRate5 / 10); i++) {
                $(".review-rate .score-5 .one-space").eq(i - 1).addClass("on");
            }
            $(".review-rate .score-5 .graph-rate").text(scoreRate5 + "%");

            for (let i = 1; i <= Math.floor(scoreRate4 / 10); i++) {
                $(".review-rate .score-4 .one-space").eq(i - 1).addClass("on");
            }
            $(".review-rate .score-4 .graph-rate").text(scoreRate4 + "%");

            for (let i = 1; i <= Math.floor(scoreRate3 / 10); i++) {
                $(".review-rate .score-3 .one-space").eq(i - 1).addClass("on");
            }
            $(".review-rate .score-3 .graph-rate").text(scoreRate3 + "%");

            for (let i = 1; i <= Math.floor(scoreRate2 / 10); i++) {
                $(".review-rate .score-2 .one-space").eq(i - 1).addClass("on");
            }
            $(".review-rate .score-2 .graph-rate").text(scoreRate2 + "%");

            for (let i = 1; i <= Math.floor(scoreRate1 / 10); i++) {
                $(".review-rate .score-1 .one-space").eq(i - 1).addClass("on");
            }
            $(".review-rate .score-1 .graph-rate").text(scoreRate1 + "%");
        }

        $(function() {
            $('body').on('click', '.notifyReview', function() {
                let num = $(this).attr('data-num');
                alert(num);
            });
        });

        // question -----
        function listQuestion(page) {
        	let productNum = '${dto.tboardNum}';
        	let url = '${pageContext.request.contextPath}/qna/list';
        	let query = 'tboardNum='+tboardNum+'&pageNo='+page;
        	
        	const fn = function(data) {
        		printQuestion(data);
        	};
        	ajaxFun(url, 'get', query, 'json', fn);
        }

        function printQuestion(data) {
        	let dataCount = data.dataCount;
        	let pageNo = data.pageNo;
        	let total_page = data.total_page;
        	let size = data.size;
        	let paging = data.paging;
        	
        	$('.title-qnaCount').html('(' + dataCount + ')');
        	let out = '';
        	for(let item of data.list) {
        		let num = item.num;
        		let userName = item.userName;
        		let question = item.question;
        		let question_date = item.question_date;
        		let answer = item.answer;
        		let answer_date = item.answer_date;
        		let answerState = answer_date ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
        		let listFilename = item.listFilename;
        		let secret = item.secret;

        		out += '<div class="mt-1 border-bottom">';
        		out += '  <div class="mt-2 p-2">' + question + '</div>';

        		if(listFilename && listFilename.length > 0) {
        			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
        				for(let f of listFilename) {
        					out += '<div class="col-md-auto md-img">';
        					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/qna/'+f+'">';
        					out += '</div>';
        				}
        			out += '</div>';
        		}
        		out += '  <div class="row p-2">';
        		out += '     <div class="col-auto pt-2 pe-0">' + answerState + '</div>';
        		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;'+userName+'</div>';
        		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>'+question_date+'</span>';
        		if(secret === 0) {
        			out += '       |<span class="notifyQuestion" data-num="' + num + '">신고</span>';
        		}
        		out += '      </div>';
        		if(answer) {
        			out += '  <div class="col pt-2 text-end"><button class="custom-button btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
        		}
        		out += '  </div>';
        		if(answer) {
        			out += '  <div class="p-3 pt-0 answer-content" style="display: none;">';
        			out += '    <div class="bg-light">';
        			out += '      <div class="p-3 pb-0">';
        			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
        			out += '      </div>';
        			out += '      <div class="p-3 pt-1">' + answer + '</div>';
        			out += '    </div>';
        			out += '  </div>';
        		}
        		out += '</div>';
        	}
        	
        	if(dataCount > 0) {
        		out += '<div class="page-navigation">' + paging + '</div>';
        	}

        	$('.list-question').html(out);
        }

        $(function(){
        	$('.list-question').on('click', '.btnAnswerView', function(){
        		const $btn = $(this);
        		const $EL = $(this).closest('.row').next('.answer-content');
        		if($EL.is(':visible')) {
        			$btn.html(' <i class="bi bi-chevron-down"></i> ');
        			$EL.hide(100);
        		} else {
        			$btn.html(' <i class="bi bi-chevron-up"></i> ');
        			$EL.show(100);
        		}
        	});
        });

        $(function(){
        	var sel_files = [];
        	
        	$("body").on("click", ".qna-form .img-add", function(){
        		$(this).closest(".qna-form").find("input[name=selectFile]").trigger("click");
        	});
        	
        	$("form[name=questionForm] input[name=selectFile]").change(function(e){
        		if(! this.files) {
        			let dt = new DataTransfer();
        			for(let f of sel_files) {
        				dt.items.add(f);
        			}
        			
        			this.files = dt.files;
        			
        			return false;
        		}
        		
        		let $form = $(this).closest("form");
        		
        		// 유사 배열을  배열로 변환
        		const fileArr = Array.from(this.files);
        		
        		fileArr.forEach((file, index) => {
        			sel_files.push(file);
        			
        			const reader = new FileReader();
        			const $img = $("<img>", {"class":"item img-item"});
        			$img.attr("data-filename", file.name);
        			reader.onload = e => {
        				$img.attr("src", e.target.result);		
        			};
        			reader.readAsDataURL(file);
        			$form.find(".img-grid").append($img);
        		});
        		
        		let dt = new DataTransfer();
        		for(let f of sel_files) {
        			dt.items.add(f);
        		}
        		
        		this.files = dt.files;
        	});
        	
        	$("body").on("click", ".qna-form .img-item", function(){
        		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
        			return false;
        		}
        		
        		let filename = $(this).attr("data-filename");
        		
        		for(let i=0; i<sel_files.length; i++) {
        			if(filename === sel_files[i].name) {
        				sel_files.splice(i, 1);
        				break;
        			}
        		}
        		
        		let dt = new DataTransfer();
        		for(let f of sel_files) {
        			dt.items.add(f);
        		}
        		
        		const f = this.closest("form");
        		f.selectFile.files = dt.files;
        		
        		$(this).remove();
        	});
        	
        	$('.btnQuestion').click(function(){
        		$("#questionDialogModal").modal("show");
        	});

        	$('.btnQuestionSendOk').click(function(){
        		const f = document.questionForm;
        		let s;
        		
        		s = f.question.value.trim();
        		if( ! s ) {
        			alert("문의 사항을 입력하세요.")	;
        			f.question.focus();
        			return false;
        		}
        		
        		if(f.selectFile.files.length > 5) {
        			alert("이미지는 최대 5개까지 가능합니다..")	;
        			return false;
        		}
        		
        		let url = "${pageContext.request.contextPath}/qna/write";
        		// FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공 
        		// FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
        		let query = new FormData(f); 
        		
        		const fn = function(data) {
        			if(data.state === "true") {
        				f.reset();
        				$(".qna-form .img-item").each(function(){
        					$(this).remove();
        				});
        				sel_files.length = 0;
        				
        				$("#questionDialogModal").modal("hide");
        				
        				listQuestion(1);
        			}
        		};
        		
        		ajaxFun(url, "post", query, "json", fn, true);
        	});
        	
        	$('.btnQuestionSendCancel').click(function(){
        		const f = document.questionForm;
        		f.reset();
        		$(".qna-form .img-item").each(function(){
        			$(this).remove();
        		});
        		sel_files.length = 0;
        		
        		$("#questionDialogModal").modal("hide");
        	});	
        	
        	$('.btnMyQuestion').click(function(){
        		location.href = '${pageContext.request.contextPath}/myPage/review?mode=qna';
        	});
        });
    </script>
</body>
</body>
</html>
