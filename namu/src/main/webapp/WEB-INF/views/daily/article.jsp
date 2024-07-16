<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.fleamarket-cover {
    background-color: #E3F1C5;
}

h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
}
.htext{
	padding-top: 100px;
	padding-left : 100px;
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
    }

.container {
    margin: 0 auto;
    padding: 20px;
    border-radius: 8px;
}

.content {
    padding: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input,
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
 
</style>

<c:if test="${sessionScope.member.userId==dto.userId||sessionScope.member.membership>99}">
	<script type="text/javascript">
		function deleteBoard() {
		    if(confirm('게시글을 삭제 하시 겠습니까 ? ')) {
			    let query = 'num=${dto.num}&${query}';
			    let url = '${pageContext.request.contextPath}/daily/delete?' + query;
		    	location.href = url;
		    }
		}
	</script>
</c:if>

<div class="container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">소통하는<br>일상 생활</h1>
		<span class="cover-description htext"></span><br>
		<span class="cover-description htext">동네주민과 함께 만들어가요!</span>
		<div class="cover-image"></div>
	 </section>
	 	
	<div class="body-title">
		<h2>일상 게시글</h2>
	</div>	 
 
	 <table class="table mt-5 mb-0 board-article">
	 	<thead>
	 		<tr>
	 			<td colspan="2" align="center">
	 				${dto.subject}
	 			</td>
	 		</tr>
	 	</thead>
	 	
	 	<tbody>
	 		<tr>
	 			<td width="50%">
	 				닉네임 : ${dto.nickName}
	 			</td>
	 			<td align="right">
	 				${dto.regDate} | 조회 ${dto.hitCount}
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2" valign="top" height="200" style="border-bottom: none;">
	 				${dto.content}
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2" class="text-center p-3" style="border-bottom: none;">
	 				<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.dailyLikeCount}</span></button>
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td colspan="2">
	 				이전글 :
	 				<c:if test="${not empty prevDto}">
	 					<a href="${pageContext.request.contextPath}/daily/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
	 				</c:if>
	 			</td>
	 		</tr>

			<tr>
				<td colspan="2">
					다음글 :
					<c:if test="${not empty nextDto}">
						<a href="${pageContext.request.contextPath}/daily/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
					</c:if>
				</td>
			</tr>	 		
	 	</tbody>
	 </table>
	 
	 <table class="table table-borderless mb-2">
		<tr>
			<td width="50%">
				<c:choose>
					<c:when test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/daily/update?num=${dto.num}&page=${page}';">수정</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-light" disabled>수정</button>
					</c:otherwise>
				</c:choose>
		    	
				<c:choose>
		    		<c:when test="${sessionScope.member.userId==dto.userId}">
		    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
		    		</c:when>
		    		<c:otherwise>
		    			<button type="button" class="btn btn-light" disabled>삭제</button>
		    		</c:otherwise>
		    	</c:choose>
			</td>
			<td class="text-end">
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/daily/list?${query}';">리스트</button>
			</td>
		</tr>
	 </table>
	 
	<div class="reply">
		<form name="replyForm" method="post">
			<div class='form-header'>
				<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
			</div>
			
			<table class="table table-borderless reply-form">
				<tr>
					<td>
						<textarea class='form-control' name="content"></textarea>
					</td>
				</tr>
				<tr>
				   <td align='right'>
				        <button type='button' class='btn btn-light btnSendReply'>댓글 등록</button>
				    </td>
				 </tr>
			</table>
		</form>
		
		<div id="listReply"></div>
	</div>
</div>

