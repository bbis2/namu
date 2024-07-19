<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.sortMethod { }

.sortSelected { color: tomato;}
</style>

<script type="text/javascript">
function searchData() {
	location.href = "${pageContext.request.contextPath}/";
}

$(function() {
	
	$('.sortMethod').click(function() {
		$('.sortSelected').removeClass('sortSelected');
		$(this).addClass('sortSelected');
	});
	
	$('.write').click(function() {
		location.href = "${pageContext.request.contextPath}/rent/write";
	});
	
});
</script>


<div class="container">

	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			빌려드릴게요<br>동네사람들
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
						<option value="1">전체</option>
						<option value="2">의류</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-8">
			<div class="row d-flex justify-content-end">
				<div class="col-7">
					<h6>&nbsp;</h6>
					<form class="d-flex" id="searchForm" action="${pageContext.request.contextPath}/" method="GET">
						<input class="form-control border border-2" onkeypress="if( event.keyCode == 13 ){searchData();}" type="search" name="searchValue" placeholder="검색어를 입력하세요"/>
						<h6>&nbsp;</h6>
						<button class="btn" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<div class="col-2">
					<h6>&nbsp;</h6>
					<button class="btn w-100 write">글올리기</button>
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

	<!-- 게시글 리스트 시작 -->
	<div class="row align-items-start mb-3">
		<div class="col-lg-20 col-md-3 col-sm-6 list">
			<div class="overflow-hidden">
				<div class="overflow-hidden border mb-2 ratio ratio-1x1">
					<a href="${pageContext.request.contextPath}/rent/article" class="listTitle">
						<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/resources/images/camera.png">
					</a>
					<button class="btn_like">like</button>
				</div>
				<a href="${pageContext.request.contextPath}/rent/article" class="listTitle"> <h5>contax t3 빌려드립니다!!!!!!!!!!!!!!</h5> </a>
				<div>
					<h5 class="bd">1일 | 30,000원 ~</h5>
				</div>
				<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-circle-user"></i>&nbsp;나무조아</a>
				<div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;중산동</div>	
				<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
					<p><i class="fa-solid fa-heart"></i>&nbsp;7</p>
					<p><i class="fa-solid fa-eye"></i>&nbsp;789</p>
					<p><i class="fa-solid fa-clock"></i>&nbsp;3일전</p>
				</div>
			</div>
		</div>
		
	</div>
	<!-- 게시글 리스트 끝 -->

</div>






