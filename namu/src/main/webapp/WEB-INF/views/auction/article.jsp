<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
<div class="used">
  <img src="썸네일 가져와야 함!!!" class="thumb">
  <div class="used-info">
     <div class="user">
    	 <img src="회원 프로필!!">
         <div class="user-name">${dto.nickName}</div>
         <div class="seller-location">${기본주소}</div>
     </div>
     
<div class="used-header">
  <div class="title">${dto.subject}</div>
    <button class="chat">채팅하기</button>
</div>
<div class="price">${dto.price} 원</div>
<div class="state">${dto.state}</div>
  <div class="content">${dto.content}</div>

<div class="sale-meta">
  <div class="views">찜 ${dto.usedLike dto에 있나..?} | 조회수 ${dto.hitCount} | ${dto.regDate}</div>
 	 <div class="buttons">
      <button class="update-btn" onclick="location.href='${pageContext.request.contextPath}/used/update?num=${dto.num}&page=${page}';">수정</button>
          <button class="delete-btn" onclick="usedDelete()">삭제</button>
          
          </div>
        </div>
     </div>
  </div>
</div>

<script type="text/javascript">
function usedDelete() {
	if(confirm('게시글을 삭제 하시겠습니까?')){
		let query = 'num=${dto.num}&${query}';
	    let url = '${pageContext.request.contextPath}/used/delete?' + query;
    	location.href = url;
	}
}

</script>



<style>
  .used {
    display: flex;
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    background-color: white;
    width: 700px;
}

.thumb {
    width: 250px;
    height: auto;
    display: block;
}

.used-info {
    padding: 20px;
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
    align-items: center;
}

.title {
    font-size: 20px;
    margin: 10px 0;
    flex-grow: 1;
}

.chat {
    background-color: #4caf50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 20px; /* 오른쪽 여백 추가 */
}

.content {
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

.buttons btn {
    background-color: #f0f0f0;
    border: none;
    padding: 5px 10px;
    margin-left: 10px;
    cursor: pointer;
}
</style>
