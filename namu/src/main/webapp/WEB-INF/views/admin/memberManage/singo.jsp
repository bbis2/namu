<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1200px;
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}

.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}

.tab-pane {
	min-height: 300px;
}

.hover {
	cursor: pointer;
}

.btn-span {
	cursor: pointer;
	border: 1px solid #dee2e6;
	border-radius: 5px;
	margin: 3px;
	padding: 5px;
}
</style>
<style>
.button-container {
	display: flex; /* Use flexbox to align buttons in a row */
	gap: 10px; /* Adds spacing between buttons */
}

.btn-chadan {
	display: inline-block; /* Ensures inline layout */
	writing-mode: horizontal-tb; /* Ensures text is horizontal */
	white-space: nowrap; /* Prevents text from wrapping to the next line */
	/* Add any additional styling you might need */
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<div class="body-container">
	<div class="body-title">
		<h3>
			<i class="bi bi-person-square"></i> 회원 관리
		</h3>
	</div>

	<div class="body-main">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-0" data-bs-toggle="tab"
					data-bs-target="#nav-content" type="button" role="tab"
					aria-controls="0" aria-selected="true" data-tab="0">
					<i class="bi bi-person-lines-fill"></i> 회원리스트
				</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-1" data-bs-toggle="tab"
					data-bs-target="#nav-content" type="button" role="tab"
					aria-controls="1" aria-selected="true" data-tab="1">
					<i class="bi bi-bar-chart-line"></i> 신고관리
				</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab"
					data-bs-target="#nav-content" type="button" role="tab"
					aria-controls="2" aria-selected="true" data-tab="2">
					<i class="bi bi-bar-chart-line"></i> 회원분석
				</button>
			</li>
		</ul>



		<div class="tab-content pt-2" id="nav-tabContent">

			<table class="table table-borderless mt-2 mb-0"
				style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
				<tr>
					<td style="flex: 1;">
						<p class="form-control-plaintext p-0" style="margin: 0;">
							${dataCount}개(${page}/${total_page} 페이지)</p>
					</td>
					<td style="flex: 1; text-align: right;">
						<div class="col" style="display: inline-block;">
							<form id="FilterForm"
								action="${pageContext.request.contextPath}/admin/memberManage/singo"
								method="get" style="margin: 0;">
								<select name="processresult1" class="form-select mb-4 border border-2"
									aria-label="Default select example" onchange="filterByprocessresult()"
									style="display: inline-block;">
									<option value="0" ${processresult1==0?'selected':''}>처리대기</option>
									
									<option value="1" ${processresult1==1?'selected':''}>차단중</option>
									
								</select>
							</form>
						</div>
					</td>
				</tr>
			</table>




			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th width="60">번호</th>
						<th width="120">피신고인</th>
						<th width="120">신고글</th>
						<th width="120">신고유형</th>
						<th width="120">신고사유</th>
						<th width="120">신고날짜</th>
						<th width="120">신고유저</th>
						<th width="120">이동하기</th>
						<th width="120">신고처리</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>${dto.banUser}</td>
							<td>${dto.subject}</td>
							<td>${dto.reportType}</td>
							<td>${dto.reportContent}</td>
							<td>${dto.reportDate}</td>
							<td>${dto.userId}</td>
							<td>
								<!-- 버튼을 새로운 <td> 안에 포함시킴 -->
								<button type="button" class="btn btn-primary"
									onclick="send('${dto.field}', ${dto.postNum});">글 보기</button>
							</td>
							<td>
								<div class="button-container">
								<c:if test="${processresult1 == 0}">
									<button type="button" class="btn btn-primary btn-chadan"
										data-banUser="${dto.banUser}"
										data-reportNum="${dto.reportNum}">차단</button>
									<button type="button" class="btn btn-primary btn-release" data-userId="${dto.banUser}"
										data-reportNum="${dto.reportNum}">해제</button>
								</c:if>
								<c:if test="${processresult1 > 0}">
									<button type="button" class="btn btn-primary btn-freeUser" data-userId="${dto.banUser}"
										data-reportNum="${dto.reportNum}">차단풀기</button>
								</c:if>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light"
						onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/singo';"
						title="새로고침">
						<i class="bi bi-arrow-counterclockwise"></i>
					</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm"
						action="${pageContext.request.contextPath}/admin/memberManage/singo"
						method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="userId" ${schType=="userId" ? "selected":""}>아이디</option>
								<option value="reportType" ${schType=="reportType" ? "selected":""}>신고사유</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
							<input type="hidden" name="enabled" value="${enabled}"> <input
								type="hidden" name="page" value="1">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light"
								onclick="searchList()">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="col text-end">&nbsp;</div>
			</div>
		</div>

	</div>
</div>

<div class="modal fade" id="SinGoModal" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="SinGoModal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="">차단하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="SinGoForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<p class="form-control-plaintext">차단할 일수를 고르세요</p>
						</div>
						<div class="mt-0">
							<select id="resulttype" name="resulttype" class="form-select">
								<option value="욕설/인신공격" selected>욕설/인신공격</option>
								<option value="개인정보노출">개인정보노출</option>
								<option value="불법정보">불법정보</option>
								<option value="같은내용반복(도배)">같은내용반복(도배)</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div class="mt-0">
							<select id="reportType" name="banDate" class="form-select">
								<option value="1" selected>1일</option>
								<option value="7">7일</option>
								<option value="30">30일</option>
								<option value="365">1년</option>
								<option value="9999">영구정지</option>
							</select> <input type="hidden" name="banUser"> <input
								type="hidden" name="reportNum">
						</div>
						<button type="button" class="btn btn-primary" onclick="sendOk2();">차단하기</button>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" data-bs-backdrop="static"
	id="myMemberDetaileDialogModal" tabindex="-1"
	aria-labelledby="myMemberDetaileDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myMemberDetaileDialogModalLabel">회원상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#tab-1").addClass("active");
	
    $("button[role='tab']").on("click", function(e){
    	const tab = $(this).attr("aria-controls");
    	if(tab === "1") {
    		return;
    	}
    	
		let url = "${pageContext.request.contextPath}/admin/memberManage/list";
		location.href = url;
    });	
});


$('.btn-chadan').click(function(){
	let banUser = $(this).attr('data-banUser');
	let reportNum = $(this).attr('data-reportNum');
	const f = document.SinGoForm;
	f.banUser.value = banUser;
	f.reportNum.value = reportNum;
	$('#SinGoModal').modal('show');
});

$('.btn-release').click(function(){
	let reportNum = $(this).attr('data-reportNum');
	let banUser = $(this).attr('data-userId'); 
	location.href = "${pageContext.request.contextPath}/admin/memberManage/endUser?reportNum="+reportNum+"&userId="+banUser;
});

$('.btn-freeUser').click(function(){
	let reportNum = $(this).attr('data-reportNum');
	let banUser = $(this).attr('data-userId'); 
	location.href = "${pageContext.request.contextPath}/admin/memberManage/freeUser?reportNum="+reportNum+"&userId="+banUser;
});


function filterByprocessresult() {
	document.getElementById("FilterForm").submit();
}

function sendOk2() {
	
	const f = document.SinGoForm;
	let banUser = f.banUser.value;
    f.action = "${pageContext.request.contextPath}/admin/memberManage/chadan";
    f.submit();
}

function send(field, postNum) {
	if(field === 'auction'){
		location.href = "${pageContext.request.contextPath}/" + field + "/article?aNum=" + postNum + "&page=1";
	}else{
		location.href = "${pageContext.request.contextPath}/" + field + "/article?num=" + postNum + "&page=1";
	}
}

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
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

function searchList() {
	const f = document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/admin/memberManage/singo";
	f.submit();
}
	
function profile(userId) {
	let url = "${pageContext.request.contextPath}/admin/memberManage/profile";
	let query = "userId="+userId;
	
	const fn = function(data){
		$('#myMemberDetaileDialogModal .modal-body').html(data);
		$('#myMemberDetaileDialogModal').modal("show");
	};
	ajaxFun(url, "get", query, "text", fn);
}
	
function updateOk() {
	const f = document.deteailedMemberForm;
	
	if( ! f.stateCode.value ) {
		alert("상태코드를 선택하세요.");
		f.stateCode.focus();
		return;
	}
	if( ! f.memo.value.trim() ) {
		alert("상태메모를 선택하세요.");
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberState";
	let query = $("#deteailedMemberForm").serialize();

	const fn = function(data){
		$('form input[name=page]').val('${page}');
		searchList();
	};
	ajaxFun(url, 'post', query, 'json', fn);
		
	$('#myMemberDetaileDialogModal').modal("hide");
}

function deleteOk(memberIdx) {
	if(confirm("선택한 계정을 삭제 하시겠습니까 ?")) {

	}
	
	$('#myMemberDetaileDialogModal').modal("hide");
}

function dialogClose() {
	$('#myMemberDetaileDialogModal').modal("hide");
}

function memberStateDetaileView() {
	$('#myMemberStateDetaileDialogModal').modal("show");
}

function selectStateChange() {
	const f = document.deteailedMemberForm;
	
	let code = f.stateCode.value;
	let memo = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! code) {
		return;
	}

	if(code!=="0" && code!=="6") {
		f.memo.value = memo;
	}
	
	f.memo.focus();
}
</script>
