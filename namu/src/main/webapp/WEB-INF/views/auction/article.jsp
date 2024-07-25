<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body-container">
<div class="used">
<div class="thumb">
   <div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="1000">
      <div class="carousel-inner">
			<c:choose>
				<c:when test="${dto.imageFile != null}">
					<c:forEach var="vo" items="${listFile}" varStatus="status">
						<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
							<img src="${pageContext.request.contextPath}/uploads/auctionPhoto/${vo.uploadFile}" class="thumb">
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				  <div class="carousel-item active">
					  <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="d-block w-100">
				  </div>
				</c:otherwise>
			</c:choose>
       </div>
       <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Previous</span>
       </button>
       <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Next</span>
       </button>
	</div>
</div>

<div class="used-info">

 	<div class="row">
 		<div class="col">
 			<div class="row">
 				<div class="col-auto">
 					<img src="회원 프로필!!">
 				</div>
 				<div class="col  align-self-center">
					<div class="user-name">${dto.nickName}</div>
	   				<div class="seller-location">${dto.town}</div>
 				</div>
 			</div>
 		</div>
 		<div class="col-auto text-end  align-self-center">
 			<label class="time-remaining" style="color: blue; font-weight: 500;"></label>
 		</div>
 	</div>

<hr>

<div class="used-header">
  <div class="title">${dto.subject}</div>
  <c:if test="${dto.state == 0 }">
  	<c:if test="${sessionScope.member.userId != dto.userId}">
   		<button type="button" class="btn-bid">입찰하기</button>
    </c:if>
    <c:if test="${sessionScope.member.userId != dto.userId && dto.bidNum > 0}">
   		<button type="button" class="btn-bidclose">입찰완료</button>
    </c:if>
   </c:if>
</div>
<div class="bid">현재가&nbsp;&nbsp;<span class="div-bid" data-bid="${dto.bid}"><fmt:formatNumber value="${dto.bid}"/></span> 원</div>
<div class="min-bid">시작가&nbsp;&nbsp;<fmt:formatNumber value="${dto.minBid}"/> 원</div>
<div class="state">
	<c:if test="${dto.state == 1}" >
		<span style="color: #D24F04; font-weight: bold;">유찰</span>
	</c:if>	
	<c:if test="${dto.state == 2}">
		<span style="color: #8B0000; font-weight: bold;">경매취소</span>
	</c:if>	
	<c:if test="${dto.state == 3}">
		<span style="color: #2E8B1F; font-weight: bold;">경매완료</span>
	</c:if>	
	<c:if test="${dto.state == 0}">
	</c:if>		
</div>
  <div class="content1">${dto.content}</div>
<div class="sale-meta">
  <div class="views">시작가 <fmt:formatNumber value="${dto.minBid}"/> &nbsp;|&nbsp; 찜 ${likeCount} &nbsp;|&nbsp; 경매시작 ${dto.salesStart} &nbsp;|&nbsp; 경매종료 ${dto.salesEnd}</div>
 	 <div class="buttons">
 	   <c:if test="${sessionScope.member.userId == dto.userId}">
      	<button class="update-btn" onclick="location.href='${pageContext.request.contextPath}/auction/update?aNum=${dto.aNum}';">수정</button>
       </c:if>
       <c:if test="${sessionScope.member.userId == dto.userId || sessionScope.member.userId == 'admin'}">
        <button class="delete-btn" onclick="usedDelete()">삭제</button>
        </c:if>
     </div>
        </div>
      <button type="button" class="btn btn-light" onclick="SinGo();">신고</button>
      <button class="btn-list" onclick="location.href='${pageContext.request.contextPath}/auction/list';">목록</button>
     </div>
  </div>
  <hr>
  <div class="fs-6 fw-semibold text-success">1:1문의</div>
  <div class="mb-2">  
  	<button type="button" class="btn-reply mb-2 p-1" style="float: right; color: white;" onclick="location.href='${pageContext.request.contextPath}/auction/write2?aNum=${dto.aNum}&page=${page}';">문의작성</button>
 </div>
 
 <div class="qnaList pt-2"></div>
 
</div>

<div class="modal fade" id="bidModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="bidModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="bidModalLabel">입찰하기 &nbsp;[ 보유 포인트 : <span class="span-userPoint" style="color: blue;"><fmt:formatNumber value="${userPoint}"/></span> ]</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="bidForm" method="post">
					<div class="row m-1">
						<input type="number" name="bid" class="form-control" placeholder="입찰가를 입력하세요">
						<input type="hidden" name="aNum" value="${dto.aNum}">
						<input type="hidden" name="userPoint" value="${userPoint}">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnBidOk">입력하기</button>
				<button type="button" class="btn btn-secondary btnSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<!-- 신고 모달 -->
<div class="modal fade" id="SinGoModal" tabindex="-1"
	data-bs-backdrop="static" data-bs-keyboard="false"
	aria-labelledby="SinGoModal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="">신고하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="p-3">
					<form name="SinGoForm" action="" method="post" class="row g-3">
						<div class="mt-0">
							<p class="form-control-plaintext">신고유형과 사유를 적어주세요</p>
						</div>
						<div class="mt-0">
							<select id="reportType" name="reportType" class="form-select">
								<option value="욕설/인신공격" selected>욕설/인신공격</option>
									<option value="개인정보노출">개인정보노출</option>
									<option value="불법정보">불법정보</option>
									<option value="같은내용반복(도배)">같은내용반복(도배)</option>
									<option value="기타">기타</option>
							</select>
						</div>
						<div>
							<input type="text" name="reportContent" autocomplete="off"
								 class="form-control"
								placeholder="신고사유 : ">
						</div>
							<input type="hidden" name="Field" value="${dto.tableName}">
							<!-- 파라미터 num -->
							<input type="hidden" name="postNum" value="${dto.aNum}">
							<input type="hidden" name="banUser" value="${dto.userId}">
						<div>
							<button type="button" class="btn btn-primary w-100"
								onclick="sendOk();">신고하기</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function usedDelete() {
	if(confirm('문의를 삭제 하시겠습니까?')){
		let query = 'aNum=${dto.aNum}';
	    let url = '${pageContext.request.contextPath}/auction/delete?' + query;
		location.href = url;
	}
}

function SinGo(){
	$('#SinGoModal').modal('show');
}

function sendOk() {
	const f = document.SinGoForm;
	let str = f.reportContent.value.trim();
	
    if (!confirm("정말 신고하시겠습니까?")) {
        return;
    }
    
    if(!str){
    	alert("사유를 입력해주세요");
    }
    
    f.action = "${pageContext.request.contextPath}/singo/reception";
    f.submit();
}

</script>

  
<script type="text/javascript">
// 경매 참여 모달
$('.btn-bid').click(function(){
	let aNum = ${dto.aNum};
	
	let formData ={aNum: aNum};
	let url = '${pageContext.request.contextPath}/auction/userPoint';
	const fn = function(data) {
		let userPoint = parseInt(data.userPoint);
		let minBid = ${dto.minBid};
		let bid = parseInt($('.div-bid').attr('data-bid'));
		let b = bid == 0 ? minBid : bid;
		
		$('.span-userPoint').html(userPoint.toLocaleString());
		
		if(b > userPoint) {
			alert('포인트가 부족합니다.');
			return false;
		}
		
		document.bidForm.userPoint.value = userPoint;
		
		$('#bidModal').modal('show');
	};
	
	ajaxFun(url, 'post', formData, 'json', fn);
});

$('.btnBidOk').click(function(){
	const f = document.bidForm;
	
	if( ! /^\d+$/.test(f.bid.value)) {
		f.bid.focus();
		return false;
	}

	let bid = parseInt(f.bid.value);
	
	let minBid = ${dto.minBid};
	let cbid = parseInt($('.div-bid').attr('data-bid'));
	
	if(parseInt(f.userPoint.value) < bid) {
		alert('포인트가 부족합니다.');
		return false;
	}
	
	if( (cbid == 0 && minBid > bid) || (cbid != 0 && cbid >= bid) ) {
		alert('입찰금액이 적습니다.');
		return false;
	}
	
	let formData = $('form[name=bidForm]').serialize();
	let url = '${pageContext.request.contextPath}/auction/auctionAccept';
	const fn = function(data) {
		let state = data.state;
        if (state === 'true') {
        	$('.div-bid').attr('data-bid', bid);
        	
        	let a = bid.toLocaleString();
        	$('.div-bid').html(a);
        	
        	alert('입찰 완료 되었습니다.');
			$('.bidAccept').html('신청완료');
			$('.bidAccept').removeClass('bidAccept');
			
			$('#bidModal').modal('hide');
        }
	};
	ajaxFun(url, 'post', formData, 'json', fn);
	
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
	
	$(function(){
		listQna(1);
	});
	
	function listQna(page) {
		const url = "${pageContext.request.contextPath}/auction/qnaList";
		let formData = "aNum=${dto.aNum}&pageNo=" + page;
		const fn = function(data) {
			$('.qnaList').html(data);
		};
		
		ajaxFun(url, "get", formData, "text", fn);
	}

    function clickContent(id) {
    	var content = document.getElementById('content' + id);
        var answer = document.getElementById('answer' + id);
        if (content.style.display === "none" || content.style.display === "") {
            content.style.display = "table-row";
            if (answer) answer.style.display = "none"; 
        } else {
            content.style.display = "none";
        }
    }
    
    function clickAnswer(id) {
    	var answer = document.getElementById('answer' + id);
        if (answer.style.display === "none" || answer.style.display === "") {
            answer.style.display = "table-row";
        } else {
            answer.style.display = "none";
        }
    }
    
    // 답변
    $('.qnaList').on('click', '.btnSendQnaAnswer', function(){
	    let answer = $('.qna-answer-content').val().trim();
	    let qNum = $(this).attr("data-qNum");
	    // let aNum = $(this).attr("data-aNum");
	    let page = $(this).attr("data-pageNo");
	
	    if(!answer) {
	        $('.qna-answer-content').focus();
	        alert("답변 내용을 입력하세요.");
	        return false;
	    };
	
	    answer = encodeURIComponent(answer);
	
	    let url = '${pageContext.request.contextPath}/auction/answer';
	    let query = 'qNum=' + qNum + '&answer=' + answer; //
	
	    const fn = function(data){
	        $('.qna-answer-content').val(''); 
	        let state = data.state;
	        if(state === 'true') {
	        	listQna(1);
	        } else if(state === 'false') {
	            alert('답변을 추가 하지 못했습니다.');
	        }
	    };
	
	    ajaxFun(url, 'post', query, 'json', fn);
	});

    
 // 경매 남은 시간 계산
    function task() {
    	let salesEnd = "${dto.salesEnd}";
    	if(! salesEnd) {
    		$(".time-remaining").html("경매 불가");
    		$(".btn-bid").prop("disabled", true);
    		return false;
    	}
    	
        let y = parseInt(salesEnd.substring(0, 4));
        let m = parseInt(salesEnd.substring(5, 7));
        let d = parseInt(salesEnd.substring(8, 10));
        let h = parseInt(salesEnd.substring(11, 13));
        let mi = parseInt(salesEnd.substring(14));
    	
    	let now = new Date();
    	let date = new Date(y, m-1, d, h, mi, 0);
    	
    	let diff = Math.floor((date.getTime() - now.getTime()) / 1000);
    	if(diff <= 0) {
    		$(".btn-bid").prop("disabled", true);
    		$(".time-remaining").html("경매 종료");
    		
    		return false;
    	}
    	
    	let days = Math.floor(diff / (24*3600));
    	let hours = Math.floor((diff % (24*3600)) / 3600);
    	if (hours < 10) hours = "0" + hours;
    	let minutes = Math.floor((diff % (3600)) / 60);
    	if (minutes < 10) minutes = "0" + minutes;
    	let seconds = Math.floor(diff % 60);
    	if (seconds < 10) seconds = "0" + seconds;

        let s = "";
        if(days >= 1) s = days + "일 "
        
        s += hours + ":" + minutes + ":" + seconds +" 남음";
        $(".time-remaining").html(s);
        
        // 
        setTimeout("task();", 1000);
    }
    
    $(function(){
    	let state = "${dto.state}";
    	if(state === "0") {
    		task();
    	}
    }); 
</script>


<style>
.btn-reply, .btnSendQnaAnswer {
	border: none;
	background-color: #61ac2d;
	border-radius: 10px;
	padding: 3px;
	margin-left: 7px;
	color: white;
}

.btn-bidclose {
    border-radius: 16px;
    background: #F5F5F5	;
    color: black;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-left: 20px;
    height: 80%
}

  .content, .answerlist {
    display: none;
    margin-top: 10px;
    padding: 10px;
    border: 1px solid #ddd;
    background-color: #f9f9f9;
}
</style>

<style>
  .used {
    display: flex;
    overflow: hidden;
    margin-top: 100px;
    height: 500px;
}

.thumb {
    width: 640px;
    height: 470px;
    display: block;
	padding: 40px 10px;
}

.used-info {
    padding: 40px 40px 20px 20px;
    flex-grow: 1;
}

.user {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.user-name {
    font-size: 18px;
    font-weight: bold;
    margin-right: 10px;
}

.seller-location {
    font-size: 14px;
    color: gray;
}


.bid {
    font-size: 24px;
    font-weight: bold;
    color: green;
    margin-bottom: 10px;
}

.min-bid {
    font-size: 17px;
    font-weight: bold;
    color: #708090;
    margin-bottom: 10px;
}

.state {
    font-size: 16px;
    color: green;
    margin-bottom: 20px;
}
.used-header {
    display: flex;
    justify-content: space-between;
}

.title {
	margin: 10px 0;
    font-size: 20px;
    flex-grow: 1;
}

.btn-bid {
    border-radius: 16px;
    background: #61ac2d;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-left: 20px;
    height: 80%
}

.content1 {
    font-size: 14px;
    color: gray;
    margin-bottom: 20px;
}

.sale-meta {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.views {
    font-size: 12px;
    color: gray;
}

.update-btn {
	border-radius: 16px;
    background-color: #ffd615;
    border: none;
    padding: 5px 10px;
    margin-left: 10px;
    cursor: pointer;
    color: white;
}

.delete-btn {
	border-radius: 16px;
    background-color: #ff9500;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    color: white;
}

.btn-list {
background-color: white;
padding: 5px 10px;
border: none;
float: right;
}

</style>
