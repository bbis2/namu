<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${listReply}" var="vo">
<div class="article-container">
    <div class="article-header">
        <div class="col-1" style="font-weight: bold;">${vo.nickName}</div>
        <div class="col-4" style="text-align: right; display: flex; justify-content: flex-end; align-items: center;">
            <span>${vo.regDate}</span>
            <button type="button" class="btn btnBoardReply" style="background: #fff; color: #aaa; margin-left: 10px;">⋮</button>
        </div>
    </div>
    <div class="article-content">
        <div class="row">
            <div class="col">
                ${vo.content}
            </div>
        </div>
    </div>
</div>
</c:forEach>

<div class="page-navigation">${paging}</div>

