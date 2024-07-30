<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container body-container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			알림🔔
		</h1>
		<span class="cover-description htext">나: 나누고 싶은 마음을 담아</span><br>
		<span class="cover-description htext">무: 무한한 가능성을 거래합니다.</span>
		<div class="cover-image"></div>
	</section>


	<div class="row">
		<form class="d-flex" name="searchForm" id="searchForm" action="${pageContext.request.contextPath}/alarm/list" method="POST">
			<div class="col-4">
				<div class="row">
					<div class="col">
					<!-- 중고 or 빌려드림 등등 -->
						<h6 class="bd">카테고리</h6>
						<select class="form-select mb-4 border border-2" aria-label="Default select example" name="cnum" onchange="change();">
							<option value="0" ${cnum==0?'selected':''}>전체</option>
							<c:forEach var="vo" items="${listCategory}">
								<option value="${vo.cnum}" ${cnum==vo.cnum?'selected':''}>${vo.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div style="margin-top: 10px;">총 <span style="color: blue; font-weight: bold;" class="data-count">${dataCount}</span> 개</div>
			</div>
			<div class="col-8">
				<div class="row d-flex justify-content-end">
					<div class="col-7" style="padding-right: 0;">
						<h6>&nbsp;</h6>
						<div class="d-flex">
							<input class="form-control border border-2" onkeypress="if( event.keyCode == 13 ){searchData();}" type="search" name="kwd" value="${kwd}" placeholder="검색어를 입력하세요"/>
							<h6>&nbsp;&nbsp;</h6>
							<button class="btn" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>&nbsp;&nbsp;
							<button class="btn reset" style="background-color: white; color: darkgreen;"  type="button" onclick="location.href='${pageContext.request.contextPath}/alarm/list';">
								<i class="fa-solid fa-rotate-right"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<div class="flex-row" style="justify-content: space-between; align-items: center">
	</div>
			
			
			
	<form name="listForm" method="post">
		<table class="table table-hover board-list">
			<thead class="alarm-list">
				<tr>
					<th width="100">번호</th>
					<th>내용</th>
					<th width="100">보낸사람</th>
					<th width="170">받은날짜</th>
					<th width="170">읽은날짜</th>
				</tr>
			</thead>
			
			<tbody>
			    <c:forEach var="dto" items="${list}" varStatus="status">
			        <tr>
			            <td class="list-center">${dto.alarmNum}</td>
			            <td class="list-left">
			                <span class="content">
			                    <a href="#" class="text-reset alarm-content" data-bs-toggle="modal" data-bs-target="#alarmModal" data-content="${dto.content}">${dto.content}</a>
			                </span>
			            </td>
			            <td class="list-center">${dto.nickName}</td>
			            <td class="list-center">${dto.senderTime}</td>
			            <td class="list-center">${dto.timeRead}</td>
			        </tr>
			    </c:forEach>
			</tbody>
		</table>
	</form>
  </div>

	<div class="page-navigation">
		${dataCount==0? "알림 내역이 없습니다." : paging }
	</div>
	
<!-- 알림 내용 모달 -->
<div class="modal fade" id="alarmModal" tabindex="-1" aria-labelledby="alarmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alarmModalLabel">알림 내용</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="alarmModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function () {
    $('.search-btn').click(function () {
        let kwd = $('.searchInput').val().trim().toLowerCase();
        let count = 0; // 개수를 저장할 변수 초기화
        if (kwd) {
            $('.alarm-list .flex-col').each(function () {
                let content = $(this).find('.list-content').text().toLowerCase();
                if (subject.includes(kwd) || content.includes(kwd)) {
                    $(this).show();
                    count++; // 검색된 것이 하나 생길 때마다 +1
                } else {
                    $(this).hide();
                }
            });
            document.querySelector('span.data-count').innerHTML = count; // 개수 표시
        } else {
            alert('검색어를 입력하세요.');
        }
    });
   
});

function change() {
	const f = document.searchForm;
	f.submit();
}

// 알림 모달
$(document).ready(function () {
    $('.alarm-content').click(function (e) {
        e.preventDefault();
        var content = $(this).data('content');
        $('#alarmModalBody').text(content);
    });
});

</script>

<style>
.modal-dialog {
    display: flex;
    align-items: center;
    min-height: calc(100% - 1rem);
}

.alarm-list{
text-align: center;
}

.list-center {
text-align: center;
}

.list-left {
text-align: left;
}


.main1 {
    background: #C3FF9A;
    height: 300px;
    width: 100%;
    margin-top: 80px;
    border-radius: 5px;
}

.search-container {
	padding: 10px 10px;
    display: flex;
    align-items: center;
    justify-content: flex-end; /* 오른쪽 정렬 */
}

.searchInput-container {
    text-align: center;
    align-content: center;
}

.searchInput {
    border: 1px solid #ccc;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 12px;
    outline: none;
    width: 120px; 
    height: 30px;
}

.search-btn{
 border: 1px solid #ccc;
 border-radius: 25px;
 font-size: 12px;
 outline: none;
 width: 60px; 
 height: 30px;
 text-align: center;
}

.searchInput::placeholder {
    color: #999;
}

.submit-button {
    background-color: #61ac2d;
    color: white;
    border: none;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 14px;
    margin-left: 10px;
    cursor: pointer;
    align-items: center;
    height: 30px;
    text-align: center;
    justify-content: center;
}

.submit-button span {
    margin-left: 5px;
}

.cg-main {
    display: flex;
    flex-direction: row;
	transition: 0.2s;
	text-align: center;
	justify-content: center;
}

.cg-img {
	width: 64px;
	height: 64px;
}

.btn-cg {
	border: none;
	background-color: white;
	margin: 0 20px;
}

.cg-text {
text-align: center;
}

</style>