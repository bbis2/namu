<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">
					<img alt="logo" src="${pageContext.request.contextPath}/resources/images/namuLogo.png" width="30" height="24" class="d-inline-block align-text-top">
					나무
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
					aria-controls="navbarTogglerDemo02" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#">중고/경매</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">방명록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/used/list">게시판</a></li>
								<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
								<li><a class="dropdown-item" href="#">포토갤러리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">채팅</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#">빌려드림</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">방명록</a></li>
								<li><a class="dropdown-item" href="#">게시판</a></li>
								<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
								<li><a class="dropdown-item" href="#">포토갤러리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">채팅</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#">재능마켓</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">방명록</a></li>
								<li><a class="dropdown-item" href="#">게시판</a></li>
								<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
								<li><a class="dropdown-item" href="#">포토갤러리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">채팅</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#">나무모임</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">방명록</a></li>
								<li><a class="dropdown-item" href="#">게시판</a></li>
								<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
								<li><a class="dropdown-item" href="#">포토갤러리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">채팅</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#">공지사항</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">방명록</a></li>
								<li><a class="dropdown-item" href="#">게시판</a></li>
								<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
								<li><a class="dropdown-item" href="#">포토갤러리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">채팅</a></li>
							</ul>
						</li>
					</ul>
					
					<div class="d-flex float-end">
						<c:choose>
							<c:when test="${empty sessionScope.member}">
								<div class="p-2">
									<a href="javascript:dialogLogin();" title="로그인"><i class="bi bi-lock"></i></a>
								</div>
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/member/member" title="회원가입"><i class="bi bi-person-plus"></i></a>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="bi bi-unlock"></i></a>
								</div>	
								<div class="p-2">
									<a href="#" title="마이페이지"><i class="bi bi-person-circle"></i></a>
								</div>				
								<div class="p-2">
									<a href="#" title="알림"><i class="bi bi-bell"></i></a>
								</div>
								<c:if test="${sessionScope.member.membership>50}">
									<div class="p-2">
										<a href="${pageContext.request.contextPath}/admin" title="관리자"><i class="bi bi-gear"></i></a>
									</div>					
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
	</nav>

<!--
			<nav class="navbar  navbar-expand-lg navbar-light">
					<div class="container">

							
						<a class="navbar-brand" href="${pageContext.request.contextPath}/"><i class="bi bi-app-indicator"></i></a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
							<ul class="navbar-nav ms-auto flex-nowrap">
								<li class="nav-item">
								</li>
								<li class="nav-item">
									<a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">홈</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">가볼만한곳</a>
								</li>
				
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										커뮤니티
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#">방명록</a></li>
										<li><a class="dropdown-item" href="#">게시판</a></li>
										<li><a class="dropdown-item" href="#">답변형 게시판</a></li>
										<li><a class="dropdown-item" href="#">포토갤러리</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">채팅</a></li>
									</ul>
								</li>
				
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										강좌
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#">프로그래밍</a></li>
										<li><a class="dropdown-item" href="#">데이터베이스</a></li>
										<li><a class="dropdown-item" href="#">웹 프로그래밍</a></li>
										<li><a class="dropdown-item" href="#">데이터분석 및 AI</a></li>
										<li><a class="dropdown-item" href="#">클라우드 및 기타</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">질문과 답변</a></li>
									</ul>
								</li>
								
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										고객센터
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#">자주하는질문</a></li>
										<li><a class="dropdown-item" href="#">공지사항</a></li>
										<li><a class="dropdown-item" href="#">1:1문의</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">이벤트</a></li>
									</ul>
								</li>
								
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										마이페이지
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#">일정관리</a></li>
										<li><a class="dropdown-item" href="#">사진첩</a></li>
										<li><a class="dropdown-item" href="#">쪽지함</a></li>
										<li><a class="dropdown-item" href="#">친구관리</a></li>
										<li><a class="dropdown-item" href="#">메일</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">정보수정</a></li>
									</ul>
								</li>
								
							</ul>
								<div class="">
									<div class="d-flex float-end">
										<c:choose>
											<c:when test="${empty sessionScope.member}">
												<div class="p-2">
													<a href="javascript:dialogLogin();" title="로그인"><i class="bi bi-lock"></i></a>
												</div>
												<div class="p-2">
													<a href="${pageContext.request.contextPath}/member/member" title="회원가입"><i class="bi bi-person-plus"></i></a>
												</div>	
											</c:when>
											<c:otherwise>
												<div class="p-2">
													<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="bi bi-unlock"></i></a>
												</div>					
												<div class="p-2">
													<a href="#" title="알림"><i class="bi bi-bell"></i></a>
												</div>
												<c:if test="${sessionScope.member.membership>50}">
													<div class="p-2">
														<a href="${pageContext.request.contextPath}/admin" title="관리자"><i class="bi bi-gear"></i></a>
													</div>					
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								
						</div>
			</nav>
  -->