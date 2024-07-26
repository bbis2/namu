<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">


$(function() {
	
	$('.sortMethod').click(function() {
		$('.sortSelected').removeClass('sortSelected');
		$(this).addClass('sortSelected');
	});
	
	 $('input[name="kwd"]').keydown(function(event) {
	        if (event.keyCode === 13) {
	            event.preventDefault();
	            searchList();
	        }
	    });
	
});

function searchList() {
	var f = document.searchForm;
	f.submit();
}

function filterByTown() {
    document.getElementById("townFilterForm").submit();
}


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
		
		let url = '${pageContext.request.contextPath}/talent/insertLike';
		let num = $btn.next('input').val();
		let query = 'tboardNum=' + num + '&userLiked=' + userLiked;
		
		// 토스트 팝업
		let $toast = document.querySelector('#toast_message');
		
		const fn = function(data) {
			let state = data.state;
			if(state === 'true') {
				let count = data.talentLikeCount;
				$btn.closest('.list').find('.talentLikeCount').html('<i class="fa-solid fa-heart"></i>&nbsp;' + count);
				
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


<style type="text/css">

.sortMethod { }

.sortSelected { color: tomato;}

 .custom-button {
      background-color: #d7bfff;
      color: white;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
      font-size: 16px;
  }

.category-tabs {
    display: flex;
    justify-content: space-around;
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 10px;
    margin-bottom: 20px;
}

.category-content {
    display: none;
}

.category-content.active {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.category-content img {
    max-width: 50px;
    max-height: 50px;
    margin-bottom: 10px;
}

.category-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 20px;
    padding: 10px;
}

.category-container {
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    background-color: #fff;
}

.btn-category {
    background-color: #f8f9fa;
    border: none;
    padding: 15px 30px;
    border-radius: 10px;
    cursor: pointer;
}

.categoryName{
margin : 0; 
display: flex;
color: #8B00FF;
}

.price{
margin : 0;
display: flex;  
color: black;
font-weight: bold;
font-size: 25px;
}
.btn-category.active {
    background-color: #e0e0e0;
}

.category-item.active {
    background-color: #e0e0e0;
    border-radius: 10px;
}

.highlighted-text {
    color: #8B00FF;
    font-weight: bold;
}

.flex{
margin : 0;
display: flex;
justify-content: space-between;
}
</style>

<div class="container">

	<section class="fleamarket-cover" style="background-color: #f0e5ff;">
		<h1 class="cover-title htext bd">
			우리 동네 재능마켓<br>함께 나눠요
		</h1>
		<span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>
		<span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
		<div class="cover-image"></div>
	</section>

	<div class="row">
		<div class="col-4">
			<div class="row">
				<div class="col">
					
					 <form id="townFilterForm" action="${pageContext.request.contextPath}/talent/list" method="get">
					 
					<h6 class="bd">나의 동네</h6>
					<select name="town" class="form-select mb-4 border border-2" aria-label="Default select example" onchange="filterByTown()">
						 <c:if test="${sessionScope.member.userId == null}">
						 	<option selected>전체</option>
						 </c:if>
						 <c:if test="${sessionScope.member.userId != null}">	
							 <option value="${sessionScope.member.town1}" <c:if test="${town == sessionScope.member.town1}">selected</c:if>>${sessionScope.member.town1}</option>
					            <c:if test="${sessionScope.member.town2 != null}">
					                <option value="${sessionScope.member.town2}" <c:if test="${town == sessionScope.member.town2}">selected</c:if>>${sessionScope.member.town2}</option>
					            </c:if>
					            </c:if>
						</select>
		
					 </form>
				</div>
			</div>
			<div class="d-flex">
				<h5>
					<c:if test="${sessionScope.member.userId != null}">
				    [${town}] 동네의
				    </c:if> 
				    <span class="highlighted-text">${categoryNum==0 ? "전체" : category.categoryName}</span> 
				    상품
				</h5>
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
						<input type="hidden" name="town" value="${town}">
						<input type="hidden" name="categoryNum" value="${categoryNum}">
						<button class="btn custom-button" type="button" onclick="searchList()">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<div class="col-2">
					<h6>&nbsp;</h6>
					<button class="btn custom-button w-100" onclick="location.href='${pageContext.request.contextPath}/talent/write';">글올리기</button>
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
<div class="category-container">
    <div class="category-tabs">
    	 <button class="btn-category" data-category="all" data-value="0">전체보기</button>
        <button class="btn-category" data-category="business">비즈니스</button>
        <button class="btn-category" data-category="career">N잡·커리어</button>
        <button class="btn-category" data-category="life">취미·생활</button>
        <button class="btn-category" data-category="enterprise">엔터프라이즈</button>
    </div>

    <div id="business" class="category-content active">
        <div class="category-item" data-value="1">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_1.png" alt="디자인">
            <strong>디자인</strong>
        </div>
        <div class="category-item" data-value="2">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_6.png" alt="IT·프로그래밍">
            <strong>IT·프로그래밍</strong>
        </div>
        <div class="category-item" data-value="3">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_7.png" alt="영상·사진·음향">
            <strong>영상·사진·음향</strong>
        </div>
        <div class="category-item" data-value="4">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_2.png" alt="마케팅">
            <strong>마케팅</strong>
        </div>
        <div class="category-item" data-value="5">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_3.png" alt="번역·통역">
            <strong>번역·통역</strong>
        </div>
        <div class="category-item" data-value="6">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_4.png" alt="문서·글쓰기">
            <strong>문서·글쓰기</strong>
        </div>
        <div class="category-item" data-value="7">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_8.png" alt="창업·사업">
            <strong>창업·사업</strong>
        </div>
        <div class="category-item" data-value="8">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_11.png" alt="주문제작">
            <strong>주문제작</strong>
        </div>
        <div class="category-item" data-value="9">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_14.png" alt="세무·법무·노무">
            <strong>세무·법무·노무</strong>
        </div>
    </div>

    <div id="career" class="category-content">
        <div class="category-item" data-value="10">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_12.png" alt="취업·입시">
            <strong>취업·입시</strong>
        </div>
        <div class="category-item" data-value="11">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_13.png" alt="투잡·노하우">
            <strong>투잡·노하우</strong>
        </div>
        <div class="category-item" data-value="12">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_10.png" alt="직무역량 레슨">
            <strong>직무역량 레슨</strong>
        </div>
    </div>

    <div id="life" class="category-content">
        <div class="category-item" data-value="13">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_9.png" alt="운세">
            <strong>운세</strong>
        </div>
        <div class="category-item" data-value="14">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_17.png" alt="심리상담">
            <strong>심리상담</strong>
        </div>
        <div class="category-item" data-value="15">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_15.png" alt="취미 레슨">
            <strong>취미 레슨</strong>
        </div>
        <div class="category-item" data-value="16">
            <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/modules/directories/white/ic_category_16.png" alt="생활서비스">
            <strong>생활서비스</strong>
        </div>
    </div>

    <div id="enterprise" class="category-content">
        <div class="category-item" data-value="17">
            <img src="https://static.cdn.kmong.com/assets/enterprise/desktop/building.png" alt="엔터프라이즈">
            <strong>엔터프라이즈</strong>
        </div>
    </div>
</div>

<form id="categoryFilterForm" action="${pageContext.request.contextPath}/talent/list" method="get" style="display: none;">
    <input type="hidden" name="categoryNum" id="categoryNum">
    <input type="hidden" name="town" value="${town}">
</form>

  <script type="text/javascript">
  $(document).ready(function() {
	  
	    var currentCategory = ${categoryNum};

	    function showCategoryContent(category) {
	        $('.category-content').removeClass('active').hide();
	        $('#' + category).addClass('active').show();
	    }

	    // 초기 로딩 시 카테고리 설정
	    if (currentCategory == 0) {
	        $('.category-content').hide(); // 전체보기일 때 모든 카테고리 콘텐츠 숨기기
	    } else {
	        $('.btn-category[data-value="' + currentCategory + '"]').addClass('active');
	        showCategoryContent($('.btn-category[data-value="' + currentCategory + '"]').data('category'));
	    }

	    $('.btn-category').click(function() {
	        $('.btn-category').removeClass('active');
	        $(this).addClass('active');
	        
	        var category = $(this).data('category');
	        showCategoryContent(category);

	        if ($(this).data('value') !== undefined) {
	            var categoryValue = $(this).data('value');
	            $('#categoryNum').val(categoryValue);
	            $('#categoryFilterForm').submit();
	        }
	    });

	    $('.category-item').click(function() {
	        $('.category-item').removeClass('active');
	        $(this).addClass('active');

	        var categoryValue = $(this).data('value');
	        $('#categoryNum').val(categoryValue);
	        $('#categoryFilterForm').submit();
	    });
	});
    </script>

	 

	<div class="row align-items-start mb-3">
	
		  <c:forEach var="dto" items="${list}" varStatus="status">
		<div class="mt-4 col-lg-20 col-md-3 col-sm-6 list">
			<div>
				<div class="overflow-hidden border mb-2 ratio ratio-1x1">
				 <c:choose>
				    <c:when test="${dto.thumbnail != null && !dto.thumbnail.isEmpty()}">
						<img class="img-fluid object-fit-cover h-100" alt="" src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" onclick="location.href='${articleUrl}&num=${dto.tboardNum}';">
					</c:when>
					<c:otherwise>
                        <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="img-fluid object-fit-cover h-100" onclick="location.href='${articleUrl}&num=${dto.tboardNum}';">
                    </c:otherwise>
		         </c:choose>
		         <c:if test="${sessionScope.member.userId != null}">
					<button type="button" class="btn_like btnSendLike ${dto.userLiked? 'on' : ''}" title="찜하기">
						like
					</button>
					<input type="hidden" value="${dto.tboardNum}" class="likeTboardNum">
				</c:if>
				</div>
				
				<a href="${articleUrl}&num=${dto.tboardNum}" class="listTitle" style="display: flex;"> <h5> ${dto.subject} </h5></a>
               
               			<div class="flex">
                		<p class="price" ><fmt:formatNumber value="${dto.price}"/>원</p>
                        <p class="categoryName" style="margin-left: auto; display: flex; align-items: center; color: #8B00FF;"><i class="bi bi-bookmark-star-fill"></i>${dto.categoryName}</p>
                   		</div>
                
				<a href="${pageContext.request.contextPath}/talent/profile?nickname=${dto.nickName}"><i class="fa-solid fa-circle-user"></i>&nbsp;${dto.nickName}</a>
				<div class="float-end"><i class="bi bi-clipboard-heart" style="color: red;"></i>&nbsp;${dto.type}</div> 
				<div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
					<p class="talentLikeCount"><i class="fa-solid fa-heart"></i>&nbsp;${dto.likeCount}</p>
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
	<div id="toast_message">찜 목록</div>
</div>






