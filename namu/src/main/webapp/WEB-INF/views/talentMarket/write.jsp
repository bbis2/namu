<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.custom-container {
    max-width: 1000px;
    margin: auto;
    padding: 20px;
    background-color: #f7f3fc; 
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.custom-body-container {
    padding: 20px;
}

.custom-body-title h3 {
    font-size: 24px;
    font-weight: bold;
    color: #6f42c1; 
    text-align: center;
    margin-bottom: 30px;
}

.custom-table-form {
    width: 100%;
    border: 1px solid #dcd6f0; 
    border-radius: 10px;
}

.custom-table-form td {
    padding: 10px;
    border: 1px solid #dcd6f0; 
    background-color: #f7f3fc; 
}

.custom-table-form .form-select,
.custom-table-form input,
.custom-table-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #dcd6f0;
    border-radius: 5px;
    background-color: #ffffff; 
}

.custom-table-form .form-select {
    background-color: #ece8f6;
    border: 1px solid #dcd6f0;
}

.custom-btn {
    background-color: #6f42c1;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
}

.custom-btn:hover {
    background-color: #5a32a3;
}

.custom-btn-light {
    background-color: #e3d9f1; 
    color: #333;
}

.custom-thumbnail-viewer {
    cursor: pointer;
    border: 1px solid #c2c2c2;
    width: 100px;
    height: 100px;
    border-radius: 10px;
    background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
    background-size: cover;
    background-position: center;
}

.custom-img-grid {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

.custom-img-grid .custom-item {
    width: 100px;
    height: 100px;
    border: 1px solid #c2c2c2;
    border-radius: 10px;
    background-size: cover;
    background-position: center;
    cursor: pointer;
}

.custom-help-block {
    color: #6c757d;
}


.custom-table-light {
    background-color: #ece8f6 !important; 
    border: 1px solid #dcd6f0 !important; /
}

.spacing-container {
    margin-top: 100px; 
    margin-bottom: 100px; 
}

h1 {
  position: relative;
  padding: 0;
  margin: 0;
  font-family: "Raleway", sans-serif;
  font-weight: 300;
  font-size: 40px;
  color: #080808;
  -webkit-transition: all 0.4s ease 0s;
  -o-transition: all 0.4s ease 0s;
  transition: all 0.4s ease 0s;
}

h1 span {
  display: block;
  font-size: 0.5em;
  line-height: 1.3;
}
h1 em {
  font-style: normal;
  font-weight: 600;
}

.two h1 {
  text-transform: capitalize;
}
.two h1:before {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 60px;
  height: 2px;
  content: "";
  background-color: #c50000;
}

.two h1 span {
  font-size: 13px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 4px;
  line-height: 3em;
  padding-left: 0.25em;
  color: rgba(0, 0, 0, 0.4);
  padding-bottom: 10px;
}
.alt-two h1 {
  text-align:center;
}
.alt-two h1:before {
  left:50%; margin-left:-30px;
}

</style>

<script type="text/javascript">
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
        f.subject.focus();
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
            alert("옵션명을 입력 하세요.");
            f.optionName.focus();
            return false;
        }

        b = true;
        $("input[name=optionValues]").each(function(){
            if(! $(this).val().trim()) {
                b = false;
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
            alert("옵션명을 입력 하세요.");
            f.optionName2.focus();
            return false;
        }

        b = true;
        $("input[name=optionValues2]").each(function(){
            if(! $(this).val().trim()) {
                b = false;
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
        settings.processData = false;
        settings.contentType = false;
    }
    
    $.ajax(url, settings);
}
</script>

<c:if test="${mode=='update'}">
    <script type="text/javascript">
    $(function(){
        let count = ${dto.optionCount};
        
        if(count === 0) {
            $('.custom-product-option-1').hide();
            $('.custom-product-option-2').hide();
        } else if(count === 1) {
            $('.custom-product-option-2').hide();
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
        if(mode === 'update') {
            alert('옵션 변경이 불가능 합니다.');
            $(this).val(savedCount);
            return false;
        }
        
        if(count === 0) {
            $('.custom-product-option-1').hide();
            $('.custom-product-option-2').hide();
        } else if(count === 1) {
            $('.custom-product-option-1').show();
            $('.custom-product-option-2').hide();
        } else if(count === 2) {
            $('.custom-product-option-1').show();
            $('.custom-product-option-2').show();
        }
    });
});

$(function(){
    $(".custom-btnOptionAdd").click(function(){
        let $el = $(this).closest(".custom-option-area").find(".custom-optionValue-area");
        if($el.find(".input-group").length >= 5) {
            alert("옵션은 최대 5개까지 가능합니다.");
            return false;
        }
        let $option = $(".custom-option-area .custom-optionValue-area .input-group:first-child").clone();
        
        $option.find("input[type=hidden]").remove();
        $option.find("input[name=optionValues]").removeAttr("value");
        $option.find("input[name=optionValues]").val("");
        $el.append($option);
    });
    
    $(".custom-option-area").on("click", ".custom-option-minus", function(){
        let $minus = $(this);
        let $el = $minus.closest(".custom-option-area").find(".custom-optionValue-area");
        
        let mode = "${mode}";
        if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums]").length === 1) {
            if($el.find(".input-group input[name=detailNums]").length <= 1) {
                alert("옵션값은 최소 하나이상 필요합니다.");    
                return false;
            }
            
            if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
                return false;
            }
            
            let detailNum = $minus.parent(".input-group").find("input[name=detailNums]").val();
            let url = "${pageContext.request.contextPath}/talent/deleteOptionDetail";
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
    $(".custom-btnOptionAdd2").click(function(){
        let $el = $(this).closest(".custom-option-area2").find(".custom-optionValue-area2");
        if($el.find(".input-group").length >= 5) {
            alert("옵션 값은 최대 5개까지 가능합니다.");
            return false;
        }
        let $option = $(".custom-option-area2 .custom-optionValue-area2 .input-group:first-child").clone();
        
        $option.find("input[type=hidden]").remove();
        $option.find("input[name=optionValues2]").removeAttr("value");
        $option.find("input[name=optionValues2]").val("");
        $el.append($option);
    });
    
    $(".custom-option-area2").on("click", ".custom-option-minus2", function(){
        let $minus = $(this);
        let $el = $minus.closest(".custom-option-area2").find(".custom-optionValue-area2");
        
        let mode = "${mode}";
        if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums2]").length === 1) {
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
<div class="spacing-container"></div>
<div class="custom-container">

    <div class="custom-body-container">
        <div class="two alt-two">
		  <h1>Talent Registration
		    <span>당신의 재능을 등록해보세요!</span>
		  </h1>
		</div>
        
        <div class="custom-body-main">
        
            <form name="productForm" method="post" enctype="multipart/form-data">
                <table class="table mt-5 custom-table-form">
                    <tr>
                        <td class="custom-table-light col-sm-2">카테고리</td>
                        <td>
                            <div class="row">
                                <div class="col-6">
                                    <select name="categoryNum" class="form-select">
                                        <option value="">카테고리</option>
                                        <c:forEach var="vo" items="${listCategory}">
                                            <option value="${vo.categoryNum}" ${dto.categoryNum == vo.categoryNum?"selected" : ""}>${vo.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">상품구분</td>
                        <td>
                            <div class="row">
                                <div class="col-6">
                                    <select name="typeNum" class="form-select">
                                        <c:forEach var="vo" items="${listType}">
                                            <option value="${vo.typeNum}" ${dto.typeNum == vo.typeNum?"selected" : ""}>${vo.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">동네</td>
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
                        <td class="custom-table-light col-sm-2">상품명</td>
                        <td>
                            <input type="text" name="subject" class="form-control" value="${dto.subject}">
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">상품가격</td>
                        <td>
                            <input type="text" name="price" class="form-control" value="${dto.price}">
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">상품 옵션</td>
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
                    <tr class="custom-product-option-1">
                        <td class="custom-table-light col-sm-2">옵션 1</td>
                        <td>
                            <div class="mb-2">
                                <input type="text" name="optionName" class="form-control" style="width: 250px;" placeholder="옵션명" value="${dto.optionName}">
                                <c:if test="">
                                    <input type="hidden" name="optionNum" value="${empty dto.optionNum ? 0 : dto.optionNum}">
                                </c:if>
                            </div>
                            <div class="row custom-option-area">
                                <div class="col-auto pe-0 d-flex flex-row custom-optionValue-area">
                                    <c:forEach var="vo" items="${listOptionDetail}">
                                        <div class='input-group pe-1'>
                                            <input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
                                            <input type="hidden" name="detailNums" value="${vo.detailNum}">
                                            <i class='bi bi-dash input-group-text ps-2 pe-2 bg-white custom-option-minus'></i>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
                                        <div class='input-group pe-1'>
                                            <input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
                                            <i class='bi bi-dash input-group-text ps-2 pe-2 bg-white custom-option-minus'></i>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="col-auto">
                                    <button type="button" class="custom-btn custom-btnOptionAdd">추가</button>
                                </div>
                            </div>
                            <small class="custom-help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
                        </td>
                    </tr>
                    <tr class="custom-product-option-2">
                        <td class="custom-table-light col-sm-2">옵션 2</td>
                        <td>
                            <div class="mb-2">
                                <input type="text" name="optionName2" style="width: 250px;" class="form-control" placeholder="옵션명" value="${dto.optionName2}">
                                <c:if test="">
                                    <input type="hidden" name="optionNum2" value="${empty dto.optionNum2 ? 0 : dto.optionNum2}">
                                </c:if>
                            </div>
                            <div class="row custom-option-area2">
                                <div class="col-auto pe-0 d-flex flex-row custom-optionValue-area2">
                                    <c:forEach var="vo" items="${listOptionDetail2}">
                                        <div class='input-group pe-1'>
                                            <input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
                                            <input type="hidden" name="detailNums2" value="${vo.detailNum}">
                                            <i class='bi bi-dash input-group-text ps-2 pe-2 bg-white custom-option-minus2'></i>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${empty listOptionDetail2 || listOptionDetail2.size() < 1}">
                                        <div class='input-group pe-1'>
                                            <input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
                                            <i class='bi bi-dash input-group-text ps-2 pe-2 bg-white custom-option-minus2'></i>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="col-auto">
                                    <button type="button" class="custom-btn custom-btnOptionAdd2">추가</button>
                                </div>
                            </div>
                            <small class="custom-help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">상품설명</td>
                        <td>
                            <textarea name="content" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">교환/환불 및 주의사항</td>
                        <td>
                            <textarea name="guidelines" class="form-control" style="max-width: 95%; height: 290px;">${dto.guidelines}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">대표이미지</td>
                        <td>
                            <div class="custom-thumbnail-viewer"></div>
                            <input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
                        </td>
                    </tr>
                    <tr>
                        <td class="custom-table-light col-sm-2">추가이미지</td>
                        <td>
                            <div class="custom-img-grid">
                                <img class="custom-item custom-img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
                                <c:forEach var="vo" items="${listFile}">
                                    <img src="${pageContext.request.contextPath}/uploads/photo/${vo.fileName}"
                                        class="custom-item custom-delete-img"
                                        data-fileNum="${vo.fileNum}"
                                        data-filename="${vo.fileName}">
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
                            <button type="button" class="custom-btn" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
                            <button type="reset" class="custom-btn custom-btn-light">다시입력</button>
                            <button type="button" class="custom-btn custom-btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
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
<div class="spacing-container"></div>

<script type="text/javascript">
$(function(){
    var img = "${dto.thumbnail}";
    if( img ) {
        img = "${pageContext.request.contextPath}/uploads/photo/"+img;
        $(".custom-table-form .custom-thumbnail-viewer").empty();
        $(".custom-table-form .custom-thumbnail-viewer").css("background-image", "url("+img+")");
    }
    
    $(".custom-table-form .custom-thumbnail-viewer").click(function(){
        $("form[name=productForm] input[name=thumbnailFile]").trigger("click");
    });
    
    $("form[name=productForm] input[name=thumbnailFile]").change(function(){
        let file = this.files[0];
        
        if(! file) {
            $(".custom-table-form .custom-thumbnail-viewer").empty();
            
            if( img ) {
                img = "${pageContext.request.contextPath}/uploads/photo/"+img;
            } else {
                img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
            }
            $(".custom-table-form .custom-thumbnail-viewer").css("background-image", "url("+img+")");
            
            return false;
        }
        
        if( ! file.type.match("image.*") ) {
            this.focus();
            return false;
        }
        
        var reader = new FileReader();
        reader.onload = function(e) { 
            $(".custom-table-form .custom-thumbnail-viewer").empty();
            $(".custom-table-form .custom-thumbnail-viewer").css("background-image", "url("+e.target.result+")");
        };
        reader.readAsDataURL( file );
    });
});

$(function(){
    $(".custom-delete-img").click(function(){
        if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
            return false;
        }
        
        let $img = $(this);
        let fileNum = $img.attr("data-fileNum");
        let filename = $img.attr("data-filename");
        let url="${pageContext.request.contextPath}/talent/deleteFile";
        $.post(url, {fileNum:fileNum, filename:filename}, function(data){
            $img.remove();
        }, "json");
    });
});

$(function(){
    var sel_files = [];
    
    $("body").on("click", ".custom-table-form .custom-img-add", function(){
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
            const $img = $("<img>", {class:"custom-item custom-img-item"});
            $img.attr("data-filename", file.name);
            reader.onload = e => {
                $img.attr("src", e.target.result);
            };
            reader.readAsDataURL(file);
            
            $(".custom-img-grid").append($img);
        }
        
        let dt = new DataTransfer();
        for(let f of sel_files) {
            dt.items.add(f);
        }
        document.productForm.addFiles.files = dt.files;
    });
    
    $("body").on("click", ".custom-table-form .custom-img-item", function(){
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

function submitContents(elClickedObj) {
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
    try {
        if(! check()) {
            return;
        }
        
        elClickedObj.submit();
        
    } catch(e) {
        console.log(e);
    }
}

function setDefaultFont() {
    var sDefaultFont = '돋움';
    var nFontSize = 12;
    oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
