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
				<div class="card" >
					<div class="card-header">전체 현황</div>
					<div class="card-body row">
						<div id="map" style="width: 100%; height: 400px;" style="display: flex;">
						</div>
					</div>
					<div class="card-footer">차트 1</div>
				</div>
			</div>
		</div>

	</div>
</div>

<c:forEach var="dto2" items="${list }">
	<input type="hidden" class="totalCount" value="${dto2.totalCount }">
	<input type="hidden" class="reg_date" value="${dto2.reg_date }">
</c:forEach>

<script type="text/javascript">
	$(function() {
		// 기본적으로 첫 번째 탭을 활성화
		$("#tab-3").addClass("active");

		$("button[role='tab']")
				.on(
						"click",
						function(e) {
							// 클릭한 탭의 aria-controls 속성 값을 가져옴
							const tab = $(this).attr("data-tab");

							// 각 탭에 맞는 URL을 설정
							let url;
							switch (tab) {
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
let result1 = ${result1};
let result2 = ${result2};
let result3 = ${result3};
let result4 = ${result4};
let result5 = ${result5};
let result6 = ${result6};
let result7 = ${result7};
let result8 = ${result8};
let result9 = ${result9};
let result11 = ${result11};
let result12 = ${result12};
let result13 = ${result13};
let result14 = ${result14};
let result15 = ${result15};
let result16 = ${result16};
let result17 = ${result17};
let result18 = ${result18};

// 전체 결과 변수
let result = ${result};

// 백분율 계산sssssssdddsdsdsdsdsdsdsd
let percentage1 = Math.floor((result1 / result) * 100);
let percentage2 = Math.floor((result2 / result) * 100);
let percentage3 = Math.floor((result3 / result) * 100);
let percentage4 = Math.floor((result4 / result) * 100);
let percentage5 = Math.floor((result5 / result) * 100);
let percentage6 = Math.floor((result6 / result) * 100);
let percentage7 = Math.floor((result7 / result) * 100);
let percentage8 = Math.floor((result8 / result) * 100);
let percentage9 = Math.floor((result9 / result) * 100);
let percentage11 = Math.floor((result11 / result) * 100);
let percentage12 = Math.floor((result12 / result) * 100);
let percentage13 = Math.floor((result13 / result) * 100);
let percentage14 = Math.floor((result14 / result) * 100);
let percentage15 = Math.floor((result15 / result) * 100);
let percentage16 = Math.floor((result16 / result) * 100);
let percentage17 = Math.floor((result17 / result) * 100);
let percentage18 = Math.floor((result18 / result) * 100);

	
    var ROOT_PATH = "${pageContext.request.contextPath}/resources/koreaAll4.geojson"; // geoJSON 파일 경로
    var chartDom = document.getElementById("map"); // 지도 차트를 표시할 DOM 요소
    var myChart = echarts.init(chartDom); // ECharts 인스턴스 초기화

    var option; // 옵션 변수를 선언

    myChart.showLoading(); // 차트 로딩 상태 표시

    // geoJSON 파일 로드
    $.getJSON(ROOT_PATH, function (geoJson) {
        myChart.hideLoading(); // 로딩 상태 숨기기
        echarts.registerMap("KOREA", geoJson); // geoJSON 데이터를 ECharts에 등록

        // 차트 옵션 설정
        myChart.setOption(option = {
            tooltip: {
                trigger: "item",
                formatter: "{b}<br />{c} %" // 툴팁 포맷 설정
            },
            visualMap: {
                min: 0,
                max: 100,
                text: ["100%", "0%"],
                realtime: false,
                calculable: true,
                inRange: {
                    color: ["#89b6fe", "#25529a"] // 색상 범위 설정
                }
            },
            series: [{
                name: "County Map",
                type: "map",
                roam: true,
                zoom: 1.5, // 기본 줌 레벨 설정
                scaleLimit: {
                    min: 1.5,
                    max: 3
                }, // 줌 레벨 제한
                map: "KOREA", // 사용할 지도 데이터
                itemStyle: {
                    normal: {
                        borderColor: "#26566a" // 경계선 색상
                    },
                    emphasis: {
                        areaColor: "#85fff7" // 강조 영역 색상
                    }
                },
                data: [
                    {name: "서울", value: percentage1},
                    {name: "부산", value: percentage2},
                    {name: "대구", value: percentage3},
                    {name: "인천", value: percentage4},
                    {name: "광주", value: percentage5},
                    {name: "대전", value: percentage6},
                    {name: "울산", value: percentage7},
                    {name: "세종", value: percentage8},
                    {name: "경기", value: percentage9},
                    {name: "강원", value: percentage11},
                    {name: "충북", value: percentage12},
                    {name: "충남", value: percentage13},
                    {name: "전북", value: percentage14},
                    {name: "전남", value: percentage15},
                    {name: "경북", value: percentage16},
                    {name: "경남", value: percentage17},
                    {name: "제주", value: percentage18}
                ],
                nameMap: {
                    "서울특별시": "서울",
                    "부산광역시": "부산",
                    "대구광역시": "대구",
                    "인천광역시": "인천",
                    "광주광역시": "광주",
                    "대전광역시": "대전",
                    "울산광역시": "울산",
                    "세종특별자치시": "세종",
                    "경기도": "경기",
                    "강원도": "강원",
                    "충청북도": "충북",
                    "충청남도": "충남",
                    "전라북도": "전북",
                    "전라남도": "전남",
                    "경상북도": "경북",
                    "경상남도": "경남",
                    "제주특별자치도": "제주"
                }
            }]
        });
    });

    // 옵션 적용
    option && myChart.setOption(option);
</script>
