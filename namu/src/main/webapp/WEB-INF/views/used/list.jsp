<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container body-container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			나무<br>중고거래
		</h1>
		<span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>
		<span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
		<div class="cover-image"></div>
	</section>


	<div class="row">
		<form class="d-flex" name="searchForm" id="searchForm" action="${pageContext.request.contextPath}/used/list" method="POST">
			<div class="col-4">
				<div class="row">
					<div class="col">
						<h6 class="bd">나의 동네</h6>
							<select class="form-select mb-4 border border-2" aria-label="Default select example" name="town" onchange="change();">
							    <option value="" ${town==''?'selected':''}>전체</option>
							    <option value="${sessionScope.member.town1}" ${town==sessionScope.member.town1?'selected':''}>${sessionScope.member.town1}</option>
							    <c:if test="${sessionScope.member.town2 != null}">
							        <option value="${sessionScope.member.town2}" ${town==sessionScope.member.town2?'selected':''}>${sessionScope.member.town2}</option>
						   		</c:if>
							</select>
					</div>
					<div class="col">
						<h6 class="bd">카테고리</h6>
						<select class="form-select mb-4 border border-2" aria-label="Default select example" name="cnum" onchange="change();">
							<option value="0" ${cnum==0?'selected':''}>전체</option>
							<c:forEach var="vo" items="${listCategory}">
								<option value="${vo.cnum}" ${cnum==vo.cnum?'selected':''}>${vo.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div style="margin-top: 10px;">총 <span style="color: blue; font-weight: bold;" class="data-count">${dataCount}</span> 개</div>
			</div>
			<div class="col-8">
				<div class="row d-flex justify-content-end">
					<div class="col-7" style="padding-right: 0;">
						<h6>&nbsp;</h6>
						<div class="d-flex">
							<input class="form-control border border-2" onkeypress="if( event.keyCode == 13 ){searchData();}" type="search" name="kwd" value="${kwd}" placeholder="검색어를 입력하세요"/>
							<h6>&nbsp;&nbsp;</h6>
							<button class="btn" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>&nbsp;&nbsp;
							<button class="btn reset" style="background-color: white; color: darkgreen;"  type="button" onclick="location.href='${pageContext.request.contextPath}/used/list';">
								<i class="fa-solid fa-rotate-right"></i>
							</button>
						</div>
					</div>
					<div class="col-2">
						<h6>&nbsp;</h6>
						<button type="button" class="write btn w-100" onclick="location.href='${pageContext.request.contextPath}/used/write';">글올리기</button>
					</div>
				</div>
			</div>
		</form>
	</div>


		<div class="flex-row" style="justify-content: space-between; align-items: center">
		</div>
	
		<div class="main-best-board-container1">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="flex-col banner-card-container">
				<div class="home-img-container">
				<a href="${pageContext.request.contextPath}/used/article?num=${dto.num}">
					<c:choose>
                        <c:when test="${dto.imageFile != null && !dto.imageFile.isEmpty()}">
                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" 
                                 src="${pageContext.request.contextPath}/uploads/photo/${dto.imageFile}">
                        </c:when>
                        <c:otherwise>
                            <img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" 
                                 src="${pageContext.request.contextPath}/resources/images/noimage.png">
                        </c:otherwise>
                    </c:choose>
				</a>
					<c:if test="${dto.userId != sessionScope.member.userId}">
						<button type="button" class="btn_like btnSendLike ${dto.userLiked ? 'on' : ''}" title="찜하기">
							like
						</button>
						<input type="hidden" value="${dto.num}" class="likeUsedNum">
					</c:if>
				</div>

				<div class="list-subject" style="color: navy; margin-top: 10px; font-weight: bold;">${dto.subject}</div>
				<div class="list-content" style="display: none;">${dto.content}</div>
				<div>판매가 : <fmt:formatNumber value="${dto.price}"/>원
					<div style="float: right;">
						<c:if test="${dto.state == 1}" >
							<span style="color: #D24F04; font-weight: bold;">예약중</span>
						</c:if>	
						<c:if test="${dto.state == 2}">
							<span style="color: #2E8B1F; font-weight: bold;">판매완료</span>
						</c:if>	
						<c:if test="${dto.state == 0}">
						</c:if>				
					</div>
				</div>
				<div class="half">조회수 ${dto.hitCount} &nbsp;|&nbsp; ${dto.regDate}</div>
			</div>
		</c:forEach>
		</div>
		
	</div>
	<div id="toast_message"></div>
	<div class="page-navigation">
		${dataCount==0? "등록된 게시글이 없습니다." : paging }
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

$(document).ready(function () {
    $('.search-btn').click(function () {
        let kwd = $('.searchInput').val().trim().toLowerCase();
        let count = 0; // 개수를 저장할 변수 초기화
        if (kwd) {
            $('.main-best-board-container1 .flex-col').each(function () {
                let subject = $(this).find('.list-subject').text().toLowerCase();
                let content = $(this).find('.list-content').text().toLowerCase();
                if (subject.includes(kwd) || content.includes(kwd)) {
                    $(this).show();
                    count++; // 검색된 것이 하나 생길 때마다 +1
                } else {
                    $(this).hide();
                }
            });
            document.querySelector('span.data-count').innerHTML = count; // 개수 표시
        } else {
            alert('검색어를 입력하세요.');
        }
    });
   
});

function change() {
	const f = document.searchForm;
	f.submit();
}


$(function() {
	$('.btnSendLike').click(function() {
		
		let $btn = $(this);
		let userLiked = $btn.hasClass('on');
		
		let url = '${pageContext.request.contextPath}/used/insertLike';
		let num = $btn.next('input').val();
		let query = 'num=' + num + '&userLiked=' + userLiked;
		
		// 토스트 팝업
		let $toast = document.querySelector('#toast_message');
		
		const fn = function(data) {
			let state = data.state;
			if(state === 'true') {
				
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

<style>
.main1 {
    background: #C3FF9A;
    height: 300px;
    width: 100%;
    margin-top: 80px;
    border-radius: 5px;
}

.main-best-board-container1 {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 15px;
}

.flex-col.banner-card-container1 {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}


.main-best-board-container1 div {
    overflow: hidden;
    position: relative;
}

 .main-best-board-container1 img {
    transition: 0.2s;
}

.search-container {
	padding: 10px 10px;
    display: flex;
    align-items: center;
    justify-content: flex-end; /* 오른쪽 정렬 */
}

.searchInput-container {
    text-align: center;
    align-content: center;
}

.searchInput {
    border: 1px solid #ccc;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 12px;
    outline: none;
    width: 120px; 
    height: 30px;
}

.search-btn{
 border: 1px solid #ccc;
 border-radius: 25px;
 font-size: 12px;
 outline: none;
 width: 60px; 
 height: 30px;
 text-align: center;
}

.searchInput::placeholder {
    color: #999;
}

.submit-button {
    background-color: #61ac2d;
    color: white;
    border: none;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 14px;
    margin-left: 10px;
    cursor: pointer;
    align-items: center;
    height: 30px;
    text-align: center;
    justify-content: center;
}

.submit-button span {
    margin-left: 5px;
}

.home-img-container {
   width: 100%;
   height: 200px;
   border-radius: 5px;
}

.cg-main {
    display: flex;
    flex-direction: row;
	transition: 0.2s;
	text-align: center;
	justify-content: center;
}

.cg-img {
	width: 64px;
	height: 64px;
}

.btn-cg {
	border: none;
	background-color: white;
	margin: 0 20px;
}

.cg-text {
text-align: center;
}

</style>