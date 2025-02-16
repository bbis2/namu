<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.fleamarket-cover {
    position: relative;
    width: 100%;
    height: 300px; /* 원하는 높이로 조정 */
    background-image: url('${pageContext.request.contextPath}/resources/images/together.jpg');
    background-size: cover;
    background-position: center 20%;
    background-repeat: no-repeat;
    overflow: hidden;
}

.htext{
	padding-top: 100px;
	padding-left : 60px;
}
.cover-content {
	padding: 50px;
    position: relative;
    height: 100%;
    box-sizing: border-box;
    margin-left: 100px;
}

@media (min-width: 768px) {
    .fleamarket-cover {
        height: 315px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
        margin-bottom: 60px;
}
/*여기까지 초록 박스*/




.row {
    display: flex;
    flex-wrap: wrap;
}



.card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-body {
    text-align: center;
}

.card-title {
    font-size: 1.25rem;
    font-weight: bold;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
    margin-bottom: 10px;
}

.categories {
    display: flex;
    justify-content: space-around;
    padding: 10px;
    background-color: #EEF2E3;
    border-radius: 10px;
    margin-bottom: 50px;
}

.categories span {
    font-weight: bold;
}
.body-left {
	padding-bottom: 40px;
}

.filter-container {
    text-align: right;
    margin-bottom: 20px;
}

.filter-container select {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

.filter-container .search-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #FFFFFF;
    margin-right: 10px;
    width: 500px;
    height: 40px;
}

.filter-container .search-button {
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

.filter-container .search-button:hover {
    background-color: #4c3b2b;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 20px;
}

.grid-item {
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    border-radius: 4px;
    height: 150px;
}

.town {
  width: 150px;
  height: 30px;
  border: 1px solid #999;
  border-radius: 5px;
}

.togetherlist {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    gap: 21px;
    max-height: 80%;
    margin-bottom: 100px;
}

.togetherlist .list {
    flex: 1 1 30%;
    max-width: 30%;
    box-sizing: border-box;
    height: 350px; /* 고정된 높이 추가 */
    display: flex;
    flex-direction: column;
    padding: 10px; /* 패딩 추가 */
}

.togetherlist .list img {
    width: 100%;
    height: 200px; /* 고정된 이미지 높이 */
    object-fit: fill;
    margin-bottom: 10px; /* 이미지 아래 마진 추가 */
}

.togetherlist .list .listTitle, 
.togetherlist .list .listDescription {
    flex: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

@media (max-width: 768px) {
    .togetherlist .list {
        flex: 1 1 45%; /* 2개의 항목을 한 줄에 배치 */
        max-width: 45%;
    }
}

@media (max-width: 480px) {
    .togetherlist .list {
        flex: 1 1 100%; /* 1개의 항목을 한 줄에 배치 */
        max-width: 100%;
    }
}

.myphoto {
 	width: 50px; 
    height: 50px; 
    object-fit: cover; 
     border-radius: 30%; 
    margin-right: 5px;
}

}
</style>
<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	f.submit();
}

function searchCategory(categoryNum) {
	var f = document.searchForm;
	f.categoryNum.value = categoryNum;
	f.submit();
}

function filterByTown() {
    let town = document.getElementById("townFilter").value;
    var f = document.searchForm;
    f.town.value = town;
    f.submit();
}
</script>

<div class="container">
 	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">함께하는<br>모임 생활</h1>
		<span class="cover-description htext"></span><br>
		<span class="cover-description htext bd">동네주민과 함께 만들어가요!</span>
  	</section> 


    <main class="container">
   	 <div class="body-title">
		<form class="row" name="searchForm" action="${pageContext.request.contextPath}/together/list" method="post">
            <div class="filter-container">

			<div class="d-flex">
				<h5 style="font-weight: bold;">${town}</h5>
				<h5>&nbsp;모임</h5>
				<h5 style="color: #b3b3b3;" class="bd">&nbsp;${dataCount}개</h5>
			</div>
			
	                <input type="text" class="search-input"  name="kwd" placeholder="검색어를 입력하세요"/>
					<input type="hidden" name="categoryNum" value="${categoryNum}">
					<input type="hidden" name="town" value="${town}">   					
	                <button type="button" class="search-button" onclick="searchList()" title="검색" ><i class="fa-solid fa-magnifying-glass"></i></button>
					<button class="btn reset" style="background-color: white; color:#74634F;"  type="button" onclick="location.href='${pageContext.request.contextPath}/together/list';">
						<i class="fa-solid fa-rotate-right"></i>
					</button>       			
	                <button type="button" class="search-button" onclick="location.href='${pageContext.request.contextPath}/together/write';">모임 등록</button>
	          
            </div>
        </form>		
	</div>
    <div class="row">
        <div class="col-md-3 ">
        
			<div class="card mb-4 d-flex align-items-center">
				<div style="margin-top: 10px;">
					<c:if test="${empty userdto.photo }">
						<img class="myphoto" src="${pageContext.request.contextPath}/resources/images/person.png">
					</c:if>
					<c:if test="${not empty userdto.photo }">
						<img class="myphoto" src="${pageContext.request.contextPath}/uploads/photo/${userdto.photo}">
					</c:if>	
				</div>
				
				<div class="card-body">
					<h5 class="card-title">${sessionScope.member.userId}</h5>
   				    <h6 class="bd">[<a style="color: green">${sessionScope.member.nickName}</a>]님의 동네</h6>
						<select id="townFilter" class="form-select border-2" aria-label="Default select example" onchange="filterByTown()">
							<option value="" ${town==''?'selected':''}>전체</option>
							<option value="${sessionScope.member.town1}" <c:if test="${town == sessionScope.member.town1}">selected</c:if>>${sessionScope.member.town1}</option>
							<c:if test="${sessionScope.member.town2 != null}">
								<option value="${sessionScope.member.town2}" <c:if test="${town == sessionScope.member.town2}">selected</c:if>>${sessionScope.member.town2}</option>
							</c:if>
						</select>
				   		<br>
						
				</div>
			</div>
            
		    <div class="card mb-4">
				<div class="list-group">
					<a class="list-group-item list-subject" type="button" style="text-align: center; font-weight: bold;" onclick="location.href='${pageContext.request.contextPath}/daily/list';">일상</a>
					<a class="list-group-item list-subject" type="button" style="text-align: center; font-weight: bold;"  onclick="location.href='${pageContext.request.contextPath}/together/list';">모임</a>
				</div>
			</div>              

		</div>
            
       <div class="col-md-9">
			<div class="categories">
              <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(1)">#운동</a></span>         
              <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(2)">#자기계발</a></span>         
              <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(3)">#동네친구</a></span>         
              <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(4)">#반려동물</a></span>         
              <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(5)">#취미/오락</a></span>         
              <span class="${category == 1 ? 'fw-semibold text-primary' : ''}"><a href="javascript:searchCategory(6)">#기타</a></span>         
			</div>

			<div class="togetherlist">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="list">
					    <div>
					   
					        <!-- 이미지 -->
					            <c:choose>
					                <c:when test="${dto.thumbnail != null && !dto.thumbnail.isEmpty()}">
					                    <img src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" onclick="location.href='${articleUrl}&tNum=${dto.tNum}';">
					                </c:when>
					                <c:otherwise>
					                    <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="img-fluid object-fit-cover h-100" onclick="location.href='${articleUrl}&tNum=${dto.tNum}';">
					                </c:otherwise>
					            </c:choose>
					      
					            <button class="btn_like">like
					            	<span class="like-count">찜</span>
					            </button>
					        <a  class="listTitle"> <h5>${dto.name}</h5></a>
					        <a ><i class="fa-solid fa-circle-user"></i>&nbsp;${dto.nickName}</a>
					        <div class="float-end"><i class="fa-solid fa-location-dot"></i>&nbsp;${dto.town}</div>
					        <div class="d-flex justify-content-between mt-2" style="color: #bfbfbf;">
					            <p><i class="fa-solid fa-eye"></i>&nbsp;${dto.hitCount}</p>
					            <p><i class="fa-solid fa-clock"></i>&nbsp;${dto.regDate}</p>
					        </div>
					    </div>
					</div>
				</c:forEach>
				
			</div>
			
            <div class="page-navigation">
            	${dataCount==0? "등록된 게시글이 없습니다." : paging }
            </div>
			
			
			</div>
        </div>
    </main>
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
		
		let url = '${pageContext.request.contextPath}/together/insertLike';
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
