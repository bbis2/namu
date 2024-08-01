<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row board-list-header">
    <div class="col-auto me-auto mb-3">
        <p style="font-weight: bold;">총 공지글 : ${dataCount}개</p>
    </div>
    <div class="col-auto">&nbsp;</div>
</div>

<!-- 공지사항 list -->
<c:forEach var="vo" items="${list}">
    <div class="post-list mb-3">
        <div class="post-item" style="position: relative;">
        <c:if test="${sessionScope.member.userId == vo.userId}">
            <div style="position: absolute; right: 0; mb-6">
            
                <div class="dropdown">
                    <button class="dropdown" type="button" data-bs-toggle="dropdown" style="background:none; border: none; color: olive;">
                        <i class='bi bi-three-dots-vertical'></i>
                    </button>
                    
                    <div class="dropdown-menu">
                        <button class="dropdown-item btnDeleteNoticeList" type="button" data-num="${vo.num}">삭제</button>
                    </div>
                </div>
                
            </div>
		</c:if>
            <div class="post-date">
                [공지글]
                <div class="month-year">${vo.regDate}</div>
            </div>
            <div class="post-content">
                <h2>${vo.subject}</h2>
                <div class="text-break mb-4">${vo.content}</div>
                <div class="post-meta">
                    작성자: ${vo.nickName}
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<div class="page-navigation">${paging}</div>


