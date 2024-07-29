<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />

<style type="text/css">
    .chart-container {
        width: 100%; /* 부모 컨테이너의 너비에 맞게 */
        height: 400px; /* 고정된 높이 */
        position: relative; /* 위치 관련 스타일 */
        display: block; /* 블록 요소로 설정 */
    }
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
        flex: 1; /* 카드가 같은 크기로 확장 */
        box-sizing: border-box; /* 패딩과 테두리를 너비에 포함 */
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
        gap: 1rem; /* 카드 간의 간격 추가 */
    }
    .small-card {
        flex: 1; /* 카드가 같은 크기로 확장 */
        min-width: calc(50% - 0.5rem); /* 카드 너비를 50%로 설정하고 간격을 고려 */
    }
    .large-card {
        flex: 1; /* 카드가 같은 크기로 확장 */
        max-width: calc(50% - 0.5rem); /* 카드 너비를 50%로 설정하고 간격을 고려 */
    }
    .full-width-card {
        flex: 1; /* 카드가 같은 크기로 확장 */
        max-width: 100%; /* 카드 너비 제한 */
    }
</style>
<style>
    /* 모달 크기 조정 */
    #selectAllModal .modal-dialog {
        max-width: 80%; /* 원하는 너비를 비율로 설정, 예: 80% */
    }

    #selectAllModal .modal-content {
        height: 80vh; /* 원하는 높이를 뷰포트 높이 비율로 설정, 예: 80vh */
    }

    /* 내용이 긴 경우 스크롤 추가 */
    #selectAllModal .modal-body {
        max-height: calc(80vh - 120px); /* 높이 조정 후 스크롤 가능하도록 설정 */
        overflow-y: auto;
    }
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div class="body-container">
    <div class="body-title">
        <h3><i class="bi bi-person-square"></i> 포인트 관리</h3>
    </div>
    
    <h3 style="font-weight: bold;">현재 전체 포인트 : ${totalMoney} &#8361;</h3>
    
    <div class="body-main">
        <div class="tab-content pt-2" id="nav-tabContent">
            <!-- 셀렉트 박스 추가 -->
            <div style="margin-bottom: 1rem;">
                <label for="timeSelect">주/월별 선택:</label>
                <select id="timeSelect">
                    <option value="weekly">주차별</option>
                    <option value="monthly">월별</option>
                </select>
            </div>
            
            <!-- 첫 번째 줄: 작은 카드 섹션 2개 (양옆으로 길이 맞추기) -->
            <div class="card-container">
                <div class="card-body">
                    <div id="main" class="chart-container">
                        <!-- 주차별 차트 -->
                    </div>
                    <div id="main2" class="chart-container" style="display: none;">
                        <!-- 월별 차트 -->
                    </div>
                </div>
            </div>

            <!-- 두 번째 줄: 큰 카드 섹션 2개 -->
            <div class="card-container">
                <div class="large-card card">
                    <div class="card-header">전체 포인트 대비 환불 포인트</div>
                    <div class="card-body">
                        <div style="margin-bottom: 1rem;">
                            <label for="chartSelect">차트 선택:</label>
                            <select id="chartSelect">
                                <option value="percent">퍼센트</option>
                                <option value="dopo">총 액수</option>
                            </select>
                        </div>
                        <div id="main3" class="chart-container">
                            <!-- 차트가 표시될 영역 -->
                        </div>
                         <div id="main4" class="chart-container" style="display: none;">
                            <!-- 차트가 표시될 영역 -->
                        </div>
                    </div>
                    <div class="card-footer">충전 포인트/환불 포인트</div>
                </div>

                <div class="large-card card">
                    <div class="card-header">적립포인트 대비 충전 포인트</div>
                    <div class="card-body">
                        <div id="largeCard2" style="width: 100%; height: 400px;"></div>
                    </div>
                    <div class="card-footer">충전 포인트/적립 포인트</div>
                </div>
            </div>

            <!-- 세 번째 줄: 큰 카드 섹션 1개 -->
            <div class="tab-content pt-2" id="nav-tabContent">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> 유저별 포인트 내역
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                	<th>유저번호</th>
                                    <th>닉네임</th>
                                    <th>이름</th>
                                    <th>현재 포인트</th>
                                    <th>내역 보기</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="udo" items="${list3}">
                                <tr>
                                    
                                    <td>${udo.memberIdx}</td>
                                    <td>${udo.userId}</td>
                                    <td>${udo.userName}</td>
                                    <td>${udo.lastMoney}</td>
                                    <td><button type="button" class="btn btn-primary" onclick="viewUser('${udo.userId}');">확인</button></td>
                                    
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
            </div>
        </div>
    </div>
</div>

<!-- 거래내역 모달 -->
<!-- 모달 HTML -->
<div id="selectAllModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header d-flex justify-content-between">
        <h5 class="modal-title">사용자 포인트 정보</h5>
       <!--  <button type="button" class="btn btn-primary btn-close ml-auto" data-dismiss="modal" aria-label="Close"> 모달창 </button> -->

          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="selectAllTable" class="display">
          <thead>
            <tr>
              <th>사용자 이름</th>
              <th>등록일</th>
              <th>설명</th>
              <th>현재 포인트</th>
              <th>포인트 변화</th>
              <th>최종 금액</th>
            </tr>
          </thead>
          <tbody>
            <!-- 데이터가 여기에 추가됩니다. -->
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>



<c:forEach var="dto2" items="${list}">
    <input type="hidden" class="sumedMoney" value="${dto2.sumedMoney}">
    <input type="hidden" class="week_start_date" value="${dto2.week_start_date}">
</c:forEach>

<c:forEach var="dto" items="${list2}">
    <input type="hidden" class="sumedMoney2" value="${dto.sumedMoney}">
    <input type="hidden" class="month_start_date" value="${dto.month_start_date}">
</c:forEach>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src='${pageContext.request.contextPath}/resources/js2/datatables-simple-demo.js'></script>
<script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript">
    var contextPath = "${pageContext.request.contextPath}";

    // 콘솔에 출력
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

        // 주차별 데이터
        const hiddenInputs = document.querySelectorAll('input.sumedMoney');
        const hiddenInputs2 = document.querySelectorAll('input.week_start_date');
        const mhiddenInputs = document.querySelectorAll('input.sumedMoney2');
        const mhiddenInputs2 = document.querySelectorAll('input.month_start_date');

        const sumedMoneys = Array.from(hiddenInputs).map(input => input.value);
        const week_start_dates = Array.from(hiddenInputs2).map(input => input.value);
        const msumedMoneys = Array.from(mhiddenInputs).map(input => input.value);
        const month_start_dates = Array.from(mhiddenInputs2).map(input => input.value);

        var weeklyChartDom = document.getElementById('main');
        var weeklyChart = echarts.init(weeklyChartDom);
        var weeklyOption = {
            xAxis: {
                type: 'category',
                data: week_start_dates
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    data: sumedMoneys,
                    type: 'line'
                }
            ]
        };
        weeklyChart.setOption(weeklyOption);

        var monthlyChartDom = document.getElementById('main2');
        var monthlyChart = echarts.init(monthlyChartDom);
        var monthlyOption = {
            xAxis: {
                type: 'category',
                data: month_start_dates
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    data: msumedMoneys,
                    type: 'line'
                }
            ]
        };
        monthlyChart.setOption(monthlyOption);

        var chartDom3 = document.getElementById('main3');
        var myChart3 = echarts.init(chartDom3);
        var allCharge = ${allCharge};
        var allRefund = ${allRefund};

        var allChargeP = (allCharge / (allCharge + allRefund)) * 100;
        allChargeP = parseFloat(allChargeP.toFixed(1));

        var allRefundP = (allRefund / (allCharge + allRefund)) * 100;
        allRefundP = parseFloat(allRefundP.toFixed(1));

        var option3 = {
            tooltip: {
                trigger: 'item',
                formatter: function (params) {
                    return `${params.name}: ${params.value.toFixed(1)}%`;
                }
            },
            legend: {
                top: '5%',
                left: 'center'
            },
            series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: ['40%', '70%'],
                    avoidLabelOverlap: false,
                    padAngle: 5,
                    itemStyle: {
                        borderRadius: 10
                    },
                    label: {
                        show: true,
                        position: 'outside', // 레이블을 차트 외부에 표시
                        formatter: '{b}: {d}%'
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
                        { value: allChargeP, name: '전체 충전 나무머니' },
                        { value: allRefundP, name: '전체 환불 나무머니' }
                    ]
                }
            ]
        };
        myChart3.setOption(option3);

        var chartDom4 = document.getElementById('main4');
        var myChart4 = echarts.init(chartDom4);

        var option4 = {
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
                    data: ['충전금액', '환불금액'],
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
                    data: [allCharge, allRefund]
                }
            ]
        };
        myChart4.setOption(option4);

        // 셀렉트 박스 이벤트 리스너 추가
        document.getElementById('timeSelect').addEventListener('change', function() {
            const selectedValue = this.value;
            if (selectedValue === 'weekly') {
                document.getElementById('main').style.display = 'block';
                document.getElementById('main2').style.display = 'none';
                weeklyChart.resize(); // 차트 리사이즈
            } else if (selectedValue === 'monthly') {
                document.getElementById('main').style.display = 'none';
                document.getElementById('main2').style.display = 'block';
                monthlyChart.resize(); // 차트 리사이즈
            }
        });
        
        document.getElementById('chartSelect').addEventListener('change', function() {
            const selectedValue = this.value;
            if (selectedValue === 'percent') {
                document.getElementById('main3').style.display = 'block';
                document.getElementById('main4').style.display = 'none';
                myChart3.resize(); // 차트 리사이즈
            } else if (selectedValue === 'dopo') {
                document.getElementById('main3').style.display = 'none';
                document.getElementById('main4').style.display = 'block';
                myChart4.resize(); // 차트 리사이즈
            }
        });

        // 화면 크기 조정 시 차트 리사이즈
        window.addEventListener('resize', function() {
            if (document.getElementById('main').style.display === 'block') {
                weeklyChart.resize();
            } else if (document.getElementById('main2').style.display === 'block') {
                monthlyChart.resize();
            }
            if (document.getElementById('main3').style.display === 'block') {
                myChart3.resize();
            }
            if (document.getElementById('main4').style.display === 'block') {
                myChart4.resize();
            }
        });
    });
    
    window.addEventListener('DOMContentLoaded', event => {
        const SdatatablesSimple = document.getElementById('selectAllTable');
        
        if (datatablesSimple) {
            // `simpleDatatables` 초기화
            new simpleDatatables.DataTable(datatablesSimple, {
                perPage: 5, // 한 페이지에 표시할 행 수
                perPageSelect: [5, 10, 20], // 페이지당 선택 가능한 옵션
                sortable: true, // 열 정렬 가능
                searchable: true // 검색 기능
            });
        }
    });
	
    let userPointsTable; // 전역 변수로 선언

    function initializeDatatable() {
        const selectAllTable = document.getElementById('selectAllTable');
        if (selectAllTable) {
            if (userPointsTable) {
                userPointsTable.update(); // 데이터 변경 시 테이블 업데이트
            } else {
                userPointsTable = new simpleDatatables.DataTable(selectAllTable, {
                    perPage: 5,
                    perPageSelect: [5, 10, 20],
                    sortable: true,
                    searchable: true
                });
            }
        }
    }

    function viewUser(userId) {
        let url = `${pageContext.request.contextPath}/admin/analysis/userPoint?userId=` + userId;
        let query = "";

        const fn = function(data) {
            let state = data.state;
            if (state === "true") {
                let htmlContent = '';
                for (let it of data.listAll) {
                    htmlContent += '<tr>' +
                        '<td>' + it.userName + '</td>' +
                        '<td>' + it.regDate + '</td>' +
                        '<td>' + it.description + '</td>' +
                        '<td>' + it.currentPoint + '</td>' +
                        '<td>' + it.pointVar + '</td>' +
                        '<td>' + it.lastMoney + '</td>' +
                    '</tr>';
                }

                // 테이블의 tbody에 데이터를 추가합니다.
                $('#selectAllTable tbody').html(htmlContent);

                // `simpleDatatables` 초기화 또는 업데이트
                initializeDatatable();

                // 모달을 표시합니다.
                $('#selectAllModal').modal('show');
            } else {
                alert("결제 정보가 없습니다.");
            }
        };

        ajaxFun(url, "get", query, "json", fn);
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
</script>
