<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.btn {border: none;}

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
.unread-dot {
    width: 9px;
    height: 9px;
    background-color: red;
    border-radius: 50%;
    display: inline-block;
    margin-left: 7px;
    margin-top: 2px;
}
.fleamarket-cover {
    position: relative;
    width: 100%;
    height: 300px; /* 원하는 높이로 조정 */
    background-image: url('${pageContext.request.contextPath}/resources/images/borrowlist.PNG');
    background-size: cover;
    background-position: center 20%;
    background-repeat: no-repeat;
    overflow: hidden;
}

.cover-content {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;
    color: #eee;
    margin-left: 50px;
}
</style>

<script type="text/javascript">
$(function() {
	msg = ${msg};
	if(msg) {
		alert(msg);
		location.href = '${pageContext.request.contextPath}' + ${url};
	}
});
</script>


<div class="container mt-5 mb-5 pb-5">

	<section class="fleamarket-cover">
	    <div class="cover-content pt-5 mt-5">
        	<h1 class="bd">
           	 	빌려드림 신청 관리
        	</h1>
        	<h6>나의 신청 내역과 받은 신청 내역을 관리해요.</h6>
    	</div>
	</section>

	<ul class="nav nav-tabs custom-tabs" id="myTab" role="tablist">
	    <li class="nav-item" role="presentation">
	        <button class="nav-link active position-relative" id="applicant-tab" data-bs-toggle="tab" data-bs-target="#applicant" type="button" role="tab" aria-controls="applicant" aria-selected="true">
	            내 신청 목록
	            <span id="applicantTabDot" class="unread-dot d-none"></span>
	        </button>
	    </li>
	    <li class="nav-item" role="presentation">
	        <button class="nav-link position-relative" id="provider-tab" data-bs-toggle="tab" data-bs-target="#provider" type="button" role="tab" aria-controls="provider" aria-selected="false">
	            받은 신청 목록
	            <span id="providerTabDot" class="unread-dot d-none"></span>
	        </button>
	    </li>
	</ul>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="applicant" role="tabpanel" aria-labelledby="applicant-tab">
            <h3 class="mt-4">내 신청 목록</h3>
            <c:choose>
            	<c:when test="${myApplications.size() == 0}">
            		<div class="d-flex justify-content-center mt-5 pt-5">
						<h3 class="bd">신청 내역이 없어요.</h3>
					</div>
					<div class="d-flex justify-content-center mb-5 pb-5">
						<a href="${pageContext.request.contextPath}/rent/list"><h5 class="bd" style="color: #61ac2d;"> > 눌러서 대여 신청하러 가기 < </h5></a>
					</div>
            	</c:when>
            	<c:otherwise>
            		<div class="float-end" style="background: lightgray;">
            			<span class="bd">취소</span>, <span class="bd" style="color: red;">거절</span>, <span class="bd" style="color: green;">완료</span> 상태에서 자동으로 보증금이 반환됩니다.
            		</div>
		            <table class="table table-hover">
		                <thead>
		                    <tr>
		                        <th>신청 번호</th>
		                        <th>글제목</th>
		                        <th>제공자</th>
		                        <th>신청 일자</th>
		                        <th>대여 기간</th>
		                        <th>총 금액</th>
		                        <th>보증금</th>
		                        <th>상태</th>
		                        <th>액션</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="dto" items="${myApplications}">
		                        <tr>
		                            <td>${dto.reqNum}</td>
		                            <td>
		                            	<a href="${pageContext.request.contextPath}/rent/article?num=${dto.rentNum}">${dto.subject}</a>
		                            </td>
		                            <td>${dto.rentName}</td>
		                            <td>${dto.reqDate}</td>
		                            <td>${dto.strDate} ~ ${dto.endDate}</td>
		                            <td><fmt:formatNumber value="${dto.totalPrice}" pattern="#,###"/>원</td>
		                            <td><fmt:formatNumber value="${dto.deposit}" pattern="#,###"/>원</td>
		                            <td>
		                            	<c:choose>
		                            		<c:when test="${dto.state == 1}"><span class="bd" style="color: orange;">대기</span></c:when>
		                            		<c:when test="${dto.state == 2}"><span class="bd" style="color: blue;">수락</span></c:when>
		                            		<c:when test="${dto.state == 3}"><span class="bd" style="color: red;">거절</span><span></span></c:when>
		                            		<c:when test="${dto.state == 4}"><span class="bd">취소</span><span></span></c:when>
		                            		<c:when test="${dto.state == 5}"><span class="bd" style="color: green;">완료</span><span></span></c:when>
		                            	</c:choose>
		                            </td>
		                            <td>
		                                <c:choose>
		                                    <c:when test="${dto.state == 1}">
		                                        <button class="btn btn-sm btn-danger cancel-btn" data-id="${dto.rentNum}">취소</button>
		                                    </c:when>
											<c:when test="${dto.state == 2}">
											    <button class="btn btn-sm btn-danger chat-btn position-relative"
											            onclick="liveChatStart('rent-${dto.rentNum}', '${dto.rentId}', '${dto.rentName}');"
											            data-id="${dto.reqNum}">
											        채팅하기
											        <c:if test="${dto.hasUnreadMessages == 1}">
											            <span class="unread-dot position-absolute top-0 end-1 translate-middle"></span>
											        </c:if>
											    </button>
											</c:when>
		                                    <c:when test="${dto.state == 3}">
		                                        <button class="btn btn-sm btn-danger rejectReason-btn" data-id="${dto.reject}">거절사유</button>
		                                    </c:when>
		                                    <c:when test="${dto.state == 5}">
		                                    	<c:choose>
		                                    		<c:when test="${dto.userReview == 0 && dto.rentReview == 0}">
													    <button class="btn btn-sm btn-primary review-btn" data-id="${dto.reqNum}" data-target-user="${dto.rentId}" data-writeUser="borrower">제공자 후기</button>
													    <button class="btn btn-sm btn-success rent-review-btn" data-id="${dto.reqNum}">물품 후기</button>
		                                    		</c:when>
		                                    		<c:when test="${dto.userReview == 1 && dto.rentReview == 0}">
													    <div>제공자 후기 작성 완료</div>
													    <button class="btn btn-sm btn-success rent-review-btn" data-id="${dto.reqNum}">물품 후기</button>
		                                    		</c:when>
		                                    		<c:when test="${dto.userReview == 0 && dto.rentReview == 1}">
													    <button class="btn btn-sm btn-primary review-btn" data-id="${dto.reqNum}" data-target-user="${dto.rentId}" data-writeUser="borrower">제공자 후기</button>
													    <div>물품 후기 작성 완료</div>
		                                    		</c:when>
		                                    		<c:otherwise>
													    <div>제공자 후기 작성 완료</div>
													    <div>물품 후기 작성 완료</div>
		                                    		</c:otherwise>
		                                    	</c:choose>
		                                    </c:when>
		                                </c:choose>
		                            </td>
		                        </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
		            <c:import url="/WEB-INF/views/liveChat/chatClient.jsp"/>
            	</c:otherwise>
            </c:choose>
        </div>
        
        <div class="tab-pane fade" id="provider" role="tabpanel" aria-labelledby="provider-tab">
            <h3 class="mt-4">받은 신청 목록</h3>
            <c:choose>
            	<c:when test="${receivedRequests.size() == 0}">
            		<div class="d-flex justify-content-center mt-5 pt-5">
						<h3 class="bd">받은 신청이 없어요.</h3>
					</div>
					<div class="d-flex justify-content-center mb-5 pb-5">
						<a href="${pageContext.request.contextPath}/rent/write?townNum=1"><h5 class="bd" style="color: #61ac2d;"> > 눌러서 글쓰러 가기 < </h5></a>
					</div>
            	</c:when>
            	<c:otherwise>
		            <table class="table table-hover">
		                <thead>
		                    <tr>
		                        <th>신청번호</th>
		                        <th>글제목</th>
		                        <th>신청자</th>
		                        <th>신청 일자</th>
		                        <th>대여 기간</th>
		                        <th>총 금액</th>
		                        <th>상태</th>
		                        <th>액션</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="dto" items="${receivedRequests}">
		                        <tr>
		                            <td>${dto.reqNum}</td>
		                            <td>
		                            	<a href="${pageContext.request.contextPath}/rent/article?num=${dto.rentNum}">${dto.subject}</a>
		                            </td>
		                            <td>${dto.borrowName}</td>
		                            <td>${dto.reqDate}</td>
		                            <td>${dto.strDate} ~ ${dto.endDate}</td>
		                            <td><fmt:formatNumber value="${dto.totalPrice}" pattern="#,###"/>원</td>
		                            <td>
		                            	<c:choose>
		                            		<c:when test="${dto.state == 1}"><span class="bd" style="color: orange;">대기</span></c:when>
		                            		<c:when test="${dto.state == 2}"><span class="bd" style="color: blue;">수락</span></c:when>
		                            		<c:when test="${dto.state == 3}"><span class="bd" style="color: red;">거절</span></c:when>
		                            		<c:when test="${dto.state == 4}"><span class="bd">취소</span></c:when>
		                            		<c:when test="${dto.state == 5}"><span class="bd" style="color: green;;">완료</span></c:when>
		                            	</c:choose>
									</td>
		                            <td>
		                                <c:choose>
		                                    <c:when test="${dto.state == 1}">
		                                        <button class="btn btn-sm btn-success accept-btn" data-id="${dto.reqNum}">수락</button>
		                                        <button class="btn btn-sm btn-danger reject-btn" data-id="${dto.reqNum}">거절</button>
		                                    </c:when>
											<c:when test="${dto.state == 2}">
											    <button class="btn btn-sm btn-danger chat-btn position-relative"
											            onclick="liveChatStart('rent-${dto.rentNum}', '${dto.rentId}', '${dto.rentName}');"
											            data-id="${dto.reqNum}">
											        채팅하기
											        <c:if test="${dto.hasUnreadMessages == 1}">
											            <span class="unread-dot position-absolute top-0 end-2 translate-middle"></span>
											        </c:if>
											    </button>
		                                        <button class="btn btn-sm btn-danger finish-btn" data-id="${dto.reqNum}">반납완료</button>
											</c:when>
		                                    <c:when test="${dto.state == 5}">
		                                    	<c:choose>
		                                    		<c:when test="${dto.borrowerReview == 0}">
				                                        <button class="btn btn-sm btn-primary evaluate-btn" data-id="${dto.reqNum}" data-target-user="${dto.rentId}" data-write-user="renter">대여자 후기</button>
		                                    		</c:when>
		                                    		<c:otherwise>
		                                    			<div>대여자 후기 작성 완료</div>
		                                    		</c:otherwise>
		                                    	</c:choose>
		                                    </c:when>
		                                </c:choose>
		                            </td>
		                        </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
		            <c:import url="/WEB-INF/views/liveChat/chatOwner.jsp"/>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- 모달 영역 -->

<!-- 사용자 후기 모달 -->
<div class="modal fade" id="userReviewModal" tabindex="-1" aria-labelledby="userReviewModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userReviewModalLabel">사용자 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="userReviewForm">
          <input type="hidden" id="userReviewReqNum" name="reqNum">
          <input type="hidden" id="userReviewTargetUserId" name="targetUserId">
          <input type="hidden" id="userReviewWriter" name="writeUser">
          <div class="mb-3">
            <label class="form-label">전체 평가</label>
            <div class="btn-group" role="group">
              <input type="radio" class="btn-check" name="overallRating" id="btnradio1" value="best" autocomplete="off">
              <label class="btn btn-outline-primary" for="btnradio1">최고였어요</label>
              <input type="radio" class="btn-check" name="overallRating" id="btnradio2" value="good" autocomplete="off">
              <label class="btn btn-outline-primary" for="btnradio2">좋았어요</label>
              <input type="radio" class="btn-check" name="overallRating" id="btnradio3" value="bad" autocomplete="off">
              <label class="btn btn-outline-primary" for="btnradio3">별로였어요</label>
            </div>
          </div>
          <div id="subRatingOptions" class="mb-3">
            <!-- 하위 평가 옵션은 JavaScript로 동적 생성 -->
          </div>
          <div class="mb-3">
            <label for="userReviewContent" class="form-label">상세 후기</label>
            <textarea class="form-control" id="userReviewContent" name="content" rows="3"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="submitUserReview">제출</button>
      </div>
    </div>
  </div>
</div>

<!-- 대여 물품 후기 모달 -->
<div class="modal fade" id="rentReviewModal" tabindex="-1" aria-labelledby="rentReviewModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="rentReviewModalLabel">대여 물품 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="rentReviewForm">
          <input type="hidden" id="rentReviewReqNum" name="reqNum">
          <div class="mb-3">
            <label class="form-label">평가</label>
            <div class="btn-group" role="group">
              <input type="radio" class="btn-check" name="wasGood" id="rentGood" value="1" autocomplete="off">
              <label class="btn btn-outline-primary" for="rentGood">좋았어요</label>
              <input type="radio" class="btn-check" name="wasGood" id="rentBad" value="0" autocomplete="off">
              <label class="btn btn-outline-primary" for="rentBad">별로였어요</label>
            </div>
          </div>
          <div class="mb-3">
            <label for="rentReviewContent" class="form-label">상세 후기</label>
            <textarea class="form-control" id="rentReviewContent" name="content" rows="3"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="submitRentReview">제출</button>
      </div>
    </div>
  </div>
</div>

<!-- 거절 사유 제출 -->
<div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rejectModalLabel">거절 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="rejectForm">
                    <input type="hidden" id="rejectApplicationId" name="reqNum">
                    <div class="mb-3">
                        <label for="rejectReason" class="form-label">거절 사유</label>
                        <textarea class="form-control" id="rejectReason" name="rejectReason" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="submitReject">제출</button>
            </div>
        </div>
    </div>
</div>

<!-- 거절 사유 조회 -->
<div class="modal fade" id="rejectReasonModal" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rejectModalLabel">거절 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                	<div id="reject"></div>
                </div>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>

$(document).ready(function() {
    // 채팅 버튼 클릭 이벤트
    $('.chat-btn').click(function() {
        $(this).find('.unread-dot').remove();
        updateTabDots();
    });

    // 탭의 빨간 점 업데이트 함수
    function updateTabDots() {
        let applicantHasUnread = $('#applicant .unread-dot').length > 0;
        let providerHasUnread = $('#provider .unread-dot').length > 0;

        $('#applicantTabDot').toggleClass('d-none', !applicantHasUnread);
        $('#providerTabDot').toggleClass('d-none', !providerHasUnread);
    }

    // 초기 탭 빨간 점 설정
    updateTabDots();
	
    // 탭 클릭 이벤트
    $('.nav-link').on('click', function (e) {
        // 클릭한 탭의 id를 로컬 스토리지에 저장
        localStorage.setItem('activeTab', $(e.target).attr('id'));
    });

    // 페이지 로드 시 저장된 탭 확인
    var activeTab = localStorage.getItem('activeTab');

    // 저장된 탭이 있으면 해당 탭 활성화
    if(activeTab){
        $('#' + activeTab).tab('show');
    }

    // 취소 버튼 클릭 이벤트
    $('.cancel-btn').click(function() {
        if(confirm('정말 취소하시겠습니까?')) {
            var rentNum = $(this).data('id');
            
            // AJAX 요청으로 취소 처리
            $.ajax({
                url: '${pageContext.request.contextPath}/rentcr/cancelRent?rentNum=' + rentNum,
                type: 'POST',
                data: rentNum,
                success: function(data) {
                    alert('취소되었습니다.');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('취소 처리 중 오류가 발생했습니다.');
                }
            });
        }
    });

    // 사용자 후기 버튼 클릭 이벤트 (대여 요청자)
    $('.review-btn').click(function() {
        var reqNum = $(this).data('id');
        var targetUserId = $(this).data('target-user');
        var writeUser = $(this).data('writeUser');
        $('#userReviewReqNum').val(reqNum);
        $('#userReviewTargetUserId').val(targetUserId);
        $('#userReviewWriter').val(writeUser);
        $('#userReviewModal').modal('show');
    });

    // 대여 물품 후기 버튼 클릭 이벤트 (대여 요청자)
    $('.rent-review-btn').click(function() {
        var reqNum = $(this).data('id');
        $('#rentReviewReqNum').val(reqNum);
        $('#rentReviewModal').modal('show');
    });
    
    // 평가 버튼 클릭 이벤트 (대여 제공자)
    $('.evaluate-btn').click(function() {
        var reqNum = $(this).data('id');
        var targetUserId = $(this).data('target-user');
        var writeUser = $(this).data('write-user');
        $('#userReviewReqNum').val(reqNum);
        $('#userReviewTargetUserId').val(targetUserId);
        $('#userReviewWriter').val(writeUser);
        $('#userReviewModal').modal('show');
    });
    
    // 사용자 후기 전체 평가 변경 시 하위 옵션 업데이트
    $('input[name="overallRating"]').change(function() {
        updateSubRatingOptions($(this).val());
    });

    // 사용자 후기 제출
    $('#submitUserReview').click(function() {
        submitUserReview();
    });

    // 대여 물품 후기 제출
    $('#submitRentReview').click(function() {
        submitRentReview();
    });
    
    function updateSubRatingOptions(rating) {
        var options = {
            best: [
                {name: 'good1', label: '시간 약속을 잘 지켜요'},
                {name: 'good2', label: '친절하고 매너가 좋아요'},
                {name: 'good3', label: '응답이 빨라요'}
            ],
            good: [
                {name: 'soso1', label: '시간 약속을 대체로 지켜요'},
                {name: 'soso2', label: '친절하고 매너가 괜찮아요'},
                {name: 'soso3', label: '응답이 빨라요'}
            ],
            bad: [
                {name: 'bad1', label: '시간 약속을 지키지 않아요'},
                {name: 'bad2', label: '불친절하고 매너가 좋지 않아요'},
                {name: 'bad3', label: '응답이 느려요'}
            ]
        };

        var html = '';
        options[rating].forEach(function(option) {
            html += '<div class="form-check">';
            html += '<input class="form-check-input" type="checkbox" name="' + option.name + '" id="' + option.name + '" value="1">';
            html += '<label class="form-check-label" for="' + option.name + '">' + option.label + '</label>';
            html += '</div>';
        });

        $('#subRatingOptions').html(html);
    }

    function submitUserReview() {
        var formData = $('#userReviewForm').serializeArray();
        var reviewData = {};
        
        // 모든 체크박스에 대해 0 또는 1 값 설정
        ['good1', 'good2', 'good3', 'soso1', 'soso2', 'soso3', 'bad1', 'bad2', 'bad3'].forEach(function(name) {
            reviewData[name] = '0';
        });

        formData.forEach(function(item) {
            if (item.name.startsWith('good') || item.name.startsWith('soso') || item.name.startsWith('bad')) {
                reviewData[item.name] = item.value;
            } else {
                reviewData[item.name] = item.value;
            }
        });
        
        $.ajax({
            url: '${pageContext.request.contextPath}/rentcr/submitUserReview',
            type: 'POST',
            data: reviewData,
            success: function(response) {
                if(response.state === "success") {
                    alert('후기가 성공적으로 제출되었습니다.');
                    $('#userReviewModal').modal('hide');
                    location.reload();
                } else {
                    alert('후기 제출에 실패했습니다: ' + response.message);
                }
            },
            error: function() {
                alert('후기 제출 중 오류가 발생했습니다.');
            }
        });
    }

    function submitRentReview() {
        var formData = $('#rentReviewForm').serialize();
        $.ajax({
            url: '${pageContext.request.contextPath}/rentcr/submitRentReview',
            type: 'POST',
            data: formData,
            success: function(response) {
                if(response.state === "success") {
                    alert('후기가 성공적으로 제출되었습니다.');
                    $('#rentReviewModal').modal('hide');
                    location.reload();
                } else {
                    alert('후기 제출에 실패했습니다: ' + response.message);
                }
            },
            error: function() {
                alert('후기 제출 중 오류가 발생했습니다.');
            }
        });
    }

    // 수락 버튼 클릭 이벤트
	$('.accept-btn').click(function() {
	    if(confirm('신청을 수락하시겠습니까?')) {
	        var reqNum = $(this).data('id');
	        $.ajax({
	            url: '${pageContext.request.contextPath}/rentcr/accept',
	            type: 'POST',
	            data: { reqNum: reqNum },
	            success: function(result) {
	                if(result.state === "success") {
	                    alert(result.message);
	                    location.reload();
	                } else {
	                    alert(result.message);
	                }
	            },
	            error: function(xhr, status, error) {
	                alert('수락 처리 중 오류가 발생했습니다.');
	            }
	        });
	    }
	});

    // 거절 사유 버튼 클릭 이벤트
    $('.rejectReason-btn').click(function() {
        var rejectReason = $(this).data('id');
        $('#reject').text(rejectReason);
        $('#rejectReasonModal').modal('show');
    });
    
    // 거절 버튼 클릭 이벤트
    $('.reject-btn').click(function() {
        var reqNum = $(this).data('id');
        $('#rejectApplicationId').val(reqNum);
        $('#rejectModal').modal('show');
    });

    // 거절 사유 제출 버튼 클릭 이벤트
    $('#submitReject').click(function() {
        if($('#rejectForm')[0].checkValidity()) {
            var formData = $('#rejectForm').serialize();
            $.ajax({
                url: '${pageContext.request.contextPath}/rentcr/reject',
                type: 'POST',
                data: formData,
                success: function(result) {
                    alert('신청이 거절되었습니다.');
                    $('#rejectModal').modal('hide');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('거절 처리 중 오류가 발생했습니다.');
                }
            });
        } else {
            $('#rejectForm')[0].reportValidity();
        }
    });
    
 	// 반납완료 버튼 클릭 이벤트
    $('.finish-btn').click(function() {
        if(confirm('대여를 완료 처리하시겠습니까? 보증금이 반환됩니다.')) {
            var reqNum = $(this).data('id');
            $.ajax({
                url: '${pageContext.request.contextPath}/rentcr/finishRent',
                type: 'POST',
                data: { reqNum: reqNum },
                success: function(result) {
                    if(result.state === "success") {
                        alert(result.message);
                        location.reload();
                    } else {
                        alert(result.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('완료 처리 중 오류가 발생했습니다.');
                }
            });
        }
    });

    // 평가 버튼 클릭 이벤트
    $('.evaluate-btn').click(function() {
        var applicationId = $(this).data('id');
        $('#reviewApplicationId').val(applicationId);
        $('#reviewModalLabel').text('대여자 평가');
        $('#reviewModal').modal('show');
    });
});

</script>












