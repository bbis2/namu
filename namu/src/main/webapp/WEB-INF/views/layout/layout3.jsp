<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:insertAttribute name="title" /></title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css"
	type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menu.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/default.css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/core.css"
	type="text/css">
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	

</head>


<body>

	<header>
		<tiles:insertAttribute name="header" />
	</header>

	<main>
		<tiles:insertAttribute name="body" />
	</main>

	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>

	<div id="loadingLayout"
		style="display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
		<div class="loader"></div>
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

	<!-- Login Modal -->
	<script type="text/javascript">
		function dialogLogin() {
			$("form[name=modelLoginForm] input[name=userId]").val("");
			$("form[name=modelLoginForm] input[name=userPwd]").val("");

			$("#loginModal").modal("show");

			$("form[name=modelLoginForm] input[name=userId]").focus();
		}

		function sendModelLogin() {
			var f = document.modelLoginForm;
			var str;

			str = f.userId.value;
			if (!str) {
				f.userId.focus();
				return;
			}

			str = f.userPwd.value;
			if (!str) {
				f.userPwd.focus();
				return;
			}

			f.action = "${pageContext.request.contextPath}/member/login";
			f.submit();
		}

		// Hide Header on on scroll down
		var didScroll;
		var lastScrollTop = 0;
		var delta = 5; // 동작의 구현이 시작되는 위치
		var navbarHeight = $('.navbar').outerHeight(); // 영향을 받을 요소를 선택

		// 스크롤시에 사용자가 스크롤했다는 것을 알림
		$(window).scroll(function(event) {
			didScroll = true;
		});

		// hasScrolled()를 실행하고 didScroll 상태를 재설정
		setInterval(function() {
			if (didScroll) {
				hasScrolled();
				didScroll = false;
			}
		}, 250);

		// 동작을 구현
		function hasScrolled() {
			// 접근하기 쉽게 현재 스크롤의 위치를 저장한다.
			var st = $(this).scrollTop();

			// 설정한 delta 값보다 더 스크롤되었는지를 확인한다.
			if (Math.abs(lastScrollTop - st) <= delta) {
				return;
			}

			// 헤더의 높이보다 더 스크롤되었는지 확인하고 스크롤의 방향이 위인지 아래인지를 확인한다.
			if (st > lastScrollTop && st > navbarHeight) {
				// Scroll Down
				$('.navbar').removeClass('nav-down').addClass('nav-up');
			} else {
				// Scroll Up
				if (st + $(window).height() < $(document).height()) {
					$('.navbar').removeClass('nav-up').addClass('nav-down');
				}
			}

			// lastScrollTop 에 현재 스크롤위치를 지정한다.
			lastScrollTop = st;
		}

		/* 추가로 웹페이지의 스크롤을 내렸을때를 감지해 코드를 실행시키는 함수입니다.
		$(window).scroll(function(){ 
		   if($(window).scrollTop() == $(document).height() - $(window).height()){ 
		      // 실행할 함수
		   } 
		});
		 */
		 
		 $('.btn_like').click(function () {
				$(this).toggleClass("on")
			});
	</script>
	
	<div class="modal fade" id="loginModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginViewerModalLabel">Login</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="p-3">
						<form name="modelLoginForm" action="" method="post"
							class="row g-3">
							<div class="mt-0">
								<p class="form-control-plaintext">계정으로 로그인 하세요</p>
							</div>
							<div class="mt-0">
								<input type="text" name="userId" class="form-control"
									placeholder="아이디">
							</div>
							<div>
								<input type="password" name="userPwd" autocomplete="off"
									class="form-control" placeholder="패스워드">
							</div>
							<div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="rememberMeModel"> <label class="form-check-label"
										for="rememberMeModel"> 아이디 저장</label>
								</div>
							</div>
							<div>
								<button type="button" class="btn btn-primary w-100"
									onclick="sendModelLogin();">Login</button>
							</div>
							<div>
								<p class="form-control-plaintext text-center">
									<a href="#" class="text-decoration-none me-2">패스워드를 잊으셨나요 ?</a>
								</p>
							</div>
						</form>
						<hr class="mt-3">
						<div>
							<p class="form-control-plaintext mb-0">
								아직 회원이 아니세요 ? <a
									href="${pageContext.request.contextPath}/member/member"
									class="text-decoration-none">회원가입</a>
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>