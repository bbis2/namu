<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Box Layout Example</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.box {
	background: black;
	color: white;
	text-align: center;
	padding: 20px;
	margin: 10px;
}

.custom-margin-top {
	margin-top: -200px; /* 원하는 마이너스 마진 값 설정 */
}

.custom-margin-top2 {
	margin-top: -85px; /* 원하는 마이너스 마진 값 설정 */
}

.custom-margin-top3 {
	margin-top: 20px; /* 원하는 마이너스 마진 값 설정 */
}

.custom-margin-top4 {
	margin-top: 0px; /* 원하는 마이너스 마진 값 설정 */
}
</style>
</head>
<body>

	<div class="container-fluid mt-5 pt-5">
		<!-- 첫 번째 줄 -->
		<div class="row">
			<div class="col-sm-4">
				<div class="box"
					style="height: 300px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
					<div class="inner-box"
						style="background: gray; height: 120px; width: 50%"></div>
					<div class="inner-box"
						style="background: gray; height: 30px; width: 50%">
						<p>조현호</p>
					</div>
					<div class="inner-box"
						style="background: gray; height: 30px; width: 50%">
						<p>철산동 백수</p>
					</div>
					<div class="inner-box"
						style="background: gray; height: 60px; width: 50%">
						<img> <img> <img>
					</div>
				</div>
			</div>

			<div class="col-sm-4 d-none d-sm-block">
				<div class="box" style="height: 100px;">
					<div
						style="display: flex; justify-content: space-between; margin-bottom: 10px;">
						<p style="margin: 0;">포인트</p>
						<p style="margin: 0;">1000P</p>
					</div>
					<div style="display: flex; justify-content: space-between;">
						<p style="margin: 0;">메세지</p>
						<p style="margin: 0;">3건</p>
					</div>
				</div>
			</div>

			<div class="col-sm-4 d-none d-sm-block ">
				<div class="box"
					style="display: flex; align-items: center; height: 100px;">
					<img src="first-image.jpg">
					<hr
						style="border-top: 1px solid #ccc; flex-grow: 1; margin: 0 10px;">
					<img src="third-image.jpg">
				</div>
			</div>

		</div>


		<!-- 두 번째 줄 -->
		<div class="row">
			<div class="col-sm-8 offset-sm-4">
				<div class="box custom-margin-top" style="text-align: left;">
					<p>
						🏠 집앞 산책하고 <span class="font-weight-bold text-primary">포인트를</span>
						얻는 방법
					</p>
				</div>
			</div>
			<div class="col-sm-8 offset-sm-4">
				<div class="box custom-margin-top2" style="text-align: left;">
					<p>
						🔥 지금 여러 활동에 참가하면 <span class="font-weight-bold text-primary">한정판
							뱃지</span>를 지급
					</p>

				</div>
			</div>
		</div>

		<!-- 세 번째 줄 -->
		<div class="row">
			<div class="col-sm-4">
				<div class="box">
					<button type="button">로그아웃</button>
				</div>
			</div>
			<div class="col">
				<div class="box custom-margin-top3">
					<p>나무에서 당신의 가치를 나눠보세요!</p>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-4">
				<div class="box">
					<p>나의 일정</p>
				</div>
			</div>

			<div class="col d-flex flex-column">
				<h4>나의 활동</h4>
				<div class="box custom-margin-top4" style="display: flex;">
					<div style="flex-grow: 1; text-align: left;">
						<!-- 왼쪽 영역 -->
						<p>관심목록</p>
						<p>거래내역</p>
					</div>
					<div style="flex-grow: 1; text-align: left;">
						<!-- 오른쪽 영역 -->
						<p>내가쓴글</p>
						<p>나의뱃지</p>
					</div>
				</div>
			</div>

		</div>

		<div class="box offset-sm-7">
			<!-- 오른쪽 영역 -->
			<p>내가쓴글</p>
			<p>나의뱃지</p>
		</div>

	</div>
</body>
</html>
