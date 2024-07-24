<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table">
	<thead>
		<tr>
			<td width="120">이름</td>
			<td>각오한마디</td>
			<td width="110">신청일</td>
			<td width="100">상태</td>
			<td width="160">변경</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${listApply}">
			<tr>
				<td>${dto.nickName }</td>
				<td>
					${dto.content}
				</td>
				<td>
					${dto.applyDate}
				</td>
				<td> 
					<c:choose>
						<c:when test="${dto.acceptance == 0}">수락대기</c:when>
						<c:when test="${dto.acceptance == 1}">수락완료</c:when>
						<c:when test="${dto.acceptance == 2}">거절</c:when>
					</c:choose>				
				</td>
				<td>
					<c:if test="${dto.acceptance == 0}">
						<button type="button" class="btn btnAcceptOk" data-tNum="${dto.tNum}" data-acceptance="1" data-nickName="${dto.nickName}" data-userId="${dto.userId}">수락</button>
						<button type="button" class="btn btnAcceptOk" data-tNum="${dto.tNum}" data-acceptance="2" data-nickName="${dto.nickName}" data-userId="${dto.userId}">거절</button>
					</c:if>
					<c:if test="${dto.acceptance == 1}">
						<button type="button" class="btn btnAcceptOk" data-tNum="${dto.tNum}" data-acceptance="2" data-nickName="${dto.nickName}" data-userId="${dto.userId}">거절</button>
					</c:if>
					<c:if test="${dto.acceptance == 2}">
						<button type="button" class="btn btnAcceptOk" data-tNum="${dto.tNum}" data-acceptance="1" data-nickName="${dto.nickName}" data-userId="${dto.userId}">수락</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>