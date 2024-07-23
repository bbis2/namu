<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
        margin-bottom: 60px;
}
/*여기까지 초록 박스*/


.body-title {
    margin: 40px 0;
    text-align: left;
}

.body-title h2 {
    font-size: 28px;
    font-weight: bold;
}

.write-form {
    width: 100%;
    border-collapse: collapse;
}

.write-form td {
    padding: 10px;
    border: 1px solid #ddd;
}

.write-form .bg-light {
    background-color: #f9f9f9;
}

.form-control {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
}

.form-control-plaintext {
	height: 40px;
    padding: 8px;
}

.table-borderless td {
    border: none;
}

.text-center {
    text-align: center;
}

.btn {
    padding: 10px 20px;
    font-size: 16px;
    margin: 5px;
}

.btn-dark {
    background-color: #333;
    color: #fff;
    border: none;
}

.btn-light {
    background-color: #f9f9f9;
    color: #333;
    border: 1px solid #ddd;
}
</style>

<script type="text/javascript">
function check() {
    const f = document.dailyForm;
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
	</section>
		  
	<div class="body-title">
		<h2>글 등록</h2>
	</div>
		  
	<form name="dailyForm" method="post" enctype="multipart/form-data">
		<table class="table mt-5 write-form">
			<tr>
				<td class="bg-light col-sm-2" scope="row">카테고리</td>
				<td>
					<div class="row">
						<div class="col-6 pe-1">
							<select id="categoryNum" name="categoryNum" class="form-select">
								<option value="" selected>카테고리 선택</option>
								<c:forEach var="vo" items="${listDailyCategory}">
									<option value="${vo.categoryNum}" ${categoryNum == vo.categoryNum?"selected" : ""}>${vo.categoryName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="table-light col-sm-2">동네</td>
				<td>
					<div class="row">
						<div class="col-6">
							<select name="town" class="form-select">
								<option>동네 선택</option>
								<option value="${sessionScope.member.town1}">${sessionScope.member.town1}</option>
							<c:if test="${sessionScope.member.town2 != null}">
								<option value="${sessionScope.member.town2}">${sessionScope.member.town2}</option>
							</c:if>
							</select>
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="bg-light col-sm-2" scope="row"> 닉네임 </td>
				<td>
					<p class="form-control-plaintext">${sessionScope.member.nickName}</p>
				</td>
			</tr>
			
			<tr>
				<td class="bg-light col-sm-2" scope="row">제목</td>
				<td>
					<input type="text" name="subject" class="form-control" value="${dto.subject}">
				</td>
			</tr>

			<tr>
				<td class="bg-light col-sm-2" scope="row"> 내용 </td>
				<td>
					<textarea name="content" id="ir1" class="form-control" style="height: 300px;">${dto.content}</textarea>
				</td>
			</tr>
		</table>
		
		<table class="table table-borderless">
			<tr>
				<td class="text-center">
					<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
					<button type="reset" class="btn btn-light">다시입력</button>
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/daily/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</td>
			</tr>
		</table>        	
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
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);z
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
