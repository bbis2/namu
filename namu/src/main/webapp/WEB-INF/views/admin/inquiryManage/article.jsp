<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 900px;
}

.row-flex { display: flex; justify-content: space-between; }
.left-item {
	width:40px; margin-right: 1px; padding:10px 10px;
    text-align: center;
	font-weight: 600;
	color: #fff;
}
.right-item {
	flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    word-spacing: nowrap;
    box-sizing: border-box;
    padding: 10px 7px;
	font-weight: 600;
	color: #fff;
}
.left-question { background: #0d6efd; }
.right-question { background: #0d6efd; }

.left-answer { background: #198754; }
.right-answer { background: #198754; }

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function deleteInquiry(num) {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/admin/inquiryManage/delete?"+query;
		location.href = url;
	}
}

function deleteAnswer(num) {
	if(confirm("답변을 삭제 하시겠습니까 ?")) {
		let query = "num="+num+"&${query}";
		let url = "${pageContext.request.contextPath}/admin/inquiryManage/deleteAnswer?"+query;
		location.href = url;
	}
}

function sendAnswerOk() {
	const f = document.answerForm;
	if(!f.answer.value.trim()) {
		alert("답변을 입력 하세요");
		f.answer.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/inquiryManage/answer";
	f.submit();
}
</script>

<div class="body-container">
    <div class="body-title">
		<h3><i class="bi bi-question-diamond"></i> 1:1 문의 </h3>
    </div>
    
    <div class="body-main">

		<table class="table mt-5 mb-0">
			<tbody>
				<tr>
					<td colspan="2" class="px-0 pb-0">
						<div class="row gx-0">
							<div class="col-sm-1 bg-primary me-1">
								<p class="form-control-plaintext text-white text-center">Q.</p>
							</div>
							<div class="col bg-primary">
								<p class="form-control-plaintext text-white ps-2">${dto.subject}</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						분 류 : ${dto.category}
					</td>
				</tr>
				<tr>
					<td width="50%" align="left">
						작성자 : ${dto.userName}(${dto.userId})
					</td>
					<td width="50%" align="right">
						문의일자 : ${dto.reg_date}
					</td>
				</tr>
				
				<tr>
					<td colspan="2" valign="top" height="150">
						${dto.content}
					</td>
				</tr>
			</tbody>
		</table>
		
		<c:if test="${not empty dto.answer}">
			<table class="table mb-0">
				<tbody>
					<tr>
						<td colspan="2" class="p-0">
							<div class="row gx-0">
								<div class="col-sm-1 bg-success me-1">
									<p class="form-control-plaintext text-white text-center">A.</p>
								</div>
								<div class="col bg-success">
									<p class="form-control-plaintext text-white ps-2">[답변] ${dto.subject}</p>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td width="50%" align="left">
							담당자 : ${dto.answerName}
						</td>
						<td width="50%" align="right">
							답변일자 :  ${dto.answer_date}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="150">
							${dto.answer}
						</td>
					</tr>
				</tbody>
			</table>
		</c:if>
		
		<table class="table table-borderless mb-2">
			<tr>
				<td width="50%" align="left">
					<button type="button" class="btn btn-light" onclick="deleteInquiry('${dto.num}');">질문삭제</button>
					<c:if test="${not empty dto.answer}">
						<button type="button" class="btn btn-light" onclick="deleteAnswer('${dto.num}');">답변삭제</button>
					</c:if>
				</td>
			
				<td align="right">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryManage/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
		
		<c:if test="${empty dto.answer}">
			<div class="reply">
				<form name="answerForm" method="post">
					<div class='form-header'>
						<span class="bold">답변달기</span><span> - 문의에 대한 답변을 입력 하세요</span>
					</div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name='answer'></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-light' onclick="sendAnswerOk()">답변 등록</button>
						        <input type="hidden" name="num" value="${dto.num}">
						        <input type="hidden" name="page" value="${page}">
						        <input type="hidden" name="schType" value="${schType}">
						        <input type="hidden" name="kwd" value="${kwd}">
						    </td>
						 </tr>
					</table>
				</form>
			</div>
		</c:if>
	</div>
</div>
