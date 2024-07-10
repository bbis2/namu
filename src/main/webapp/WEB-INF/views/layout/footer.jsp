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
                <h5 class="bd">고객센터</h5>
                <p>1670-0876 09:00~18:00</p>
                <ul class="list-unstyled">
                    <li>평일: 전체 문의 상담</li>
                    <li>토요일, 공휴일: 오늘의집 직집배송, 이사/시공/제 품설치 문의 상담</li>
                    <li>일요일: 휴무</li>
                </ul>
                <button class="btn btn-secondary btn-sm">카톡 상담(평일 09:00~18:00)</button>
                <button class="btn btn-secondary btn-sm">이메일 문의</button>
            </div>
            <div class="col-md-3 py-4 d-flex justify-content-center">
                <ul class="list-unstyled ">
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">채용정보</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보 처리방침</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">안전거래센터</a></li>
                    <li><a href="#">입점신청</a></li>
                    <li><a href="#">제휴/광고 문의</a></li>
                    <li><a href="#">시공파트너 안내</a></li>
                    <li><a href="#">상품광고 소개</a></li>
                    <li><a href="#">고객의 소리</a></li>
                </ul>
            </div>
            <div class="col-md-6 py-4">
                <p>(주)버킷플레이스 | 대표이사 이승재 | 서울 서초구 서초대로74길 4 삼성생명서초타워 25층, 27층</p>
                <p>contact@bucketplace.net | 사업자등록번호 119-86-91254 사업자정보확인</p>
                <p>통신판매업신고번호 제2018-서울서초-0580호</p>
                <p>고객님이 현금결제한 금액에 대해 우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다. 서비스가입사실확인</p>
                <div>
                    <img src="path-to-image" alt="오늘의집 서비스 운영" style="width:50px;">
                    <img src="path-to-image" alt="서비스가입사실확인" style="width:50px;">
                </div>
                <p>(주)버킷플레이스는 통신판매중개자 거래 당사자가 아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다. 단, (주)버킷플레이스가 판매자로 등록 판매하는 상품은 판매자 등록정보 기준 책임을 부담합니다.</p>
                <div class="d-flex">
                    <a href="#"><img src="path-to-icon" alt="icon" class="mr-2" style="width:20px;"></a>
                    <a href="#"><img src="path-to-icon" alt="icon" class="mr-2" style="width:20px;"></a>
                    <a href="#"><img src="path-to-icon" alt="icon" class="mr-2" style="width:20px;"></a>
                    <a href="#"><img src="path-to-icon" alt="icon" class="mr-2" style="width:20px;"></a>
                </div>
                <p>Copyright 2014. bucketplace, Co., Ltd. All rights reserved.</p>
                <p>Windows 정품 인증 [설정]으로 이동하여 Windows를 정품 인증합니다.</p>
            </div>
        </div>
	</div>
</div>

<style>
.container-fluid {
height: 150px;
}
</style>