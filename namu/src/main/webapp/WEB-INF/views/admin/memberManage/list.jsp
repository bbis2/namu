<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1000px;
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
.tab-pane { min-height: 300px; }

.hover { cursor: pointer; }
.btn-span { cursor: pointer; 
	border: 1px solid #dee2e6; border-radius: 5px;
	margin:3px; padding: 5px; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div class="body-container">
    <div class="body-title">
		<h3><i class="bi bi-person-square"></i> 회원 관리 </h3>
    </div>
    
    <div class="body-main">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="0" aria-selected="true" data-tab="0"><i class="bi bi-person-lines-fill"></i> 회원리스트</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="1" aria-selected="true" data-tab="1"> <i class="bi bi-bar-chart-line"></i> 신고관리</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="2" aria-selected="true" data-tab="2"> <i class="bi bi-bar-chart-line"></i> 회원분석</button>
			</li>
		</ul>
		
		<div class="tab-content pt-2" id="nav-tabContent">
		
			<table class="table table-borderless mt-2 mb-0">
				<tr>
					<td align="left" width="50%" valign="bottom">
						<p class="form-control-plaintext p-0">
							${dataCount}개(${page}/${total_page} 페이지)
						</p>
					</td>
					<td align="right">
						<select id="selectEnabled" class="form-select" style="width: 230px;" onchange="searchList();">
							<option value="" ${enabled=="" ? "selected":""}>::계정상태::</option>
							<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
							<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
						</select>
					</td>
				</tr>
			</table>
				
			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr> 
						<th width="60">번호</th>
						<th width="120">아이디</th>
						<th width="100">이름</th>
						<th width="220">거주지</th>
						<th width="120">전화번호</th>
						<th width="80">회원구분</th>
						<th width="60">상태</th>
						<th>이메일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="hover" onclick="profile('${dto.userId}');"> 
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>${dto.userId}</td>
							<td>${dto.userName}</td>
							<td>${dto.town1}</td>
							<td>${dto.tel}</td>
							<td>${dto.membership==1?"일반회원":(dto.membership==31?"강사":(dto.membership==51?"사원":"기타"))}</td>
							<td>${dto.enabled==1?"활성":"잠금"}</td>
							<td>${dto.email}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
					 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="userId"     ${schType=="userId" ? "selected":""}>아이디</option>
								<option value="userName"   ${schType=="userName" ? "selected":""}>이름</option>
								<option value="email"      ${schType=="email" ? "selected":""}>이메일</option>
								<option value="tel"        ${schType=="tel" ? "selected":""}>전화번호</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
							<input type="hidden" name="enabled" value="${enabled}">
							<input type="hidden" name="page" value="1">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					&nbsp;
				</div>
			</div>
		</div>

	</div>
</div>

<div class="modal fade" data-bs-backdrop="static" id="myMemberDetaileDialogModal" tabindex="-1" aria-labelledby="myMemberDetaileDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myMemberDetaileDialogModalLabel">회원상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#tab-0").addClass("active");
	
    $("button[role='tab']").on("click", function(e){
    	const tab = $(this).attr("aria-controls");
    	if(tab === "0") {
    		return;
    	}
    	
		let url = "${pageContext.request.contextPath}/admin/memberManage/analysis";
		location.href = url;
    });	
});

$(function(){
	$("#tab-0").addClass("active");
	
    $("button[role='tab']").on("click", function(e){
    	const tab = $(this).attr("aria-controls");
    	if( tab === "2") {
    		return;
    	}
    	
		let url = "${pageContext.request.contextPath}/admin/memberManage/singo";
		location.href = url;
    });	
});

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
	f.action = "${pageContext.request.contextPath}/admin/memberManage/list";
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
