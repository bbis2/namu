<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1200px;
	 margin: 0 auto;
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

.card {
	margin-bottom: 1rem; /* 카드 사이의 여백 */
	flex: 1; /* 카드를 같은 크기로 확장 */
	margin-right: 1rem; /* 카드 간의 수평 간격 추가 */
}

.card:last-child {
	margin-right: 0; /* 마지막 카드의 오른쪽 여백을 제거 */
}

.card-header {
	background-color: #f8f9fa; /* 카드 헤더 배경색 */
	border-bottom: 1px solid #dee2e6; /* 카드 헤더 하단 테두리 색상 */
}

.card-body {
	padding: 1.25rem; /* 카드 내용 패딩 */
}

.card-footer {
	background-color: #f8f9fa; /* 카드 푸터 배경색 */
	border-top: 1px solid #dee2e6; /* 카드 푸터 상단 테두리 색상 */
}

.card-container {
	display: flex; /* 카드를 가로로 배치 */
	flex-wrap: wrap; /* 화면 크기에 따라 카드들이 줄바꿈 되도록 설정 */
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<div class="body-container">
	<div class="body-title">
		<h3>
			<i class="bi bi-person-square"></i> VIP관리
		</h3>
	</div>

	<div class="body-main">
		

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="card-container">
				<div class="card">
					<div class="card-header">포인트 VIP</div>
					<div class="card-body">
						<div id="main3" style="width: 100%; height: 400px;">
						<table id="datatablesSimple"
						class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>이름</th>
								<th>닉네임</th>
								<th>총 충전금액</th>
								<th>현재 보유금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${listAll}">
							<tr>
							<td>${dto.userName}</td>
							<td>${dto.nickname}</td>
							<td>${dto.totalPoints}</td>
							<td>${dto.lastMoney}</td>
							</tr>
							<input type="hidden" id="'totalPointsSum'+${userNam }+" value="${dto.totalPointsSum}">
							</c:forEach>
							
						</tbody>


					</table>
						</div>
						
					</div>
					<div class="card-footer">가장많은 금액을 충전한 5명</div>
				</div>
			</div>
		</div>



		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="card-container">
				<div class="card">
					<div class="card-header">전체 충전금액/VIP 충전금액</div>
					<div class="card-body">
						<div id="main2" style="width: 100%; height: 400px;"></div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">게시판 VIP</div>
					<div class="card-body">
						<div id="main" style="width: 100%; height: 400px;">
						<table id="datatablesSimple"
						class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>이름</th>
								<th>닉네임</th>
								<th>게시물 개수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto2" items="${list}">
							<tr>
							<td>${dto2.userName}</td>
							<td>${dto2.nickname}</td>
							<td>${dto2.postCount}</td>
							</tr>
							</c:forEach>
							
						</tbody>


					</table>
						</div>
					</div>
					<div class="card-footer">가장 게시물 활동이 활발한 5명</div>
				</div>
			</div>

			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>
	</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script
	src='${pageContext.request.contextPath}/resources/js2/datatables-simple-demo.js'></script>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";

// console에 출력
console.log(contextPath);

window.addEventListener('DOMContentLoaded', event => {
    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
            perPage: 5, // 한 페이지에 표시할 행 수
            perPageSelect: [5,10], // 페이지당 선택 가능한 옵션
            sortable: true, // 열 정렬 가능
            searchable: true // 검색 기능
        });
    }
});
</script>
<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script>
var totalPointsSumElement = document.getElementById("totalPointsSum");
var chartDom = document.getElementById('main2');
var myChart = echarts.init(chartDom);
var option;

option = {
  xAxis: {
    type: 'category',
    data: ['총 회원', 'VIP']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [
        ${chargeAll},
        {
          value: ${vipTotal},
          itemStyle: {
            color: '#a90000'
          }
        },
      ],
      type: 'bar'
    }
  ]
};

option && myChart.setOption(option);
</script>
