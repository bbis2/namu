<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.articleBoard {
	height: 600px;
}
.post {
      padding: 16px;
      margin-bottom: 16px;
  }
  .comments {
      margin-top: 16px;
  }
  .comment {
      border-top: 1px solid #eee;
      padding: 8px 0;
  }
  .comment:first-child {
      border-top: none;
  }
  .comment-form {
      display: flex;
      margin-top: 16px;
  }
  .comment-form input[type="text"] {
      flex: 1;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
  }
  .comment-form button {
      padding: 8px 16px;
      border: none;
      background-color: #ffc107;
      color: #fff;
      border-radius: 4px;
      cursor: pointer;
      margin-left: 8px;
  }
</style>
</head>
<body>
<div class="article-container">
    <div class="article-header">
        <div class="author">정유진</div>
        <div class="time">1분 전</div>
        <div class="article-options">
            <button  type="button"  style="background: #fff; color: #aaa;">⋮</button>
        </div>
    </div>
    <div class="article-content">
        하하하하하
    </div>
</div>
</body>
</html>