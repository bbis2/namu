<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1' >
			<div class='col'>
				<div class='d-flex justify-content-between align-items-center'>
					<div>
						<div class='name' style="font-weight: bold;">${vo.nickName}</div>
					</div>
					<div class='d-flex align-items-center'>
						<div class='date me-2'>${vo.regDate}</div>
						<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
						<div class='reply-menu'>
							<c:choose>
								<c:when test="${sessionScope.member.userId==vo.userId}">
									<div class='deleteReplyAnswer reply-menu-item' data-rNum='${vo.rNum}' data-answer='${vo.answer}'>삭제</div>
									<div class='hideReplyAnswer reply-menu-item' data-rNum='${vo.rNum}' data-showReply='${vo.showReply}'>${vo.showReply == 1 ? "숨김":"표시"}</div>
								</c:when>
								<c:when test="${sessionScope.member.userId!=vo.userId}">
									<div class='deleteReplyAnswer reply-menu-item' data-rNum='${vo.rNum}' data-answer='${vo.answer}'>삭제</div>
									<div class='blockReplyAnswer reply-menu-item'>차단</div>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class='p-2 ${vo.showReply == 0 ? "text-primary text-opacity-50":""}'>
			${vo.content}
		</div>
	</div>
</c:forEach>
