<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<p class="form-control-plaintext fs-6 fw-semibold"><i class="bi bi-chevron-double-right"></i> 회원 정보</p>
<table class="table table-bordered">
	<tr>
		<td class="bg-light col-sm-2">회원번호</td>
		<td class="col-sm-4">${dto.memberIdx}</td>
		<td class="bg-light col-sm-2">아이디</td>
		<td class="col-sm-4">${dto.userId}</td>
	</tr>
	<tr>
		<td class="bg-light col-sm-2">이 름</td>
		<td class="col-sm-4">${dto.userName}</td>
	</tr>
	<tr>
		<td class="bg-light col-sm-2">이메일</td>
		<td colspan="3">${dto.email}</td>
	</tr>
	<tr>
		<td class="bg-light col-sm-2">회원구분</td>
		<td>
			${dto.membership==10?"일반회원":(dto.membership==31?"전문가":(dto.membership==51?"직원":"기타"))}
		</td>
		<td class="bg-light col-sm-2">전화번호</td>
		<td class="col-sm-4">${dto.tel}</td>
	</tr>
	<tr>
		<td class="bg-light col-sm-2">회원가입일</td>
		<td class="col-sm-4">${dto.regDate}</td>
		<td class="bg-light col-sm-2">최근로그인</td>
		<td class="col-sm-4">${dto.lastLogin}</td>
	</tr>
	
	<tr valign="middle">
		<td class="bg-light col-sm-2">계정상태</td>
		<td colspan="3">
			<span>
				${dto.enabled==1?"활성":"잠금"}
			</span>
			<c:if test="${dto.enabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
			&nbsp;
			<span class="btn border" onclick="memberStateDetaileView();" style="cursor: pointer;">자세히</span>
		</td>
	</tr>
</table>


<table class="table table-borderless">
	<tr> 
		<td class="text-end">
			<button type="button" class="btn btn-light" onclick="updateOk();">수정</button>
			<button type="button" class="btn btn-light" onclick="deleteOk('${dto.memberIdx}');">삭제</button>
			<button type="button" class="btn btn-light" onclick="dialogClose();">닫기</button>
		</td>
	</tr>
</table>

<div class="modal fade" id="myMemberStateDetaileDialogModal" tabindex="-1" aria-labelledby="myMemberStateDetaileDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" style="max-width: 600px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myMemberStateDetaileDialogModalLabel">회원상태정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
				<table class="table board-list">
					<thead class="table-light">
						<tr>
							<th width="120">차단이유</th>
							<th width="120">차단헤제</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo" items="${listState}">
							<tr>
								<td class="ps-5">${vo.resultType}</td>
								<td class="text-center">${vo.banDate}</td>
							</tr>
						</c:forEach>
				  
						<c:if test="${listState.size()==0}">
							<tr align="center">
								<td colspan="3" style="border: none;">등록된 정보가 없습니다.</td>
							</tr>  
						</c:if>
					</tbody>
				</table>  
			
			</div>
		</div>
	</div>
</div>

