<%@ page contentType="text/html; charset=UTF-8" %>
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

.table-form tr>td { vertical-align: middle; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr>td:first-child { text-align: center; }
.table-form tr>td:nth-child(2) { padding-left: 10px; }
.table-form textarea { height: 170px; resize: none; }

.table-form .option-minus, .table-form .option-minus2 { cursor: pointer; }

.table-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px; height: 50px; border-radius: 10px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.table-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.table-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	let mode = "${mode}";
	if(mode === "write") {
		let classify = "${classify}";
		$("select[name=classify]").val(classify);
		
		$("#productShow1").prop("checked", true);
	}
});

function check() {
	const f = document.productForm;
	let str, b;
	let mode = "${mode}";
	


	if(! f.categoryNum.value) {
		alert("카테고리를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	if(! f.typeNum.value) {
		alert("판매유형을 선택하세요.");
		f.typeNum.focus();
		return false;
	}
	
	if(! f.subject.value.trim()) {
		alert("상품명을 입력하세요.");
		f.productName.focus();
		return false;
	}
	
	if(!/^(\d){1,8}$/.test(f.price.value)) {
		alert("상품가격을 입력 하세요.");
		f.price.focus();
		return false;
	}
	
	let optionCount = parseInt(f.optionCount.value);
	
	if(optionCount > 0) {
		if(! f.optionName.value.trim()) {
			alert("옵션명 입력 하세요.");
			f.optionName.focus();
			return false;
		}
		
		b = true;
		$("input[name=optionValues]").each(function(){
			if(! $(this).val().trim()) {
				b= false;
				return false;
			}
		});
		
		if(! b) {
			alert("옵션값을 입력 하세요.");
			return false;
		}
	}
	
	if(optionCount > 1) {
		if(! f.optionName2.value.trim()) {
			alert("옵션명 입력 하세요.");
			f.optionName2.focus();
			return false;
		}
		
		b = true;
		$("input[name=optionValues2]").each(function(){
			if(! $(this).val().trim()) {
				b= false;
				return false;
			}
		});
		if(! b) {
			alert("옵션값을 입력 하세요.");
			return false;
		}
	}
	
	str = f.content.value.trim();
	if( !str || str === "<p><br></p>" ) {
		alert("상품 설명을 입력하세요.");
		f.content.focus();
		return false;
	}
	
	if(! f.guidelines.value.trim()) {
		alert("주의사항을 입력하세요.");
		f.guidelines.focus();
		return false;
	}

	if(mode === "write" && ! f.thumbnailFile.value) {
		alert("대표 이미지를 등록하세요.");
		f.thumbnailFile.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/talent/${mode}";
	return true;
}
</script>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}
</script>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
	$(function(){
		let count = ${dto.optionCount};
		
		if(count === 0) {
			$('.product-option-1').hide();
			$('.product-option-2').hide();
		} else if(count === 1) {
			$('.product-option-2').hide();
		}
	});
	</script>
</c:if>

<script type="text/javascript">
$(function(){
	$('select[name=optionCount]').change(function(){
		let count = parseInt($(this).val());
		let mode = '${mode}';
		let savedCount = '${dto.optionCount}';
		let totalStock = '${dto.totalStock}';
		if(mode === 'update' && totalStock !== '0') {
			alert('옵션 변경이 불가능 합니다.');
			$(this).val(savedCount);
			return false;
		}
		
		if(count === 0) {
			$('.product-option-1').hide();
			$('.product-option-2').hide();
			
			
		} else if(count === 1) {
			$('.product-option-1').show();
			$('.product-option-2').hide();
			
			
		} else if(count === 2) {
			$('.product-option-1').show();
			$('.product-option-2').show();
		}
	});
});

$(function(){
	$(".btnOptionAdd").click(function(){
		let $el = $(this).closest(".option-area").find(".optionValue-area");
		if($el.find(".input-group").length >= 5) {
			alert("옵션은 최대 5개까지 가능합니다.");
			return false;
		}
		let $option = $(".option-area .optionValue-area .input-group:first-child").clone();
		
		$option.find("input[type=hidden]").remove();
		$option.find("input[name=optionValues]").removeAttr("value");
		$option.find("input[name=optionValues]").val("");
		$el.append($option);
	});
	
	$(".option-area").on("click", ".option-minus", function(){
		let $minus = $(this);
		let $el = $minus.closest(".option-area").find(".optionValue-area");
		
		// 수정에서 등록된 자료 삭제
		let mode = "${mode}";
		if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums]").length === 1) {
			// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
			if($el.find(".input-group input[name=detailNums]").length <= 1) {
				alert("옵션값은 최소 하나이상 필요합니다.");	
				return false;
			}
			
			if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
				return false;
			}
			
			let detailNum = $minus.parent(".input-group").find("input[name=detailNums]").val();
			let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
			$.post(url, {detailNum:detailNum}, function(data){
				if(data.state === "true") {
					$minus.closest(".input-group").remove();
				} else {
					alert("옵션값을 삭제할 수 없습니다.");
				}
			}, "json");
			
			return false;			
		}
		
		if($el.find(".input-group").length <= 1) {
			$el.find("input[name=optionValues]").val("");
			return false;
		}
		
		$minus.closest(".input-group").remove();
	});
});

$(function(){
	$(".btnOptionAdd2").click(function(){
		let $el = $(this).closest(".option-area2").find(".optionValue-area2");
		if($el.find(".input-group").length >= 5) {
			alert("옵션 값은 최대 5개까지 가능합니다.");
			return false;
		}
		let $option = $(".option-area2 .optionValue-area2 .input-group:first-child").clone();
		
		$option.find("input[type=hidden]").remove();
		$option.find("input[name=optionValues2]").removeAttr("value");
		$option.find("input[name=optionValues2]").val("");
		$el.append($option);
	});
	
	$(".option-area2").on("click", ".option-minus2", function(){
		let $minus = $(this);
		let $el = $minus.closest(".option-area2").find(".optionValue-area2");
		
		// 수정에서 등록된 자료 삭제
		let mode = "${mode}";
		if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums2]").length === 1) {
			// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
			if($el.find(".input-group input[name=detailNums2]").length <= 1) {
				alert("옵션값은 최소 하나이상 필요합니다.");	
				return false;
			}
			
			if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
				return false;
			}
			
			let detailNum = $minus.parent(".input-group").find("input[name=detailNums2]").val();
			let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
			$.post(url, {detailNum:detailNum}, function(data){
				if(data.state === "true") {
					$minus.closest(".input-group").remove();
				} else {
					alert("옵션값을 삭제할 수 없습니다.");
				}
			}, "json");
			
		}
		
		if($el.find(".input-group").length <= 1) {
			$el.find("input[name=optionValues2]").val("");
			return false;
		}
		
		$minus.closest(".input-group").remove();
	});
});
</script>


<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 재능마켓 상품 등록 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="productForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 table-form">
					<tr>
						<td class="table-light col-sm-2">카테고리</td>
						<td>
							<div class="row">
								<div class="col-6">
									<select name="categoryNum" class="form-select">
										<option value="">카테고리</option>
											<c:forEach var="vo" items="${listCategory}">
											<option value="${vo.categoryNum}" ${categoryNum == vo.categoryNum?"selected" : ""}>${vo.categoryName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품구분</td>
						<td>
							<div class="row">
								<div class="col-6">
									<select name="typeNum" class="form-select">
										<c:forEach var="vo" items="${listType}">
											<option value="${vo.typeNum}" ${typeNum == vo.typeNum?"selected" : ""}>${vo.type}</option>
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
						<td class="table-light col-sm-2">상품명</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">상품가격</td>
						<td>
							<input type="text" name="price" class="form-control" value="${dto.price}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품 옵션</td>
						<td>
							<div class="row">
								<div class="col-6">
									<select name="optionCount" class="form-select">
										<option value="2" ${dto.optionCount==2?'selected':''}>옵션 둘</option>
										<option value="1" ${dto.optionCount==1?'selected':''}>옵션 하나</option>
										<option value="0" ${dto.optionCount==0?'selected':''}>옵션 없음</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr class="product-option-1">
						<td class="table-light col-sm-2">옵션 1</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName" class="form-control" style="width: 250px;" placeholder="옵션명" value="${dto.optionName}">
								<c:if test="">
									<input type="hidden" name="optionNum" value="${empty dto.optionNum ? 0 : dto.optionNum}">
								</c:if>
							</div>
							<div class="row option-area">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area">
									<c:forEach var="vo" items="${listOptionDetail}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
											<input type="hidden" name="detailNums" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>
					<tr class="product-option-2">
						<td class="table-light col-sm-2">옵션 2</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName2" style="width: 250px;" class="form-control" placeholder="옵션명" value="${dto.optionName2}">
								<c:if test="">
									<input type="hidden" name="optionNum2" value="${empty dto.optionNum2 ? 0 : dto.optionNum2}">
								</c:if>
							</div>
							<div class="row option-area2">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area2">
									<c:forEach var="vo" items="${listOptionDetail2}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
											<input type="hidden" name="detailNums2" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail2 || listOptionDetail2.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd2">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">상품설명</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">교환/환불 및 주의사항</td>
						<td>
							<textarea name="guidelines" class="form-control" style="max-width: 95%; height: 290px;">${dto.guidelines}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">대표이미지</td>
						<td>
							<div class="thumbnail-viewer"></div>
							<input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">추가이미지</td>
						<td>
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								<c:forEach var="vo" items="${listFile}">
									<img src="${pageContext.request.contextPath}/uploads/product/${vo.filename}"
										class="item delete-img"
										data-fileNum="${vo.fileNum}"
										data-filename="${vo.filename}">
								</c:forEach>
							</div>
							<input type="file" name="addFiles" accept="image/*" multiple class="form-control" style="display: none;">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<c:url var="url" value="/talent/list">
								<c:if test="${not empty page}">
									<c:param name="page" value="${page}"/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="tboardNum" value="${dto.tboardNum}">
								<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
								<input type="hidden" name="page" value="${page}">
								
								<input type="hidden" name="prevOptionNum" value="${empty dto.optionNum ? 0 : dto.optionNum}">
								<input type="hidden" name="prevOptionNum2" value="${empty dto.optionNum2 ? 0 : dto.optionNum2}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/talent/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/talent/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { 
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});


$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/admin/product/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});


$(function(){
	var sel_files = [];
	
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=productForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.addFiles.files = dt.files;
			
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
		document.productForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".table-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
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
		document.productForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

</script>