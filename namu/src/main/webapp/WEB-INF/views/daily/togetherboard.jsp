<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">상세정보</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false">리뷰 <span class="title-reviewCount">(${dto.reviewCount})</span></button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false">문의사항 <span class="title-qnaCount">(${dto.questionCount})</span></button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane-4" type="button" role="tab" aria-controls="4" aria-selected="false">배송 및 환불정책</button>
		</li>
	</ul>

	
	<div class="tab-content pt-2" id="myTabContent">
		<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">${dto.productName}</p> 
				</div>
				<div class="mt-3 product-content">
					${dto.content}
			</div>
		</div>
		
		<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
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
						<label class="review-score">${dto.score} / 5</label> 
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

		<div class="tab-pane fade" id="tab-pane-3" role="tabpanel" aria-labelledby="tab-3" tabindex="0">
			<div class="mt-3 pt-3 border-bottom">
				<p class="fs-4 fw-semibold">상품 문의 사항</p> 
			</div>
	
			<div class="mt-3 p-2 text-end">
				<button type="button" class="btnMyQuestion btn btn-dark" ${empty sessionScope.member ? "disabled":""}> 내 Q&amp;A 보기  </button>
				<button type="button" class="btnQuestion btn btn-dark" ${empty sessionScope.member ? "disabled":""}> 상품 Q&amp;A 작성 </button>
			</div>
			<div class="mt-1 p-2 list-question"></div>
				<div class="tab-pane fade" id="tab-pane-4" role="tabpanel" aria-labelledby="tab-4" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">배송 및 환불정책</p> 
					</div>
					<div class="mt-3">
						<p> 배송 및 환불 정책 입니다. </p>
					</div>				
				</div>								
		</div>	
	</div>
	
	