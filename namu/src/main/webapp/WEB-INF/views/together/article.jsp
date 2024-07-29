<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.togetherBoard-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.togetherBoard-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>
<style type="text/css">
.fleamarket-cover {
    background-color: #E3F1C5;
}

.htext {
    padding-top: 100px;
    padding-left: 100px;
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
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input{
    width: 70%;
    padding: 10px;
}
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

textarea.form-control {
    height: 100px;
    resize: none;
}

.content-meta {
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
}

.navigation,
.actions,
.comments {
    margin: 10px 0;
}

.navigation .btn,
.actions .btn,
.comments .btn {
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px;
}

.navigation .btn:hover,
.actions .btn:hover,
.comments .btn:hover {
    background-color: #4c3b2b;
}

.comments input[type="text"] {
    margin-bottom: 10px;
}

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

.thumb img {
	height: 400px;
	widows: 400px;
	border-radius: 30px;
}

.together-info {
    padding: 40px 40px 20px 20px;
    flex-grow: 1;
}

.user {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
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
    background-color: #A4B974;
    border: none;
    padding: 5px 10px;
    margin-left: 10px;
    cursor: pointer;
    color: white;
}
.thumb img {
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    height: 400px; /* 원하는 높이로 설정 */
    object-fit: cover; /* 이미지 비율을 유지하며 크기에 맞게 자르기 */
}

.apply{
    border-radius: 30px;
	height: 50px;
	width: 100%;
	border: none;
	background-color: #A4B974;
	color: #fff;
	font-weight: 600;
}

textarea::placeholder{
	opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상 제거 */
	color: #333;
	text-align: center;
	line-height: 80px;
}
.applybutton{
	padding-top: 10px;
}
/*togetherBoard*/

#myTab {
	padding-top: 150px;
}

.nav-tabs .nav-link {
	min-width: 300px;
	background: #fff;
	border: none;
	border-bottom: 2px solid #dbdddf;
	border-radius: 0;
	color: #4B3B29;
	font-weight: 600;
	font-size: 18px;
}
.nav-tabs .nav-link.active {
	background: #fff;
	color: #4B3B29;
	border-bottom: 2px solid ;
}
.tab-pane { 
	min-height: 300px;
	padding-bottom: 10px;}

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #f54a4c; }
.graph { font-size: 0;  letter-spacing: 0; word-spacing: 0; }
.graph-title { padding-right: 3px; }
.graph .one-space { font-size:13px; background:#eee;}
.graph .one-space:after { content: ''; display: inline-block; width:17px; }
.graph .one-space.on{ background:  #f54a4c; }
.graph .one-space:first-child{ border-top-left-radius:5px;  border-bottom-left-radius:5px; }
.graph .one-space:last-child{ border-top-right-radius:5px; border-bottom-right-radius:5px; }
.graph-rate { padding-left: 5px; display: inline-block; width: 60px; text-align: left; }

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }

.qna-form textarea { width: 100%; height: 75px; resize: none; }
.qna-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.qna-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>

<style>
/* 공지사항 */
.form-container {
    background-color: white;
    border-radius: 10px;
    box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.1);
    width: 100%;
    padding: 20px;
}
.form-header {
    display: flex;
    align-items: center;
}
.user-name {
    margin-left: 10px;
    font-weight: bold;
}
.form-body textarea {
    width: 100%;
    height: 100px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    resize: none;
}
.form-footer {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-top: 10px;
}
.char-counter {
    font-size: 0.9em;
    color: #999;
}
.subject input{
    width: 80%;
    height: 40px;
    padding: 5px;;
    border: none;
    resize: none;
}
.submit-btn {
    background-color: #ffcc00;
    color: white;
    border: none;
    padding: 10px 10px;
    border-radius: 5px;
    cursor: pointer;
    justify-content: right;
}
.submit-btn:hover {
    background-color: #ff9900;
}
</style>
<!-- 공지사항 lsit -->
<style>

.post-item {
	width: 100%;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 10px;
    display: flex;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.post-date {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    font-size: 1.2em;
    color: #666;
}

.post-date .day {
    font-size: 2.5em;
    font-weight: bold;
    color: #333;
}

.post-date .month-year {
    margin-top: 5px;
    font-size: 1.1em;
    font-weight: bold;
}

.post-content h2 {
    margin: 0 0 10px;
    font-size: 1.5em;
}

.post-content p {
    margin: 0 0 10px;
    color: #333;
}

.post-meta {
    font-size: 0.9em;
    color: #999;
}
</style>

<style>
/*articleBoard*/
.articleBoard {
	height: 600px;
	width: 800px;
}
.post {
      padding: 16px;
      margin-bottom: 16px;
      border-radius: 8px; /* 테두리 둥글게 */
      box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.1);
  }
  .comments {
      margin-top: 16px;
  }
  .comment {
      border-top: 1px solid #eee;
      padding: 8px 0;
  }
  .comment:first-child {
      border-top: none;
  }
  .comment-form {
      display: flex;
      margin-top: 16px;
  }
  .comment-form input[type="text"] {
      flex: 1;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
  }
  .comment-form button {
      padding: 8px 16px;
      border: none;
      background-color: #ffc107;
      color: #fff;
      border-radius: 4px;
      cursor: pointer;
      margin-left: 8px;
  }
  
.main-image {
    width: 120%;
    height: 250px; /* 원하는 높이로 설정하세요 */
    object-fit: fill; /* 이미지 비율을 유지하며 크기에 맞게 자릅니다 */
}

</style>


<style>
.article-container {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

.article-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.article-header .author {
    font-weight: bold;
    font-size: 1.2em;
    color: #333;
}

.article-header .time {
    color: #aaa;
    font-size: 0.9em;
}

.article-header .article-options {
    position: relative;
}

.article-header .article-options button {
    border: none;
    background: #fff;
    color: #aaa;
    font-size: 1.5em;
    cursor: pointer;
    padding: 5px;
    border-radius: 5px;
    transition: color 0.3s ease;
}

.article-header .article-options button:hover {
    color: #333;
}

.article-content {
    font-size: 1em;
    line-height: 1.6;
    color: #555;
    margin-top: 15px;
}
</style>

<style>
.boardList {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.boardList strong {
    font-size: 1.2rem;
    color: #343a40;
}
.boardList div {
    margin-bottom: 10px;
}
.btn-freeboard-detail {
    color: #007bff;
}
.btn-freeboard-detail:hover {
    text-decoration: none;
    color: #0056b3;
}
.post-content {
    margin-top: 10px;
}
.post-content .left {
    font-size: 1rem;
    color: #6c757d;
}
.post-content .right .post-image {
    display: flex;
    align-items: center;
    justify-content: center;
}
.post-content .right .post-image img {
    width: 60%;
    max-height: 60%;
    object-fit: fill;
    border-radius: 5px;
}
.post-footer .btn {
    color: white;
    border: none;
}
.post-footer .btn i {
    font-size: 1.2rem;
}

.carousel-item {
    display: flex;
    justify-content: center;
    align-items: center;
} 
</style>

<script type="text/javascript">
    function deleteTogether() {
        if (confirm('게시글을 삭제 하시겠습니까?')) {
            let tNum = '${dto.tNum}';
            if (!tNum) {
                alert('잘못된 접근입니다.');
                return;
            }
            let query = "tNum=${dto.tNum}&${query}&thumbnail=${dto.thumbnail}";
            let url = '${pageContext.request.contextPath}/together/delete?' + query;
            location.href = url;
        }
    }
</script>

<div class="container">
    <section class="fleamarket-cover">
        <h1 class="cover-title htext bd">소통하는<br>일상 생활</h1>
        <span class="cover-description htext"></span><br>
        <span class="cover-description htext">동네주민과 함께 만들어가요!</span>
        <div class="cover-image"></div>
    </section>
</div>   

<div class="container body-container">
    <div class="used">
        <div class="thumb">
            <div>
                <div>
                    <c:choose>
                        <c:when test="${not empty dto.thumbnail}">
                                <div ${status.index == 0 ? 'active' : ''}>
                                    <img src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}">
                                </div>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="d-block w-100">
                            </div>
                        </c:otherwise>
                    </c:choose>
				
	                    <div class="applybutton">
	                    	<c:if test="${sessionScope.member.userId != dto.userId}">
		                    	<c:if test="${dto.acceptance == -1}">
		                        	<button type="button" class="apply applyAccept">참가신청</button>
		                    	</c:if>
		                    	<c:if test="${dto.acceptance == 0}">
		                        	<button type="button" class="apply">신청완료</button>
		                    	</c:if>
		                    	<c:if test="${dto.acceptance == 1}">
		                        	<button type="button" class="apply">참여중</button>
		                    	</c:if>
	                    	</c:if>
	                    	<c:if test="${sessionScope.member.userId == dto.userId}">
	                    		<button type="button" class="apply applyAcceptList">참여자 리스트</button>
	                    	</c:if>
	                    </div>
                </div>
            </div>
        </div>
        <div class="together-info">
        
            <div class="rpr">
                <h1>${dto.name}</h1>
                <div class="seller-location">${dto.town}</div>
            </div>
            <hr>
            <div class="used-header">
                <div class="title">${dto.subject}</div>
                <div> <h4>모임장 : ${dto.nickName}</h4></div>	
            </div>

            <table class="table table-borderless mb-2">
                <tr>
                    <td width="50%">
                        <c:choose>
                            <c:when test="${sessionScope.member.userId == dto.userId}">
                                <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/together/update?tNum=${dto.tNum}&page=${page}&categoryNum=${dto.categoryNum}&town=${town}';">수정</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-light" disabled>수정</button>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${sessionScope.member.userId == dto.userId}">
                                <button type="button" class="btn btn-light" onclick="deleteTogether();">삭제</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-light" disabled>삭제</button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="text-end">
                        <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/together/list?${query}';">리스트</button>
                    </td>
                </tr>
            </table>  
        </div>
    </div>
    
    <!-- # 여기서 부터 게시판  -->
	<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">모임소개</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false">공지사항<span class="title-reviewCount"></span></button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false">함께해요<span class="title-qnaCount"></span></button>
		</li>
	</ul>

	<div class="tab-content pt-2" id="myTabContent">
		<!-- 모임소개 -->
		<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
			<div class="mt-3 pt-3">
				<p class="fs-4 fw-semibold">상세정보</p> 
			</div>
			<div class="mt-3 product-content">
				${dto.content}
			</div>
		</div>
	
		<!-- #1 공지사항 -->
		<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
			<div class="mt-3 pt-3">
				<p class="fs-4 fw-semibold">공지사항</p>
			</div>
	
			<!-- 공지사항 쓰기 -->
				<c:if test="${sessionScope.member.userId == dto.userId}">	
				    <div class="form-container">
				        <div class="form-header">
				            <div class="profile-pic"></div>
				            <div class="user-name">모임장 : ${sessionScope.member.nickName}</div>
				        </div>
				        <form action="${pageContext.request.contextPath}/togetherNotice/write" method="POST">			        
				            <input type="hidden" name="tNum" value="${dto.tNum}">    
				            <div class="form-body">
					            <div class="subject" style="font-weight: bold;"> 제목 :
					            	<input name="subject" placeholder=" 제목을 입력해 주세요 :)"></input>
					            </div>	
				                <textarea name="content" placeholder="글을 작성해 주세요 :)"></textarea>
				            </div>
				            <div class="form-footer">
				                <button type="button"  class="btn btnNotice">등록</button>
				            </div>
				        </form>
				    </div>				
				</c:if>
					
			<div class="mt-2 listNotice"></div>
		</div>		
	
		<!-- 버튼, class 이름을 줄 때, 이름 중복을 막기위해 이 부분처럼 줘여 함. togetherBoard-form / btnTogetherBoard 유사한 형식으로 줄 것. -->
		<!-- #2 함께해요 글쓰기 -->
		<div class="tab-pane fade" id="tab-pane-3" role="tabpanel" aria-labelledby="tab-3" tabindex="0">
			<div class="mt-3 pt-3">
				<p class="fs-4 fw-semibold">함께해요</p>
			</div>
	
			<!-- 함께해요 쓰기 -->
			
			<div class="border p-2 togetherBoard-form">
			    <div class="post-header">
			        <div style="font-weight: bold;">작성자 : ${dto.nickName}</div>
			    </div>
			    <form name="togetherBoardForm"  method="POST" enctype="multipart/form-data">
			   		<input type="hidden" name="tNum" value="${dto.tNum}">    
			        <div class="comment-box">
			            <textarea class="form-control" name="content" placeholder="글을 작성해 주세요 :)" id="commentInput"></textarea>
					</div>
					<div class="p-1">
						<div class="img-grid">
							<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
						</div>
						<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
					</div>					
			        <div>
			            <button type="button" class="btn btnTogetherBoard" >등록</button>
		            </div>		            
			    </form>
			</div>
			
			<!-- togetherBoard list 이 부분도 div 완전 벗어난 곳에 주면 안됨.-->
			
			<div class="mt-2 listTogetherBoard"></div>			
		</div>

	</div>		
</div>

<div class="modal fade" id="myApplyModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myApplyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myApplyModalLabel">참가신청</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="applyForm" method="post">
					<div class="row m-1">
						<textarea name="content" class="form-control" placeholder="각오 한마디를 입력하세요"></textarea>
						<input type="hidden" name="tNum" value="${dto.tNum}">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnAcceptOk">신청하기</button>
				<button type="button" class="btn btn-secondary btnSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<div class="modal fade" id="myApplyListModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myApplyListModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myApplyListModalLabel">참여자 리스트</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div style="width: 190px;" class="p-2">
					<select id="selectAcceptance" class="form-select">
						<option value="-1">전체 리스트</option>
						<option value="0">신청자 리스트</option>
						<option value="1">참여자 리스트</option>
						<option value="2">거절 리스트</option>
					</select>
				</div>
				
				<div class="p-2 applyList"></div>
			
			</div>
		</div>
	</div>
</div>

<!-- 여기는 #2에서의 모달창 띄우는 부분!  -->
<div class="modal fade" id="freeBoardModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="freeBoardModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="freeBoardModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<!-- 여기로 이제 jsp 작성해서 넣을 것. -->
			<div class="modal-body">

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function login() {
    location.href = '${pageContext.request.contextPath}/member/login';
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
    $('.btnSendtogetherListLike').click(function() {
        const $i = $(this).find('i');
        let userLiked = $i.hasClass('bi-hand-thumbs-up-fill');
        let msg = userLiked ? '게시글 공감을 취소하시겠습니까?' : '게시글에 공감하십니까?';

        if (!confirm(msg)) {
            return false;
        }

        let url = '${pageContext.request.contextPath}/together/inserttogetherListLike';
        let tNum = '${dto.tNum}';
        let query = 'tNum=' + tNum + '&userLiked=' + userLiked;

        const fn = function(data) {
            let state = data.state;
            if (state === 'true') {
                if (userLiked) {
                    $i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
                } else {
                    $i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
                }
                let count = data.togetherListLikeCount;
                $('#togetherListLikeCount').text(count);
            } else if (state === 'liked') {
                alert('게시글 공감은 한번만 가능합니다!');
            } else if (state === 'false') {
                alert('게시물 공감 여부 처리가 실패했습니다.');
            }
        };

        ajaxFun(url, 'post', query, 'json', fn);
    });
});


$(function(){
	$('.container').on('click', '.btnSendOk', function() {
		//  글 등록 완료 및 수정 완료
		const f = document.applyForm;
		
		let str;

		str = f.content.value.trim();
	    if(!str) {
	        alert('내용을 입력하세요. ');
	        f.content.focus();
	        return;
	    }
	    
		    
		let url = "${pageContext.request.contextPath}/together/"+mode;
	    let formData = new FormData(f);

		const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("게시물을 추가(수정)하지 못했습니다. !!!");
	            return false;
	        }

	        $('#searchInput').val('');
	        $('#searchWord').val('');
	        
			$('.list-content').empty();
	    	loadContent(1);
	    	
	    	$('#myDialogModal').modal('hide');
		};
		
		ajaxFun(url, 'post', formData, 'json', fn, true);		
	});
});

// 참여하기 대화상자
$('.applyAccept').click(function(){
	$('#myApplyModal').modal('show');
});

// 참여완료
$('.btnAcceptOk').click(function(){
	const f = document.applyForm;
	
	if( ! f.content.value.trim() ) {
		f.content.focus();
		return false;
	}
	
	let formData = $('form[name=applyForm]').serialize();
	let url = '${pageContext.request.contextPath}/together/apply';
	const fn = function(data) {
		let state = data.state;
        if (state === 'true') {
       	  alert('참가 신청 되었습니다.');
       	  $('.applyAccept').html('신청완료');
       	  $('.applyAccept').removeClass('applyAccept');
        }
	};
	ajaxFun(url, 'post', formData, 'json', fn);
});

// 참여자 리스트 대화상자
$('.applyAcceptList').click(function(){
	applyList(-1);
	$('#myApplyListModal').modal('show');
});

// select 
$('#selectAcceptance').change(function(){
	let acceptance = $(this).val();
	applyList(acceptance);
});

function applyList(acceptance) {
	let tNum = "${dto.tNum}";
	
	let formData = "tNum=" + tNum + "&acceptance=" + acceptance;
	let url = '${pageContext.request.contextPath}/together/applyList';
	
	const fn = function(data) {
		$("#myApplyListModal .applyList").html(data);
	};
	ajaxFun(url, 'get', formData, 'text', fn);	
}

// 거절/수락 하기
$("#myApplyListModal").on("click", ".btnAcceptOk", function(){
	let tNum = $(this).attr("data-tNum");
	let acceptance = $(this).attr("data-acceptance");
	let userId = $(this).attr("data-userId");
	let nickName = $(this).attr('data-nickName');

	var s = nickName + "님의 요청을 수락하시겠습니까 ?";
	if(acceptance === "2") {
		s = nickName + "님의 요청을 거절하시겠습니까 ?";
	}
	
	if(! confirm(s)) {
		return false;
	}
	
	let formData = "tNum=" + tNum + "&acceptance=" + acceptance + "&userId=" + userId;
	let url = '${pageContext.request.contextPath}/together/applyUpdate';
	
	const fn = function(data) {
		let state = data.state;
        if (state === 'true') {
       	  alert('정보가 변경 돠었습니다.');
          applyList(-1);
        }
	};
	ajaxFun(url, 'post', formData, 'json', fn);
});
</script>

<script type="text/javascript">
// 탭이 바뀔때 -> 탭이 바뀔때는 탭에 이벤트를 발생시켜야 한다.
$(function(){
    $("button[role='tab']").on("click", function(e){
    	const tab = $(this).attr("aria-controls");
    	
    	if(tab == "2") {
    		listTogetherNotice(1);
    	} else if(tab == "3") {
    		listTogetherBoard(1);
    	}
    });
});
</script>




<script type="text/javascript">
//#1 공지사항 등록
$(function() {
    $('.btnNotice').click(function() { // btnNotice를 클릭하면,
        const f = this.closest('form'); // 가장 가까운 form태그 찾기. form 태그의 장점 : 객체로 던질 수 있음.
        // console.log(f);
        // console.log(f.tNum.value);
        // let 사용하는 것 보다 const로 변하지 않게 상수로 선언하는 게 좋다.
    	const tNum = f.tNum.value;			// tNum의 값을 tNum에 담는다.
    	const content = f.content.value;
    	const subject = f.subject.value;

    	const query = {					// 쿼리에 담는다.
    			tNum: tNum,
    			subject: subject,
    			content: content
    	}
    	
    	const url = '${pageContext.request.contextPath}/togetherNotice/write'; // togetherNotice(controller 주소의 write)로 보냄
    	
    	const fn = function(data) { // fn 함수 실행.
    		f.subject.value = ''; 	// subject의 값을 비워줌 
    		f.content.value = ''; 	// content의 값을 비워줌
    		
    		 let state = data.state;	
             if (state === 'true') {
            	 listTogetherNotice(1);
             } else if (state === 'false') {
                 alert('공지사항을 추가하지 못했습니다.');
             }
    	}
    	
    	ajaxFun(url, 'post', query, 'json', fn);  // url 주소/ 'post'방식으로/ 쿼리를/ json 방식으로 보냄. / fn 함수 실행  
    });
});

function listTogetherNotice(page) {
	let url = '${pageContext.request.contextPath}/togetherNotice/list';
    let query = 'tNum=${dto.tNum}&pageNo=' + page;
    let selector = '.listNotice';

    const fn = function(data) {
    	// console.log(data);
        $(selector).html(data);
    };

	ajaxFun(url, 'get', query, 'text', fn);
}

//#1 공지사항 삭제
$(function(){
    $('.post-list').on('click', '.btndeleteNoticeList', function(){
        if(!confirm('게시물을 삭제하시겠습니까?')) {
            return false;
        }

        let noticeNum = $(this).data('num');
        let url = '${pageContext.request.contextPath}/togetherNotice/deleteNotice';
        let query = 'num=' + noticeNum;

        const fn = function(data){
            if(data.state === 'success') {
                listTogetherNotice(page);
            } else {
                alert('게시물 삭제에 실패했습니다.');
            }
        };

        ajaxFun(url, 'post', query, 'json', fn);
    });
});

</script>

<script type="text/javascript">
//#2. 함께해요

function listTogetherBoard(page) {
	let url = '${pageContext.request.contextPath}/togetherBoard/list';
    let query = 'tNum=${dto.tNum}&pageNo=' + page;
    let selector = '.listTogetherBoard';

    const fn = function(data) {
        $(selector).html(data);
    };

	ajaxFun(url, 'get', query, 'text', fn);
}

// 파일 지우기
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".togetherBoard-form .img-add", function(){
		$(this).closest(".togetherBoard-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=togetherBoardForm] input[name=selectFile]").change(function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
		
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		// 화면에 그려주기 위한 코드!! 
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		// this -> "input[name=selectFile]" 
		this.files = dt.files; // dt.files : 유사배열
	});
	
	
	// 화면에 표시된 이미지를 클릭할 경우에 실행되는 이벤트 핸들러
	// 기능 1. 화면에 출력된 이미지를 삭제
	// 기능 2. input 요소에 등록된 files 유사배열에서 삭제한 이미지 정보를 제거
	$("body").on("click", ".togetherBoard-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});

	$('.btnTogetherBoard').click(function(){
		const f = document.togetherBoardForm;
		let s;
		
		s = f.content.value.trim();
		if( ! s ) {
			alert("내용을 입력하세요.")	;
			f.content.focus();
			return false;
		}
		
		if(f.selectFile.files.length > 5) {
			alert("이미지는 최대 5개까지 가능합니다..")	;
			return false;
		}

    	const url = '${pageContext.request.contextPath}/togetherBoard/write'; 
		let query = new FormData(f); 
		
		const fn = function(data) {
			if(data.state === "true") {
				f.reset();	//ㅇㅣ ㅁ ㅣ ㅈ ㅣ 지우기는 천천구다사이~!하있 ^^
				listTogetherBoard(1);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn, true); // 파일은 true 줘여 함 ^^
	});
});
</script>

<script type="text/javascript">
// # 모달 창

$(function(){
	// 상세보기  => 중요한 것은! 여기는 전부 num을 넘겨 받아야함. tNum 아님! 
	$(".tab-content").on("click", ".btn-freeboard-detail", function(){
		let num = $(this).attr("data-num");
		const url = '${pageContext.request.contextPath}/togetherBoard/article'; 
		let query = "num="+num; 
		const fn = function(data) {
			console.log(data);
			$("#freeBoardModal .modal-body").html(data) // 이 부분이 모달창 부분 jsp 넘겨 받는 부분.
			
			$('#freeBoardModal').modal('show');
		};
		
		ajaxFun(url, "get", query, "text", fn);
		
	});

});

</script>

