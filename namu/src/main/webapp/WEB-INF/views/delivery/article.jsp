<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fleamarket-cover {
	background-color: #E3F1C5;
}

.htext {
	padding-top: 100px;
	padding-left: 100px;
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
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: #f2f2f2;
}

textarea.form-control {
	height: 100px;
	resize: none;
}

.content-meta {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}

.navigation, .actions, .comments {
	margin: 10px 0;
}

.navigation .btn, .actions .btn, .comments .btn {
	background-color: #5d4734;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
}

.navigation .btn:hover, .actions .btn:hover, .comments .btn:hover {
	background-color: #4c3b2b;
}

.comments input[type="text"] {
	margin-bottom: 10px;
}
</style>

<c:if
	test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership > 99}">
	<script type="text/javascript">
		function deleteBoard() {
			if (confirm('게시글을 삭제 하시겠습니까?')) {
				let query = 'num=${dto.num}&${query}';
				let url = '${pageContext.request.contextPath}/daily/delete?'
						+ query;
				location.href = url;
			}
		}
	</script>
</c:if>

<div class="container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			소통하는<br>일상 생활
		</h1>
		<span class="cover-description htext"></span><br> <span
			class="cover-description htext">동네주민과 함께 만들어가요!</span>
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
				<td align="right">${dto.regDate}|조회 ${dto.hitCount}</td>
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
			<td width="50%"><c:choose>
					<c:when test="${sessionScope.member.userId == dto.userId}">
						<button type="button" class="btn btn-light"
							onclick="location.href='${pageContext.request.contextPath}/delivery/update?num=${dto.num}';">수정</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-light" disabled>수정</button>
					</c:otherwise>
				</c:choose> <c:choose>
					<c:when test="${sessionScope.member.userId == dto.userId}">
						<button type="button" class="btn btn-light"
							onclick="deleteBoard();">삭제</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-light" disabled>삭제</button>
					</c:otherwise>
				</c:choose>
			<c:if test="${count == 0}">
				<button type="button" class="btn btn-light" onclick="itsMe();">신청</button>
			</c:if>	
			<c:if test="${count != 0}">
			<button type="button" class="btn btn-light" onclick="itsMe();" disabled>신청</button>
			</c:if>
			<button type="button" class="btn btn-light" onclick="SinGo();">신고</button>
			</td>
			<td class="text-end">
				<button type="button" class="btn btn-light"
					onclick="location.href='${pageContext.request.contextPath}/delivery/list?${query}';">리스트</button>
			</td>
		</tr>
	</table>

	<span class="bold">😊</span><span> 안타 안타 날려버려라 키움의 히어로 이정후 ❣️</span>
	<div class="reply" style="display: none;">
		<form name="answerForm" method="post" enctype="multipart/form-data">
			<textarea class='form-control' name="" readonly style="height: 300px;">${dto.author}</textarea>
			<img src="${pageContext.request.contextPath}/uploads/delivery/${dto.imageFilename1}">
			<img src="${pageContext.request.contextPath}/uploads/delivery/${dto.imageFilename2}">
			<table class="table table-borderless reply-form">
				<tr>
					<td><textarea class='form-control' name="author"></textarea>
					<div class="img-viewer"></div> <input type="file"
							name="selectFile1" accept="image/*">
							<div class="img-viewer"></div> <input type="file"
							name="selectFile2" accept="image/*">
					</td>
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


<c:if test="${sessionScope.member.membership>98 || (dstart >= 1 && dstart != 2)}">
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
								 class="form-control"
								placeholder="신고사유 : ">
						</div>
							<input type="hidden" name="Field" value="${dto.tableName}">
							<!-- 파라미터 num -->
							<input type="hidden" name="postNum" value="${dto.num}">
							<input type="hidden" name="banUser" value="${dto.userId}">
							<input type="hidden" name="subject" value="${dto.subject}">
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
