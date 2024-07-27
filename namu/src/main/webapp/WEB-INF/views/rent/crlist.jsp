<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container mt-5 mb-5 pb-5">

	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">대여 신청 관리</h1>
		<span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>
		<span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
		<div class="cover-image"></div>
	</section>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="applicant-tab" data-bs-toggle="tab" data-bs-target="#applicant" type="button" role="tab" aria-controls="applicant" aria-selected="true">내 신청 목록</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="provider-tab" data-bs-toggle="tab" data-bs-target="#provider" type="button" role="tab" aria-controls="provider" aria-selected="false">받은 신청 목록</button>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="applicant" role="tabpanel" aria-labelledby="applicant-tab">
            <h3 class="mt-4">내 신청 목록</h3>
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
                            <td>${dto.subject}</td>
                            <td>${dto.rentName}</td>
                            <td>${dto.reqDate}</td>
                            <td>${dto.strDate} ~ ${dto.endDate}</td>
                            <td><fmt:formatNumber value="${dto.totalPrice}" pattern="#,###"/>원</td>
                            <td><fmt:formatNumber value="${dto.deposit}" pattern="#,###"/>원</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${dto.state == 1}"><span class="bd">대기</span></c:when>
                            		<c:when test="${dto.state == 2}"><span class="bd">수락</span></c:when>
                            		<c:when test="${dto.state == 3}"><span class="bd">거절</span><span>(보증금 반환 완료)</span></c:when>
                            		<c:when test="${dto.state == 4}"><span class="bd">취소</span><span>(보증금 반환 완료)</span></c:when>
                            		<c:when test="${dto.state == 5}"><span class="bd">완료</span><span>(보증금 반환 완료)</span></c:when>
                            	</c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${dto.state == 1}">
                                        <button class="btn btn-sm btn-danger cancel-btn" data-id="${dto.rentNum}">취소</button>
                                    </c:when>
                                    <c:when test="${dto.state == 2}">
                                        <button class="btn btn-sm btn-danger chat-btn" data-id="${dto.reqNum}">채팅하기</button>
                                    </c:when>
                                    <c:when test="${dto.state == 3}">
                                        <button class="btn btn-sm btn-danger rejectReason-btn" data-id="${dto.reject}">거절사유</button>
                                    </c:when>
                                    <c:when test="${dto.state == 5}">
                                        <button class="btn btn-sm btn-primary review-btn" data-id="${dto.reqNum}">후기 작성</button>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="tab-pane fade" id="provider" role="tabpanel" aria-labelledby="provider-tab">
            <h3 class="mt-4">받은 신청 목록</h3>
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
                            <td>${dto.subject}</td>
                            <td>${dto.borrowName}</td>
                            <td>${dto.reqDate}</td>
                            <td>${dto.strDate} ~ ${dto.endDate}</td>
                            <td><fmt:formatNumber value="${dto.totalPrice}" pattern="#,###"/>원</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${dto.state == 1}"><span class="bd">대기</span></c:when>
                            		<c:when test="${dto.state == 2}"><span class="bd">수락</span></c:when>
                            		<c:when test="${dto.state == 3}"><span class="bd">거절</span></c:when>
                            		<c:when test="${dto.state == 4}"><span class="bd">취소</span></c:when>
                            		<c:when test="${dto.state == 5}"><span class="bd">완료</span></c:when>
                            	</c:choose>
							</td>
                            <td>
                                <c:choose>
                                    <c:when test="${dto.state == 1}">
                                        <button class="btn btn-sm btn-success accept-btn" data-id="${dto.reqNum}">수락</button>
                                        <button class="btn btn-sm btn-danger reject-btn" data-id="${dto.reqNum}">거절</button>
                                    </c:when>
                                    <c:when test="${dto.state == 2}">
                                        <button class="btn btn-sm btn-primary chat-btn" data-id="${dto.reqNum}">채팅하기</button>
                                    </c:when>
                                    <c:when test="${dto.state == 5}">
                                        <button class="btn btn-sm btn-primary evaluate-btn" data-id="${dto.reqNum}">평가</button>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 모달 영역 -->
<!-- 리뷰 -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reviewModalLabel">후기 작성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="reviewForm">
                    <input type="hidden" id="reviewApplicationId" name="applicationId">
                    <div class="mb-3">
                        <label for="reviewContent" class="form-label">후기 내용</label>
                        <textarea class="form-control" id="reviewContent" name="content" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="reviewRating" class="form-label">평점</label>
                        <select class="form-select" id="reviewRating" name="rating" required>
                            <option value="">선택하세요</option>
                            <option value="5">5점</option>
                            <option value="4">4점</option>
                            <option value="3">3점</option>
                            <option value="2">2점</option>
                            <option value="1">1점</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="submitReview">제출</button>
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

    // 후기 작성 버튼 클릭 이벤트
    $('.review-btn').click(function() {
        var applicationId = $(this).data('id');
        $('#reviewApplicationId').val(applicationId);
        $('#reviewModal').modal('show');
    });

    // 후기 제출 버튼 클릭 이벤트
    $('#submitReview').click(function() {
        if($('#reviewForm')[0].checkValidity()) {
            var formData = $('#reviewForm').serialize();
            $.ajax({
                url: '${pageContext.request.contextPath}/rental/review',
                type: 'POST',
                data: formData,
                success: function(result) {
                    alert('후기가 등록되었습니다.');
                    $('#reviewModal').modal('hide');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('후기 등록 중 오류가 발생했습니다.');
                }
            });
        } else {
            $('#reviewForm')[0].reportValidity();
        }
    });

    // 수락 버튼 클릭 이벤트
    $('.accept-btn').click(function() {
        if(confirm('신청을 수락하시겠습니까?')) {
            var applicationId = $(this).data('id');
            $.ajax({
                url: '${pageContext.request.contextPath}/rental/accept/' + applicationId,
                type: 'POST',
                success: function(result) {
                    alert('신청이 수락되었습니다.');
                    location.reload();
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

    // 평가 버튼 클릭 이벤트
    $('.evaluate-btn').click(function() {
        var applicationId = $(this).data('id');
        $('#reviewApplicationId').val(applicationId);
        $('#reviewModalLabel').text('대여자 평가');
        $('#reviewModal').modal('show');
    });
});

</script>












