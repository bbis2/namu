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

</style>

<div class="container mt-5 pt-5 mb-5 pb-2">
	<div class="mx-5 px-5 pt-5">
		<div class="mx-5 px-5">
			<h2 class="mb-4">글쓰기 - 빌림</h2>
			<hr>
			<form id="postForm" action="submit_post.jsp" method="post" enctype="multipart/form-data">
				<div class="form-group d-flex align-items-center">
					<label for="title" class="form-label">동네 선택</label>
					<select class="form-select mb-3 border border-2 w-25" aria-label="Default select example" name="location">
						<option value="${sessionScope.member.town1}">${sessionScope.member.town1}</option>
						<c:if test="${sessionScope.member.town2 != null}">
							<option value="${sessionScope.member.town2}">${sessionScope.member.town2}</option>
						</c:if>
					</select>
				</div>
				
				<div class="form-group d-flex align-items-center">
					<label for="title" class="form-label">사진</label>
					
					<img id="imageUploadArea" src="${pageContext.request.contextPath}/resources/images/imageReg.PNG" alt="이미지 등록" class="me-3">
					<input type="file" class="form-control d-none" id="imageUpload" name="image" accept="image/*" multiple>
						
					<div id="imagePreviewContainer" class="image-preview-container"></div>
				</div>

				<div class="form-group d-flex align-items-center justify-content-between">
					<label for="title" class="form-label">제목</label>
					<div class="flex-grow-1">
						<input type="text" class="form-control" id="title" name="subject"
							placeholder="빌리려는 물건의 이름을 포함하여 작성해주세요." maxlength="40" required>
						<div class="char-counter">0/40</div>
					</div>
				</div>

				<div class="form-group d-flex align-items-center justify-content-between mb-4">
					<label for="category" class="form-label me-4">카테고리</label>
					<select class="form-select" id="category" name="categoryNum">
						<c:forEach var="dto" items="${category}">
							<option value="${dto.categoryNum}">${dto.category}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group d-flex align-items-center mb-4">
					<label class="form-label">대여 희망기간</label>
					<div class="d-flex gap-2 flex-grow-1">
						<div>
							시작
							<input type="datetime-local" class="form-control" name="strDate" required>
						</div>
						<div>
							종료
							<input type="datetime-local" class="form-control" name="endDate" required>
						</div>
					</div>
				</div>

				<div class="form-group d-flex align-items-center mb-4">
					<label for="price" class="form-label me-4">희망가격</label>
					<input type="text" class="form-control" id="price" name="price" placeholder="대여희망 가격을 입력하세요(원)" required>
				</div>

				<div class="form-group d-flex">
					<label for="content" class="form-label">설명</label>
					<div class="flex-grow-1">
						<textarea class="form-control" id="content" name="content"
							rows="5" maxlength="2000" placeholder="빌리려는 물건에 대한 설명과 대여 방법 및 위치를 포함해서 작성해주세요." required></textarea>
						<div class="char-counter">0/2000</div>
					</div>
				</div>

				<button type="submit" class="btn btn-primary mb-5 float-end">등록하기</button>
			</form>
		</div>
	</div>
</div>

<script>
    let selectedFiles = []; // 선택된 파일들을 저장할 배열
    
    document.getElementById('imageUploadArea').addEventListener('click', function() {
    	console.log('click');
        document.getElementById('imageUpload').click();
    });

    document.getElementById('imageUpload').addEventListener('change', function(e) {
        let files = e.target.files;
        let container = document.getElementById('imagePreviewContainer');

        for (let i = 0; i < files.length; i++) {
            let file = files[i];
            selectedFiles.push(file); // 선택된 파일을 배열에 추가
            let reader = new FileReader();

            reader.onload = function(e) {
                let wrapper = document.createElement('div');
                wrapper.className = 'image-preview-wrapper';

                let img = document.createElement('img');
                img.className = 'image-preview';
                img.src = e.target.result;

                let deleteBtn = document.createElement('button');
                deleteBtn.className = 'delete-image';
                deleteBtn.innerHTML = '×';
                deleteBtn.onclick = function() {
                    container.removeChild(wrapper);
                    selectedFiles = selectedFiles.filter(f => f !== file); // 파일 배열에서 제거
                };

                wrapper.appendChild(img);
                wrapper.appendChild(deleteBtn);
                container.appendChild(wrapper);
            }

            reader.readAsDataURL(file);
        }
    });

    // 폼 제출 이벤트 처리
    document.getElementById('postForm').addEventListener('submit', function(e) {
        e.preventDefault(); // 기본 제출 동작 방지

        if(selectedFiles.length == 0) {
        	alert("최소 1장 이상의 사진을 등록해주세요.");
        	return;
        }
        
        let formData = new FormData(this);

        // 기존의 file input의 파일들을 제거
        formData.delete('image');
        
        // 선택된 파일들만 FormData에 추가
        selectedFiles.forEach((file, index) => {
            formData.append('image', file, file.name);
        });

        // AJAX를 사용하여 폼 데이터 제출
        fetch('${pageContext.request.contextPath}/borrow/write', {
            method: 'POST',
            body: formData
        }).then(response => {
            if(response.ok) {
                alert('글이 성공적으로 등록되었습니다.');
                // 필요한 경우 페이지 리다이렉트 등의 추가 작업
            } else {
                alert('글 등록에 실패했습니다.');
            }
        }).catch(error => {
            console.error('Error:', error);
            alert('오류가 발생했습니다.');
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
	
    // 숫자만 입력되도록 하는 이벤트 리스너 추가
    document.querySelectorAll('#price').forEach(function(input) {
        input.addEventListener('input', function() {
            this.value = this.value.replace(/[^0-9]/g, '');
        });
    });
    </script>
