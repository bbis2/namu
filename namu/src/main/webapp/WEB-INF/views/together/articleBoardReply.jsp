<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${listReply}" var="vo">
<div class="article-container">
    <div class="article-header">
        <div class="col-1">${vo.nickName}</div>
        <div class="col-4">${vo.regDate}</div>
        <div>
            <button  type="button"  class="btn btnBoardReply" style="background: #fff; color: #aaa;">⋮</button>
        </div>
    </div>
    <div class="article-content">

       		<div class="row">
       			<div class="col">
       				${vo.nickName}
       			</div>
       			<div class="col">
       				${vo.content}
       			</div>
       		</div>

    </div>
</div>
</c:forEach>

<div class="page-navigation">${paging}</div>

