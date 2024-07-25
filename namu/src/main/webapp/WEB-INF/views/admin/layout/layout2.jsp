<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/core2.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu2.css" type="text/css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu2.js"></script>
</head>

<body>

<header class="container-fluid header-top fixed-top">
	<div class="container-fluid p-2">
		<div class="row">
			<div class="col-auto d-lg-none align-self-center">
				<button type="button" id="toggleMenu" class="toggle_menu">
					<i class="bi bi-list"></i>
				</button>
			</div>
			<div class="col align-self-center">
				<h2 class="fs-4 fw-bold">관리자 페이지</h2>
			</div>
			<div class="col-auto">
				<div class="row">
					<div class="col-3 align-self-center">
						<span class="img-person" style="background-image: url('${pageContext.request.contextPath}/resources/images/person.png');"></span>
					</div>
					<div class="col-auto text-end align-self-center ps-3">
						<div class="text-start">
							<span class="fw-semibold" style="font-size: 10px;">관리자</span>
						</div>
						<div class="text-start">
							<span>관리자 님</span>
							&nbsp;<a href="${pageContext.request.contextPath}/"><i class="bi bi-box-arrow-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<main>
	<tiles:insertAttribute name="left"/>
	<div class="wrapper">
		<tiles:insertAttribute name="body"/>
	</div>
</main>

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

</body>
</html>