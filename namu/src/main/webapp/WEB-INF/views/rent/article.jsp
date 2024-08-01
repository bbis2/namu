<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%
    ObjectMapper objectMapper = new ObjectMapper();
    String writerOtherPostsJson = objectMapper.writeValueAsString(request.getAttribute("writerOtherPosts"));
    pageContext.setAttribute("writerOtherPostsJson", writerOtherPostsJson);
%>

<style type="text/css">

.btnSendLike {
	background: #b1b1b1;
	color: white;
	width: 150px;
	height: 50px;
	border: none;
	font-size: 18px;
	font-weight: 700;
	transition: 0.2s;
	
}
.btnSendLike:hover {
	background: #8a8a8a;
}
.btnSendLike.on {
	background: #8a8a8a;
}

.btnChat {
	background: #ec433d;
	color: white;
	width: 150px;
	height: 50px;
	border: none;
	font-size: 18px;
	font-weight: 700;
	transition: 0.2s;
}

.btnChat:hover {
	background: #ff2600;
}
.btnWaiting {
    background: #ffa500;  /* 노란색(주황색) */
    color: white;
    width: 150px;
    height: 50px;
    border: none;
    font-size: 18px;
    font-weight: 700;
    transition: 0.2s;
}

.btnWaiting:hover {
    background: #ff8c00;
}

.btnAccept {
    background: #4169e1;  /* 파란색 */
    color: white;
    width: 150px;
    height: 50px;
    border: none;
    font-size: 18px;
    font-weight: 700;
    transition: 0.2s;
}

.btnAccept:hover {
    background: #1e90ff;
}

a:hover {text-decoration: none;}

.profileList {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.carousel-control-prev,
.carousel-control-next {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 15%;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0.5;
    background: none; /* 기본 상태에서는 배경을 투명하게 설정 */
    transition: background-color 0.3s, opacity 0.3s;
}

.carousel-control-prev:hover {
    background: linear-gradient(to right, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0)); /* 왼쪽으로 향하는 그라데이션 */
    opacity: 1; /* 호버 시 불투명도 증가 */
}

.carousel-control-next:hover {
    background: linear-gradient(to left, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0)); /* 오른쪽으로 향하는 그라데이션 */
    opacity: 1; /* 호버 시 불투명도 증가 */
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
    width: 2rem;
    height: 2rem;
    background-color: rgba(0, 0, 0, 0.5); /* 버튼 아이콘의 기본 배경 색상 */
    border-radius: 50%;
    transition: background-color 0.3s;
}

.carousel-control-prev-icon:hover,
.carousel-control-next-icon:hover {
    background-color: rgba(0, 0, 0, 0.7); /* 호버 시 약간 더 어두운 배경 색상 */
}

#modalCarousel .carousel-item img {
    max-height: 80vh;
    object-fit: contain;
}

.tree-icon {
  position: relative;
  display: inline-block;
}

.tooltip-icon {
  position: absolute;
  color: #888;
  font-size: 14px;
  margin-left: 5px;
  cursor: help;
  left: 105%;
  bottom: 60%;
}

.tooltip-text {
  visibility: hidden;
  width: 200px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  bottom: 50%;
  left: 355%;
  margin-left: -100px;
  opacity: 0;
  transition: opacity 0.3s;
}

.tree-icon:hover .tooltip-text {
  visibility: visible;
  opacity: 1;
}

.custom-tabs .nav-link {
    font-size: 1.2rem;  /* 글자 크기 키우기 */
    color: #333;  /* 탭 글자 색상 */
    transition: all 0.3s ease;  /* 부드러운 전환 효과 */
}

.custom-tabs .nav-link.active {
    font-weight: bold;  /* 활성화된 탭 bold 처리 */
    color: #000;  /* 활성화된 탭 글자 색상 더 진하게 */
    border-bottom: 2px solid #000;  /* 활성화된 탭 아래 선 추가 */
}

.custom-tabs .nav-link:hover {
    color: #000;  /* 호버 시 글자 색상 변경 */
}

#myTabContent {
    padding: 20px 0;  /* 탭 내용과 탭 사이에 여백 추가 */
}

.positive-review {
    background-color: #e6ffe6;
    border-left: 5px solid #4CAF50;
    padding: 10px;
    margin-bottom: 10px;
}

.negative-review {
    background-color: #ffebeb;
    border-left: 5px solid #f44336;
    padding: 10px;
    margin-bottom: 10px;
}

</style>

<script type="text/javascript">
function searchList() {
	const form = document.searchForm;
	
	form.action = "${pageContext.request.contextPath}/rent/list";
	form.submit();
}

document.addEventListener('DOMContentLoaded', function() {
	  var tooltipIcons = document.querySelectorAll('.tooltip-icon');
	  tooltipIcons.forEach(function(icon) {
	    icon.addEventListener('touchstart', function(e) {
	      e.preventDefault();
	      this.parentNode.querySelector('.tooltip-text').style.visibility = 'visible';
	      this.parentNode.querySelector('.tooltip-text').style.opacity = '1';
	    });
	    icon.addEventListener('touchend', function(e) {
	      e.preventDefault();
	      this.parentNode.querySelector('.tooltip-text').style.visibility = 'hidden';
	      this.parentNode.querySelector('.tooltip-text').style.opacity = '0';
	    });
	  });
	});
	
function SinGo(){
	$('#SinGoModal').modal('show');
}

function sendOk() {
	const f = document.SinGoForm;
	let str = f.reportContent.value.trim();
	
    if (!confirm("정말 신고하시겠습니까?")) {
        return;
    }
    
    if(!str){
    	alert("사유를 입력해주세요");
    }
    
    f.action = "${pageContext.request.contextPath}/singo/reception";
    f.submit();
}
</script>

<div class="container mt-5 pt-3">

	<div class="row mt-4">
		<form class="d-flex w-100" id="searchForm" action="${pageContext.request.contextPath}/rent/list" method="GET">
			<div class="col-3">
				<div>
					<h6>&nbsp;</h6>
					<h5><a style="color: #bfbfbf;" href="${pageContext.request.contextPath}/rent/list?${query}">> [${dto.category}]의 모든 글 보기</a></h5>
				</div>
			</div>
			<div class="col-9">
				<div class="row d-flex justify-content-end">
					<div class="col-2">
						<div>
							<h6 class="bd">나의 동네</h6>
							<select id="selectTown" class="form-select mb-4 border border-2" aria-label="Default select example" name="townNum">
								<option value="1" ${townNum=="1" ? "selected" : "" }>${sessionScope.member.town1}</option>
								<c:if test="${sessionScope.member.town2 != null}">
									<option value="2" ${townNum=="2" ? "selected" : "" }>${sessionScope.member.town2}</option>
								</c:if>
							</select>
						</div>
					</div>
					<div class="col-2">
						<div>
							<h6 class="bd">카테고리</h6>
							<select class="form-select mb-4 border border-2" aria-label="Default select example" name="categoryNum">
								<option value="0" ${categoryNum=="0" ? "selected" : ""}>전체</option>
								<c:forEach var="category" items="${category}">
									<option value="${category.categoryNum}" ${category.categoryNum==categoryNum ? "selected" : ""}>${category.category}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-4">
						<div>
							<h6 class="bd">&nbsp;</h6>
						</div>
						<div class="d-flex">
							<input class="form-control border border-2" onkeypress="if( event.keyCode == 13 ){searchList();}" value="${kwd}" type="search" name="kwd" placeholder="검색어를 입력하세요"/>
							<h6>&nbsp;</h6>
							<button class="btn" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<hr class="my-4"  style="border: 1px solid #000000;">

	<div class="row mb-4 mx-5 px-5">
		<div class="col-md-4">
		
			<div id="carouselExampleIndicators" class="carousel slide border">

		        <div class="carousel-inner ratio ratio-1x1">
		            <c:forEach var="i" items="${listImage}" varStatus="status">
		                <div class="carousel-item ${status.first ? 'active' : ''}">
		                    <img src="${pageContext.request.contextPath}/uploads/album/${i.imageFilename}" 
                         		class="d-block w-100 object-fit-cover h-100" alt="..." data-bs-toggle="modal" 
                         		data-bs-target="#imageModal" data-image-src="${pageContext.request.contextPath}/uploads/album/${i.imageFilename}">
		                </div>
		            </c:forEach>
		        </div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			
			<div class="mt-2 d-flex justify-content-center">
			    <c:forEach var="i" items="${listImage}" varStatus="status">
			        <div class="mx-1">
			            <img src="${pageContext.request.contextPath}/uploads/album/${i.imageFilename}" 
			                 class="img-thumbnail thumbnail-image" alt="썸네일" 
			                 style="width: 60px; height: 60px; object-fit: cover; cursor: pointer;"
			                 data-slide-to="${status.index}">
			        </div>
			    </c:forEach>
			</div>

		</div>
		
		<!-- Modal -->
	    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered modal-lg">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="imageModalLabel"></h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <div id="modalCarousel" class="carousel slide">
	                        <div class="carousel-inner">
	                            <c:forEach var="i" items="${listImage}" varStatus="status">
	                                <div class="carousel-item ${status.first ? 'active' : ''}">
	                                    <img src="${pageContext.request.contextPath}/uploads/album/${i.imageFilename}" class="d-block w-100" alt="...">
	                                </div>
	                            </c:forEach>
	                        </div>
	                        <button class="carousel-control-prev" type="button" data-bs-target="#modalCarousel" data-bs-slide="prev">
	                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                            <span class="visually-hidden">Previous</span>
	                        </button>
	                        <button class="carousel-control-next" type="button" data-bs-target="#modalCarousel" data-bs-slide="next">
	                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                            <span class="visually-hidden">Next</span>
	                        </button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- 모달 끝 -->
		
		<div class="col-md-8">
			<div class="ms-5 mb-4 me-4">
				<div class="d-flex justify-content-between">
					<h3 class="bd">${dto.subject}</h3>
					<c:if test="${!dto.nickName.equals(sessionScope.member.nickName)}">
						<button type="button" style="border: none; width: 50px; height: 30px; color: gray;" class="btn-light" onclick="SinGo();">신고</button>
					</c:if>
				</div>
				<div class="d-flex justify-content-between">
					<c:choose>
						<c:when test="${writer.profile != null}">
							<div class="d-flex align-items-center">
							    <img style="width: 30px; height: 30px; margin-bottom: 20px; border-radius: 50%; object-fit: cover; cursor: pointer;" 
							         alt="" src="${pageContext.request.contextPath}/uploads/photo/${writer.profile}" 
							         data-bs-toggle="modal" data-bs-target="#profileImageModal"> 
							    <h5 class="ms-2">${dto.nickName}</h5>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex align-items-center">
							    <img style="width: 30px; height: 30px; margin-bottom: 20px; border-radius: 50%; object-fit: cover; cursor: pointer;" 
							         alt="" src="${pageContext.request.contextPath}/resources/images/default_profile.png" 
							         data-bs-toggle="modal" data-bs-target="#profileImageModal"> 
							    <h5 class="ms-2">${dto.nickName}</h5>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="d-flex gap-3 justify-content-end" style="color: #bfbfbf;">
						<p class="LikeCount"><i class="fa-solid fa-heart"></i>&nbsp;<span id="likeCount">${dto.likeCount}</span></p>
						<p>|</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;${dto.hitCount}</p>
						<p>|</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;${dto.passedTime}</p>
					</div>
				</div>
				<div class=""><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.location}</div>	
				
				<div class="mt-5 pt-4 d-flex justify-content-between">
					<div>
						<h6 class="bd">대여요금</h6>
						<c:if test="${dto.hPrice != 0}">
							<div class="d-flex my-2">
								<h6 style="width: 130px; color: #ababab;">• 1시간</h6>
								<h6 class="bd"><fmt:formatNumber value="${dto.hPrice}" pattern="#,###"/>원</h6>
							</div>
						</c:if>
						<c:if test="${dto.dPrice != 0}">
							<div class="d-flex my-2">
								<h6 style="width: 130px; color: #ababab;">• 1일</h6>
								<h6 class="bd"><fmt:formatNumber value="${dto.dPrice}" pattern="#,###"/>원</h6>
							</div>
						</c:if>
						<c:if test="${dto.wPrice != 0}">
							<div class="d-flex my-2">
								<h6 style="width: 130px; color: #ababab;">• 1주</h6>
								<h6 class="bd"><fmt:formatNumber value="${dto.wPrice}" pattern="#,###"/>원</h6>
							</div>
						</c:if>
						<c:if test="${dto.mPrice != 0}">
							<div class="d-flex my-2">
								<h6 style="width: 130px; color: #ababab;">• 30일</h6>
								<h6 class="bd"><fmt:formatNumber value="${dto.mPrice}" pattern="#,###"/>원</h6>
							</div>
						</c:if>
					</div>
					<c:choose>
						<c:when test="${dto.nickName.equals(sessionScope.member.nickName)}">
						
						</c:when>
						<c:otherwise>
							<div class="w-50">
								<h6 class="bd">대여 시간 선택</h6>
								<div>
								    <h6 class="mt-3 me-2">시작</h6>
								    <input type="datetime-local" id="strDate" name="strDate" class="form-control" step="3600" required>
								</div>
								<div id="endDateContainer" style="display: none;">
								    <h6 class="mt-3 me-2">종료</h6>
								    <input type="datetime-local" id="endDate" name="endDate" class="form-control" step="3600" required>
								</div>
								<div class="d-flex justify-content-between">
								    <h6 class="mt-3 bd" id="totalRentalTime2" style="display: none;">총 대여 시간</h6>
								    <h6 class="float-end mt-3" id="totalRentalTime" style="display: none;">~~일 ~~시간</h6>
								</div>
								<div class="d-flex justify-content-between mt-3" style="color: blue;">
								    <h4 class="mt-3 bd" id="totalPrice2" style="display: none;">총 금액</h4>
								    <h4 class="float-end mt-3" id="totalPrice" style="display: none;">계산 중...</h4>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="mt-3">
					<div class="d-flex justify-content-end gap-3">
						<c:choose>
							<c:when test="${dto.nickName.equals(sessionScope.member.nickName)}">
								<button type="button" class="btnUpdate btnSendLike">수정하기</button>
								<button type="button" class="btnDelete btnChat">삭제하기</button>
							</c:when>
							<c:otherwise>
								<button class="ajaxLike btnSendLike ${dto.userLiked ? 'on' : ''}">${dto.userLiked ? '찜삭제' : '찜하기'}</button>
								<button id="rentalActionButton" class="rental-action-btn" style="border: none;">신청하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>		
		</div>
		
		
		
		<div class="row">
			<div class="col">
			</div>
		</div>

		<div class="row mb-2">
		    <div class="col-md-8">
		        <div class="mt-3">
		            <ul class="nav nav-tabs custom-tabs" id="myTab" role="tablist">
		                <li class="nav-item" role="presentation">
		                    <button class="nav-link active" id="content-tab" data-bs-toggle="tab" data-bs-target="#content" type="button" role="tab" aria-controls="content" aria-selected="true">본문</button>
		                </li>
		                <li class="nav-item" role="presentation">
		                    <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews" aria-selected="false">후기</button>
		                </li>
		            </ul>
		            <div class="tab-content" id="myTabContent">
		                <div class="tab-pane fade show active" id="content" role="tabpanel" aria-labelledby="content-tab">
		                    <div class="mt-3">
		                        ${dto.content}
		                    </div>
		                </div>
		                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
		                    <div class="mt-3">
		                        <div id="reviewsContainer">
		                            <!-- 여기에 후기 내용을 동적으로 로드합니다 -->
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
	        
			<div class="col-md-4 profile card text-bg-light mb-4">
                <div class="mt-3">
                    <h5 class="bd">작성자 프로필</h5>
	                <hr class="mt-0 mb-2">
                    <div class="mx-3">
                    	<div class="d-flex justify-content-between mb-1">
                    		<div class="mt-3">
								<div class="d-flex align-items-center">
									<c:choose>
										<c:when test="${writer.profile != null}">
										    <img style="width: 50px; height: 50px; margin-bottom: 20px; border-radius: 50%; object-fit: cover; cursor: pointer;" 
										         alt="" src="${pageContext.request.contextPath}/uploads/photo/${writer.profile}" 
										         data-bs-toggle="modal" data-bs-target="#profileImageModal"> 
										    <h3 class="ms-2">${dto.nickName}</h3>
										</c:when>
										<c:otherwise>
										    <img style="width: 50px; height: 50px; margin-bottom: 20px; border-radius: 50%; object-fit: cover; cursor: pointer;" 
										         alt="" src="${pageContext.request.contextPath}/resources/images/default_profile.png" 
										         data-bs-toggle="modal" data-bs-target="#profileImageModal"> 
										    <h3 class="ms-2">${dto.nickName}</h3>
										</c:otherwise>
									</c:choose>
								</div>
			                    <div class="d-flex">
			                    	<c:if test="${writer.ment != null}">
					                    한마디: <p class="bd ms-1">${writer.ment}</p>
			                    	</c:if>
			                    </div>
                    		</div>
		                    <div>
			                    <p>가입일 | ${writer.regDate}</p>
			                    <div class="d-flex align-items-center">
			                        <img alt="" src="${pageContext.request.contextPath}/resources/images/namuLogo.png" width="40px;" height="40px;">
			                        <span class="tree-icon ms-2">
			                            <p class="bd">${writer.userManner}cm</p>
			                            <i class="fas fa-question-circle tooltip-icon"></i>
			                            <span class="tooltip-text">좋은 평가를 받으면 나무가 자라요!<br>초기높이: 200cm</span>
			                        </span>
			                    </div>
		                    </div>
                    	</div>
						<!-- 글쓴이의 다른 글 목록 -->
						<div class="writer-other-posts">
						    <h5 class="bd mb-3">${dto.nickName}님의 다른 글</h5>
						    <ul class="list-unstyled">
						    	<c:choose>
						    		<c:when test="${writerOtherPosts.size() != 0}">
								        <c:forEach var="post" items="${writerOtherPosts}" varStatus="status">
								            <c:if test="${status.index < 8}">
								                <li class="d-flex">
													<a href="${pageContext.request.contextPath}/${post.TABLENAME}/article?${post.TABLENAME == 'auction' ? 'aNum' : (post.TABLENAME == 'together' ? 'tNum' : 'num')}=${post.NUM}" class="text-decoration-none">
													    <span class="bd">[${post.boardName}]</span> ${post.SUBJECT}
													</a>
								                </li>
								            </c:if>
								        </c:forEach>
						    		</c:when>
						    		<c:otherwise>
						    			<li>등록된 다른 글이 없습니다.</li>
						    		</c:otherwise>
						    	</c:choose>
						    </ul>
						    <c:if test="${writerOtherPosts.size() > 8}">
						        <button type="button" style="border: none; text-decoration: none;" class="btn-link mb-2" data-bs-toggle="modal" data-bs-target="#writerPostsModal">
						            더보기
						        </button>
						    </c:if>
						</div>
						<!-- 모달 -->
						<div class="modal fade" id="writerPostsModal" tabindex="-1" aria-labelledby="writerPostsModalLabel" aria-hidden="true">
						    <div class="modal-dialog modal-lg">
						        <div class="modal-content">
						            <div class="modal-header">
						                <h5 class="modal-title" id="writerPostsModalLabel">${dto.nickName}님의 글 목록</h5>
						                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						            </div>
						            <div class="modal-body">
						                <ul class="nav nav-tabs" id="writerPostsTabs" role="tablist">
						                    <li class="nav-item" role="presentation">
						                        <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
						                    </li>
						                    <li class="nav-item" role="presentation">
						                        <button class="nav-link" id="-tab" data-bs-toggle="tab" data-bs-target="#" type="button" role="tab" aria-controls="" aria-selected="false">빌림</button>
						                    </li>
						                    <!-- 다른 탭들 추가 -->
						                </ul>
						                <div class="tab-content" id="writerPostsTabContent">
						                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
						                        <ul class="list-group list-group-flush">
													<c:forEach var="post" items="${writerOtherPosts}">
													    <li class="list-group-item">
													        <a href="${pageContext.request.contextPath}/${post.TABLENAME}/article?num=${post.NUM}" class="text-decoration-none">
															    <span class="bd">[${post.boardName}]</span> ${post.SUBJECT}
															</a>
													        <small class="text-muted ml-2">${post.regDate}</small>
													    </li>
													</c:forEach>
						                        </ul>
						                    </div>
						                    <!-- 다른 탭들의 내용 -->
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
                    </div>
	            </div>
	        </div>
	    </div>
	        
		<div class="row">
		    <div class="col-md-8">
		        <h5 class="bd">[${dto.location}] > [${dto.category}] 의 다른 글</h5>
		    </div>
		    <hr>
		</div>
		<!-- 캐러샐 시작 -->
		<div class="row align-items-start">
			<c:choose>
			    <c:when test="${otherPosts.size() == 0}">
					<div class="d-flex justify-content-center mt-5 pt-5">
						<h3 class="bd">등록된 글이 없어요. 가장 먼저 등록해보세요!</h3>
					</div>
					<div class="d-flex justify-content-center mb-5 pb-5">
						<a href="${pageContext.request.contextPath}/rent/write?townNum=${townNum}"><h5 class="bd" style="color: #61ac2d;"> > 눌러서 글쓰러 가기 < </h5></a>
					</div>
		        </c:when>
		        <c:otherwise>
				    <div id="otherPostsCarousel" class="carousel slide" data-bs-interval="false">
				        <div class="carousel-inner">
				            <c:forEach var="page" begin="0" end="${totalPages - 1}" varStatus="status">
				                <div class="carousel-item ${status.first ? 'active' : ''}">
				                    <div class="row">
				                        <c:forEach var="post" items="${otherPosts}" begin="${page*5}" end="${(page+1)*5 - 1}" varStatus="postStatus">
				                            <c:if test="${postStatus.index < otherPosts.size()}">
				                                <div class="col-lg-20 col-md-3 col-sm-6 list">
				                                    <div>
				                                        <div class="overflow-hidden border mb-2 ratio ratio-1x1">
				                                            <a href="${pageContext.request.contextPath}/rent/article?num=${post.rentNum}&${query}" class="listTitle">
				                                                <img class="thumbnail img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/uploads/album/${post.imageFilename}">
				                                            </a>
				                                            <c:if test="${!post.nickName.equals(sessionScope.member.nickName)}">
				                                                <button type="button" class="btn_like ${post.userLiked ? 'on' : ''}" title="찜하기">
				                                                    like
				                                                </button>
				                                                <input type="hidden" value="${post.rentNum}" class="likeRentNum">
				                                            </c:if>
				                                        </div>
				                                        <a href="${pageContext.request.contextPath}/rent/article?num=${post.rentNum}&${query}" class="listTitle"><h5 class="bd">${post.subject}</h5></a>
														<div class="d-flex justify-content-between" style="height: 35px;">
															<div class="d-flex align-items-center">
																<c:choose>
																	<c:when test="${post.profile != null}">
															    		<img class="mt-2" style="width: 20px; height: 20px; margin-bottom: 20px; border-radius: 50%; object-fit: cover;" 
																	         alt="" src="${pageContext.request.contextPath}/uploads/photo/${post.profile}"> 
																	</c:when>
																	<c:otherwise>
															    		<img class="mt-2" style="width: 20px; height: 20px; margin-bottom: 20px; border-radius: 50%; object-fit: cover;" 
																	         alt="" src="${pageContext.request.contextPath}/resources/images/default_profile.png"> 
																	</c:otherwise>
																</c:choose>
													    		<h6 class="ms-2">${post.nickName}</h6>
															</div>
															<div style="margin-top: 4px;"><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.location}</div>	
														</div>
				                                        <div class="d-flex justify-content-between" style="color: #bfbfbf;">
				                                            <p class="LikeCount"><i class="fa-solid fa-heart"></i>&nbsp;${post.likeCount}</p>
				                                            <p><i class="fa-solid fa-eye"></i>&nbsp;${post.hitCount}</p>
				                                            <p><i class="fa-solid fa-clock"></i>&nbsp;${post.passedTime}</p>
				                                        </div>
				                                    </div>
				                                </div>
				                            </c:if>
				                        </c:forEach>
				                    </div>
				                </div>
				            </c:forEach>
				        </div>
				        <button class="carousel-control-prev" style="width: 5%;" type="button" data-bs-target="#otherPostsCarousel" data-bs-slide="prev">
				            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				            <span class="visually-hidden">Previous</span>
				        </button>
				        <button class="carousel-control-next" style="width: 5%;" type="button" data-bs-target="#otherPostsCarousel" data-bs-slide="next">
				            <span class="carousel-control-next-icon" aria-hidden="true"></span>
				            <span class="visually-hidden">Next</span>
				        </button>
				    </div>
				</c:otherwise>
			</c:choose>
		</div>
			<!-- 캐러샐 끝 -->
        
	</div>
</div>
<div id="toast_message"></div>

<!-- 프로필 이미지 모달 -->
<div class="modal fade" id="profileImageModal" tabindex="-1" aria-labelledby="profileImageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileImageModalLabel">${dto.nickName}님의 프로필 사진</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
	      		<c:choose>
					<c:when test="${writer.profile != null}">
		                <img src="${pageContext.request.contextPath}/uploads/photo/${writer.profile}" class="img-fluid" alt="프로필 사진">
					</c:when>
					<c:otherwise>
		                <img src="${pageContext.request.contextPath}/resources/images/default_profile.png" class="img-fluid" alt="프로필 사진">
					</c:otherwise>
				</c:choose>
            </div>
        </div>
    </div>
</div>

<!-- 신고 모달 -->
<div class="modal fade" id="SinGoModal" tabindex="-1"
	data-bs-keyboard="false"
	aria-labelledby="SinGoModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="">신고하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="SinGoForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<p class="form-control-plaintext">신고유형과 사유를 적어주세요</p>
						</div>
						<div class="mt-0">
							<select id="reportType" name="reportType" class="form-select">
								<option value="욕설/인신공격" selected>욕설/인신공격</option>
									<option value="개인정보노출">개인정보노출</option>
									<option value="불법정보">불법정보</option>
									<option value="같은내용반복(도배)">같은내용반복(도배)</option>
									<option value="기타">기타</option>
							</select>
						</div>
						<div>
							<input type="text" name="reportContent" autocomplete="off"
								 class="form-control"
								placeholder="신고사유 : ">
						</div>
							<input type="hidden" name="Field" value="${dto.tableName}">
							<!-- 파라미터 num -->
							<input type="hidden" name="postNum" value="${dto.rentNum}">
							<input type="hidden" name="banUser" value="${writer.userId}">
							<input type="hidden" name="subject" value="${dto.subject}">
						<div>
							<button type="button" class="btn btn-primary w-100"
								onclick="sendOk();">신고하기</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- 신청 모달 -->
<div class="modal fade" id="rentalConfirmModal" tabindex="-1" aria-labelledby="rentalConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="rentalConfirmModalLabel">대여 신청 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="accordion" id="rentalAccordion">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                대여 정보
              </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#rentalAccordion">
              <div class="accordion-body">
                <p><strong>시작 날짜:</strong> <span id="modalStartDate"></span></p>
                <p><strong>종료 날짜:</strong> <span id="modalEndDate"></span></p>
                <p><strong>총 대여 시간:</strong> <span id="modalTotalTime"></span></p>
                <p><strong>총 금액:</strong> <span id="modalTotalPrice"></span></p>
                <p><strong>보증금:</strong> <span id="modalDeposit"></span></p>
                <p><strong>나무머니 잔액:</strong> <span id="modalPoint"></span></p>
                <p>보증금은 총 금액의 20%로 산정되었으며, 대여 종료 후 물품 상태 확인 후 반환됩니다.</p>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                약관 동의
              </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#rentalAccordion">
              <div class="accordion-body">
                <p>본 거래의 모든 책임은 거래 당사자들에게 있습니다. 물품의 상태, 반환, 손상 등에 대한 모든 사항은 대여자와 차용자 간의 합의에 따릅니다.</p>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="agreeTerms">
                  <label class="form-check-label" for="agreeTerms">
                    위 약관에 동의합니다.
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="confirmRental" disabled>대여 신청</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

$(function() {
	
	
	// 토스트 팝업
	const $toast = document.querySelector('#toast_message');
	
	function moveToSlide(index) {
	    $('#carouselExampleIndicators').carousel(index);
	}
	
    var carouselElement = document.querySelector('#carouselExampleIndicators');
    var carousel = new bootstrap.Carousel(carouselElement, {
        interval: false // 자동 슬라이드 비활성화
    });
    
    $(document).ready(function() {
    	
    	// 후기 개수 로드
        function loadReviewCount() {
            $.ajax({
                url: '${pageContext.request.contextPath}/rentcr/reviewCount',
                type: 'GET',
                data: { rentNum: ${dto.rentNum} },
                success: function(data) {
                    $('#reviews-tab').text('후기(' + data.count + ')');
                }
            });
        }

        // 페이지 로드 시 후기 개수 로드
        loadReviewCount();
    	
        // 리뷰 탭 클릭 이벤트
        $('#reviews-tab').on('click', function (e) {
            e.preventDefault();  // 기본 동작 방지
            $(this).tab('show');  // 탭 활성화
            loadReviews();  // 리뷰 로드 함수 호출
        });

        $('#loadMoreReviews').on('click', function() {
            loadReviews(currentPage + 1);
        });

        let currentPage = 1;

        function loadReviews(page = 1) {
            $.ajax({
                url: '${pageContext.request.contextPath}/rentcr/reviews',
                type: 'GET',
                data: { rentNum: ${dto.rentNum}, page: page },
                success: function(data) {
                    var reviewsHtml = '';
                    if (data.reviews.length > 0) {
                        data.reviews.forEach(function(review) {
                            var reviewClass = review.WASGOOD == 1 ? 'positive-review' : 'negative-review';
                            reviewsHtml += '<div class="review-item ' + reviewClass + '">';
                            reviewsHtml += '<p><strong>' + review.NICKNAME + '</strong> - ' + (review.WASGOOD == 1 ? '긍정적인 후기' : '부정적인 후기') + '</p>';
                            reviewsHtml += '<p>' + review.CONTENT + '</p>';
                            reviewsHtml += '</div>';
                        });
                        
                        if (page === 1) {
                            $('#reviewsContainer').html(reviewsHtml);
                        } else {
                            $('#reviewsContainer').append(reviewsHtml);
                        }
                        
                        currentPage = data.currentPage;
                        
                        if (currentPage < data.totalPages) {
                            $('#loadMoreReviews').show();
                        } else {
                            $('#loadMoreReviews').hide();
                        }
                    } else {
                        if (page === 1) {
                            $('#reviewsContainer').html('<p>아직 후기가 없습니다.</p>');
                        }
                        $('#loadMoreReviews').hide();
                    }
                },
                error: function() {
                    $('#reviewsContainer').html('<p>후기를 불러오는 데 실패했습니다.</p>');
                }
            });
        }

        
        function numberWithCommas(x) {
        	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	}
        
        // rentCR 상태에 따라 버튼 변경 및 대여 정보 표시
        var $rentalButton = $('#rentalActionButton');
        
        if (${rentCR == null}) {
            $rentalButton.text('신청하기').removeClass('btnWaiting btnAccept').addClass('btnChat');
            enableRentalInputs();
        } else if (${rentCR.state == 1}) {
            $rentalButton.text('대기중(취소하기)').removeClass('btnChat btnAccept').addClass('btnWaiting');
            displayRentalInfo();
        } else if (${rentCR.state == 2}) {
            $rentalButton.text('대여 확정(채팅하기)').removeClass('btnChat btnWaiting').addClass('btnAccept').attr('onclick', 'liveChatStart("rent-${dto.rentNum}", "${dto.userId}", "${dto.nickName}")');
            displayRentalInfo();
        } else {
            $rentalButton.text('신청하기').removeClass('btnWaiting btnAccept').addClass('btnChat');
            enableRentalInputs();
        }

        // 대여 정보 표시 함수
        function displayRentalInfo() {
            var startDate = new Date('${rentCR.strDate}');
            var endDate = new Date('${rentCR.endDate}');
            
            $('#strDate').val(formatDateToString(startDate)).prop('disabled', true);
            $('#endDate').val(formatDateToString(endDate)).prop('disabled', true);
            $('#endDateContainer').show();
            
            var totalTime = calculateTotalTime(startDate, endDate);
            $('#totalRentalTime').text(totalTime).show();
            $('#totalRentalTime2').show();
            
            if (${rentCR.totalPrice != null && rentCR.totalPrice > 0}) {
                $('#totalPrice').text(numberWithCommas(${rentCR.totalPrice}) + '원').show();
                $('#totalPrice2').show();
            } else {
                console.log("Total Price is null or 0");
                $('#totalPrice').text('가격 정보 없음').show();
                $('#totalPrice2').show();
            }
            
            disableRentalInputs();
        }

        // 날짜를 YYYY-MM-DDTHH:00 형식의 문자열로 변환
        function formatDateToString(date) {
            return date.getFullYear() + '-' +
                   String(date.getMonth() + 1).padStart(2, '0') + '-' +
                   String(date.getDate()).padStart(2, '0') + 'T' +
                   String(date.getHours()).padStart(2, '0') + ':00';
        }

        // 총 대여 시간 계산 함수
        function calculateTotalTime(startDate, endDate) {
            var diff = endDate.getTime() - startDate.getTime();
            var days = Math.floor(diff / (1000 * 60 * 60 * 24));
            var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var timeString = "";
            if (days > 0) {
                timeString += days + "일 ";
            }
            timeString += hours + "시간";
            return timeString;
        }

        // 대여 입력 필드 비활성화 함수
        function disableRentalInputs() {
            $('#strDate, #endDate').prop('disabled', true);
            $('#totalRentalTime, #totalPrice').css('color', '#888');
        }

        // 대여 입력 필드 활성화 함수
        function enableRentalInputs() {
            $('#strDate, #endDate').prop('disabled', false).val('');
            $('#totalRentalTime, #totalPrice').css('color', '').text('');
            $('#totalRentalTime2, #totalPrice2, #endDateContainer').hide();
        }

        // 숫자에 쉼표 추가 함수 (jQuery 확장 메서드)
        $.numberWithCommas = function(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        };
    });

    // 썸네일 클릭 시 해당 슬라이드로 이동
    $('.thumbnail-image').click(function() {
        var slideIndex = $(this).data('slide-to');
        carousel.to(slideIndex);
    });

    // 이미지 클릭 시 모달 표시
    $('#carouselExampleIndicators img').click(function() {
        let slideIndex = $(this).closest('.carousel-item').index();
        let modalCarousel = new bootstrap.Carousel('#modalCarousel');
        $('#modalCarousel').carousel(slideIndex);
        $('#imageModal').modal('show');
    });
    
    function formatDate(date) {
        return date.toISOString().slice(0, 19).replace('T', ' ');
    }
	
    $(document).on('click', '.btnChat', function(e) {
        e.preventDefault();
        console.log("btnChat clicked");
        
        let strDate = new Date($('#strDate').val());
        let endDate = new Date($('#endDate').val());
        let currentDateTime = new Date();
        let rentNum = ${dto.rentNum};
        
        // 현재 시간 이전의 시작 날짜를 선택했는지 확인
        if (strDate < currentDateTime) {
			$toast.innerText = '시작 시간은 현재 시간 이후로 선택해주세요.';
			$toast.classList.add('active');
			setTimeout(() => {
				$toast.classList.remove('active');
			}, 2500);
            return;
        }
        
        // h4 태그에서 totalPrice 텍스트를 가져오고 숫자로 변환
        let totalPrice = parseInt($('#totalPrice').text().replace(/[^0-9]/g, ''));
        let deposit = Math.round(totalPrice * 0.2); // 총 금액의 20%

        // 날짜가 선택되지 않았거나 총 금액이 없을 경우
        if (isNaN(strDate.getTime()) || isNaN(endDate.getTime()) || isNaN(totalPrice)) {
			$toast.innerText = '대여 기간과 금액을 확인해주세요.';
			$toast.classList.add('active');
			setTimeout(() => {
				$toast.classList.remove('active');
			}, 2500);
            return;
        }
        
        // 서버에 중복 검사 요청
        $.ajax({
            url: '${pageContext.request.contextPath}/rentcr/checkOverlap',
            type: 'POST',
            data: {
                strDate: formatDate(strDate),
                endDate: formatDate(endDate),
                rentNum: rentNum
            },
            success: function(response) {
            	console.log("AJAX response:", response);
                if (response.overlap) {
    				$toast.innerText = '선택한 시간대에 이미 대여 신청이 있습니다. 다른 시간을 선택해주세요.';
    				$toast.classList.add('active');
    				setTimeout(() => {
    					$toast.classList.remove('active');
    				}, 2500);
                } else {
                    proceedWithRental(strDate, endDate, totalPrice, deposit);
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });

    function proceedWithRental(strDate, endDate, totalPrice, deposit) {
    	console.log("proceedWithRental called");
        // 보유 포인트가 부족한 경우
        if(${point} < deposit) {
            let needPoint = deposit - ${point};
            if (confirm("보유한 나무머니가 부족합니다.\n(나무머니 잔액: ${point}, 부족한 포인트: " + needPoint + ")\n마이페이지로 이동하시겠습니까?")) {
                location.href = '${pageContext.request.contextPath}/mypage/list';
                return;
            } else {
				$toast.innerText = '대여신청을 취소합니다.';
				$toast.classList.add('active');
				setTimeout(() => {
					$toast.classList.remove('active');
				}, 2500);
                return;
            }
        }
        
        // 날짜를 년월일시 형식으로 변환하는 함수
        function formatDateTime(date) {
            return date.getFullYear() + '년 ' + 
                   (date.getMonth() + 1).toString().padStart(2, '0') + '월 ' + 
                   date.getDate().toString().padStart(2, '0') + '일 ' + 
                   date.getHours().toString().padStart(2, '0') + '시';
        }
        // 모달에 정보 표시
        let point = ${point};
        $('#modalStartDate').text(formatDateTime(strDate));
        $('#modalEndDate').text(formatDateTime(endDate));
        $('#modalTotalTime').text($('#totalRentalTime').text());
        $('#modalTotalPrice').text(totalPrice.toLocaleString() + '원');
        $('#modalDeposit').text(deposit.toLocaleString() + '원');
        $('#modalPoint').text(point.toLocaleString() + '원');

        // 모달 열기
        $('#rentalConfirmModal').modal('show');
    }

    $('#agreeTerms').change(function() {
        $('#confirmRental').prop('disabled', !this.checked);
    });

    $('#confirmRental').click(function() {
        if($('#agreeTerms').is(':checked')) {
            let url = '${pageContext.request.contextPath}/rentcr/rentConfirm';
            let query = {
                strDate: $('#strDate').val(),
                endDate: $('#endDate').val(),
                rentNum: ${dto.rentNum},
                deposit: parseInt($('#modalDeposit').text().replace(/[^0-9]/g, '')),
                totalPrice: parseInt($('#modalTotalPrice').text().replace(/[^0-9]/g, ''))
            };

            const fn = function(data) {
                if(data.state === "success") {
                    $toast.innerText = '대여 신청이 완료되었습니다.';
                    $toast.classList.add('active');
                    setTimeout(() => {
                        $toast.classList.remove('active');
                    }, 2500);

                    // 버튼 변경
                    $('.btnChat')
                        .text('대기중(취소하기)')
                        .removeClass('btnChat')
                        .addClass('btnWaiting')
                        .css({
                            'background-color': '#FFA500',  // 노란색 (주황색)
                            'color': 'white'
                        })
                        .prop('disabled', false);  // 버튼 활성화

                    // 대여 신청 완료 후 추가 작업
                    disableRentalInputs();
                } else {
                    $toast.innerText = '대여 신청 중 오류가 발생했습니다.';
                    $toast.classList.add('active');
                    setTimeout(() => {
                        $toast.classList.remove('active');
                    }, 2500);
                }
            };

            ajaxFun(url, "post", query, "json", fn);
            $('#rentalConfirmModal').modal('hide');
        }
    });

    // 대여 입력 필드 비활성화 함수
    function disableRentalInputs() {
        $('#strDate, #endDate').prop('disabled', true);
        $('#totalRentalTime, #totalPrice').css('color', '#888');  // 회색으로 변경
    }

    // 대기중(취소하기) 버튼 클릭 이벤트
    $(document).on('click', '.btnWaiting', function() {
        if (confirm('대여 신청을 취소하시겠습니까?')) {
            // 여기에 대여 신청 취소 로직 추가
            cancelRental();
        }
    });

    // 대여 신청 취소 함수
    function cancelRental() {
        let url = '${pageContext.request.contextPath}/rentcr/cancelRent';
        let query = {
            rentNum: ${dto.rentNum}
        };

        const fn = function(data) {
            if(data.state === "success") {
                $toast.innerText = '대여 신청이 취소되었습니다.';
                $toast.classList.add('active');
                setTimeout(() => {
                    $toast.classList.remove('active');
                }, 2500);

                // 버튼을 원래대로 되돌리기
                $('.btnWaiting')
                    .text('신청하기')
                    .removeClass('btnWaiting')
                    .addClass('btnChat')
                    .css({
                        'background': '#ec433d',
                        'color': 'white'
                    });

                // 대여 입력 필드 활성화
                enableRentalInputs();
            } else {
                $toast.innerText = '대여 신청 취소 중 오류가 발생했습니다.';
                $toast.classList.add('active');
                setTimeout(() => {
                    $toast.classList.remove('active');
                }, 2500);
            }
        };

        ajaxFun(url, "post", query, "json", fn);
    }

    // 대여 입력 필드 활성화 함수
    function enableRentalInputs() {
        $('#strDate, #endDate').prop('disabled', false);
        $('#totalRentalTime, #totalPrice').css('color', '');  // 원래 색상으로 변경
    }
	
	$('.ajaxLike').click(function() {
		
		let $btn = $(this);
		let userLiked = $btn.hasClass('on');
		
		let url = '${pageContext.request.contextPath}/rent/insertLike';
		let query = 'num=' + ${dto.rentNum} + '&userLiked=' + !userLiked;
		
		// 토스트 팝업
		let $toast = document.querySelector('#toast_message');
		
		let $likeCount = document.querySelector('#likeCount');
		
		const fn = function(data) {
			let state = data.state;
			if(state === 'true') {
				let count = data.rentLikeCount;
				// $btn.closest('.list').find('.LikeCount').html('<i class="fa-solid fa-heart"></i>&nbsp;' + count);
				$likeCount.innerText = count;
				
                // 버튼 상태 토글
                $btn.toggleClass('on');
				
				// 토스트 팝업
				if(!userLiked) {
					$toast.innerText = '찜 목록에 추가되었습니다.';
					$btn.text('찜삭제');
				} else {
					$toast.innerText = '찜 목록에서 삭제되었습니다.';
					$btn.text('찜하기');
				}
				
				$toast.classList.add('active');
				setTimeout(() => {
					$toast.classList.remove('active');
				}, 2500);
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
	
	$(function() {
		$('.btn_like').click(function() {
			
			let $btn = $(this);
			let userLiked = $btn.hasClass('on');
			
			let url = '${pageContext.request.contextPath}/rent/insertLike';
			let num = $btn.next('input').val();
			let query = 'num=' + num + '&userLiked=' + userLiked;
			
			const fn = function(data) {
				let state = data.state;
				if(state === 'true') {
					let count = data.rentLikeCount;
					$btn.closest('.list').find('.LikeCount').html('<i class="fa-solid fa-heart"></i>&nbsp;' + count);
					
					// 토스트 팝업
					if(userLiked) {
						$toast.innerText = '찜 목록에 추가되었습니다.';
					} else {
						$toast.innerText = '찜 목록에서 삭제되었습니다.';
					}
					
					$toast.classList.add('active');
					setTimeout(() => {
						$toast.classList.remove('active');
					}, 2500);
				}
			};
			
			ajaxFun(url, 'post', query, 'json', fn);
		});
	});
	
	
	$('#carouselExampleIndicators img').click(function() {
        let slideIndex = $(this).data('slide-to');
        let modalCarousel = new bootstrap.Carousel('#modalCarousel');
        $('#modalCarousel').carousel(slideIndex);
        $('#imageModal').modal('show');
	});
	
    // 수정 버튼 클릭 이벤트
	$(".btnUpdate").click(function() {
	    let num = ${dto.rentNum};
	    let page = ${page};
	    let townNum = ${townNum};
	    let categoryNum = ${dto.categoryNum};
	    let url = "${pageContext.request.contextPath}/rent/update?num=" + num + "&page=" + page + "&townNum=" + townNum + "&categoryNum=" + categoryNum;
	    location.href = url;
	});

    // 삭제 버튼 클릭 이벤트
	$(".btnDelete").click(function() {
	    if(confirm("게시글을 삭제하시겠습니까?")) {
	        let num = ${dto.rentNum};
	        let page = ${page};
	        let townNum = ${townNum};
	        let url = "${pageContext.request.contextPath}/rent/delete?num=" + num + "&page=" + page + "&townNum=" + townNum;
	        location.href = url;
	    }
	});
    

    
	// 현재 날짜와 시간을 YYYY-MM-DDTHH:00 형식으로 반환하는 함수
	function getCurrentDateTime() {
	    var now = new Date();
	    return now.getFullYear() + '-' +
	           String(now.getMonth() + 1).padStart(2, '0') + '-' +
	           String(now.getDate()).padStart(2, '0') + 'T' +
	           String(now.getHours()).padStart(2, '0') + ':' +
	           String(now.getMinutes()).padStart(2, '0');
	}
    
	function updateMinDateTime() {
	    var currentDateTime = getCurrentDateTime();
	    $('#strDate').attr('min', currentDateTime);
	    
	    var selectedDateTime = $('#strDate').val();
	    if (selectedDateTime && selectedDateTime < currentDateTime) {
	        $('#strDate').val(currentDateTime);
	    }
	}

	// 날짜를 YYYY-MM-DDTHH:00 형식으로 변환하는 함수
	function formatDateToHourString(date) {
	    return date.getFullYear() + '-' +
	           String(date.getMonth() + 1).padStart(2, '0') + '-' +
	           String(date.getDate()).padStart(2, '0') + 'T' +
	           String(date.getHours()).padStart(2, '0') + ':00';
	}

	// 시작 날짜의 최소값을 현재 시간으로 설정
    $('#strDate').attr('min', getCurrentDateTime());

 	// 총 대여 시간과 금액을 계산하는 함수
    function calculateTotalTimeAndPrice() {
        var startDate = new Date($('#strDate').val());
        var endDate = new Date($('#endDate').val());
        
        // 시작 날짜와 종료 날짜가 모두 선택되었고, 종료 날짜가 시작 날짜보다 나중일 때만 계산 진행
        if (startDate && endDate && endDate > startDate) {
            var diff = endDate - startDate;
            var days = Math.floor(diff / (1000 * 60 * 60 * 24));
            var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var timeString = "";
            if (days > 0) {
                timeString += days + "일 ";
            }
            timeString += hours + "시간";
            $('#totalRentalTime').text(timeString).show();

            // 총 금액 계산
            var totalPrice = calculatePrice(days, hours);
            if (totalPrice !== null) {
                $('#totalPrice').text(totalPrice.toLocaleString() + '원').show();
                $('#totalPrice2').show();
                $('#totalRentalTime2').show();
            } else {
                hideAllPriceElements();
            }
        } else {
            hideAllPriceElements();
        }
    }

    // 모든 가격 관련 요소를 숨기는 함수
    function hideAllPriceElements() {
        $('#totalRentalTime').hide();
        $('#totalRentalTime2').hide();
        $('#totalPrice').hide();
        $('#totalPrice2').hide();
    }

    function calculatePrice(days, hours) {
        var mPrice = ${dto.mPrice};
        var wPrice = ${dto.wPrice};
        var dPrice = ${dto.dPrice};
        var hPrice = ${dto.hPrice};

        var totalPrice = 0;
        var totalHours = days * 24 + hours;

        // 최소 대여 기간 체크
        var minRentalPeriod = getMinRentalPeriod();
        if (totalHours < minRentalPeriod) {
            var minPeriodMessage = formatMinRentalPeriod(minRentalPeriod);
            alert("최소 대여 기간은 " + minPeriodMessage + " 입니다.");
            $('#endDate').val("");
            return null;
        }
        
        var monthCount;
        var weekCount;
        var dayCount;

        // 30일(월) 단위 계산
        if (mPrice > 0 && totalHours >= 30 * 24) {
            monthCount = Math.floor(totalHours / (30 * 24));
            totalPrice += monthCount * mPrice;
            totalHours %= (30 * 24);
        } else if (wPrice > 0 && totalHours >= 7 * 24) {
        	// 주단위 계산
            weekCount = Math.floor(totalHours / (7 * 24));
            totalPrice += weekCount * wPrice;
            totalHours %= (7 * 24);
        } else if (dPrice > 0 && totalHours >= 24) {
        	// 일단위 계산
            dayCount = Math.floor(totalHours / 24);
            totalPrice += dayCount * dPrice;
            totalHours %= 24;
        }
        
        // 남은 시간에 대한 계산
        if (totalHours > 0) {
            if (mPrice > 0 && monthCount > 0) {
            	totalPrice += (totalHours * (mPrice / (30 * 24)));
            } else if (wPrice > 0 && weekCount > 0) {
                totalPrice += (totalHours * (wPrice / (7 * 24)));
            } else if (dPrice > 0 && dayCount > 0) {
                totalPrice += (totalHours * (dPrice / 24));
            } else if (hPrice > 0) {
            	totalPrice += totalHours * hPrice;
            }
        }

        return Math.round(totalPrice);
    }

    function getMinRentalPeriod() {
        if (${dto.hPrice} > 0) return 1;
        if (${dto.dPrice} > 0) return 24;
        if (${dto.wPrice} > 0) return 7 * 24;
        if (${dto.mPrice} > 0) return 30 * 24;
        return 0;
    }

    function formatMinRentalPeriod(hours) {
        if (hours >= 30 * 24) return "30일";
        if (hours >= 7 * 24) return "7일";
        if (hours >= 24) return "1일";
        return hours + "시간";
    }
    
    updateMinDateTime();
    setInterval(updateMinDateTime, 60000);

    $('#strDate').on('change', function() {
        var selectedStartDate = new Date($(this).val());
        var currentDateTime = new Date();
        var selectedEndDate = new Date($('#endDate').val());
        
        if (selectedStartDate < currentDateTime) {
            $(this).val(getCurrentDateTime());
            selectedStartDate = new Date($(this).val());
        } else {
            $(this).val(formatDateToHourString(selectedStartDate));
            selectedStartDate = new Date($(this).val());
        }

        if(selectedStartDate) {
            $('#endDateContainer').show();
            $('#endDate').attr('min', formatDateToHourString(new Date(selectedStartDate.getTime() + 60 * 60 * 1000)));
            
            // 시작 시간이 종료 시간 이후인 경우 종료 시간을 초기화
            if (selectedEndDate && selectedStartDate >= selectedEndDate) {
                $('#endDate').val('');
                
				$toast.innerText = '종료 시간을 다시 설정해주세요.';
				$toast.classList.add('active');
				setTimeout(() => {
					$toast.classList.remove('active');
				}, 2500);
            }
            
            calculateTotalTimeAndPrice();
        } else {
            $('#endDateContainer').hide();
            hideAllPriceElements();
        }
    });
    
 	// 날짜를 YYYY-MM-DDTHH:mm 형식으로 변환하는 함수
    function formatDateToMinuteString(date) {
        return date.getFullYear() + '-' +
               String(date.getMonth() + 1).padStart(2, '0') + '-' +
               String(date.getDate()).padStart(2, '0') + 'T' +
               String(date.getHours()).padStart(2, '0') + ':' +
               String(date.getMinutes()).padStart(2, '0');
    }

    // 종료 날짜가 변경될 때 이벤트
    $('#endDate').on('change', function() {
        var selectedEndDate = new Date($(this).val());
        $(this).val(formatDateToHourString(selectedEndDate));
        calculateTotalTimeAndPrice();
    });
    
	$('#writerPostsModal').on('show.bs.modal', function (e) {
	    // 모달이 열릴 때 탭 내용을 동적으로 생성
	    var tabs = {
	        'all': '전체',
	        'used': '중고거래',
	        'auction': '중고경매',
	        'rent': '빌려드림',
	        'borrow': '빌려줘요',
	        'talent': '재능마켓',
	        'daily': '나무일상',
	        'together': '나무모임',
	        'delivery': '배달해요'
	    };
	    var tabContent = '';
	    var navItems = '';
	    
	    // JSON 문자열을 JavaScript 객체로 파싱
	    var writerOtherPosts = JSON.parse('${writerOtherPostsJson}');
	    
	    Object.keys(tabs).forEach(function(key, index) {
	    	
	        navItems += '<li class="nav-item" role="presentation">' +
	            '<button class="nav-link ' + (index === 0 ? 'active' : '') + '" id="' + key + '-tab" data-bs-toggle="tab" ' +
	            'data-bs-target="#' + key + '" type="button" role="tab" aria-controls="' + key + '" ' +
	            'aria-selected="' + (index === 0 ? 'true' : 'false') + '">' + tabs[key] + '</button>' +
	            '</li>';
	        tabContent += '<div class="tab-pane fade ' + (index === 0 ? 'show active' : '') + '" id="' + key + '" role="tabpanel" aria-labelledby="' + key + '-tab">' +
	            '<ul class="list-group list-group-flush">';
	        
	            var postsInThisTab = writerOtherPosts.filter(function(post) {
	                return post.TABLENAME === key || key === 'all';
	            });
	            
	            var numParameter;
	            
	            if (postsInThisTab.length === 0) {
	                tabContent += '<li class="list-group-item">등록된 글이 없습니다.</li>';
	            } else {
	                postsInThisTab.forEach(function(post) {
	                	numParameter = (post.TABLENAME === 'auction' ? 'aNum=' : (post.TABLENAME === 'together' ? 'tNum=' : 'num='));
	                    tabContent += '<li class="list-group-item">' +
	                        '<a href="${pageContext.request.contextPath}/' + post.TABLENAME + '/article?' + numParameter + post.NUM + '" class="text-decoration-none">' +
	                        '[' + tabs[post.TABLENAME] + '] ' + post.SUBJECT +
	                        '</a>' +
	                        '</li>';
	                });
	            }
	        
	        tabContent += '</ul></div>';
	    });
	    $('#writerPostsTabs').html(navItems);
	    $('#writerPostsTabContent').html(tabContent);
	});
});

</script>
<c:import url="/WEB-INF/views/liveChat/chatClient.jsp" />















