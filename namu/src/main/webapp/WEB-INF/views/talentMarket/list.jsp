<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">


$(function() {
	
	$('.sortMethod').click(function() {
		$('.sortSelected').removeClass('sortSelected');
		$(this).addClass('sortSelected');
	});
	
});

function searchList() {
	var f = document.searchForm;
	f.submit();
}

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
		<div class="col-4">
			<div class="row">
				<div class="col">
					<h6 class="bd">나의 동네</h6>
					<select class="form-select mb-4 border border-2" aria-label="Default select example">
						<option value="1">인천 중구</option>
						<option value="2">서울 마포구</option>
					</select>
				</div>
				<div class="col">
					<h6 class="bd">카테고리</h6>
					<select class="form-select mb-4 border border-2" aria-label="Default select example">
						<c:forEach var="vo" items="${listCategory}">
							<option value="${vo.categoryNum}">${vo.categoryName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="d-flex">
				<h5>[인천 중구] 카테고리의 전체 상품</h5>
				<h5 style="color: #b3b3b3;" class="bd">&nbsp;${dataCount}개</h5>
			</div>
		</div>
		<div class="col-8">
			<div class="row d-flex justify-content-end">
				<div class="col-7">
					<h6>&nbsp;</h6>
					<form class="d-flex" name="searchForm" method="GET" action="${pageContext.request.contextPath}/talent/list">
						<select name="schType" class="form-select">
											<option value="all" ${schType=="all"?"selected":""}>전체검색</option>
											<option value="subject"
												${schType=="subject"?"selected":""}>제목</option>
											<option value="regDate"
												${schType=="content"?"selected":""}>등록일</option>
											<option value="nickName" ${schType=="nickName"?"selected":""}>작성자</option>
											<option value="content"
												${schType=="subject"||schType=="content"?"selected":""}>제목+내용</option>
										</select>
						<input class="form-control border border-2" type="text" name="kwd" value="${kwd}" placeholder="검색어를 입력하세요"/>
						<h6>&nbsp;</h6>
						<button class="btn" type="button" onclick="searchList()">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<div class="col-2">
					<h6>&nbsp;</h6>
					<button class="btn w-100" onclick="location.href='${pageContext.request.contextPath}/talent/write';">글올리기</button>
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
	</div>


	<div class="row align-items-start mb-3">
	
		  <c:forEach var="dto" items="${list}" varStatus="status">
		<div class="col-lg-20 col-md-3 col-sm-6 list" onclick="location.href='${articleUrl}&num=${dto.tboardNum}';">
			<div>
				<div class="overflow-hidden border mb-2 ratio ratio-1x1">
				 <c:choose>
				    <c:when test="${dto.thumbnail != null && !dto.thumbnail.isEmpty()}">
						<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}">
					</c:when>
					<c:otherwise>
                        <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="img-fluid object-fit-cover h-100">
                    </c:otherwise>
		         </c:choose>
					<button class="btn_like">like</button>
				</div>
				<a href="${pageContext.request.contextPath}/" class="listTitle"> <h5 class="bd"> ${dto.subject}</h5> </a>
				<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;${dto.nickName}</a>
				<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
				<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
					<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
					<p><i class="fa-solid fa-eye"></i>&nbsp;${dto.hitCount}</p>
					<p><i class="fa-solid fa-clock"></i>&nbsp;${dto.daysDifference == 0 ? "오늘" : dto.daysDifference}${dto.daysDifference == 0 ?"":"일전"}</p>
				</div>
			</div>
		</div>
		</c:forEach>
		
		<div class="page-navigation mt-5">
					${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
				</div>
		
		
	</div>
	<!-- 게시글 리스트 끝 -->

</div>






