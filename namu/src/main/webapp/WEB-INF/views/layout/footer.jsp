<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
footer {
    background-color: #f8f9fa;
    color: #333;
}
footer h5 {
    margin-bottom: 1rem;
}
footer ul {
    padding-left: 0;
}
footer ul li {
    list-style: none;
}
footer ul li a {
    color: #333;
    text-decoration: none;
}
footer ul li a:hover {
    text-decoration: underline;
}
footer .btn {
    margin-top: 0.5rem;
}
footer p{
    font-size: 0.75rem;
}
footer .d-flex img {
    width: 30px;
    height: 30px;
}

</style>

<div style="background-color: #f9f9f9; min-height: 250px;">
	<div class="container">
		<div class="row">
            <div class="col-md-3 py-4">
				<h5 class="bd" style="font-size: 28px;">
					<img alt="logo" src="${pageContext.request.contextPath}/resources/images/namuLogo.png" width="30" height="24" class="d-inline-block align-text-top">
					나무
				</h5>
				<p>(주)나무 | 대표이사 윤상상 | 서울특별시 마포구 월드컵북로 21</p>
                <p>forest.namu.official@gmail.com</p>
                <span class="btn-sm"><a href="${pageContext.request.contextPath}/inquiry/list">1:1 상담</a></span>
                <br>
                <span class="btn-sm">이메일 문의</span>
                <br>
                
            </div>
        </div>
	</div>
</div>

<style>
.container-fluid {
height: 150px;
}
</style>