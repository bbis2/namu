<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.image-preview-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}
.image-preview, #imageUploadArea {
    width: 150px;
    height: 150px;
    object-fit: cover;
    cursor: pointer;
}
.image-preview-wrapper {
    position: relative;
}
.delete-image {
    position: absolute;
    top: 5px;
    right: 5px;
    background-color: rgba(255, 255, 255, 0.7);
    border: none;
    border-radius: 50%;
    padding: 5px 8px;
    cursor: pointer;
}
.form-group {
    margin-bottom: 15px;
}
.form-label {
    font-weight: bold;
    width: 150px;
}
.char-counter {
    font-size: 0.8em;
    color: #6c757d;
    text-align: right;
}
.price-input {
    width: 100px;
    display: none;
}

.duration-price-group {
    display: flex;
    flex-direction: column;
    width: 120px;
    margin-right: 15px;
    margin-bottom: 15px;
}
.price-input {
    margin-top: 5px;
}
.form-group.duration-prices {
    min-height: 120px; /* 입력창이 나타날 공간을 확보합니다 */
}
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>

<div class="container mt-5 pt-5 mb-5 pb-2">
    <div class="mx-5 px-5 pt-5">
        <div class="mx-5 px-5">
            <h2 class="mb-4">글쓰기 - 빌려드림</h2>
            <hr>
            <form id="postForm" method="post" enctype="multipart/form-data">
            
				<div class="form-group d-flex align-items-center">
					<label for="title" class="form-label">동네 선택</label>
					<select class="form-select mb-3 border border-2 w-25" aria-label="Default select example" name="location">
						<option value="${sessionScope.member.town1}" ${dto.location.equals(sessionScope.member.town1) ? 'selected' : ''}>${sessionScope.member.town1}</option>
						<c:if test="${sessionScope.member.town2 != null}">
							<option value="${sessionScope.member.town2}" ${dto.location.equals(sessionScope.member.town2) ? 'selected' : ''} ${townNum == 2 ? 'selected' : ''}> ${sessionScope.member.town2} </option>
						</c:if>
					</select>
				</div>
				
				<div class="form-group d-flex align-items-center">
					<label for="title" class="form-label">사진</label>
					
					<img id="imageUploadArea" src="${pageContext.request.contextPath}/resources/images/imageReg.PNG" alt="이미지 등록" class="me-3">
					<input type="file" class="form-control d-none" id="imageUpload" name="image" accept="image/*" multiple>
						
					<div id="imagePreviewContainer" class="image-preview-container">
						<c:if test="${mode == 'update'}">
							<c:forEach var="image" items="${listImage}">
						        <div class="image-preview-wrapper">
						            <img src="${pageContext.request.contextPath}/uploads/album/${image.imageFilename}" class="image-preview" alt="기존 이미지">
						            <button type="button" class="delete-image" data-image-num="${image.imageNum}">×</button>
						        </div>
						    </c:forEach>
						</c:if>
					</div>
				</div>

				<div class="form-group d-flex align-items-center justify-content-between">
					<label for="title" class="form-label">제목</label>
					<div class="flex-grow-1">
						<input type="text" class="form-control" id="title" name="subject" value="${dto.subject}"
							placeholder="대여서비스를 제공하려는 물건의 이름을 포함하여 작성해주세요." maxlength="40" required>
						<div class="char-counter">0/40</div>
					</div>
				</div>

				<div class="form-group d-flex align-items-center justify-content-between mb-4">
					<label for="category" class="form-label me-4">카테고리</label>
					<select class="form-select" id="category" name="categoryNum">
						<c:forEach var="dto" items="${category}">
							<option value="${dto.categoryNum}" ${dto.categoryNum == categoryNum ? 'selected' : ''}>${dto.category}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group duration-prices d-flex align-items-center">
				    <label class="form-label">기간 별 가격</label>
				    <div class="d-flex flex-wrap">
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="hour1" name="duration" value="h" ${dto.hPrice != 0 ? 'checked' : ''}>
				                <label class="form-check-label" for="hour1">1시간</label>
				            </div>
				            <input type="number" class="form-control price-input" name="hPrice" placeholder="가격 입력" style="display: ${dto.hPrice != 0 ? 'block' : 'none'};" value="${dto.hPrice != 0 ? dto.hPrice : ''}">
				        </div>
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="day1" name="duration" value="d" ${dto.dPrice != 0 ? 'checked' : ''}>
				                <label class="form-check-label" for="day1">1일</label>
				            </div>
				            <input type="number" class="form-control price-input" name="dPrice" placeholder="가격 입력" style="display: ${dto.dPrice != 0 ? 'block' : 'none'};" value="${dto.dPrice != 0 ? dto.dPrice : ''}">
				        </div>
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="week1" name="duration" value="w" ${dto.wPrice != 0 ? 'checked' : ''}>
				                <label class="form-check-label" for="week1">1주</label>
				            </div>
				            <input type="number" class="form-control price-input" name="wPrice" placeholder="가격 입력" style="display: ${dto.wPrice != 0 ? 'block' : 'none'};" value="${dto.wPrice != 0 ? dto.wPrice : ''}">
				        </div>
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="month1" name="duration" value="m" ${dto.mPrice != 0 ? 'checked' : ''}>
				                <label class="form-check-label" for="month1">1달</label>
				            </div>
				            <input type="number" class="form-control price-input" name="mPrice" placeholder="가격 입력" style="display: ${dto.mPrice != 0 ? 'block' : 'none'};" value="${dto.mPrice != 0 ? dto.mPrice : ''}">
				        </div>
				    </div>
				</div>

				<div class="form-group d-flex">
					<label for="content" class="form-label">설명</label>
					<div class="flex-grow-1">
						<textarea class="form-control" id="content" name="content"
							rows="5" maxlength="2000" placeholder="대여서비스를 제공하시려는 물건에 대한 설명과 대여 방법 및 위치, 주의사항 등을 작성해주세요." required>${dto.content}</textarea>
						<div class="char-counter">0/2000</div>
					</div>
				</div>
			    <!-- 기존 이미지 정보를 hidden 필드로 추가 -->
			    <c:if test="${mode == 'update'}">
			        <c:forEach var="image" items="${listImage}">
			            <input type="hidden" name="existingImages" value="${image.imageFilename}">
			        </c:forEach>
			    </c:if>
			
			    <c:if test="${mode == 'update'}">
			        <input type="hidden" name="rentNum" value="${dto.rentNum}">
			        <c:forEach var="image" items="${listImage}">
				        <input type="hidden" name="existingImages" value="${image.imageFilename}">
				        <input type="hidden" name="existingImageNums" value="${image.imageNum}">
				    </c:forEach>
			    </c:if>			    
			    <input type="hidden" name="page" value="${page}">
			    <input type="hidden" name="categoryNum" value="${categoryNum}">
			    <input type="hidden" name="kwd" value="${kwd}">
			    <input type="hidden" name="townNum" value="${townNum}">
			    <input type="hidden" id="mode" name="mode" value="${mode}">
				<button type="submit" class="btn btn-primary mb-5 float-end">${mode == 'update' ? '수정하기' : '등록하기'}</button>
            </form>
        </div>
    </div>
</div>

<script>
//$(function (){}) 시작
$(function() {
	
	let selectedFiles = []; // 선택된 파일들을 저장할 배열

    // 기존 이미지를 selectedFiles 배열에 추가
    $('.image-preview-wrapper').each(function() {
        let imageUrl = $(this).find('img').attr('src');
        let fileName = imageUrl.split('/').pop();
        let fakeFile = new File([new Blob()], fileName, {type: 'image/jpeg'});
        selectedFiles.push(fakeFile);
    });

    function createDeleteButton(wrapper, file) {
        let deleteBtn = document.createElement('button');
        deleteBtn.className = 'delete-image';
        deleteBtn.innerHTML = '×';
        deleteBtn.onclick = function() {
            wrapper.remove();
            selectedFiles = selectedFiles.filter(f => f !== file);
        };
        return deleteBtn;
    }

    // 기존 이미지에 삭제 버튼 기능 추가
    $('.image-preview-wrapper').each(function(index) {
        let wrapper = $(this);
        let deleteBtn = wrapper.find('.delete-image');
        deleteBtn.on('click', function() {
            wrapper.remove();
            selectedFiles.splice(index, 1);
        });
    });

    $('#imageUploadArea').on('click', function() {
        $('#imageUpload').click();
    });

    $('#imageUpload').on('change', function(e) {
        let files = e.target.files;
        let container = $('#imagePreviewContainer');

        for (let i = 0; i < files.length; i++) {
            let file = files[i];
            selectedFiles.push(file); // 새 파일을 배열에 추가
            let reader = new FileReader();

            reader.onload = function(e) {
                let wrapper = $('<div>').addClass('image-preview-wrapper');
                let img = $('<img>').addClass('image-preview').attr('src', e.target.result);
                let deleteBtn = createDeleteButton(wrapper[0], file);

                wrapper.append(img).append(deleteBtn);
                container.append(wrapper);
            }

            reader.readAsDataURL(file);
        }
    });
    
 	// 가격 입력 유효성 검사 함수
    function validatePriceInputs() {
        let isValid = false;

        $('.form-check-input:checked').each(function() {
            let priceInput = $('input[name="' + this.value + 'Price"]');
            if (priceInput.val().trim() !== '') {
                isValid = true;
                return false;  // 각 반복 중단
            }
        });

        return isValid;
    }
    
 	// 폼 제출 이벤트 처리
    $('#postForm').on('submit', function(e) {
        e.preventDefault();
        
        // 가격 입력 유효성 검사
        if (!validatePriceInputs()) {
            alert('최소한 하나의 기간을 선택하고 해당 가격을 입력해주세요.');
            return;
        }
        
        var formData = new FormData(this);
        
        // 체크된 가격 입력 필드의 값을 숫자로 변환하여 FormData에 추가
        $('.form-check-input:checked').each(function() {
            var priceInput = $('input[name="' + this.value + 'Price"]');
            var priceValue = priceInput.val();
            if (priceValue !== '') {
                formData.set(priceInput.attr('name'), parseInt(priceValue, 10));
            }
        });

        // 체크되지 않은 가격 입력 필드의 값을 제거
        $('.form-check-input:not(:checked)').each(function() {
            formData.delete(this.value + 'Price');
        });

        
        // 기존 이미지 중 삭제되지 않은 이미지 정보 추가
        $('.image-preview-wrapper').each(function() {
            var imageNum = $(this).find('.delete-image').data('image-num');
            if (imageNum) {
                formData.append('remainingImageNums', imageNum);
            }
        });

        // 새로 선택된 파일 추가 (순서 유지)
        selectedFiles.forEach((file, index) => {
            formData.append('newImages', file);
        });

        $.ajax({
            url: '${pageContext.request.contextPath}/rent/${mode}',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                if(response.status === "success") {
                    alert(formData.get('mode') === 'update' ? '글이 성공적으로 수정되었습니다.' : '글이 성공적으로 등록되었습니다.');
                    if(formData.get('mode') === 'update') {
                        location.href = '${pageContext.request.contextPath}/rent/article?townNum=${townNum}&categoryNum=${categoryNum}&page=${page}&num=${dto.rentNum}';
                    } else {
                        location.href = '${pageContext.request.contextPath}/rent/list?townNum=${townNum}';
                    }
                } else {
                    alert('오류가 발생했습니다: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('오류가 발생했습니다: ' + error);
            }
        });
    });

	// 글자 수 카운팅 기능 (이전과 동일)
	function updateCharCount(inputElement, countElement) {
	    var maxLength = inputElement.getAttribute('maxlength');
	    var currentLength = inputElement.value.length;
	    countElement.textContent = currentLength + '/' + maxLength;
	}
	
	document.getElementById('title').addEventListener('input', function() {
	    updateCharCount(this, this.nextElementSibling);
	});
	
	document.getElementById('content').addEventListener('input', function() {
	    updateCharCount(this, this.nextElementSibling);
	});
	
    // 체크박스 이벤트 리스너
    $('.form-check-input').on('change', function() {
        var inputField = $('input[name="' + this.value + 'Price"]');
        if (this.checked) {
            inputField.show().prop('disabled', false);
        } else {
            inputField.hide().prop('disabled', true).val('');
        }
    });

    // 숫자만 입력되도록 하는 이벤트 리스너
    $('.price-input').on('input', function() {
        this.value = this.value.replace(/[^0-9]/g, '');
    });
	
});
// $(function (){}) 끝

</script>
