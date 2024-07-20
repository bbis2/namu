<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
<div class="used">
<div class="thumb">
   <div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="1000">
      <div class="carousel-inner">
			<c:choose>
				<c:when test="${dto.imageFile != null}">
					<c:forEach var="vo" items="${listFile}" varStatus="status">
						<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
							<img src="${pageContext.request.contextPath}/uploads/photo/${vo.uploadFile}" class="thumb">
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				  <div class="carousel-item active">
					  <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="d-block w-100">
				  </div>
				</c:otherwise>
			</c:choose>
       </div>
       <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Previous</span>
       </button>
       <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Next</span>
       </button>
	</div>
</div>

<div class="used-info">
 <div class="user">
	<img src="회원 프로필!!">
	   <div class="user-name">${dto.nickName}</div>
	   <div class="seller-location">주소1</div>
</div>
  <hr>
<div class="used-header">
  <div class="title">${dto.subject}</div>
  <c:if test="${dto.state != 2 }">
    <button class="chat1">채팅하기</button>
    </c:if>
</div>
<div class="price"><fmt:formatNumber value="${dto.price}"/> 원</div>
<div class="state">
	<c:if test="${dto.state == 1}" >
		<span style="color: #D24F04; font-weight: bold;">예약중</span>
	</c:if>	
	<c:if test="${dto.state == 2}">
		<span style="color: #2E8B1F; font-weight: bold;">판매완료</span>
	</c:if>	
	<c:if test="${dto.state == 0}">
	</c:if>		
</div>
  <div class="content1">${dto.content}</div>
<div class="sale-meta">
  <div class="views">찜 ${likeCount} &nbsp;|&nbsp; 조회수 ${dto.hitCount} &nbsp;|&nbsp; ${dto.regDate}</div>
<div class="report-btn">신고하기</div>
 	 <div class="buttons">
 	   <c:if test="${sessionScope.member.userId == dto.userId}">
      	<button class="update-btn" onclick="location.href='${pageContext.request.contextPath}/used/update?num=${dto.num}';">수정</button>
       </c:if>
       <c:if test="${sessionScope.member.userId == dto.userId || sessionScope.member.userId == 'admin'}">
        <button class="delete-btn" onclick="usedDelete()">삭제</button>
        </c:if>
     </div>
        </div>
      <button class="btn-list" onclick="location.href='${pageContext.request.contextPath}/used/list';">목록</button>
     </div>
  </div>
</div>

<script type="text/javascript">
function usedDelete() {
	if(confirm('게시글을 삭제 하시겠습니까?')){
		let query = 'num=${dto.num}&imageFile=${dto.imageFile}';
	    let url = '${pageContext.request.contextPath}/used/delete?' + query;
		location.href = url;
	}
}
</script>

<style>
  .used {
    display: flex;
    overflow: hidden;
    margin-top: 100px;
    height: 500px;
}

.thumb {
    width: 640px;
    height: 470px;
    display: block;
	padding: 40px 10px;
}

.used-info {
    padding: 40px 40px 20px 20px;
    flex-grow: 1;
}

.user {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.user-name {
    font-size: 18px;
    font-weight: bold;
    margin-right: 10px;
}

.seller-location {
    font-size: 14px;
    color: gray;
}


.price {
    font-size: 24px;
    font-weight: bold;
    color: green;
    margin-bottom: 10px;
}

.state {
    font-size: 16px;
    color: green;
    margin-bottom: 20px;
}
.used-header {
    display: flex;
    justify-content: space-between;
}

.title {
	margin: 10px 0;
    font-size: 20px;
    flex-grow: 1;
}

.chat1 {
    border-radius: 16px;
    background: #61ac2d;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-left: 20px;
    height: 80%
}

.content1 {
    font-size: 14px;
    color: gray;
    margin-bottom: 20px;
}

.sale-meta {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.views {
    font-size: 12px;
    color: gray;
}

.update-btn {
	border-radius: 16px;
    background-color: #ffd615;
    border: none;
    padding: 5px 10px;
    margin-left: 10px;
    cursor: pointer;
    color: white;
}

.delete-btn {
	border-radius: 16px;
    background-color: #ff9500;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    color: white;
}

.btn-list {
background-color: white;
padding: 5px 10px;
border: none;
float: right;
}

</style>
