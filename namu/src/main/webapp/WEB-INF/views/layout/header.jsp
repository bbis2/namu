<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<nav class="navbar navbar-expand-lg">
	<div class="container">

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item dropdown"><a class="navbar-brand"
					href="${pageContext.request.contextPath}/"> <img alt="logo"
						src="${pageContext.request.contextPath}/resources/images/namuLogo.png"
						width="30" height="24" class="d-inline-block align-text-top">
						나무
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#">중고/경매</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/used/list">중고거래</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/auction/list">중고경매</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#">빌려드림</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/borrow/list">빌려줘요</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/rent/list">빌려드림</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/rentcr/list">빌려드림 신청
								관리</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="${pageContext.request.contextPath}/talent/list">재능마켓</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#">나무모임</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/daily/list">나무일상</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/together/list">나무모임</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/myhome/list">내집근처</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="${pageContext.request.contextPath}/delivery/list">배달해요</a></li>
					
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#">공지사항</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li class="nav-item dropdown"><a class="nav-link"
							href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
						<li class="nav-item dropdown"><a class="nav-link"
							href="${pageContext.request.contextPath}/inquiry/list">1대1문의</a></li>
					</ul></li>

			</ul>

			<div class="d-flex float-end">
				<c:choose>
					<c:when test="${empty sessionScope.member}">
						<div class="p-2">
							<a href="javascript:dialogLogin();" title="로그인"><i
								class="bi bi-lock"></i></a>
						</div>
						<div class="p-2">
							<a href="${pageContext.request.contextPath}/member/member"
								title="회원가입"><i class="bi bi-person-plus"></i></a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="p-2">
							<a href="${pageContext.request.contextPath}/member/logout"
								title="로그아웃"><i class="bi bi-unlock"></i></a>
						</div>
						<div class="p-2">
							<a href="${pageContext.request.contextPath}/mypage/list" title="마이페이지"><i class="bi bi-person-circle"></i></a>
						</div>
						<div class="p-2">
							<a href="${pageContext.request.contextPath}/alarm/list" class="position-relative">
								<i class="bi bi-bell"></i>
							<span class="alarmCount position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 6px;"></span>
							</a>
						</div>
						<c:if test="${sessionScope.member.membership>50}">
							<div class="p-2">
								<a href="${pageContext.request.contextPath}/admin" title="관리자"><i
									class="bi bi-gear"></i></a>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>

<script type="text/javascript">
$(function(){
	var isLogin = "${not empty sessionScope.member ? 'true':'false'}";
	var timer = null;
	
	if(isLogin === "true") {
		alarmCount();
	}
	
	function alarmCount() {
		var url = "${pageContext.request.contextPath}/alarm/alarmCount";
		var query = "tmp=" + new Date().getTime();
		
		$.ajax({
			type:"get"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var count = parseInt(data.count);
				if(count === 0) {
					$(".alarmCount").hide();
					return false;
				}
				if(count >= 10) {
					$(".alarmCount").text("9+");
				} else {
					$(".alarmCount").text(count);
				}
			}
			,error:function(jqXHR) {
				if(timer != null) {
					clearInterval(timer);
					timer = null;
				}
				console.log(jqXHR.responseText);
			}
		});
	}
});

</script>