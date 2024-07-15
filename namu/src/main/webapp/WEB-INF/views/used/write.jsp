<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
	<div class="title">
		<h3>🌳중고거래</h3>
		</div>
		
		<form name="UsedForm" method="post" enctype="multipart/form-data">
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
					<p class="block">${sessionScope.member.userId}</p>
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">금액</td>
				<td>
					<input class="block" type="number" name="price" value="${dto.price}">
				</td>
			</tr>
			<c:if test="${mode=='update'}">
			<tr>
				<td class="bg-light col-sm-2" scope="row">상태</td>
				<td>
				  <input type="radio" name="state" value="0" checked>&nbsp;판매중
				  <input type="radio" name="state" value="1">&nbsp;예약중
				  <input type="radio" name="state" value="2">&nbsp;판매완료
				</td>
			</tr>
			</c:if>
			<tr>
				<td class="bg-light col-sm-2" scope="row">사진</td>
				<td>
					<div class="img-viewer">🌳<i class="bi bi-exposure"></i></div>
					<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">내용</td>
				<td>
					<textarea class="block" name="content">${dto.content}</textarea>
				</td>
			</tr>
			</table>
			
			<table class="btn3">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="check()">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="UsedDelete()">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="imageFile" value="${dto.imageFile}">
							</c:if>
						</td>
					</tr>
			</table>
		</form>
</div>

<script type="text/javascript">
$(function() {
	let img = "${dto.imageFile}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/photo/" + img;
		$(".write-form .img-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .img-viewer").click(function(){
		$("form[name=UsedForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=UsedForm] input[name=selectFile]").change(function(){
		let file = this.files[0];
		if(! file) {
			$(".write-form .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/" + img;
			} else {
				img = "🌳";
			}
			$(".write-form .img-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$(".write-form .img-viewer").empty();
			$(".write-form .img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});

</script>


<script type="text/javascript">
function check() {
	const f = document.UsedForm;
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
	 f.action = "${pageContext.request.contextPath}/used/${mode}";
	 f.submit();
	 return true;
}


function UsedDelete() {
	const f = document.UsedForm;
	
	f.action = "${pageContext.request.contextPath}/used/list";
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

