<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
function searchList() {
	const form = document.searchForm;
	
	form.action = "${pageContext.request.contextPath}/borrow/list";
	form.submit();
}

$(function() {
	
	$('.sortMethod').click(function() {
		$('.sortSelected').removeClass('sortSelected');
		$(this).addClass('sortSelected');
	});
	
	$('.write').click(function() {
		location.href = "${pageContext.request.contextPath}/borrow/write";
	});
	
});

</script>

<style type="text/css">

.sortMethod { }

.sortSelected { color: tomato;}

</style>

<div class="container">

	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			동네사람들<br>빌려줘요
		</h1>
		<span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>
		<span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
		<div class="cover-image"></div>
	</section>

	<div class="row">
		<form class="d-flex" id="searchForm" name="searchForm" action="${pageContext.request.contextPath}/borrow/list" method="GET">
			<div class="col-4">
				<div class="row">
					<div class="col">
						<h6 class="bd">나의 동네</h6>
						<select id="selectTown" class="form-select mb-4 border border-2" aria-label="Default select example" name="townNum" onchange="searchList();">
							<option value="1" ${townNum=="1" ? "selected" : "" }>${sessionScope.member.town1}</option>
							<c:if test="${sessionScope.member.town2 != null}">
								<option value="2" ${townNum=="2" ? "selected" : "" }>${sessionScope.member.town2}</option>
							</c:if>
						</select>
					</div>
					<div class="col">
						<h6 class="bd">카테고리</h6>
						<select class="form-select mb-4 border border-2" aria-label="Default select example" name="categoryNum" onchange="searchList();">
							<option value="0" ${categoryNum=="0" ? "selected" : ""}>전체</option>
							<c:forEach var="category" items="${category}">
								<option value="${category.categoryNum}" ${category.categoryNum==categoryNum ? "selected" : ""}>${category.category}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="d-flex">
					<h5 class="bd me-1">[${location}]&nbsp;</h5>
					<h5> > [${categoryName}] </h5>
					<c:choose>
						<c:when test="${kwd.length() == 0}">
							<h5> 의 전체 상품 </h5>						
						</c:when>
						<c:otherwise>
							<h5> 의 키워드 검색결과 </h5>						
						</c:otherwise>
					</c:choose>
					<h5 style="color: #b3b3b3;" class="bd">&nbsp;${dataCount}개</h5>
				</div>
			</div>
			<div class="col-8">
				<div class="row d-flex justify-content-end">
					<div class="col-7">
						<h6>&nbsp;</h6>
						<div class="d-flex">
							<input class="form-control border border-2" onkeypress="if( event.keyCode == 13 ){searchList();}" value="${kwd}" type="search" name="kwd" placeholder="검색어를 입력하세요"/>
							<h6>&nbsp;</h6>
							<button class="btn" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
					<div class="col-2">
						<a href="${pageContext.request.contextPath}/borrow/list"><h6 class="float-end">검색 새로고침</h6></a>
						<button type="button" class="write btn w-100 mb-4">글올리기</button>
					</div>
				</div>
				<div class="sortWrap d-flex float-end mt-4 gap-2">
					<h6><a class="sortMethod sortSelected" href="#">최신순</a></h6>
					<h6>|</h6>
					<h6><a class="sortMethod" href="#">오래된순</a></h6>
					<h6>|</h6>
					<h6><a class="sortMethod" href="#">인기순</a></h6>
				</div>
			</div>
		</form>
	</div>

	<!-- 게시글 리스트 시작 -->
	<div class="row align-items-start mb-3">
		<c:choose>
			<c:when test="${list.size() > 0}">
				<c:forEach var="dto" items="${list}">
					<div class="col-lg-20 col-md-3 col-sm-6 list">
						<div>
							<div class="overflow-hidden border mb-2 ratio ratio-1x1">
								<a href="${articleUrl}&num=${dto.borrowNum}" class="listTitle">
									<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/uploads/album/${dto.imageFilename}">
								</a>
								<button type="button" class="btn_like btnSendLike ${dto.userLiked ? 'on' : ''}" title="찜하기">
									like
								</button>
								<input type="hidden" value="${dto.borrowNum}" class="likeBorrowNum">
							</div>
							<a href="${articleUrl}&num=${dto.borrowNum}" class="listTitle"> <h5 class="bd">${dto.subject}</h5> </a>
							<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;${dto.nickName}</a>
							<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.location}</div>	
							<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
								<p class="borrowLikeCount"><i class="fa-solid fa-heart"></i>&nbsp;${dto.likeCount}</p>
								<p><i class="fa-solid fa-eye"></i>&nbsp;${dto.hitCount}</p>
								<p><i class="fa-solid fa-clock"></i>&nbsp;${dto.passedTime}</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="pt-4">
					${paging}
				</div>
			</c:when>
			<c:otherwise>
				<div class="d-flex justify-content-center mt-5 pt-5">
					<h3 class="bd">등록된 글이 없어요. 가장 먼저 등록해보세요!</h3>
				</div>
				<div class="d-flex justify-content-center mb-5 pb-5">
					<a href="${pageContext.request.contextPath}/borrow/write"><h5 class="bd" style="color: #61ac2d;"> > 눌러서 글쓰러 가기 < </h5></a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 게시글 리스트 끝 -->
	<div id="toast_message">찜 목록</div>
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
	$('.btnSendLike').click(function() {
		
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

</script>






