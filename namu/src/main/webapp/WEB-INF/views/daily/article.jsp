<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.fleamarket-cover {
    background-color: #E3F1C5;
}

h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
}
.htext{
	padding-top: 100px;
	padding-left : 100px;
}
.cover-content {
	padding: 50px;
    position: relative;
    height: 100%;
    box-sizing: border-box;
    margin-left: 100px;
}

@media (min-width: 768px) {
    .fleamarket-cover {
        height: 315px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
    }
    
body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.container {
    margin: 0 auto;
    padding: 20px;
    border-radius: 8px;
}

.content {
    padding: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

textarea.form-control {
    height: 100px;
    resize: none;
}

.content-meta {
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
}

.navigation,
.actions,
.comments {
    margin: 10px 0;
}

.navigation .btn,
.actions .btn,
.comments .btn {
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px;
}

.navigation .btn:hover,
.actions .btn:hover,
.comments .btn:hover {
    background-color: #4c3b2b;
}

.comments input[type="text"] {
    margin-bottom: 10px;
}
 
    
}

</style>

<div class="container">

<section class="fleamarket-cover">
      <h1 class="cover-title htext">믿을만한<br>나무 거래</h1>
      <span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>	
      <span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
      <div class="cover-image">
      </div>
  </section>
  
	    <div class="container">
        <div class="content">
            <div class="form-group">
                <label for="tag">태그</label>
                <input type="text" id="tag" class="form-control">
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" class="form-control">
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" class="form-control">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" class="form-control"></textarea>
            </div>
            <div class="content-meta">
                <span>등록일</span>
                <span>조회</span>
            </div>
            <div class="navigation">
                <button class="btn">이전글</button>
                <button class="btn">다음글</button>
            </div>
            <div class="actions">
                <button class="btn">수정</button>
                <button class="btn">삭제</button>
                <button class="btn">리스트</button>
            </div>
            <div class="comments">
                <input type="text" class="form-control" placeholder="닉네임">
                <input type="text" class="form-control" placeholder="댓글을 입력하세요">
                <button class="btn">댓글 등록</button>
            </div>
        </div>
    </div>
</div>