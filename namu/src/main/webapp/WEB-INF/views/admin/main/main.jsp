<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<style>
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

    /* 차트 컨테이너 스타일 */
    .chart-container {
        position: relative;
        width: 100%;
        height: 400px; /* 적절한 높이 설정 */
        overflow: hidden; /* 차트가 컨테이너를 벗어나지 않도록 */
    }

    .chart-content {
        width: 100%;
        height: 100%;
    }
</style>

<body class="sb-nav-fixed">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">나무 통계</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">간단한 요약</li>
                </ol>
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">회원 관리</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/admin/memberManage/list">신규회원 ${countNew}명</a>
                                <div class="small text-white">보기
                                    <i class="fas fa-angle-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-warning text-white mb-4">
                            <div class="card-body">문의사항</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/admin/inquiryManage/list">쌓인문의 ${countInquiry}개</a>
                                <div class="small text-white">보기
                                    <i class="fas fa-angle-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">매출 확인</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/admin/analysis/page">통계 확인</a>
                                <div class="small text-white">보기
                                    <i class="fas fa-angle-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">차단관리</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/admin/memberManage/singo">신고된 유저 ${countSingo}명</a>
                                <div class="small text-white">보기
                                    <i class="fas fa-angle-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i> 누적 포인트 -주차
                            </div>
                            <div class="chart-container">
                                <div id="main" class="chart-content"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i> 누적 게시물 -주차
                            </div>
                            <div class="chart-container">
                                <div id="main3" class="chart-content"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> 신규 회원 - 7일 이내 가입
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>회원번호</th>
                                    <th>이름</th>
                                    <th>닉네임</th>
                                    <th>주소</th>
                                    <th>생일</th>
                                    <th>한마디</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                            <c:forEach var="udo" items="${list3}">
                                <tr>
                                    <td>${udo.memberIdx}</td>
                                    <td>${udo.userName}</td>
                                    <td>${udo.nickName}</td>
                                    <td>${udo.town1}</td>
                                    <td>${udo.birth}</td>
                                    <td>${udo.ment}</td>
                                </tr>
                                <!-- 다른 데이터 행들 -->
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
         </div>
</body>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
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
   
    <c:forEach var="dto2" items="${list}">
        <input type="hidden" class="sumedMoney" value="${dto2.sumedMoney}">
        <input type="hidden" class="week_start_date" value="${dto2.week_start_date}">
    </c:forEach>
<c:forEach var="dto" items="${list2 }">
	<input type="hidden" class="totalCount" value="${dto.totalCount }">
	<input type="hidden" class="reg_date" value="${dto.reg_date }">
</c:forEach>
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script>
    window.addEventListener('DOMContentLoaded', event => {
        const hiddenInputs = document.querySelectorAll('input.sumedMoney');
        const hiddenInputs2 = document.querySelectorAll('input.week_start_date');
        const sumedMoneys = Array.from(hiddenInputs).map(input => parseFloat(input.value));
        const week_start_dates = Array.from(hiddenInputs2).map(input => input.value);

        console.log(sumedMoneys); // 콘솔 로그 확인
        console.log(week_start_dates); // 콘솔 로그 확인

        var chartDom = document.getElementById('main');
        if (chartDom) {
            var myChart = echarts.init(chartDom);
            var option = {
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
                        type: 'line',
                        smooth: true
                    }
                ]
            };

            myChart.setOption(option);

            // 차트 리사이즈 핸들러 추가
            window.addEventListener('resize', () => {
                myChart.resize();
            });
        }
        
        var barChartDom = document.getElementById('myBarChart');
        if (barChartDom) {
            var myBarChart = echarts.init(barChartDom);
            var barOption = {
                xAxis: {
                    type: 'category',
                    data: ['A', 'B', 'C', 'D', 'E']
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        data: [10, 20, 30, 40, 50],
                        type: 'bar'
                    }
                ]
            };

            myBarChart.setOption(barOption);

            // 차트 리사이즈 핸들러 추가
            window.addEventListener('resize', () => {
                myBarChart.resize();
            });
        }
    });
    </script>
<script>

const hiddenInputss = document.querySelectorAll('input.totalCount');
const hiddenInputs2s = document.querySelectorAll('input.reg_date');

const totalCountss = Array.from(hiddenInputss).map(input => input.value);
const reg_datess = Array.from(hiddenInputs2s).map(input => input.value);

var chartDom = document.getElementById('main3');
var myChart = echarts.init(chartDom);
var option;

option = {
  xAxis: {
    type: 'category',
    data: reg_datess
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: totalCountss,
      type: 'line'
    }
  ]
};

option && myChart.setOption(option);

</script>
