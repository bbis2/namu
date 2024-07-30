<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
/* 카드 컴포넌트 */
.card {
    margin-bottom: 1rem;
}

.card-body {
    padding: 1.25rem;
}

/* 테이블 스타일 */
.table {
    width: 100%;
    border-collapse: collapse; /* 테두리 병합 */
    margin-bottom: 1rem; /* 테이블 아래 여백 */
}

.table-bordered {
    border: 1px solid #dee2e6; /* 테두리 색상 */
}

.table-bordered th, .table-bordered td {
    border: 1px solid #dee2e6; /* 셀 테두리 색상 */
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: #f2f2f2; /* 홀수 행 배경색 */
}

.table thead th {
    background-color: #f8f9fa; /* 헤더 배경색 */
}

/* 탭 네비게이션 */
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

/* 탭 콘텐츠 */
.tab-pane {
    min-height: 300px;
}

/* 커서 스타일 */
.hover {
    cursor: pointer;
}

/* 버튼 스타일 */
.btn-span {
    cursor: pointer;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    margin: 3px;
    padding: 5px;
}

/* 최대 너비 설정 */
.body-container {
    max-width: 1200px;
    margin: 0 auto; /* 중앙 정렬 */
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .nav-tabs .nav-link {
        min-width: auto; /* 모바일에서는 최소 너비 제거 */
        text-align: center;
    }
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
			
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">

			<table class="table table-borderless mt-2 mb-0">
				<tr>
					<td align="left" width="50%" valign="bottom">
						<p class="form-control-plaintext p-0">
							${dataCount}개(${page}/${total_page} 페이지)</p>
					</td>
					<td align="right"><select id="selectEnabled"
						class="form-select" style="width: 230px;" onchange="searchList();">
							<option value="" ${enabled=="" ? "selected":""}>::계정상태::</option>
							<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
							<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
					</select></td>
				</tr>
			</table>

			<div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        회원 테이블
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>유저번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>거주지</th>
                                    <th>전화번호</th>
                                    <th>회원구분</th>
                                    <th>회원상태</th>
                                    <th>이메일</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                     <th>유저번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>거주지</th>
                                    <th>전화번호</th>
                                    <th>회원구분</th>
                                    <th>회원상태</th>
                                    <th>이메일</th>
                                </tr>
                            </tfoot>
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
                    </div>
                </div>

			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light"
						onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list';"
						title="새로고침">
						<i class="bi bi-arrow-counterclockwise"></i>
					</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm"
						action="${pageContext.request.contextPath}/admin/memberManage/list"
						method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="userId" ${schType=="userId" ? "selected":""}>아이디</option>
								<option value="userName" ${schType=="userName" ? "selected":""}>이름</option>
								<option value="email" ${schType=="email" ? "selected":""}>이메일</option>
								<option value="tel" ${schType=="tel" ? "selected":""}>전화번호</option>
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
<script type="text/javascript">
            window.addEventListener('DOMContentLoaded', event => {
                // Simple-DataTables
                const datatablesSimple = document.getElementById('datatablesSimple');
                if (datatablesSimple) {
                    new simpleDatatables.DataTable(datatablesSimple, {
                        perPage: 5, // 한 페이지에 표시할 행 수
                        perPageSelect: [5, 10, 20], // 페이지당 선택 가능한 옵션
                        sortable: true, // 열 정렬 가능
                        searchable: true // 검색 기능
                    });
                }
            });
        </script>