<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 공지사항 list -->
<c:forEach var="vo" items="${listNotice}">
    <div class="post-list">
        <div class="post-item">
            <div class="post-date">
            [공지글]
                <div class="month-year">${dto.regDate}</div>
            </div>
            <div class="post-content">
                <h2>${dto.subject}</h2>
                <div class="post-meta">
                    작성자: ${dto.nickName}
                </div>
            </div>
        </div>
    </div>
</c:forEach>


