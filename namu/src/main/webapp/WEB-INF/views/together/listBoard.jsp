<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- board list -->
<c:forEach var="vo" items="${list}">
    <div class="boardList mb-3">
        <div>
            <div>
                <strong>${vo.nickName}</strong>
                <div>${vo.regDate}</div>
            </div>
            <div class="btn-freeboard-detail mb-3" data-num="${vo.num}" style="cursor: pointer; text-decoration: underline;">
            	상세보기
            </div>
        </div>
        <div class="post-content row justify-content-between mb-5">
        	<div class="left col col-6">
	            ${vo.content}
        	</div>
        	<div class="right col col-6">
		        <div class="post-image" >
					<c:choose>
						<c:when test="${not empty vo.listFilename}">
							<img src="${pageContext.request.contextPath}/uploads/photo/${vo.listFilename[0]}" >
						</c:when>
						
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/uploads/image.png" class="img-fluid object-fit-cover h-100"> 
						</c:otherwise>
					</c:choose>
		        </div>
        	</div>
        </div>
        <div class="post-footer" align='right'>
            <div >
                <button type="button"  class='btn' style="background-color: #564838;"><i class="bi bi-chat-heart"></i></button>
                <button type="button" class='btn' style="background-color: #564838;"><i class="bi bi-chat-dots"></i></button>                
            </div>
        </div>
    </div>
</c:forEach>

<div class="page-navigation">${paging}</div>
