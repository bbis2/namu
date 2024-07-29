<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- board list -->
<c:forEach var="vo" items="${list}">
    <div class="post mb-3">
        <div class="post-header">
            <div>
                <strong>${vo.nickName}</strong>
                <span>${vo.regDate}</span>
            </div>
            <div class="btn-freeboard-detail mb-3" data-num="${vo.num}" style="cursor: pointer;">
            	상세보기
            </div>
        </div>
        <div class="post-content row justify-content-between mb-5">
        	<div class="left col col-9">
	            ${vo.content}
        	</div>
        	<div class="right col col-3">
		        <div class="post-image" style="width: 70%; height: 70%;" >
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
