<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
 <table class="table table-hover board-list" style="text-align: center;" >
			 <thead class="table-light">
        <tr>
            <th width="60">번호</th>
            <th width="150">제목</th>
            <th width="100">작성자</th>
            <th width="100">작성일</th>
        </tr>
    </thead>
    <tbody>
            <c:forEach var="qna" items="${qnalist}" varStatus="status">
                <tr>
                <td>${qna.qNum}</td>
                <c:choose>
                    <c:when test="${qna.secret == 1}">
                        <c:if test="${qna.nickName == sessionScope.member.nickName || sessionScope.member.nickName == '관리자'}">
                            <td style="text-align: left; cursor: pointer;" onclick="clickContent(${qna.qNum})">🔒 ${qna.subject}</td>
                        </c:if>
                        <c:if test="${qna.nickName != sessionScope.member.nickName}">
                            <td style="text-align: left;">🔒 ${qna.subject}</td>
                        </c:if>
                    </c:when>
                    <c:when test="${qna.secret == 0}">
                        <td style="text-align: left; cursor: pointer;" onclick="clickContent(${qna.qNum})">${qna.subject}</td>
                    </c:when>
                </c:choose>
                <td>${qna.nickName}</td>
                <td>${qna.questionDate}</td>
            </tr>
                <tr id="content${qna.qNum}" class="content">
                    <td colspan="4">
                    	<div class="p-1">
                          	<div class="px-3" style="text-align: left; white-space: pre;"> &lt; ${qna.nickName} &gt; 님 문의 내용</div>
	                        <div class="fs-6 p-3" style="text-align: left; white-space: pre; ">${qna.content}</div>
	                        
	                        <c:if test="${empty qna.answer && sessionScope.member.userId == dto}">
	                        <div class="pe-3" style="text-align: right;">
	                        	<button class="btn-reply" onclick="clickAnswer(${qna.qNum})">${empty qna.answer ? "답변하기" : ""}</button>
	                        </div>
	                       </c:if>
	                       
	                       <c:if test="${not empty qna.answer}">
	                        <div class="pe-3" style="text-align: right;">
	                        	<button class="btn-reply" onclick="clickAnswer(${qna.qNum})">답변보기</button>
	                        </div>
	                        </c:if>
	                        
                        </div>
                    </td>
                </tr>
                <tr id="answer${qna.qNum}" class="answerlist">
                    <td colspan="4" class="p-0">
                        <div class='m-1'>
                        	<c:if test="${not empty qna.answer}">
	                            <div>
	                            	<div class="mt-1" style="text-align: right;">등록일 : ${qna.answerDate} </div>
	                            	<div class="px-3" style="text-align: left; white-space: pre;"> &lt; 판매자 &gt; 문의 답변</div>
	                            	<div class="fs-6 px-3" style="text-align: left; white-space: pre;">${qna.answer}</div>
	                            </div>
                            </c:if>
                        	<c:if test="${empty qna.answer}">
	                            <div>
		                            <div class="p-1 pe-3">
		                                <textarea class="form-control m-2 qna-answer-content" style="resize: none;"></textarea>
		                            </div>
		                            <div class='text-end pe-3 pb-1'>
		                                <button type='button' class='btnSendQnaAnswer' data-qNum='${qna.qNum}' 
		                                	data-pageNo="${pageNo}" data-aNum='${qna.aNum}'>답변등록</button>
		                            </div>
		                         </div>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
</table>
<div class="page-navigation">
	${dataCount==0? "등록된 문의가 없습니다." : paging }
</div>
