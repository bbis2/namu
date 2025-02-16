<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.fleamarket-cover {
	background-color: #E3F1C5;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/bicycle.jpg');
	background-size: cover; /* 이미지를 커버 전체에 맞춤 */
	background-position: center; /* 이미지를 중앙에 위치시킴 */
	position: relative;
}

.htext {
	padding-top: 100px;
	padding-left: 100px;
	color: black; /* 배경 이미지와 대비되도록 텍스트를 흰색으로 설정 */
	position: relative;
	z-index: 1; /* 텍스트를 배경 위에 표시되도록 함 */
}

.cover-content {
	padding: 50px;
	position: relative;
	height: 100%;
	box-sizing: border-box;
	margin-left: 100px;
}

@media ( min-width : 768px) {
	.fleamarket-cover {
		height: 315px;
		padding: 0 16px 0 16px;
		margin-top: 60px;
		margin-bottom: 60px;
	}
	/*여기까지 초록 박스*/
	.body-title {
		margin: 40px 0;
		text-align: left;
	}
	.body-title h2 {
		font-size: 28px;
		font-weight: bold;
	}
	.write-form {
		width: 100%;
		border-collapse: collapse;
	}
	.write-form td {
		padding: 10px;
		border: 1px solid #ddd;
	}
	.write-form .bg-light {
		background-color: #f9f9f9;
	}
	.form-control {
		width: 100%;
		padding: 8px;
		box-sizing: border-box;
	}
	.form-control-plaintext {
		height: 40px;
		padding: 8px;
	}
	.table-borderless td {
		border: none;
	}
	.text-center {
		text-align: center;
	}
	.btn {
		padding: 10px 20px;
		font-size: 16px;
		margin: 5px;
	}
	.btn-dark {
		background-color: #333;
		color: #fff;
		border: none;
	}
	.btn-light {
		background-color: #f9f9f9;
		color: #333;
		border: 1px solid #ddd;
	}
}

.image-container {
	display: flex; /* Display images in a row */
	gap: 10px; /* Space between images */
}

.image-container img {
	max-width: 400px; /* Ensure images scale within their container */
	height: auto;
}
</style>
<c:if
	test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership > 90}">
	<script type="text/javascript">
		function deleteBoard() {
			if (confirm('게시글을 삭제 하시겠습니까?')) {
				let query = 'num=${dto.num}';
				let url = '${pageContext.request.contextPath}/delivery/delete?'
						+ query;
				location.href = url;
			}
		}
	</script>
</c:if>

<div class="container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			둘러보는<br>우리 동네
		</h1>
		<span class="cover-description htext"></span><br> <span
			class="cover-description htext">심부름하고 포인트를 얻어가세요!</span>
		<div class="cover-image"></div>
	</section>

	<div class="body-title">
		<h4>${dto.saddr},${dto.saddr2}->${dto.receive},${dto.receive2}</h4>
	</div>

	<table class="table mt-5 mb-0 board-article">
		<thead>
			<tr>
				<td colspan="2" align="center"
					style="font-size: 40px; font-weight: bold;">${dto.subject}</td>
			</tr>
		</thead>

		<tbody>
			<tr style="font-size: 17px;">
				<td width="50%" style="font-weight: bold;">${dto.nickname}</td>
				<td align="right">${dto.regDate}|조회${dto.hitCount}</td>
			</tr>

			<tr>
				<td colspan="2" valign="top" height="200"
					style="border-bottom: none;">${dto.content}</td>
			</tr>


			<tr>
				<td colspan="2">이전글 : <c:if test="${not empty prevDto}">
						<a
							href="${pageContext.request.contextPath}/delivery/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
					</c:if>
				</td>
			</tr>

			<tr>
				<td colspan="2">다음글 : <c:if test="${not empty nextDto}">
						<a
							href="${pageContext.request.contextPath}/delivery/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	<table class="table table-borderless mb-2">
		<tr>
			<td width="50%">
				<!-- 수정 버튼은 언제나 비활성화된 상태 -->
				<button type="button" class="btn btn-light" disabled>수정</button> <!-- 삭제 버튼은 회원등급이 90 이상일 때만 활성화 -->
				<c:choose>
					<c:when test="${sessionScope.member.membership > 90}">
						<button type="button" class="btn btn-light"
							onclick="deleteBoard();">삭제</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-light" disabled>삭제</button>
					</c:otherwise>
				</c:choose> <!-- 신청 버튼은 count가 0일 때만 활성화 --> <c:if test="${count == 0}">
					<button type="button" class="btn btn-light" onclick="itsMe();">신청</button>
				</c:if> <c:if test="${count != 0}">
					<button type="button" class="btn btn-light" onclick="itsMe();"
						disabled>신청</button>
				</c:if> <!-- 신고, 지도보기 버튼 -->
				<button type="button" class="btn btn-light" onclick="SinGo();">신고</button>
				<button type="button" class="btn btn-light" onclick="mapOk();">지도보기</button>
			</td>
			<td class="text-end">
				<button type="button" class="btn btn-light"
					onclick="location.href='${pageContext.request.contextPath}/delivery/list?${query}';">리스트</button>
			</td>
		</tr>
	</table>


	<span class="bold">😊</span><span> 배달 인증하고 보증금 받아가세요 ❣️</span>
	<div class="reply" style="display: none;">
		<form name="answerForm" method="post" enctype="multipart/form-data">
			<div class="image-container">
				<img
					src="${pageContext.request.contextPath}/uploads/delivery/${dto.imageFilename1}"
					alt="Image 1"> <img
					src="${pageContext.request.contextPath}/uploads/delivery/${dto.imageFilename2}"
					alt="Image 2">
			</div>

			<textarea class="text-area" style="width: 50%;" readonly>${dto.author}</textarea>
			<table class="table table-borderless reply-form">
				<tr>
					<td><textarea class='form-control' name="author"></textarea>
						<div class="img-viewer"></div> <input type="file"
						name="selectFile1" accept="image/*">
						<div class="img-viewer"></div> <input type="file"
						name="selectFile2" accept="image/*"></td>
				</tr>
				<tr>
					<td align='right'><input type="hidden" name="num"
						value="${dto.num}"> <input type="hidden" name="page"
						value="${page}">
						<button type='button' class='btn btn-light btnSendAnswer'
							onclick="check();">배달 인증</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>


<c:if
	test="${sessionScope.member.membership>98 || (dstart >= 1 && dstart != 2)}">
	<script type="text/javascript">
	console.log(${dstart});
		$(function() {
			let answerName = "";
			if (!answerName) {
				$(".reply").show();
			}
		});

		function check() {
			console.log("답변 등록 버튼 클릭됨"); // 디버깅 메시지 추가
			const f = document.answerForm;
			let num = ${dto.num};
			if (!f.author.value.trim()) {
				alert("답변 내용을 입력하세요."); // 경고창 추가
				f.author.focus();
				return false;
			}
			
			if (!f.selectFile1 || !f.selectFile2) {
				alert("사진을 올려주세요."); // 경고창 추가
				f.author.focus();
				return false;
			}

			f.action = "${pageContext.request.contextPath}/delivery/answer?num="+num;
			console.log("폼 제출 준비 완료"); // 디버깅 메시지 추가
			f.submit();
		}

		$(function() {
			$(".btnUpdateAnswer").click(function() {
				let mode = $(this).attr("data-mode");
				if (mode === "update") {
					$(".reply").show();
					$(this).text("답변 수정 취소")
					$(this).attr("data-mode", "cancel");
				} else {
					$(".reply").hide();
					$(this).attr("data-mode", "update");
					$(this).text("답변 수정")
				}
			});
		});
	</script>
</c:if>


<div class="modal fade" id="whatTime" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="chagneMent" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="">출발시간 입력</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="okForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<input type="date" name="date" class="form-control"> <input
								type="time" name="time" class="form-control">
						</div>
						<div>
							<button type="button" class="btn btn-primary w-100"
								onclick="goMent();">신청하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="map2" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="map2" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<!-- 여기서 modal-sm을 modal-lg로 변경 -->
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">지도로 보기</h5>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-primary"
					onclick="getDistanceFromLatLonInKm();">거리계산</button>
				<!-- id 속성 제거 -->
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div id="mapContent" style="width: 100%; height: 350px;"></div>
				<!-- id 수정 -->
			</div>

		</div>

	</div>
</div>




<!-- 신고 모달 -->
<div class="modal fade" id="SinGoModal" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="SinGoModal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="">신고하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="SinGoForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<p class="form-control-plaintext">신고유형과 사유를 적어주세요</p>
						</div>
						<div class="mt-0">
							<select id="reportType" name="reportType" class="form-select">
								<option value="욕설/인신공격" selected>욕설/인신공격</option>
								<option value="개인정보노출">개인정보노출</option>
								<option value="불법정보">불법정보</option>
								<option value="같은내용반복(도배)">같은내용반복(도배)</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div>
							<input type="text" name="reportContent" autocomplete="off"
								class="form-control" placeholder="신고사유 : ">
						</div>
						<input type="hidden" name="Field" value="${dto.tableName}">
						<!-- 파라미터 num -->
						<input type="hidden" name="postNum" value="${dto.num}"> <input
							type="hidden" name="banUser" value="${dto.userId}"> <input
							type="hidden" name="subject" value="${dto.subject}">
						<div>
							<button type="button" class="btn btn-primary w-100"
								onclick="sendOk();">신고하기</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function login() {
		location.href = '${pageContext.request.contextPath}/member/login';
	}

	function ajaxFun(url, method, formData, dataType, fn) {
		const settings = {
			type : method,
			data : formData,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete : function() {
				// 요청 완료 후 실행할 코드
			},
			error : function(jqXHR) {
				if (jqXHR.status === 403) {
					login();
					return false;
				} else if (jqXHR.status === 400) {
					alert('요청 처리가 실패했습니다.');
					return false;
				}

				console.log(jqXHR.responseText);
			}
		};

		$.ajax(url, settings);
	}

	// 페이징 처리
	$(function() {
		listPage(1);
	});

	function listPage(page) {
		let url = '${pageContext.request.contextPath}/daily/listReply';
		let query = 'num=${dto.num}&pageNo=' + page;
		let selector = '#listReply';

		const fn = function(data) {
			$(selector).html(data);
		};

		ajaxFun(url, 'get', query, 'text', fn);
	}

	// 삭제, 신고 메뉴
	$(function() {
		$('.reply').on('click', '.reply-dropdown', function() {
			const $menu = $(this).next('.reply-menu');
			if ($menu.is(':visible')) {
				$menu.fadeOut(100);
			} else {
				$('.reply-menu').hide();
				$menu.fadeIn(100);

				let pos = $(this).offset();
				$menu.offset({
					left : pos.left - 70,
					top : pos.top + 20
				});
			}
		});

		$('.reply').on('click', function(event) {
			if ($(event.target.parentNode).hasClass('reply-dropdown')) {
				return false;
			}
			$(".reply-menu").hide();
		});
	});

	// 댓글 삭제
	$(function() {
		$('.reply').on('click', '.deleteReply', function() {
			if (!confirm('댓글을 삭제하시겠습니까?')) {
				return false;
			}

			let rNum = $(this).attr('data-rNum');
			let page = $(this).attr('data-pageNo');

			let url = '${pageContext.request.contextPath}/daily/deleteReply';
			let query = 'rNum=' + rNum + '&mode=reply';

			const fn = function(data) {
				listPage(page);
			};

			ajaxFun(url, 'post', query, 'json', fn);
		});
	});

	function itsMe() {
		$('#whatTime').modal('show');
	}

	function goMent() {
		const f = document.okForm;
		let time = f.time;
		let date = f.date
		let num2 = ${dto.num};
		f.action = "${pageContext.request.contextPath}/delivery/application?num2="
				+ num2;
		f.submit();

	}
	
	function mapOk(){
		$('#map2').modal('show');
	}
	
	
	 function getDistanceFromLatLonInKm() {
		 let lat1 = ${latitude1};
		let lng1 = ${longitude1};
		let lat2 = ${latitude2};
		let lng2 = ${longitude2};
		
		 function deg2rad(deg) {
		        return deg * (Math.PI/180)
		    }
		    var r = 6371; //지구의 반지름(km)
		    var dLat = deg2rad(lat2-lat1);
		    var dLon = deg2rad(lng2-lng1);
		    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
		    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    
		    var d = r * c; // Distance in km
		    alert(Math.round(d*1000)+'m 입니다');
		    return Math.round(d*1000);
		
	    }
	
	
	//신고관련
	
	function SinGo(){
		$('#SinGoModal').modal('show');
	}
	
	function sendOk() {
		const f = document.SinGoForm;
		let str = f.reportContent.value.trim();
		
	    if (!confirm("정말 신고하시겠습니까?")) {
	        return;
	    }
	    
	    if(!str){
	    	alert("사유를 입력해주세요");
	    }
	    
	    f.action = "${pageContext.request.contextPath}/singo/reception";
	    f.submit();
	}


</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd17f1bf688c4db20bc89158d76400a0&libraries=services"></script>
<script>
$('#map2').on('shown.bs.modal', function () {
    let lat1 = ${latitude1};
    let lng1 = ${longitude1};
    let lat2 = ${latitude2};
    let lng2 = ${longitude2};
    
    var mapContainer = document.getElementById('mapContent');
    var centerCoords = new kakao.maps.LatLng(lat1, lng1); // 출발지 좌표
    var centerCoords2 = new kakao.maps.LatLng(lat2, lng2); // 도착지 좌표

    var map = new kakao.maps.Map(mapContainer, {
        center: centerCoords,
        level: 2
    });

    // 출발지 마커 생성
    var marker = new kakao.maps.Marker({
        position: centerCoords
    });
    
    // 도착지 마커 생성
    var marker2 = new kakao.maps.Marker({
        position: centerCoords2
    });

    // 출발지 정보 창 생성
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:3px; text-align:center;">출발지</div>'
    });

    // 도착지 정보 창 생성
    var infowindow2 = new kakao.maps.InfoWindow({
        content: '<div style="padding:3px; text-align:center;">도착지</div>'
    });

    // 마커를 지도에 추가
    marker.setMap(map);
    marker2.setMap(map);

    // 정보 창을 마커와 지도에 연결
    infowindow.open(map, marker);
    infowindow2.open(map, marker2);

    // 지도 컨테이너 크기 변경 시 지도 크기 조절
    map.relayout();
});


</script>
