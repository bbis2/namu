<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
/* 컨테이너의 최대 너비를 화면 너비에 맞춤 */
.body-container {
    max-width: 100%;
    padding: 0 15px; /* 좌우 여백 추가 */
    box-sizing: border-box;
}

/* 테이블과 셀의 여백 및 패딩 조정 */
.table {
    margin-bottom: 0;
}

.table td {
    padding: 8px; /* 테이블 셀 패딩 조정 */
}

/* 텍스트 영역의 크기 조정 */
.reply textarea {
    width: 100%;
    height: 100px; /* 텍스트 영역의 높이 조정 */
    resize: vertical; /* 수직으로만 크기 조절 가능 */
}

/* 플렉스 레이아웃 조정 */
.row-flex {
    display: flex;
    justify-content: space-between;
    align-items: flex-start; /* 상단 정렬 */
}

.left-item {
    width: 40px;
    margin-right: 1px;
    padding: 10px;
    text-align: center;
    font-weight: 600;
    color: #fff;
}

.right-item {
    flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap; /* 줄 바꿈 방지 */
    box-sizing: border-box;
    padding: 10px;
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
        <!-- 문의 내용 -->
        <table class="table mt-5 mb-0">
            <tbody>
                <tr>
                    <td colspan="2" class="px-0 pb-0">
                        <div class="row gx-0 row-flex">
                            <div class="col-sm-1 bg-primary me-1 left-question">
                                <p class="form-control-plaintext text-white text-center">Q.</p>
                            </div>
                            <div class="col bg-primary right-question">
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
                    <td colspan="2" valign="top">
                        ${dto.content}
                    </td>
                </tr>
            </tbody>
        </table>
        
        <!-- 답변 내용 -->
        <c:if test="${not empty dto.answer}">
            <table class="table mb-0">
                <tbody>
                    <tr>
                        <td colspan="2" class="p-0">
                            <div class="row gx-0 row-flex">
                                <div class="col-sm-1 bg-success me-1 left-answer">
                                    <p class="form-control-plaintext text-white text-center">A.</p>
                                </div>
                                <div class="col bg-success right-answer">
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
                            답변일자 : ${dto.answer_date}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top">
                            ${dto.answer}
                        </td>
                    </tr>
                </tbody>
            </table>
        </c:if>
        
        <!-- 버튼들 -->
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
        
        <!-- 답변 폼 -->
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
