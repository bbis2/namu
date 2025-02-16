<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row articleBoard">
	<div class="row">
		<div id="carouselArticleBoardIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
                <c:if test="${listFile.size() == 0}">
	                <button type="button" data-bs-target="#carouselArticleBoardIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                </c:if>
				<c:forEach var="vo" items="${listFile}" varStatus="status">
	                <button type="button" data-bs-target="#carouselArticleBoardIndicators" data-bs-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}" aria-label="Slide ${status.index + 1}"></button>
	            </c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach var="vo" items="${listFile}" varStatus="status">
	                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
	                    <c:choose>
	                        <c:when test="${vo.filename != null && !vo.filename.isEmpty()}">
	                            <img style="object-fit: fill;" src="${pageContext.request.contextPath}/uploads/photo/${vo.filename}" class="card-img-top mb-3 main-image" alt="Main image">
	                        </c:when>
	                        <c:otherwise>
	                            <img style="object-fit: fill;" src="${pageContext.request.contextPath}/resources/images/noimage.png" class="card-img-top mb-3 main-image" alt="No image available">
	                        </c:otherwise>
	                    </c:choose>
	                </div>
	            </c:forEach>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselArticleBoardIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselArticleBoardIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<div class="row">
        <div class="col-12">
        <div>
            <h3 style="font-weight: bold;">${dto.nickName}</h3>
            <p>${dto.regDate}</p>
        </div>
        <div class="col-12">
            
        </div>
        <div class="col-12">
            <p>${dto.content}</p>
        </div>
    </div>
		    
		    <form class="comment-form" name="comment-form">
		        <input type="text" name="content" placeholder="댓글을 달아보세요" aria-label="댓글 입력" />
		        <button type="button" class="btn togetherBoardOk">등록</button>
		        <input type="hidden" name="num" value="${dto.num}"/>
		    </form>
			<div class="mt-2 articleBoardReply">
			
			</div>
		</div>
	</div>
	