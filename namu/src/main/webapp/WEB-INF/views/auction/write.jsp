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
		<h3>👑중고경매</h3>
		</div>
		
		<form name="AuctionForm" method="post" enctype="multipart/form-data">
			<table class="table mt-2 write-form">
			<tr>
				<td class="bg-light col-sm-2" scope="row">카테고리</td>
				<td>
				  <button type="button" class="btn-cg ${empty dto || dto.cnum==1?'active':'' }" value="1" onclick="cnumChange(1)">디지털ㆍ가전</button>
				  <button type="button" class="btn-cg ${dto.cnum==2?'active':'' }" value="2" onclick="cnumChange(2)">의류</button>
				  <button type="button" class="btn-cg ${dto.cnum==3?'active':'' }" value="3" onclick="cnumChange(3)">식품</button>
                  <button type="button" class="btn-cg ${dto.cnum==4?'active':'' }" value="4" onclick="cnumChange(4)">도서ㆍ상품권</button>
                  <button type="button" class="btn-cg ${dto.cnum==5?'active':'' }" value="5" onclick="cnumChange(5)">기타</button>
                  <input type="hidden" name="cnum" value="1">
				</td>
			</tr>
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
				<td class="bg-light col-sm-2" scope="row">나의 동네</td>
				<td>
					<button type="button" class="btn-town ${dto.town==1?'active':'' }" value="1" onclick="townChange(1)">${sessionScope.member.town1}</button>
					<button type="button" class="btn-town ${dto.town==2?'active':'' }" value="2" onclick="townChange(2)">${sessionScope.member.town2}</button>
					<input type="hidden" name="town" value="1">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">시작가</td>
				<td>
					<input class="block" type="number" name="minBid" value="${dto.minBid}">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">경매시작</td>
				<td>
					<input class="block" type="date" name="startDate" value="${dto.startDate}">
					<input class="block" type="time" name="startTime" value="${dto.startTime}">
				</td>
			</tr>
			<tr>
				<td class="bg-light col-sm-2" scope="row">경매종료</td>
				<td>
					<input class="block" type="date" name="endDate" value="${dto.endDate}">
					<input class="block" type="time" name="endTime" value="${dto.endTime}">
				</td>
			</tr>
			<c:if test="${mode=='update'}">
			<tr>
				<td class="bg-light col-sm-2" scope="row">상태</td>
				<td>
				  <input type="radio" name="state" value="0" 
                <c:if test="${dto.state == 0}">checked</c:if>>&nbsp;판매중
				  <input type="radio" name="state" value="1" 
                <c:if test="${dto.state == 1}">checked</c:if>>&nbsp;낙찰완료
				  <input type="radio" name="state" value="2" 
                <c:if test="${dto.state == 2}">checked</c:if>>&nbsp;유찰
				</td>
			</tr>
			</c:if>
			<tr>
				<td class="bg-light col-sm-2" scope="row">썸네일</td>
				<td>
					<div class="thumbnail-viewer"></div>
					<input type="file" name="thumbFile" accept="image/*" class="form-control" style="display: none;">
				</td>
			</tr>			
			<tr>
				<td class="bg-light col-sm-2" scope="row">추가 이미지</td>
				<td>
					<div class="img-grid">
						<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
						<c:forEach var="vo" items="${listFile}">
							<img src="${pageContext.request.contextPath}/uploads/auctionPhoto/${vo.uploadFile}"
								class="item delete-img"
								data-fileNum="${vo.fileNum}"
								data-filename="${vo.uploadFile}">
						</c:forEach>
					</div>
					<input type="file" name="selectFile" accept="image/*" class="form-control" multiple="multiple" style="display: none;">
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
								<input type="hidden" name="aNum" value="${dto.aNum}">
								<input type="hidden" name="imageFile" value="${dto.imageFile}">
								<input type="hidden" name="selectFile" value="${vo.uploadFile}">
							</c:if>
						</td>
					</tr>
			</table>
		</form>
</div>

<script type="text/javascript">
//대표(썸네일) 이미지
$(function(){
	var img = "${dto.imageFile}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/auctionPhoto/"+img;
		$(".write-form .thumbnail-viewer").empty();
		$(".write-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .thumbnail-viewer").click(function(){
		$("form[name=AuctionForm] input[name=thumbFile]").trigger("click");
	});
	
	$("form[name=AuctionForm] input[name=thumbFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".write-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/auctionPhoto/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".write-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".write-form .thumbnail-viewer").empty();
			$(".write-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

// 수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/auction/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

//추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".write-form .img-add", function(){
		$("form[name=AuctionForm] input[name=selectFile]").trigger("click");
	});
	
	$("form[name=AuctionForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.AuctionForm.selectFile.files = dt.files;
			
			return false;
		}
		
     for(let file of this.files) {
     	sel_files.push(file);
     	
         const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
	         reader.onload = e => {
	         	$img.attr("src", e.target.result);
	         };
			reader.readAsDataURL(file);
         
         $(".img-grid").append($img);
     }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.AuctionForm.selectFile.files = dt.files;
	});
	
	$("body").on("click", ".write-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-selectFile");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.AuctionForm.selectFile.files = dt.files;		
		
		$(this).remove();
	});
});
</script>


<script type="text/javascript">
function check() {
	const f = document.AuctionForm;
	let str;
	
	str = f.cnum.value.trim();
 	if(!str) {
 		alert("카테고리를 선택하세요.");
 		f.cnum.focus();
	 return false;
	 	}
 	
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
	 
	 str = f.startDate.value.trim();
	 if(! str) {
		 alert("시작 일자를 선택하세요. ");
		 f.startDate.focus();
		 return false;
	 }

	 str = f.startTime.value.trim();
	 if(! str) {
		 alert("시작 시간를 선택하세요. ");
		 f.startTime.focus();
		 return false;
	 }

	 str = f.endDate.value.trim();
	 if(! str) {
		 alert("종료 일자를 선택하세요. ");
		 f.endDate.focus();
		 return false;
	 }

	 str = f.endTime.value.trim();
	 if(! str) {
		 alert("종료 시간를 선택하세요. ");
		 f.endTime.focus();
		 return false;
	 }
	 
	 str = f.minBid.value.trim();
	 if(! str || str === "<p><br></p>") {
		 alert("금액을 입력하세요. ");
		 f.content.focus();
		 return false;
	 }
	 
	 f.action = "${pageContext.request.contextPath}/auction/${mode}";
	 f.submit();
	 return true;
}


function UsedDelete() {
	const f = document.AuctionForm;
	
	f.action = "${pageContext.request.contextPath}/auction/list";
	f.submit();
}

function cnumChange(cnum) {
	const f = document.AuctionForm;
	
	f.cnum.value = cnum;
}

function townChange(cnum) {
	const f = document.AuctionForm;
	
	f.town.value = town;
}


// 카테고리 버튼 클릭 시
document.querySelectorAll('.btn-cg').forEach(button => {
  button.addEventListener('click', () => {
    document.querySelectorAll('.btn-cg').forEach(btn => btn.classList.remove('active'));
    button.classList.add('active');
  });
});

// 주소 버튼 클릭 시
document.querySelectorAll('.btn-town').forEach(button => {
	  button.addEventListener('click', () => {
	    document.querySelectorAll('.btn-town').forEach(btn => btn.classList.remove('active'));
	    button.classList.add('active');
	  });
	});
</script>

<style>
.title {
margin-top: 100px;
}

.block {
	border: none;
}

</style>

