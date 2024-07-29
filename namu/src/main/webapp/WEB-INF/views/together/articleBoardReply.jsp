<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<body>
<div class="article-container">
    <div class="article-header">
        <div class="author">${dto.nickName}</div>
        <div class="time">${dto.regDate}</div>
        <div class="article-options">
            <button  type="button"  class="btn btnBoardReply" style="background: #fff; color: #aaa;">⋮</button>
        </div>
    </div>
    <div class="article-content">
       
    </div>
</div>
</body>
</html>