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

.btnSendLike:hover {
	background: #8a8a8a;
}
.btnSendLike.on {
	background: #8a8a8a;
}
.btnChat:hover {
	background: #ff2600;
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

</style>

<script type="text/javascript">
function searchList() {
	const form = document.searchForm;
	
	form.action = "${pageContext.request.contextPath}/borrow/list";
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
		<form class="d-flex w-100" id="searchForm" action="${pageContext.request.contextPath}/borrow/list" method="GET">
			<div class="col-3">
				<div>
					<h6>&nbsp;</h6>
					<h5><a style="color: #bfbfbf;" href="${pageContext.request.contextPath}/borrow/list?${query}">> [${dto.category}]의 모든 글 보기</a></h5>
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
						<p class="borrowLikeCount"><i class="fa-solid fa-heart"></i>&nbsp;<span id="likeCount">${dto.likeCount}</span></p>
						<p>|</p>
						<p><i class="fa-solid fa-eye"></i>&nbsp;${dto.hitCount}</p>
						<p>|</p>
						<p><i class="fa-solid fa-clock"></i>&nbsp;${dto.passedTime}</p>
					</div>
				</div>
				<div class=""><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.location}</div>	
				
				<div class="mt-5 pt-4">
					<div class="d-flex my-2">
						<h6 style="width: 130px; color: #ababab;">• 대여희망기간</h6>
						<h6>${dto.strDate} ~ ${dto.endDate}</h6>
					</div>
					<div class="d-flex my-2">
						<h6 style="width: 130px; color: #ababab;">• 희망금액</h6>
						<h6 class="bd">${dto.price}원</h6>
					</div>
				</div>
				
				<div class="mt-5 pt-3">
					<div class="d-flex justify-content-end gap-3">
						<c:choose>
							<c:when test="${dto.nickName.equals(sessionScope.member.nickName)}">
								<button type="button" class="btnUpdate btnSendLike">수정하기</button>
								<button type="button" class="btnDelete btnChat">삭제하기</button>
							</c:when>
							<c:otherwise>
								<button class="ajaxLike btnSendLike ${dto.userLiked ? 'on' : ''}">${dto.userLiked ? '찜삭제' : '찜하기'}</button>
								<button class="btnChat">채팅하기</button>
								<input type="hidden" value="${dto.borrowNum}" class="likeBorrowNum">
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
	                <h5 class="bd">본문</h5>
	                <hr class="mt-0 mb-2">
	                <div>
	                	${dto.content}
	                </div>
	            </div>
	        </div>
	        
	        <div class="col-md-4 profile card text-bg-light mb-4">
                <div class="mt-3">
                    <h5 class="bd">프로필</h5>
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
													<a href="${pageContext.request.contextPath}/${post.TABLENAME}/article?num=${post.NUM}" class="text-decoration-none">
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
						                        <button class="nav-link" id="borrow-tab" data-bs-toggle="tab" data-bs-target="#borrow" type="button" role="tab" aria-controls="borrow" aria-selected="false">빌림</button>
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
						<a href="${pageContext.request.contextPath}/borrow/write?townNum=${townNum}"><h5 class="bd" style="color: #61ac2d;"> > 눌러서 글쓰러 가기 < </h5></a>
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
				                                            <a href="${pageContext.request.contextPath}/borrow/article?num=${post.borrowNum}&${query}" class="listTitle">
				                                                <img class="thumbnail img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/uploads/album/${post.imageFilename}">
				                                            </a>
				                                            <c:if test="${!post.nickName.equals(sessionScope.member.nickName)}">
				                                                <button type="button" class="btn_like ${post.userLiked ? 'on' : ''}" title="찜하기">
				                                                    like
				                                                </button>
				                                                <input type="hidden" value="${post.borrowNum}" class="likeBorrowNum">
				                                            </c:if>
				                                        </div>
				                                        <a href="${pageContext.request.contextPath}/borrow/article?num=${post.borrowNum}&${query}" class="listTitle"><h5 class="bd">${post.subject}</h5></a>
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
				                                            <p class="borrowLikeCount"><i class="fa-solid fa-heart"></i>&nbsp;${post.likeCount}</p>
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
							<input type="hidden" name="postNum" value="${dto.borrowNum}">
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
	
	function moveToSlide(index) {
	    $('#carouselExampleIndicators').carousel(index);
	}
	
    var carouselElement = document.querySelector('#carouselExampleIndicators');
    var carousel = new bootstrap.Carousel(carouselElement, {
        interval: false // 자동 슬라이드 비활성화
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
	
	$('.ajaxLike').click(function() {
		
		let $btn = $(this);
		let userLiked = $btn.hasClass('on');
		
		let url = '${pageContext.request.contextPath}/borrow/insertLike';
		let query = 'num=' + ${dto.borrowNum} + '&userLiked=' + !userLiked;
		
		// 토스트 팝업
		let $toast = document.querySelector('#toast_message');
		
		let $likeCount = document.querySelector('#likeCount');
		
		const fn = function(data) {
			let state = data.state;
			if(state === 'true') {
				let count = data.borrowLikeCount;
				// $btn.closest('.list').find('.borrowLikeCount').html('<i class="fa-solid fa-heart"></i>&nbsp;' + count);
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
				}, 1500);
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
	
	$(function() {
		$('.btn_like').click(function() {
			
			let $btn = $(this);
			let userLiked = $btn.hasClass('on');
			
			let url = '${pageContext.request.contextPath}/borrow/insertLike';
			let num = $btn.next('input').val();
			let query = 'num=' + num + '&userLiked=' + userLiked;
			
			// 토스트 팝업
			let $toast = document.querySelector('#toast_message');
			
			const fn = function(data) {
				let state = data.state;
				if(state === 'true') {
					let count = data.borrowLikeCount;
					$btn.closest('.list').find('.borrowLikeCount').html('<i class="fa-solid fa-heart"></i>&nbsp;' + count);
					
					// 토스트 팝업
					if(userLiked) {
						$toast.innerText = '찜 목록에 추가되었습니다.';
					} else {
						$toast.innerText = '찜 목록에서 삭제되었습니다.';
					}
					
					$toast.classList.add('active');
					setTimeout(() => {
						$toast.classList.remove('active');
					}, 1500);
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
	    let num = ${dto.borrowNum};
	    let page = ${page};
	    let townNum = ${townNum};
	    let categoryNum = ${dto.categoryNum};
	    let url = "${pageContext.request.contextPath}/borrow/update?num=" + num + "&page=" + page + "&townNum=" + townNum + "&categoryNum=" + categoryNum;
	    location.href = url;
	});

    // 삭제 버튼 클릭 이벤트
	$(".btnDelete").click(function() {
	    if(confirm("게시글을 삭제하시겠습니까?")) {
	        let num = ${dto.borrowNum};
	        let page = ${page};
	        let townNum = ${townNum};
	        let url = "${pageContext.request.contextPath}/borrow/delete?num=" + num + "&page=" + page + "&townNum=" + townNum;
	        location.href = url;
	    }
	});
    
	$('#writerPostsModal').on('show.bs.modal', function (e) {
	    // 모달이 열릴 때 탭 내용을 동적으로 생성
	    var tabs = {
	        'all': '전체',
	        'used': '중고거래',
	        'auction': '경매',
	        'rent': '빌려드림',
	        'borrow': '빌려줘요',
	        'talent': '재능마켓',
	        'daily': '일상',
	        'togetherlist': '함께해요',
	        'delievery': '배달'
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
	            
	            if (postsInThisTab.length === 0) {
	                tabContent += '<li class="list-group-item">등록된 글이 없습니다.</li>';
	            } else {
	                postsInThisTab.forEach(function(post) {
	                    tabContent += '<li class="list-group-item">' +
	                        '<a href="${pageContext.request.contextPath}/' + post.TABLENAME + '/article?num=' + post.NUM + '" class="text-decoration-none">' +
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
