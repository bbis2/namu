<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fleamarket-cover {
    background-color: #E3F1C5;
}

.htext {
    padding-top: 100px;
    padding-left: 100px;
}

.cover-content {
    padding: 50px;
    position: relative;
    height: 100%;
    box-sizing: border-box;
    margin-left: 100px;
}

@media (min-width: 768px) {
    .fleamarket-cover {
        height: 315px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
        margin-bottom: 60px;    
    }
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f2f2f2;
}

textarea.form-control {
    height: 100px;
    resize: none;
}

.content-meta {
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
}

.navigation,
.actions,
.comments {
    margin: 10px 0;
}

.navigation .btn,
.actions .btn,
.comments .btn {
    background-color: #5d4734;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px;
}

.navigation .btn:hover,
.actions .btn:hover,
.comments .btn:hover {
    background-color: #4c3b2b;
}

.comments input[type="text"] {
    margin-bottom: 10px;
}

.used {
    display: flex;
    overflow: hidden;
    margin-top: 100px;
    height: 500px;
}

.thumb {
    width:470px;
    height: 470px;
    display: block;
    padding: 40px 10px;
    border-radius: 15px;
}

.together-info {
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

.price {
    font-size: 24px;
    font-weight: bold;
    color: green;
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

.chat1 {
    border-radius: 16px;
    background: #61ac2d;
    color: white;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    margin-left: 20px;
    height: 80%;
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

.apply{
    border-radius: 10px;
	height: 50px;
	width: 450px;
	border: none;
	background-color: #B4CA8A;
}

textarea::placeholder{
	opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상 제거 */
	color: #333;
	text-align: center;
	line-height: 80px;
}
</style>

<script type="text/javascript">
    function deleteTogether() {
        if (confirm('게시글을 삭제 하시겠습니까?')) {
            let tNum = '${dto.tNum}';
            if (!tNum) {
                alert('잘못된 접근입니다.');
                return;
            }
            let query = "tNum=${dto.tNum}&${query}&thumbnail=${dto.thumbnail}";
            let url = '${pageContext.request.contextPath}/together/delete?' + query;
            location.href = url;
        }
    }
</script>

<div class="container">
    <section class="fleamarket-cover">
        <h1 class="cover-title htext bd">소통하는<br>일상 생활</h1>
        <span class="cover-description htext"></span><br>
        <span class="cover-description htext">동네주민과 함께 만들어가요!</span>
        <div class="cover-image"></div>
    </section>
</div>   


<div class="container body-container">
    <div class="used">
        <div class="thumb">
            <div>
                <div>
                    <c:choose>
                        <c:when test="${dto.thumbnail != null && !dto.thumbnail.isEmpty()}">
                            <c:forEach var="vo" items="${listFile}" varStatus="status">
                                <div ${status.index == 0 ? 'active' : ''}>
                                    <img src="${pageContext.request.contextPath}/uploads/photo/${vo.thumbnail}">
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="d-block w-100">
                            </div>
                        </c:otherwise>
                    </c:choose>
				
	                    <div>
	                    	<c:if test="${sessionScope.member.userId != dto.userId}">
		                    	<c:if test="${dto.acceptance == -1}">
		                        	<button type="button" class="apply applyAccept">참가신청</button>
		                    	</c:if>
		                    	<c:if test="${dto.acceptance == 0}">
		                        	<button type="button" class="apply">신청완료</button>
		                    	</c:if>
		                    	<c:if test="${dto.acceptance == 1}">
		                        	<button type="button" class="apply">참여중</button>
		                    	</c:if>
	                    	</c:if>
	                    	<c:if test="${sessionScope.member.userId == dto.userId}">
	                    		<button type="button" class="apply applyAcceptList">참여자 리스트</button>
	                    	</c:if>
	                    </div>
                </div>
            </div>
        </div>
        <div class="together-info">
        
            <div class="rpr">
                <h1>${dto.name}</h1>
                <div class="seller-location">${dto.town}</div>
            </div>
            <hr>
            <div class="used-header">
                <div class="title">${dto.subject}</div>
                <div> <h4>모임장 : ${dto.nickName}</h4></div>	
            </div>

            <table class="table table-borderless mb-2">
                <tr>
                    <td width="50%">
                        <c:choose>
                            <c:when test="${sessionScope.member.userId == dto.userId}">
                                <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/together/update?tNum=${dto.tNum}&page=${page}&categoryNum=${dto.categoryNum}&town=${town}';">수정</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-light" disabled>수정</button>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${sessionScope.member.userId == dto.userId}">
                                <button type="button" class="btn btn-light" onclick="deleteTogether();">삭제</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-light" disabled>삭제</button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="text-end">
                        <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/together/list?${query}';">리스트</button>
                    </td>
                </tr>
            </table>  
        </div>
    </div>
</div>

<div class="content1">${dto.content}</div>



<div class="modal fade" id="myApplyModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myApplyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myApplyModalLabel">참가신청</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="applyForm" method="post">
					<div class="row m-1">
						<textarea name="content" class="form-control" placeholder="각오 한마디를 입력하세요"></textarea>
						<input type="hidden" name="tNum" value="${dto.tNum}">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnAcceptOk">신청하기</button>
				<button type="button" class="btn btn-secondary btnSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<div class="modal fade" id="myApplyListModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myApplyListModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myApplyListModalLabel">참여자 리스트</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div style="width: 190px;" class="p-2">
					<select id="selectAcceptance" class="form-select">
						<option value="-1">전체 리스트</option>
						<option value="0">신청자 리스트</option>
						<option value="1">참여자 리스트</option>
						<option value="2">거절 리스트</option>
					</select>
				</div>
				
				<div class="p-2 applyList"></div>
			
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
function login() {
    location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
    const settings = {
        type: method, 
        data: formData,
        dataType: dataType,
        success: function(data) {
            fn(data);
        },
        beforeSend: function(jqXHR) {
            jqXHR.setRequestHeader('AJAX', true);
        },
        complete: function() {
        },
        error: function(jqXHR) {
            if (jqXHR.status === 403) {
                login();
                return false;
            } else if (jqXHR.status === 400) {
                alert('요청 처리가 실패 했습니다.');
                return false;
            }
            console.log(jqXHR.responseText);
        }
    };

    $.ajax(url, settings);
}

$(function() {
    $('.btnSendtogetherListLike').click(function() {
        const $i = $(this).find('i');
        let userLiked = $i.hasClass('bi-hand-thumbs-up-fill');
        let msg = userLiked ? '게시글 공감을 취소하시겠습니까?' : '게시글에 공감하십니까?';

        if (!confirm(msg)) {
            return false;
        }

        let url = '${pageContext.request.contextPath}/together/inserttogetherListLike';
        let tNum = '${dto.tNum}';
        let query = 'tNum=' + tNum + '&userLiked=' + userLiked;

        const fn = function(data) {
            let state = data.state;
            if (state === 'true') {
                if (userLiked) {
                    $i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
                } else {
                    $i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
                }
                let count = data.togetherListLikeCount;
                $('#togetherListLikeCount').text(count);
            } else if (state === 'liked') {
                alert('게시글 공감은 한번만 가능합니다!');
            } else if (state === 'false') {
                alert('게시물 공감 여부 처리가 실패했습니다.');
            }
        };

        ajaxFun(url, 'post', query, 'json', fn);
    });
});

$(function(){
	$('.btnInsertForm').on('click', function(){
		// 글 등록 폼
		$('#myDialogModal .modal-body').empty();
		
		let url = '${pageContext.request.contextPath}/together/write';
		$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
		$.get(url, function(data){
			$('#myDialogModal .modal-body').html(data);
			$('#myDialogModal').modal('show');
		}).fail(function(){
			alert('error');
		});
	});
});

$(function(){
	$('.container').on('click', '.btnSendOk', function() {
		//  글 등록 완료 및 수정 완료
		const f = document.applyForm;
		
		let str;

		str = f.content.value.trim();
	    if(!str) {
	        alert('내용을 입력하세요. ');
	        f.content.focus();
	        return;
	    }
	    
		    
		let url = "${pageContext.request.contextPath}/together/"+mode;
	    let formData = new FormData(f);

		const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("게시물을 추가(수정)하지 못했습니다. !!!");
	            return false;
	        }

	        $('#searchInput').val('');
	        $('#searchWord').val('');
	        
			$('.list-content').empty();
	    	loadContent(1);
	    	
	    	$('#myDialogModal').modal('hide');
		};
		
		ajaxFun(url, 'post', formData, 'json', fn, true);		
	});
});

// 참여하기 대화상자
$('.applyAccept').click(function(){
	$('#myApplyModal').modal('show');
});

// 참여완료
$('.btnAcceptOk').click(function(){
	const f = document.applyForm;
	
	if( ! f.content.value.trim() ) {
		f.content.focus();
		return false;
	}
	
	let formData = $('form[name=applyForm]').serialize();
	let url = '${pageContext.request.contextPath}/together/apply';
	const fn = function(data) {
		let state = data.state;
        if (state === 'true') {
       	  alert('참가 신청 되었습니다.');
       	  $('.applyAccept').html('신청완료');
       	  $('.applyAccept').removeClass('applyAccept');
        }
	};
	ajaxFun(url, 'post', formData, 'json', fn);
});

// 참여자 리스트 대화상자
$('.applyAcceptList').click(function(){
	applyList(-1);
	$('#myApplyListModal').modal('show');
});

// select 
$('#selectAcceptance').change(function(){
	let acceptance = $(this).val();
	applyList(acceptance);
});

function applyList(acceptance) {
	let tNum = "${dto.tNum}";
	
	let formData = "tNum=" + tNum + "&acceptance=" + acceptance;
	let url = '${pageContext.request.contextPath}/together/applyList';
	
	const fn = function(data) {
		$("#myApplyListModal .applyList").html(data);
	};
	ajaxFun(url, 'get', formData, 'text', fn);	
}

// 거절/수락 하기
$("#myApplyListModal").on("click", ".btnAcceptOk", function(){
	let tNum = $(this).attr("data-tNum");
	let acceptance = $(this).attr("data-acceptance");
	let userId = $(this).attr("data-userId");
	let nickName = $(this).attr('data-nickName');

	var s = nickName + "님의 요청을 수락하시겠습니까 ?";
	if(acceptance === "2") {
		s = nickName + "님의 요청을 거절하시겠습니까 ?";
	}
	
	if(! confirm(s)) {
		return false;
	}
	
	let formData = "tNum=" + tNum + "&acceptance=" + acceptance + "&userId=" + userId;
	let url = '${pageContext.request.contextPath}/together/applyUpdate';
	
	const fn = function(data) {
		let state = data.state;
        if (state === 'true') {
       	  alert('정보가 변경 돠었습니다.');
          applyList(-1);
        }
	};
	ajaxFun(url, 'post', formData, 'json', fn);
});



</script>