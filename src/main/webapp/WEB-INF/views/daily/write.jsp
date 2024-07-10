<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

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
   
    
}
.container {
    padding: 20px;
    margin: 20px auto;
}

h2 {
	padding-top:30px;
    display: flex;
    align-items: center;
    font-size: 1.5em;
}


.form-group {
    margin-bottom: 15px;
    display: flex;
    align-items: center;
}

.form-group label {
    width: 100px;
    font-weight: bold;
}

.form-group input,
.form-group select,
.form-group textarea {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

.form-group textarea {
    height: 150px;
    resize: vertical;
}

.form-buttons {
    display: flex;
    justify-content: center; /* 가운데 정렬 */
    gap: 10px; /* 버튼 사이 간격 */
    margin-top: 20px; /* 위에 여백 추가 */
}

.form-buttons button {
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

.form-buttons button:hover {
    background-color: #4c3b2b;
}

</style>
</head>
<body>
<div class="container">
	<section class="fleamarket-cover">
	      <h1 class="cover-title htext">믿을만한<br>나무 거래</h1>
	      <span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>	
	      <span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
	      <div class="cover-image">
	      </div>
	  </section>
		  
		<div class="body-title">
			<h2> 글쓰기</h2>
		</div>
		  
		          
        <form>
            <div class="form-group">
                <label for="tag">태그</label>
                <select id="tag" name="tag">
                    <option value="" selected>태그 선택</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title">
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content"></textarea>
            </div>
            <div class="form-buttons">
                <button type="submit">글등록</button>
                <button type="reset">다시입력</button>
                <button type="button" onclick="window.location.href='/'">취소하기</button>
            </div>
        </form>
	</div>

</body>
</html>