<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Box Layout Example</title>

<style>
.namuLevel {
	height: 50px;
	width: 50px;
}

.box {
	background: white;
	color: black;
	text-align: center;
	padding: 20px;
	margin: 10px;
	border-radius: 10px;
	border: 1px solid black;
}

.custom-margin-top {
	margin-top: -220px; /* 원하는 마이너스 마진 값 설정 */
}

.custom-margin-top2 {
	margin-top: -70px; /* 원하는 마이너스 마진 값 설정 */
}

.custom-margin-top3 {
	margin-top: 20px; /* 원하는 마이너스 마진 값 설정 */
}

.custom-margin-top4 {
	margin-top: 0px; /* 원하는 마이너스 마진 값 설정 */
}

.profileImage {
	width: 100%;
	height: 220px;
	border-radius: 100%;
}

.icons {
	width: 30px;
	height: 30px;
}

.btn-user {
	width: 50%;
	height: 100%;
	background: white;
	border: none;
	font-size: 20px;
	border-radius: 30px;
	border: 1px solid black;
}

.box1 {
	background: white;
	color: black;
	text-align: center;
	padding: 20px;
	margin: 10px;
	border-radius: 10px;
}

.box-3 {
	background: white;
	color: black;
	text-align: center;
	padding: 20px;
	margin: 10px;
}

.body-container {
	max-width: 800px;
}

.fleamarket-cover {
	background-color: #97d5ee;
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap; /* Allow wrapping for smaller screens */
	padding: 16px;
}

h1 {
	display: block;
	font-size: 41px;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
	unicode-bidi: isolate;
}

.htext {
	margin: 0; /* Reset margin */
}

.cover-title {
	flex: 1;
}

.cover-description {
	display: block;
	margin-top: 10px;
	font-size: 20px; /* Adjust as needed */
}

.cover-image {
	flex: 1;
	text-align: center; /* Center the image */
}

.mainImage {
	height: 300px;
	width: 600px;
	max-width: 100%;
	height: auto; /* Maintain aspect ratio */
	margin-left: 0;
}

@media ( max-width : 768px) {
	.fleamarket-cover {
		flex-direction: column;
		align-items: center;
		height: auto;
		margin-top: 0;
	}
	.cover-title {
		padding-left: 0;
		margin: 20px 0;
	}
	.mainImage {
		width: 100%;
		height: auto;
		margin-left: 0;
	}
}

@media ( min-width : 768px) {
	.fleamarket-cover {
		height: 315px;
		padding: 0 16px;
		margin-top: 60px;
	}
	.mainImage {
		width: 600px;
		height: 300px;
	}
}
</style>
</head>

<div class="container">
	<section class="fleamarket-cover">
		<div class="cover-title htext" style="margin-left: 100px;">
			<h1>마이페이지</h1>
			<span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>
			<span class="cover-description htext" style="margin-top: -25px;">무:
				무한한 가능성을 거래합니다.</span>
		</div>
		<div class="cover-image">
			<img class="mainImage ml-3" alt=""
				src="${pageContext.request.contextPath}/resources/images/camp_1.png">
		</div>
	</section>
</div>
<div class="body-main">
	<!-- 첫 번째 줄 -->
	<div class="row">
		<div class="col-sm-3">
			<div class="box1"
				style="height: 400px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
				<div class="inner-box" style="height: 220px; width: 50%">
					<img class="profileImage" alt=""
						src="${pageContext.request.contextPath}/resources/images/person.png">
				</div>
				<div class="inner-box" style="height: 30px; width: 50%">
					<p>조현호</p>
				</div>
				<div class="inner-box" style="height: 30px; width: 80%">
					<p>철산동 백수 / 키움 히어로즈 팬</p>
				</div>
				<div class="inner-box"
					style="background: gray; height: 60px; width: 50%">
					<img> <img> <img>
				</div>
			</div>
		</div>

		<div class="col-sm-3 d-none d-sm-block ml-5 mt-3">
			<div class="box" style="height: 100px;">
				<div
					style="display: flex; justify-content: space-between; margin-bottom: 10px;">
					<p style="margin: 0; font-size: 20px; font-weight: 200;">
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_point.png">
						포인트
					</p>
					<p style="margin: 0; font-size: 20px;">${point}P</p>
				</div>

				<div style="display: flex; justify-content: space-between;">
					<p style="margin: 0; font-size: 20px; font-weight: 200;">
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_message.png">
						메세지
					</p>
					<p style="margin: 0; font-size: 20px;">3건</p>
				</div>
			</div>
		</div>

		<div class="col-sm-5 d-none d-sm-block mt-3">
			<div class="box"
				style="display: flex; align-items: center; height: 100px;">
				<img class="namuLevel"
					src="${pageContext.request.contextPath}/resources/images/namuLogo.png">
				<hr
					style="border-top: 3px solid black; flex-grow: 1; margin: 0 10px;">
				<img class="namuLevel"
					src="${pageContext.request.contextPath}/resources/images/namuLogo.png">
			</div>
		</div>
	</div>

	<!-- 두 번째 줄 -->

	<div class="row custom-margin-top">
		<div class="col-sm-8 offset-sm-3">
			<div class="box"
				style="text-align: left; height: 70px; justify-content: center;">
				<p style="font-size: 20px;">
					🏠 집앞 산책하고 <span class="font-weight-bold text-primary">포인트를</span>
					얻는 방법
				</p>
			</div>
		</div>
		<div class="col-sm-8 offset-sm-3">
			<div class="box"
				style="text-align: left; height: 70px; justify-content: center;">
				<p style="font-size: 20px;">
					🔥 지금 여러 활동에 참가하면 <span class="font-weight-bold text-primary">한정판
						뱃지</span>를 지급
				</p>
			</div>
		</div>
	</div>

	<!-- 세 번째 줄 -->
	<div class="row">
		<div class="col-sm-3" style="margin-top: 50px;">
			<div class="box-3 custom-margin-top4" style="height: 100%">
				<button type="button" class="btn-user">로그아웃</button>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="box custom-margin-top3" style="background: #BEF4F1">
				<p style="margin-top: 1rem; font-size: 25px;">나무에서 당신의 가치를
					나눠보세요!</p>
			</div>
		</div>
	</div>

	<!-- 네 번째 줄 -->
	<div class="row  mt-5">
		<div class="col-sm-3">
			<div class="box">
				<p>나의 일정</p>
			</div>
		</div>
		<div class="col-sm-8">
			<h4>나의 활동</h4>
			<div class="box custom-margin-top4"
				style="display: flex; border: none;">
				<div style="flex-grow: 1; text-align: left; font-size: 19px;">
					<!-- 왼쪽 영역 -->
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_heart.png">
						&nbsp;관심목록
					</p>
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_transaction.png">
						&nbsp;거래내역
					</p>
				</div>
				<div style="flex-grow: 1; text-align: left; font-size: 19px;">
					<!-- 오른쪽 영역 -->
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_pencil.png">
						&nbsp;내가쓴글
					</p>
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_badge.png">
						&nbsp;나의뱃지
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 다섯 번째 줄 -->
	<div class="row">
		<div class="col-sm-3">
			<!-- 빈 열을 추가하여 정렬 보정 -->
		</div>
		<div class="col-sm-8">
			<h4>포인트</h4>
			<div class="box custom-margin-top4"
				style="display: flex; border: none;">
				<div style="flex-grow: 1; text-align: left; font-size: 19px;">
					<!-- 왼쪽 영역 -->
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_account.png">
						포인트 통장
					</p>
					<a onclick="chargeModal();"> <img class="icons"
						src="${pageContext.request.contextPath}/resources/images/icon_account.png"
						onclick="requestPay();"> 충전하기
					</a>
				</div>
				<div style="flex-grow: 1; text-align: left; font-size: 19px;">
					<!-- 오른쪽 영역 -->
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_refund.png">
						&nbsp;환불하기
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 여섯 번째 줄 -->
	<div class="row">
		<div class="col-sm-3">
			<!-- 빈 열을 추가하여 정렬 보정 -->
		</div>
		<div class="col-sm-8">
			<h4>정보수정</h4>
			<div class="box custom-margin-top4"
				style="display: flex; border: none;">
				<div style="flex-grow: 1; text-align: left; font-size: 19px;">
					<!-- 왼쪽 영역 -->
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_change.png">
						&nbsp;프로필 사진 변경
					</p>
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_change.png">
						&nbsp;주소 변경
					</p>
				</div>
				<div style="flex-grow: 1; text-align: left; font-size: 19px;">
					<!-- 오른쪽 영역 -->
					<p>
						<img class="icons"
							src="${pageContext.request.contextPath}/resources/images/icon_change.png">
						&nbsp;비밀번호 변경
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="chargeModal" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="chargeModal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginViewerModalLabel">충전하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="modelLoginForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<p class="form-control-plaintext">정보를 다시 확인해 보세요</p>
						</div>
						<div class="mt-0">
							<input type="text" name="userId" class="form-control" readonly
								placeholder="${sessionScope.member.userId} 여기 유저 이름">
						</div>
						<div>
							<input type="password" name="userEamil" autocomplete="off"
								readonly class="form-control" placeholder="유저 이메일">
						</div>
						<div>
							<input type="password" name="userPwd" autocomplete="off" readonly
								class="form-control" placeholder="유저 주소">
						</div>
						<div>
							<input type="number" name="money" autocomplete="off" id="money"
								class="form-control" placeholder="금액 : 100원 이상 입력이 가능합니다.">
						</div>

						<div>
							<button type="button" class="btn btn-primary w-100"
								onclick="sendOk();">충전하기</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function sendOk() {
    var money = document.getElementById("money").value;
    if (money < 100) {
        alert("100원 이상 입력이 가능합니다.");
    } else {
        selectSeq(function(sequence) {
            requestPay(money, sequence);
        });
    }
}
	
	function chargeModal() {
		$('#chargeModal').modal('show');
	}
	
	
	function ajaxFun(url, method, formData, dataType, fn, file = false) {
		const settings = {
				type: method, 
				data: formData,
				dataType:dataType,
				success:function(data) {
					fn(data);
				},
				beforeSend: function(jqXHR) {
					jqXHR.setRequestHeader('AJAX', true);
				},
				complete: function () {
				},
				error: function(jqXHR) {
					if(jqXHR.status === 403) {
						login();
						return false;
					} else if(jqXHR.status === 400) {
						alert('요청 처리가 실패 했습니다.');
						return false;
			    	}
			    	
					console.log(jqXHR.responseText);
				}
		};
		
		if(file) {
			settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
			settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
		}
		
		$.ajax(url, settings);
	}
	
	function selectSeq(callback) {
	    let url = "${pageContext.request.contextPath}/mypage/selectSeq";
	    let query = "";

	    const fn = function(data) {
	        let state = data.state;
	        if (state === "true") {
	            var sequence = data.sequence;
	            callback(sequence); // 콜백 함수를 호출하여 sequence 값을 전달
	        } else {
	            alert("실패");
	        }
	    };
	    ajaxFun(url, "post", query, "json", fn);
	}
	
	
	function pointCharge(sequence) {
	    let url = "${pageContext.request.contextPath}/mypage/pointCharge";
	    let currentPoint = "${point}";
	    let pointVar = document.getElementById("money").value;
	    
	    
	    let formData = {currentPoint:currentPoint,pointVar:pointVar,pointNum:sequence};
		console.log(formData);
		
	    const fn = function(data) {
	        let state = data.state;
	        if (state === "true") {
	            alert("저장 성공");
	            href = "${pageContext.request.contextPath}/mypage/list";
	        } else {
	            alert("저장 실패");
	        }
	    };
	    ajaxFun(url, "post", formData, "json", fn);
	}
</script>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp62772272");
	
	function requestPay(money,sequence) {
		IMP.request_pay({
			pg : 'html5_inicis.INIpayTest', // 테스트 시 html5_inicis.INIpayTest 기재 
			pay_method : 'card',
			merchant_uid : sequence, // 상점에서 생성한 고유 주문번호
			name : '나무머니',
			amount : money, // 금액
			buyer_email : 'test@portone.io',
			buyer_name : '${userId}',
			buyer_tel : '010-1234-5678', // 필수 파라미터
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
		}, function(resp) { // callback
			if (resp.success) {
				
				pointCharge(sequence);
				alert('나무머니가 구매되었습니다...');
				
			} else {
				alert('fail...');
				console.log(resp);
			}
		});
	}
</script>