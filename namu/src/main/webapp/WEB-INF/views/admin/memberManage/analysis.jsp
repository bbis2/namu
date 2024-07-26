<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 950px;
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

#chart-container {
	width: 476px;
	box-sizing: border-box;
	padding: 20px;
	height: 400px;
	border: 1px solid #ccc;
	text-align: center;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

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

$(function(){
	let url = "${pageContext.request.contextPath}/admin/memberManage/ageAnalysis";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		/*
		for(let i=0; i<data.list.length; i++) {
			titles.push(data.list[i].section);
			values.push(data.list[i].count);
		}
		*/
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("chart-container", {
			title:{
				text : "연령대별 회원수"
			},
			xAxis : {
				categories:titles
			},
			yAxis : {
				title:{
					text:"인원(명)"
				}
			},
			series:[{
		        type: 'column',
		        colorByPoint: true,
		        name: '인원수',
		        data: values,
		        showInLegend: false
		    }]
		});
	});
});
</script>

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
				<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="1" aria-selected="true" data-tab="1"> <i class="bi bi-bar-chart-line"></i> 회원분석</button>
			</li>
		</ul>
		
		<div class="tab-content pt-2" id="nav-tabContent">
			<div id="chart-container" class="mt-4"></div>
		</div>
	</div>
</div>
