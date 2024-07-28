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
			<i class="bi bi-person-square"></i> 각 페이지 별 게시물 현황
		</h3>
	</div>

	<div class="body-main">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-0" data-bs-toggle="tab"
					data-bs-target="#nav-content" type="button" role="tab"
					aria-controls="0" aria-selected="true" data-tab="0">
					<i class="bi bi-person-lines-fill"></i> 게시물 수량 추이
				</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-1" data-bs-toggle="tab"
					data-bs-target="#nav-content" type="button" role="tab"
					aria-controls="1" aria-selected="true" data-tab="1">
					<i class="bi bi-bar-chart-line"></i> 게시물 분포
				</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-3" data-bs-toggle="tab"
					data-bs-target="#nav-content" type="button" role="tab"
					aria-controls="3" aria-selected="true" data-tab="3">
					<i class="bi bi-bar-chart-line"></i> 지역별 게시물
				</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="card-container">
				<div class="card">
					<div class="card-header">전체 현황</div>
					<div class="card-body">
						<div id="main3" style="width: 100%; height: 400px;"></div>
					</div>
					<div class="card-footer">차트 1</div>
				</div>
			</div>
		</div>



		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="card-container">
				<div class="card">
					<div class="card-header">게시물 개수</div>
					<div class="card-body">
						<div id="main2" style="width: 100%; height: 400px;"></div>
					</div>
					<div class="card-footer">차트 1</div>
				</div>

				<div class="card">
					<div class="card-header">게시물 비율</div>
					<div class="card-body">
						<div id="main" style="width: 100%; height: 400px;"></div>
					</div>
					<div class="card-footer">차트 2</div>
				</div>
			</div>

			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>
	</div>
</div>

<c:forEach var="dto2" items="${list }">
	<input type="hidden" class="totalCount" value="${dto2.totalCount }">
	<input type="hidden" class="reg_date" value="${dto2.reg_date }">
</c:forEach>

<script type="text/javascript">
$(function(){
    // 기본적으로 첫 번째 탭을 활성화
    $("#tab-0").addClass("active");

    $("button[role='tab']").on("click", function(e){
        // 클릭한 탭의 aria-controls 속성 값을 가져옴
        const tab = $(this).attr("data-tab");
        
        // 각 탭에 맞는 URL을 설정
        let url;
        switch(tab) {
            case "0":
                url = "${pageContext.request.contextPath}/admin/analysis/page";
                break;
            case "1":
                url = "${pageContext.request.contextPath}/admin/analysis/page2";
                break;
            case "3":
                url = "${pageContext.request.contextPath}/admin/analysis/page3";
                break;
            default:
                url = "${pageContext.request.contextPath}/admin/analysis/default";
                break;
        }

        // 지정된 URL로 이동
        location.href = url;
    });
});

</script>

<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script>
var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

// 총 게시물 수 계산
var total = ${dto.delieveryCount} + ${dto.dailyCount} + ${dto.borrowCount} + ${dto.rentCount} + ${dto.usedCount} + ${dto.talentMarketCount} + ${dto.togetherlistCount} + ${dto.auctionCount};

// 비율 계산
var delivery = (${dto.delieveryCount} / total) * 100;
var dailyCount = (${dto.dailyCount} / total) * 100;
var borrowCount = (${dto.borrowCount} / total) * 100;
var rentCount = (${dto.rentCount} / total) * 100;
var usedCount = (${dto.usedCount} / total) * 100;
var talentMarketCount = (${dto.talentMarketCount} / total) * 100;
var togetherlistCount = (${dto.togetherlistCount} / total) * 100;
var auctionCount = (${dto.auctionCount} / total) * 100;

// 각 변수 소수점 한 자리로 포맷
delivery = delivery.toFixed(1);
dailyCount = dailyCount.toFixed(1);
borrowCount = borrowCount.toFixed(1);
rentCount = rentCount.toFixed(1);
usedCount = usedCount.toFixed(1);
talentMarketCount = talentMarketCount.toFixed(1);
togetherlistCount = togetherlistCount.toFixed(1);
auctionCount = auctionCount.toFixed(1);

// ECharts 옵션 설정
option = {
  tooltip: {
    trigger: 'item',
    formatter: '{b}: {d}%'
  },
  legend: {
    top: '0%',
    left: 'center'
  },
  series: [
    {
      name: '게시물 비율',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 10
      },
      label: {
        show: true,
        formatter: '{b}: {d}%', // `{b}`는 이름, `{d}`는 퍼센트 값을 의미
        fontSize: 12,
        position: 'outside' // 라벨 위치를 밖으로 설정
      },
      emphasis: {
        label: {
          show: true,
          fontSize: 40,
          fontWeight: 'bold'
        }
      },
      labelLine: {
        show: true
      },
      data: [
        { value: delivery, name: 'Delivery' },
        { value: dailyCount, name: 'Daily' },
        { value: borrowCount, name: 'Borrow' },
        { value: rentCount, name: 'Rent' },
        { value: usedCount, name: 'Used' },
        { value: talentMarketCount, name: 'Talent Market' },
        { value: togetherlistCount, name: 'Together List' },
        { value: auctionCount, name: 'Auction' }
      ]
    }
  ]
};

// ECharts 옵션 적용
option && myChart.setOption(option);
</script>

<script>
var chartDom = document.getElementById('main2');
var myChart = echarts.init(chartDom);
var option;

option = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow'
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: [
    {
      type: 'category',
      data: ['배달해요', '나무일상', '빌림', '빌려드림', '중고거래', '재능마켓', '나무모임', '중고경매'],
      axisTick: {
        alignWithLabel: true
      }
    }
  ],
  yAxis: [
    {
      type: 'value'
    }
  ],
  series: [
    {
      name: 'Direct',
      type: 'bar',
      barWidth: '60%',
      data: [
          { value: ${dto.delieveryCount}, name: '배달해요' },
          { value: ${dto.dailyCount}, name: '나무일상' },
          { value: ${dto.borrowCount}, name: '빌림' },
          { value: ${dto.rentCount}, name: '빌려드림' },
          { value: ${dto.usedCount}, name: '중고거래' },
          { value: ${dto.talentMarketCount}, name: '재능마켓' },
          { value: ${dto.togetherlistCount}, name: '나무모임' },
          { value: ${dto.auctionCount}, name: '중고경매' }
        ]
    }
  ]
};

// ECharts 옵션 적용
option && myChart.setOption(option);
</script>
<script>

const hiddenInputs = document.querySelectorAll('input.totalCount');
const hiddenInputs2 = document.querySelectorAll('input.reg_date');

const totalCounts = Array.from(hiddenInputs).map(input => input.value);
const reg_dates = Array.from(hiddenInputs2).map(input => input.value);

var chartDom = document.getElementById('main3');
var myChart = echarts.init(chartDom);
var option;

option = {
  xAxis: {
    type: 'category',
    data: reg_dates
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: totalCounts,
      type: 'line'
    }
  ]
};

option && myChart.setOption(option);

</script>