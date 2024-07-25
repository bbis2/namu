<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.write-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px; height: 50px; border-radius: 10px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.write-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.write-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

.btn-cg {
 border:none;
 border-radius: 7px;
 padding: 3px;
 margin-right: 7px;
 cursor: pointer;
}

.btn-cg.active {
 background-color: skyblue; 
 color: white;
}

.btn-town {
 border:none;
 border-radius: 7px;
 padding: 3px;
 margin-right: 7px;
 cursor: pointer;
}

.btn-town.active {
 background-color: skyblue; 
 color: white;
}

</style>

<div class="container body-container">
	<div class="title">
		<h3>🤖중고경매 1:1문의</h3>
		</div>
		
		<form name="AuctionBoardForm" method="post">
			<table class="table mt-2 write-form">
			<tr>
				<td class="bg-light col-sm-2" scope="row">제목</td>
				<td>
					<input class="block" type="text" name="subject" value="${dto.subject}">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">작성자</td>
				<td>
					<p class="block">${sessionScope.member.nickName}</p>
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">내용</td>
				<td>
					<textarea class="block" name="content">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">비밀글</td>
				<td>
					<input type="checkbox" name="secret" value="1">${dto.secret}
				</td>
			</tr>
			</table>
			
			<table class="btn3">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="check()">등록하기&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="UsedDelete()">등록취소&nbsp;<i class="bi bi-x"></i></button>
							<input type="hidden" name="aNum" value="${aNum}">
							<input type="hidden" name="page" value="${page}">
						</td>
					</tr>
			</table>
		</form>
</div>

<script type="text/javascript">
function check() {
	const f = document.AuctionBoardForm;
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
	 
	 f.action = "${pageContext.request.contextPath}/auction/write2";
	 f.submit();
	 return true;
}


function UsedDelete() {
	const f = document.AuctionBoardForm;

	f.action = "${pageContext.request.contextPath}/auction/list";
	f.submit();
}

</script>

<style>
.title {
margin-top: 100px;
}

.block {
	border: none;
}

</style>

