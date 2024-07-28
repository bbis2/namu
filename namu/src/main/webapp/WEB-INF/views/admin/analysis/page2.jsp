<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />

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
	display: flex; /* Flexbox를 사용하여 요소를 가로로 배치 */
	align-items: center; /* 수직 정렬을 중앙으로 설정 */
}

.card-header .form-select {
	margin-left: 15px; /* select 요소와 텍스트 사이의 간격 */
	width: 120px; /* select 요소의 너비 */
	font-size: 0.9rem; /* select 요소의 폰트 크기 */
}

.chart {
	width: 100%;
	height: 400px;
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
					aria-controls="2" aria-selected="true" data-tab="2">
					<i class="bi bi-bar-chart-line"></i> 지역별 게시물
				</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="card-container">
				<div class="card">
					<div class="card-header rows">
						전체 요일별 현황 <select id="timeframe-select" class="form-select"
							style="margin-left: 15px; width: 120px; font-size: 0.9rem;">
							<option value="daily">요일별</option>
							<option value="weekly">주차별</option>
							<option value="monthly">월별</option>
						</select>
					</div>

					<div class="card-body">
						<!-- 요일별 차트 -->
						<div id="main3" class="chart" style="width: 100%; height: 400px;"></div>
						<!-- 주차별 차트 -->
						<div id="main4" class="chart"
							style="width: 100%; height: 400px; display: none;"></div>
						<!-- 월별 차트 -->
						<div id="main5" class="chart"
							style="width: 100%; height: 400px; display: none;"></div>
					</div>

					<div class="card-footer">차트 1</div>
				</div>
			</div>
		</div>



		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 인기 게시물
				</div>
				<div class="card-body">
					<table id="datatablesSimple"
						class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>게시판</th>
								<th>제목</th>
								<th>조회수</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list4}">
								<tr>
									<td><c:choose>
											<c:when test="${vo.tablename == 'delievery'}">
                      								 배달해요
                   							 </c:when>
											<c:when test="${vo.tablename == 'daily'}">
                      						  나무일상
                  							  </c:when>
											<c:when test="${vo.tablename == 'togetherlist'}">
                    						    나무모임
                   							 </c:when>
											<c:when test="${vo.tablename == 'talentMarket'}">
                   							     재능마켓
                   							 </c:when>
											<c:when test="${vo.tablename == 'borrow'}">
                    						    빌림
                  						  </c:when>
											<c:when test="${vo.tablename == 'rent'}">
                   							     빌려드림
                   							 </c:when>
											<c:when test="${vo.tablename == 'auction'}">
                    						    중고경매
                  						  </c:when>
											<c:when test="${vo.tablename == 'used'}">
                    					    중고거래
                    						</c:when>
											</c:choose></td>
									<td><c:choose>
											<c:when test="${vo.tablename == 'delievery'}">
												<a
													href="<c:url value='/delivery/article?num=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'daily'}">
												<a
													href="<c:url value='/daily/article?num=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'togetherlist'}">
												<a
													href="<c:url value='/together/article?tNum=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'talentMarket'}">
												<a
													href="<c:url value='/talent/article?num=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'borrow'}">
												<a
													href="<c:url value='/borrow/article?num=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'rent'}">
												<a
													href="<c:url value='/rent/article?num=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'auction'}">
												<a
													href="<c:url value='/auction/article?aNum=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:when test="${vo.tablename == 'used'}">
												<a
													href="<c:url value='/used/article?num=${vo.num}&page=1' />">
													${vo.subject} </a>
											</c:when>
											<c:otherwise>
												<a href="#">
													<!-- Default or error link --> ${vo.subject}
												</a>
											</c:otherwise>
										</c:choose></td>

									<td>${vo.hitCount}</td>
									<td>${vo.nickname}</td>
								</tr>
							</c:forEach>
						</tbody>


					</table>
				</div>
			</div>

			<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>

	</div>
</div>

<c:forEach var="dto2" items="${list }">
	<input type="hidden" class="deliveryCount"
		value="${dto2.delieveryCount }">
	<input type="hidden" class="dailyCount" value="${dto2.dailyCount }">
	<input type="hidden" class="borrowCount" value="${dto2.borrowCount }">
	<input type="hidden" class="rentCount" value="${dto2.rentCount }">
	<input type="hidden" class="usedCount" value="${dto2.usedCount }">
	<input type="hidden" class="talentMarketCount"
		value="${dto2.talentMarketCount }">
	<input type="hidden" class="togetherlistCount"
		value="${dto2.togetherlistCount }">
	<input type="hidden" class="auctionCount" value="${dto2.auctionCount }">
</c:forEach>

<c:forEach var="dto3" items="${list2 }">
	<input type="hidden" class="weekdeliveryCount"
		value="${dto3.delieveryCount }">
	<input type="hidden" class="weekdailyCount" value="${dto3.dailyCount }">
	<input type="hidden" class="weekborrowCount"
		value="${dto3.borrowCount }">
	<input type="hidden" class="weekrentCount" value="${dto3.rentCount }">
	<input type="hidden" class="weekusedCount" value="${dto3.usedCount }">
	<input type="hidden" class="weektalentMarketCount"
		value="${dto3.talentMarketCount }">
	<input type="hidden" class="weektogetherlistCount"
		value="${dto3.togetherlistCount }">
	<input type="hidden" class="weekauctionCount"
		value="${dto3.auctionCount }">
	<input type="hidden" class="week_start_date"
		value="${dto3.week_start_date }">
</c:forEach>

<c:forEach var="dto4" items="${list3 }">
	<input type="hidden" class="monthdeliveryCount"
		value="${dto4.delieveryCount }">
	<input type="hidden" class="monthdailyCount"
		value="${dto4.dailyCount }">
	<input type="hidden" class="monthborrowCount"
		value="${dto4.borrowCount }">
	<input type="hidden" class="monthrentCount" value="${dto4.rentCount }">
	<input type="hidden" class="monthusedCount" value="${dto4.usedCount }">
	<input type="hidden" class="monthtalentMarketCount"
		value="${dto4.talentMarketCount }">
	<input type="hidden" class="monthtogetherlistCount"
		value="${dto4.togetherlistCount }">
	<input type="hidden" class="monthauctionCount"
		value="${dto4.auctionCount }">
	<input type="hidden" class="month_start_date"
		value="${dto4.month_start_date }">
</c:forEach>

<script type="text/javascript">
$(function(){
    // 기본적으로 첫 번째 탭을 활성화
    $("#tab-1").addClass("active");

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
                url = "${pageContext.request.contextPath}/admin/analysis/page1";
                break;
            case "2":
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

<script>
document.getElementById('timeframe-select').addEventListener('change', function() {
    // 모든 차트 요소를 숨깁니다.
    var charts = document.querySelectorAll('.chart');
    charts.forEach(function(chart) {
        chart.style.display = 'none';
    });

    // 선택한 값에 따라 차트를 표시합니다.
    var selectedValue = this.value;
    if (selectedValue === 'daily') {
        document.getElementById('main3').style.display = 'block';
    } else if (selectedValue === 'weekly') {
        document.getElementById('main4').style.display = 'block';
    } else if (selectedValue === 'monthly') {
        document.getElementById('main5').style.display = 'block';
    }
    
    // 차트 리사이즈
    echarts.getInstanceByDom(document.getElementById('main3'))?.resize();
    echarts.getInstanceByDom(document.getElementById('main4'))?.resize();
    echarts.getInstanceByDom(document.getElementById('main5'))?.resize();
});
</script>



<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>

<script>
//요일별
//문자열로 주어진 2차원 배열 (객체의 문자열 표현)
const hiddenInputs = document.querySelectorAll('input.deliveryCount');
const hiddenInputs2 = document.querySelectorAll('input.dailyCount');
const hiddenInputs3 = document.querySelectorAll('input.borrowCount');
const hiddenInputs4 = document.querySelectorAll('input.rentCount');
const hiddenInputs5 = document.querySelectorAll('input.usedCount');
const hiddenInputs6 = document.querySelectorAll('input.talentMarketCount');
const hiddenInputs7 = document.querySelectorAll('input.togetherlistCount');
const hiddenInputs8 = document.querySelectorAll('input.auctionCount');

const deliveryCounts = Array.from(hiddenInputs).map(input => input.value);
const dailyCounts = Array.from(hiddenInputs2).map(input => input.value);
const borrowCounts = Array.from(hiddenInputs3).map(input => input.value);
const rentCounts = Array.from(hiddenInputs4).map(input => input.value);
const usedCounts = Array.from(hiddenInputs5).map(input => input.value);
const talentMarketCounts = Array.from(hiddenInputs6).map(input => input.value);
const togetherlistCounts = Array.from(hiddenInputs7).map(input => input.value);
const auctionCounts = Array.from(hiddenInputs8).map(input => input.value);



var chartDom = document.getElementById('main3');
var myChart = echarts.init(chartDom);
var option;

option = {
  title: {
    text: ''
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['배달해요', '나무일상', '빌림', '빌려드림', '중고거래','재능마켓','나무모임','중고경매']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['일', '월', '화', '수', '목', '금', '토']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '배달해요',
      type: 'line',
      stack: 'Total',
      data: deliveryCounts
    },
    {
      name: '나무일상',
      type: 'line',
      stack: 'Total',
      data: dailyCounts
    },
    {
      name: '빌림',
      type: 'line',
      stack: 'Total',
      data: borrowCounts
    },
    {
      name: '빌려드림',
      type: 'line',
      stack: 'Total',
      data: rentCounts
    },
    {
      name: '중고거래',
      type: 'line',
      stack: 'Total',
      data: usedCounts
    },
    {
        name: '재능마켓',
        type: 'line',
        stack: 'Total',
        data: talentMarketCounts
      },
      {
          name: '나무모임',
          type: 'line',
          stack: 'Total',
          data: togetherlistCounts
        },
        {
            name: '중고경매',
            type: 'line',
            stack: 'Total',
            data: auctionCounts
          }
      
  ]
};

option && myChart.setOption(option);

</script>

<script>
//주차별
//문자열로 주어진 2차원 배열 (객체의 문자열 표현)
const weekhiddenInputs = document.querySelectorAll('input.weekdeliveryCount');
const weekhiddenInputs2 = document.querySelectorAll('input.weekdailyCount');
const weekhiddenInputs3 = document.querySelectorAll('input.weekborrowCount');
const weekhiddenInputs4 = document.querySelectorAll('input.weekrentCount');
const weekhiddenInputs5 = document.querySelectorAll('input.weekusedCount');
const weekhiddenInputs6 = document.querySelectorAll('input.weektalentMarketCount');
const weekhiddenInputs7 = document.querySelectorAll('input.weektogetherlistCount');
const weekhiddenInputs8 = document.querySelectorAll('input.weekauctionCount');
const weekhiddenInputs9 = document.querySelectorAll('input.week_start_date');

const weekdeliveryCounts = Array.from(weekhiddenInputs).map(input => input.value);
const weekdailyCounts = Array.from(weekhiddenInputs2).map(input => input.value);
const weekborrowCounts = Array.from(weekhiddenInputs3).map(input => input.value);
const weekrentCounts = Array.from(weekhiddenInputs4).map(input => input.value);
const weekusedCounts = Array.from(weekhiddenInputs5).map(input => input.value);
const weektalentMarketCounts = Array.from(weekhiddenInputs6).map(input => input.value);
const weektogetherlistCounts = Array.from(weekhiddenInputs7).map(input => input.value);
const weekauctionCounts = Array.from(weekhiddenInputs8).map(input => input.value);
const week_start_date = Array.from(weekhiddenInputs9).map(input => input.value);


var chartDom = document.getElementById('main4');
var myChart = echarts.init(chartDom);
var option;
console.log(weekdeliveryCounts);
option = {
  title: {
    text: ''
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['배달해요', '나무일상', '빌림', '빌려드림', '중고거래','재능마켓','나무모임','중고경매']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data:  week_start_date// x축 데이터
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '배달해요',
      type: 'line',
      stack: 'Total',
      data: weekdeliveryCounts // y축 데이터
    },
    {
      name: '나무일상',
      type: 'line',
      stack: 'Total',
      data: weekdailyCounts // y축 데이터
    },
    {
      name: '빌림',
      type: 'line',
      stack: 'Total',
      data: weekborrowCounts // y축 데이터
    },
    {
      name: '빌려드림',
      type: 'line',
      stack: 'Total',
      data: weekrentCounts // y축 데이터
    },
    {
      name: '중고거래',
      type: 'line',
      stack: 'Total',
      data: weekusedCounts // y축 데이터
    },
    {
        name: '재능마켓',
        type: 'line',
        stack: 'Total',
        data: weektalentMarketCounts // y축 데이터
      },
    {
        name: '나무모임',
        type: 'line',
        stack: 'Total',
        data: weektogetherlistCounts // y축 데이터
      },
    {
        name: '중고경매',
        type: 'line',
        stack: 'Total',
        data: weekauctionCounts // y축 데이터
      }
  ]
};

option && myChart.setOption(option);


</script>

<script>

//문자열로 주어진 2차원 배열 (객체의 문자열 표현)
const monthhiddenInputs = document.querySelectorAll('input.monthdeliveryCount');
const monthhiddenInputs2 = document.querySelectorAll('input.monthdailyCount');
const monthhiddenInputs3 = document.querySelectorAll('input.monthborrowCount');
const monthhiddenInputs4 = document.querySelectorAll('input.monthrentCount');
const monthhiddenInputs5 = document.querySelectorAll('input.monthusedCount');
const monthhiddenInputs6 = document.querySelectorAll('input.monthtalentMarketCount');
const monthhiddenInputs7 = document.querySelectorAll('input.monthtogetherlistCount');
const monthhiddenInputs8 = document.querySelectorAll('input.monthauctionCount');
const monthhiddenInputs9 = document.querySelectorAll('input.month_start_date');

const monthdeliveryCounts = Array.from(monthhiddenInputs).map(input => input.value);
const monthdailyCounts = Array.from(monthhiddenInputs2).map(input => input.value);
const monthborrowCounts = Array.from(monthhiddenInputs3).map(input => input.value);
const monthrentCounts = Array.from(monthhiddenInputs4).map(input => input.value);
const monthusedCounts = Array.from(monthhiddenInputs5).map(input => input.value);
const monthtalentMarketCounts = Array.from(monthhiddenInputs6).map(input => input.value);
const monthtogetherlistCounts = Array.from(monthhiddenInputs7).map(input => input.value);
const monthauctionCounts = Array.from(monthhiddenInputs8).map(input => input.value);
const month_start_dates = Array.from(monthhiddenInputs9).map(input => input.value);


var chartDom = document.getElementById('main5');
var myChart = echarts.init(chartDom);
var option;

option = {
  title: {
    text: ''
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['배달해요', '나무일상', '빌림', '빌려드림', '중고거래','재능마켓','나무모임','중고경매']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: month_start_dates
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: '배달해요',
      type: 'line',
      stack: 'Total',
      data: monthdeliveryCounts
    },
    {
      name: '나무일상',
      type: 'line',
      stack: 'Total',
      data: monthdailyCounts
    },
    {
      name: '빌림',
      type: 'line',
      stack: 'Total',
      data: monthborrowCounts
    },
    {
      name: '빌려드림',
      type: 'line',
      stack: 'Total',
      data: monthrentCounts
    },
    {
      name: '중고거래',
      type: 'line',
      stack: 'Total',
      data: monthusedCounts
    },
    {
        name: '재능마켓',
        type: 'line',
        stack: 'Total',
        data: monthtalentMarketCounts
      },
      {
          name: '나무모임',
          type: 'line',
          stack: 'Total',
          data: monthtogetherlistCounts
        },
        {
            name: '중고경매',
            type: 'line',
            stack: 'Total',
            data: monthauctionCounts
          }
      
  ]
};

option && myChart.setOption(option);

</script>
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
            perPageSelect: [5, 10, 20], // 페이지당 선택 가능한 옵션
            sortable: true, // 열 정렬 가능
            searchable: true // 검색 기능
        });
    }
});
</script>
