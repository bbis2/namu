<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.modal-dialog {
	max-width: 800px; /* 원하는 너비로 조정 */
}

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
	padding-top: 0;
	padding-left: 0;
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

.form-control {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

.profileImage {
	cursor: pointer;
}

.changeSain {
	margin-top: 20px;
}

.link-block {
	display: block;
	margin-top: 10px;
	text-decoration: none; /* 링크 밑줄 제거 */
	color: inherit; /* 링크 색상 부모 요소와 동일 */
}

.link-block:hover {
	text-decoration: none; /* 링크에 마우스를 올렸을 때 밑줄 제거 */
	color: inherit; /* 링크에 마우스를 올렸을 때 색상 변화 없음 */
}

.link-block img {
	vertical-align: middle; /* 이미지와 텍스트를 수직으로 정렬 */
}


</style>


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

		<div class="body-main">
			<!-- 첫 번째 줄 -->
			<div class="row">
				<div class="col-sm-3">
					<div class="box1"
						style="height: 400px; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
						<div class="inner-box" style="height: 220px; width: 50%">
							<img class="profileImage" alt="" id="profileImage"
								onclick="Ischange();"
								src="${pageContext.request.contextPath}/resources/images/person.png">
						</div>
						<div class="inner-box" style="height: 30px; width: 50%">
							<p>${dto.nickname}</p>
						</div>
						<div class="inner-box" style="height: 30px; width: 80%">
							<p>${dto.ment}</p>
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

				<div class="col-sm-6 d-none d-sm-block mt-3">
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
				<div class="col-sm-9 offset-sm-3">
					<div class="box"
						style="text-align: left; height: 70px; justify-content: center;">
						<p style="font-size: 20px;">
							🏠 집앞 산책하고 <span class="font-weight-bold text-primary">포인트를</span>
							얻는 방법
						</p>
					</div>
				</div>
				<div class="col-sm-9 offset-sm-3">
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
				<div class="col-sm-9">
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
							<a onclick="refundOk();"> <img class="icons"
								src="${pageContext.request.contextPath}/resources/images/icon_refund.png">
								&nbsp;환불하기
							</a>
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
							<a href="#" class="link-block changeSain" id="changeSain"
								onclick="changePhoto();"> <img class="icons"
								src="${pageContext.request.contextPath}/resources/images/icon_change.png">
								&nbsp;프로필 사진 변경
							</a> <a href="#" class="link-block"> <img class="icons"
								src="${pageContext.request.contextPath}/resources/images/icon_change.png">
								&nbsp;주소 변경
							</a>
						</div>
						<div style="flex-grow: 1; text-align: left; font-size: 19px;">
							<!-- 오른쪽 영역 -->
							<a> <img class="icons"
								src="${pageContext.request.contextPath}/resources/images/icon_change.png">
								&nbsp;비밀번호 변경
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


<div class="modal fade" id="changePhoto333" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="changePhoto" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로필사진 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body form-control" id="ir1">

				</div>
			</div>
		</div>
</div>


<div class="modal fade" id="changePhoto" tabindex="-1" aria-labelledby="changePhotoLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="changePhotoLabel">프로필사진 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
        		
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
					<h5 class="modal-title" id="">충전하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="p-3">
						<form name="modelLoginForm" action="" method="post"
							class="row g-3">
							<div class="mt-0">
								<p class="form-control-plaintext">개인정보 확인을 해주세요</p>
							</div>
							<div class="mt-0">
								<input type="text" name="userId" class="form-control" readonly
									placeholder="이름 : ${dto.userName}">
							</div>
							<div>
								<input type="password" name="userEamil" autocomplete="off"
									readonly class="form-control" placeholder="이메일 : ${dto.email}">
							</div>
							<div>
								<input type="password" name="userPwd" autocomplete="off"
									readonly class="form-control" placeholder="전화번호 : ${dto.tel}">
							</div>
							<div>
								<input type="number" name="money" autocomplete="off" id="money"
									class="form-control" placeholder="금액입력 : 100원 이상 입력이 가능합니다.">
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

	<div id="refundModal" class="modal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<!-- modal-lg 추가 -->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">환불 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table id="refundTable" class="table">
						<thead>
							<tr>
								<th>결제번호</th>
								<th>결제아이디</th>
								<th>결제시간</th>
								<th>결제액수</th>
								<th>환불 사유</th>
								<th>결제유형 : 전자 결제</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 동적으로 추가됩니다 -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">

function check() {
	const f = document.photoForm;
	
    str = f.content.value.trim();
    if(! str || str === "<p><br></p>") {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/daily/${mode}";
    
    return true;
}

function changePhoto(){
	$('#changePhoto').modal('show');
}


function Ischange() {
    // 포커스를 이동시킬 요소를 가져옵니다.
    var changeSain = document.getElementById('changeSain');

    // 요소에 포커스를 설정합니다.
    changeSain.scrollIntoView({ behavior: 'smooth', block: 'start' });
    
    // 포커스를 설정하여 화면 리더기가 해당 요소를 읽도록 합니다.
    changeSain.setAttribute('tabindex', '-1');
    changeSain.focus();
}


function refundOk() {
    let url = "${pageContext.request.contextPath}/mypage/selectCharge";
    let query = "";

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            // console.log(data.list);
            let htmlContent = '';
			
            for (let it of data.list) {
                htmlContent += '<tr>' +
                    '<td>' + it.pointNum + '</td>' +
                    '<td>' + it.userId + '</td>' +
                    '<td>' + it.regDate + '</td>' +
                    '<td>' + it.pointVar + '</td>' +
                    '<td><input type="text" id="description-' + it.pointNum + '" placeholder="환불 사유" /></td>' +
                    '<td><button type="button" onclick="refundGo(this);" data-num="' + it.pointNum + '" data-pointVar="' + it.pointVar + '">환불하기</button></td>' +
                '</tr>';
            }

            $('#refundTable tbody').html(htmlContent);
            $('#refundModal').modal('show');
        } else {
            alert("결제 정보가 없습니다.");
        }
    };

    ajaxFun(url, "get", query, "json", fn);
}

function refundGo(button) {
    const num = button.getAttribute('data-num');
    let point = button.getAttribute('data-pointVar');
    getToken(num,point);
}

function getToken(num,point) {
    let url = "${pageContext.request.contextPath}/payments/token";
	let query = "";
	
    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("불러오기 성공");
            console.log(data.access_token);
            let access_token = data.access_token;
            cancel(num,access_token,point);
        } else {
            alert("불러오기 실패");
        }
    };
    ajaxFun(url, "post", query, "json", fn);
}

function cancel(num, access_token,point) {
    let url = "${pageContext.request.contextPath}/payments/cancel";
    let description = document.getElementById('description-' + num).value;
    
    let formData = {
        merchant_uid: num,
        reason: description,
        access_token: access_token // 액세스 토큰 추가
    };

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("환불 성공");
            insertRefund(num,point);
        } else {
            alert("환불 실패");
            console.log(data.message);
        }
    };
    
    // ajaxFun 함수 예시
    function ajaxFun(url, type, data, dataType, successFn) {
        $.ajax({
            url: url,
            type: type,
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: dataType,
            success: successFn,
            error: function(xhr, status, error) {
                alert("전송 실패: " + xhr.responseText);
            }
        });
    }

    ajaxFun(url, "post", formData, "json", fn);
}

function insertRefund(num,point){
	let url = "${pageContext.request.contextPath}/mypage/insertRefund";
	
	let description = document.getElementById('description-' + num).value;
	
    let formData = {point:point,description:description,pointNum:num};
	console.log(formData);
	
    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
        	refundPoint(point,description);
            alert("저장 성공");
            location.href = "${pageContext.request.contextPath}/mypage/list";
        } else {
            alert("저장 실패");
        }
    };
    ajaxFun(url, "post", formData, "json", fn);
}


function refundPoint(point,description){
	let url = "${pageContext.request.contextPath}/mypage/refundPoint";
	let currentPoint = ${point};
	let formData = {pointVar:point,description:description,currentPoint:currentPoint};
	
	 const fn = function(data) {
	        let state = data.state;
	        if (state === "true") {
	            alert("통장저장 성공");
	        } else {
	            alert("통장저장 실패");
	        }
	    };
	    ajaxFun(url, "post", formData, "json", fn);
	}
	
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
	            location.href = "${pageContext.request.contextPath}/mypage/list";
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
	<form name="photoForm" method="post">
					<textarea name="content" id="ir1" style="width: 700px; height: 500px;"></textarea>
					<button type="button" onclick="submitContents(this.form);">시작</button>
        		</form>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		if(! check()) {
			return;
		}
		elClickedObj.form.submit();
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>