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
</style>

<div class="container mt-5 pt-5 mb-5 pb-2">
    <div class="mx-5 px-5 pt-5">
        <div class="mx-5 px-5">
            <h2 class="mb-4">글쓰기 - 빌려드림</h2>
            <hr>
            <form id="postForm" action="submit_post.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group d-flex align-items-center">
                    <label for="imageUpload" class="form-label">사진</label>
                    <img id="imageUploadArea" src="${pageContext.request.contextPath}/resources/images/imageReg.PNG" alt="이미지 등록" class="me-3">
                    <input type="file" class="form-control d-none" id="imageUpload" name="image" accept="image/*" multiple>
                    <div id="imagePreviewContainer" class="image-preview-container"></div>
                </div>

                <div class="form-group d-flex align-items-center">
                    <label for="title" class="form-label">제목</label>
                    <div class="flex-grow-1">
                        <input type="text" class="form-control" id="title" name="title" placeholder="대여하시는 물건의 이름을 포함하여 작성해주세요." maxlength="40" required>
                        <div class="char-counter">0/40</div>
                    </div>
                </div>

                <div class="form-group d-flex align-items-center">
                    <label for="category" class="form-label me-4">카테고리</label>
                    <select class="form-select" id="category" name="category">
                        <option>의류</option>
                        <option>신발</option>
                        <option>식품</option>
                        <option>가전</option>
                        <option>가구</option>
                        <option>전자기기</option>
                        <option>아웃도어</option>
                        <option>악세서리</option>
                        <option>기타</option>
                    </select>
                </div>

				<div class="form-group duration-prices d-flex align-items-center">
				    <label class="form-label">기간 별 가격</label>
				    <div class="d-flex flex-wrap">
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="hour1" name="duration" value="1hour">
				                <label class="form-check-label" for="hour1">1시간</label>
				            </div>
				            <input type="text" class="form-control price-input" name="price1hour" placeholder="가격 입력" style="display: none;">
				        </div>
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="day1" name="duration" value="1day">
				                <label class="form-check-label" for="day1">1일</label>
				            </div>
				            <input type="text" class="form-control price-input" name="price1day" placeholder="가격 입력" style="display: none;">
				        </div>
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="week1" name="duration" value="1week">
				                <label class="form-check-label" for="week1">1주</label>
				            </div>
				            <input type="text" class="form-control price-input" name="price1week" placeholder="가격 입력" style="display: none;">
				        </div>
				        <div class="duration-price-group">
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" id="month1" name="duration" value="1month">
				                <label class="form-check-label" for="month1">1달</label>
				            </div>
				            <input type="text" class="form-control price-input" name="price1month" placeholder="가격 입력" style="display: none;">
				        </div>
				    </div>
				</div>

                <div class="form-group d-flex align-items-center">
                    <label for="content" class="form-label">설명</label>
                    <div class="flex-grow-1">
                        <textarea class="form-control" id="content" name="content" rows="5" maxlength="2000" placeholder="대여하시는 물건에 대한 설명과 대여 관련 주의사항을 반드시 작성해 주세요." required></textarea>
                        <div class="char-counter">0/2000</div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary float-end">등록하기</button>
            </form>
        </div>
    </div>
</div>

<script>
    let selectedFiles = []; // 선택된 파일들을 저장할 배열
    
    document.getElementById('imageUploadArea').addEventListener('click', function() {
        document.getElementById('imageUpload').click();
    });

    document.getElementById('imageUpload').addEventListener('change', function(e) {
        const files = e.target.files;
        const container = document.getElementById('imagePreviewContainer');

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            selectedFiles.push(file); // 선택된 파일을 배열에 추가
            const reader = new FileReader();

            reader.onload = function(e) {
                const wrapper = document.createElement('div');
                wrapper.className = 'image-preview-wrapper';

                const img = document.createElement('img');
                img.className = 'image-preview';
                img.src = e.target.result;

                const deleteBtn = document.createElement('button');
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

        // 사진 등록 여부 확인
        if(selectedFiles.length == 0) {
        	alert("최소 1장 이상의 사진을 등록해주세요.");
        	return;
        }
        
        // 가격 입력 여부 확인
        let priceInput = document.querySelectorAll('.price-input');
        console.log(priceInput);
        let price = '';
        for(let priceCheck of priceInput) {
        	console.log(priceCheck.value)
        	price += priceCheck.value;
        }
        if(price == '') {
        	alert("최소 1개의 이상의 '기간 별 가격'을 등록하세요.");
        	return;
        }
        
        const formData = new FormData(this);

        // 기존의 file input의 파일들을 제거
        formData.delete('image');

        // 선택된 파일들만 FormData에 추가
        selectedFiles.forEach((file, index) => {
            formData.append('image', file, file.name);
        });

        // AJAX를 사용하여 폼 데이터 제출
        fetch('submit_post.jsp', {
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
        
     // 체크박스 이벤트 리스너
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.form-check-input').forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                var inputField = document.querySelector('input[name="price' + this.value + '"]');
                if (this.checked) {
                    inputField.style.display = 'block';
                    inputField.disabled = false;
                } else {
                    inputField.style.display = 'none';
                    inputField.disabled = true;
                    inputField.value = ''; // 체크 해제 시 입력값 초기화
                }
            });
        });
        
        // 숫자만 입력되도록 하는 이벤트 리스너 추가
        document.querySelectorAll('.price-input').forEach(function(input) {
            input.addEventListener('input', function() {
                this.value = this.value.replace(/[^0-9]/g, '');
            });
        });
    });
    </script>
