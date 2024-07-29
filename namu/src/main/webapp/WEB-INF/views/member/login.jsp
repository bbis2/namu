<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1500px;
	max-height: 1500px;
}

.btn {
    width: 100%; /* 버튼 너비를 100%로 설정 */
    font-size: 16px;
    border-radius: 10px;
    background-color: #B7C890;
    border: none;
    cursor: pointer;
}

input:focus {
    outline: 1px solid gray;
}

</style>


<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="border mt-5 p-4">
                    <form name="loginForm" action="" method="post" class="row g-3">
                        <h3 class="text-center" style="color:#3F2C15; font-weight: bold;"><img alt="logo" src="${pageContext.request.contextPath}/resources/images/namuLogo.png" width="30" height="24" class="d-inline-block align-text-top"> WELCOME 나무</h3>
                        <div class="col-12">
                            <input type="text" name="userId" class="form-control" placeholder="아이디">
                        </div>
                        <div class="col-12">
                            <input type="password" name="userPwd" class="form-control" autocomplete="off" 
                            	placeholder="패스워드">
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label" for="rememberMe"> 아이디 저장</label>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn" style="background-color:#B7C890; " onclick="sendLogin();">&nbsp;Login&nbsp;</button>
                        </div>
                    </form>
                   <br>
                    <div class="col-12">
                        <p class="text-center mb-0">
                        	<a href="${pageContext.request.contextPath}/member/member" style="color: #3F2C15;" class="text-decoration-none me-2">아이디 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/pwdFind" style="color: #3F2C15;" class="text-decoration-none me-2">패스워드 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/member" style="color: #3F2C15;" class="text-decoration-none">회원가입</a>
                        </p>
                    </div>                  
                     
                </div>

                <div class="d-grid">
						<p class="form-control-plaintext text-center text-primary">${message}</p>
                </div>

            </div>
        </div>

	</div>
</div>