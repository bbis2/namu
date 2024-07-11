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

.fleamarket-cover {
    background-color: #E3F1C5;
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
}
/*여기까지 초록 박스*/

.filter-container {
    text-align: right;
    margin-bottom: 20px;
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
    width: 200px;
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
    height: 100px;
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

h2 {
	font-weight: bold;
}
</style>

<script type="text/javascript">
function check() {
    const f = document.DailyForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요.");
        f.subject.focus();
        return false;
    }

    str = f.content.value.trim();
    if(! str || str === "<p><br></p>") {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/daily/${mode}";
    return true;
}
</script>

</head>
<body>
<div class="container">
	 <section class="fleamarket-cover">
			<h1 class="cover-title htext bd">함께하는<br>일상생활</h1>
			<span class="cover-description htext"></span><br>
			<span class="cover-description htext">동네주민과 함께 만들어가요!</span>
			<div class="cover-image"></div>
	  </section>
		  
		<div class="body-title">
			<h2>글쓰기</h2>
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
					<textarea name="content" id="ir1" class="form-control" style="width: 95%; height: 270px;">${dto.content}</textarea>
            </div>
            <div class="form-buttons">
                <button type="submit">글등록</button>
                <button type="reset">다시입력</button>
                <button type="button" onclick="window.location.href='/'">취소하기</button>
            </div>
        </form>
</div>
	
<!-- 스마트에디터 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		elClickedObj.submit();
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
	
</body>
</html>