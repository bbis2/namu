<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
footer {
    background-color: #f8f9fa;
    color: #333;
    padding: 3rem 0;
}
footer h5 {
    color: #2c3e50;
    font-weight: bold;
    margin-bottom: 1.5rem;
}
footer ul {
    padding-left: 0;
}
footer ul li {
    list-style: none;
    margin-bottom: 0.5rem;
}
footer ul li a {
    color: #34495e;
    text-decoration: none;
    transition: color 0.3s ease;
}
footer ul li a:hover {
    color: #27ae60;
    text-decoration: none;
}
footer .social-icons {
    margin-top: 1rem;
}
footer .social-icons a {
    color: #34495e;
    font-size: 1.5rem;
    margin-right: 1rem;
    transition: color 0.3s ease;
}
footer .social-icons a:hover {
    color: #27ae60;
}
footer .copyright {
    margin-top: 2rem;
    font-size: 0.9rem;
    color: #7f8c8d;
}
</style>

    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
            	<div class="d-flex">
	                <h5 class="mb-3">
	                    <img alt="logo" src="${pageContext.request.contextPath}/resources/images/namuLogo.png" width="30" height="30" class="d-inline-block align-text-top me-2">
	                </h5>
	                <h3 class="bd">나무</h3>
            	</div>
                <p>동네주민과 함께 성장하는 지속 가능한 미래를 만듭니다.</p>
                <p><strong>주소:</strong> 서울특별시 마포구 월드컵북로 21</p>
                <p><strong>이메일:</strong> forest.namu.official@gmail.com</p>
                <p><strong>전화:</strong> 02-1234-5678</p>
            </div>
            
            <div class="col-md-2 mb-4 mb-md-0">
                <h5>빠른 링크</h5>
                <ul class="list-unstyled">
                    <li><a href="#">홈</a></li>
                    <li><a href="#">서비스</a></li>
                    <li><a href="#">프로젝트</a></li>
                    <li><a href="#">블로그</a></li>
                </ul>
            </div>
            
            <div class="col-md-2 mb-4 mb-md-0">
                <h5>고객 지원</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/inquiry/list">1:1 상담</a></li>
                    <li><a href="#">이메일 문의</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
                </ul>
            </div>
            
            <div class="col-md-2 mb-4 mb-md-0">
                <h5>회사 정보</h5>
                <ul class="list-unstyled">
                    <li><a href="#">회사 소개</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보 처리방침</a></li>
                    <li><a href="#">채용 정보</a></li>
                </ul>
            </div>
            
            <div class="col-md-2">
                <h5>팔로우</h5>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12 text-center copyright">
                <p>&copy; 2024 (주)나무. Copyright 2024 ⓒ all rights reserved. | 대표이사: 김윤상</p>
            </div>
        </div>
    </div>
