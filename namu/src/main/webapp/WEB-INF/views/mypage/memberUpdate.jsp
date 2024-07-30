<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
    padding-top: 20px;
}
.btn {
	background: #EEF2E3;
	color: black;
}

</style>

<div class="container" style="margin-top:-70px;">
	<div class="body-container">	
		<div class="body-main">

			<form name="memberForm" method="post">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="userPwd">패스워드</label>
					<div class="col-sm-10">
			            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
			            <small class="form-control-plaintext">패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</small>
			        </div>
			    </div>
			    
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="userPwd2">패스워드 확인</label>
			        <div class="col-sm-10">
			            <input type="password" name="userPwd2" id="userPwd2" class="form-control" autocomplete="off" placeholder="패스워드 확인">
			            <small class="form-control-plaintext">패스워드를 한번 더 입력해주세요.</small>
			        </div>
			    </div>
			 
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="birth">생년월일</label>
			        <div class="col-sm-10">
			            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="생년월일">
			            <small class="form-control-plaintext">생년월일은 2024-01-01 형식으로 입력 합니다.</small>
			        </div>
			    </div>
			
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="selectEmail">이메일</label>
			        <div class="col-sm-10 row">
			        
			        	<div class="col input-group">
							<input type="text" name="email1" class="form-control" maxlength="30" value="${dto.email1}" >
						    <span class="input-group-text p-1" style="border: none; background: none;">@</span>
							<input type="text" name="email2" class="form-control" maxlength="30" value="${dto.email2}" readonly>
						</div>	
			        
						<div class="col-3 pe-0">
							<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com" ${dto.email2=="naver.com" ? "selected" : ""}>naver.com</option>
								<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected" : ""}>gmail.com</option>
								<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected" : ""}>hanmail.net</option>
								<option value="direct">직접입력</option>
							</select>
						</div>
			        </div>
			    </div>
			    
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
			        <div class="col-sm-10 row">
						<div class="col-sm-3 pe-1">
							<input type="text" name="tel1" id="tel1" class="form-control" value="${dto.tel1}" maxlength="3">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 px-1">
							<input type="text" name="tel2" id="tel2" class="form-control" value="${dto.tel2}" maxlength="4">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 ps-1">
							<input type="text" name="tel3" id="tel3" class="form-control" value="${dto.tel3}" maxlength="4">
						</div>
			        </div>
			    </div>
			
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="town1">기본 주소</label>
			        <div class="col-sm-5">
			       		<div class="input-group">
			           		<input type="text" name="town1" id="town1" class="form-control" placeholder="기본주소 설정" value="${dto.town1}" readonly>
		           			<button class="btn" type="button" style="margin-left: 3px;" onclick="daumPostcode();">기본 주소 검색</button>
			           	<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block">필수 입력 사항입니다.</small>
						</c:if>			           	
			           	</div>
					</div>
			    </div>
		
			    <div class="row mb-3">
			        <label class="col-sm-2 col-form-label" for="town2">추가 주소</label>
			        <div class="col-sm-5">
			       		<div class="input-group">
			           		<input type="text" name="town2" id="town2" class="form-control" placeholder="*추가 주소" value="${dto.town2}" readonly>
		           			<button class="btn" type="button" style="margin-left: 3px;" onclick="town2code();">추가주소 검색</button>
			           	</div>
			           	<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block">*선택사항입니다.</small>
						</c:if>
					</div>
			    </div>

				<c:if test="${mode=='member'}">
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label" for="agree">약관 동의</label>
						<div class="col-sm-8" style="padding-top: 5px;">
							<input type="checkbox" id="agree" name="agree"
								class="form-check-input"
								checked
								style="margin-left: 0;"
								onchange="form.sendButton.disabled = !checked">
							<label class="form-check-label">
								<a href="#" class="text-decoration-none">이용약관</a>에 동의합니다.
							</label>
						</div>
				    </div>
			    </c:if>
			     
			    <div class="row mb-3">
			        <div class="text-center">
			            <button type="button" style="background: #D4DDC1;" name="sendButton" class="btn" onclick="memberOk();"> ${mode=="member"?"회원가입":"정보수정"} <i class="bi bi-check2"></i></button>
			            <button type="button" style="background: #EFEFEF;" class="btn" onclick="location.href='${pageContext.request.contextPath}/mypage/list';"> ${mode=="member"?"가입취소":"수정취소"} <i class="bi bi-x"></i></button>
						<input type="hidden" name="userIdValid" id="userIdValid" value="false">
						<input type="hidden" name="nickNameValid" id="nickNameValid" value="false">
			        </div>
			    </div>
			
			    <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
			</form>

		</div>
	</div>
</div>

