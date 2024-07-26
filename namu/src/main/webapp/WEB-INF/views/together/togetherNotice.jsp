<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1000px;
}

.lg-img img { min-height: 420px; max-height: 420px;}
.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }
.sm-img img { width: 40px; height: 40px; cursor: pointer; object-fit: cover; }

.qty-plus, .qty-minus, .qty-remove { cursor: pointer; }
.qty-plus:hover, .qty-minus:hover, .qty-remove:hover { color: #0b83e6; }

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

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #f54a4c; }

.graph { font-size: 0;  letter-spacing: 0; word-spacing: 0; }
.graph-title { padding-right: 3px; }
.graph .one-space { font-size:13px; background:#eee;}
.graph .one-space:after { content: ''; display: inline-block; width:17px; }
.graph .one-space.on{ background:  #f54a4c; }
.graph .one-space:first-child{ border-top-left-radius:5px;  border-bottom-left-radius:5px; }
.graph .one-space:last-child{ border-top-right-radius:5px; border-bottom-right-radius:5px; }
.graph-rate { padding-left: 5px; display: inline-block; width: 60px; text-align: left; }

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }

.qna-form textarea { width: 100%; height: 75px; resize: none; }
.qna-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.qna-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

.deleteQuestion, .notifyQuestion { cursor: pointer; padding-left: 5px; }
.deleteQuestion:hover, .notifyQuestion:hover { font-weight: 500; color: #2478FF; }

.product-content img { max-width: 1000px; }
</style>

<script type="text/javascript">
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
	
}
</script>

<script type="text/javascript">
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-main">
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">모임정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false">공지사항<span class="title-reviewCount"></span></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false">게시판<span class="title-qnaCount"></span></button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="mt-3 product-content">
						${dto.content}
					</div>
				</div>

				<div class="tab-pane fade" id="tab-pane-3" role="tabpanel" aria-labelledby="tab-3" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">공지 사항</p> 
					</div>
			
					<div class="mt-3 p-2 text-end">
						<button type="button" class="btnQuestion btn btn-dark" ${empty sessionScope.member ? "disabled":""}> 공지사항 작성 </button>
					</div>
					<div class="mt-1 p-2 list-question"></div>
										
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="questionDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="questionDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="questionDialogModalLabel">공지사항 등록하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="qna-form p-2">
					<form name="questionForm">
						<div class="row">
							<div class="col">
								<span class="fw-bold">공지사항 쓰기</span>
							</div>
						</div>
						<div class="p-1">
							<textarea name="question" id="question" class="form-control"></textarea>
						</div>						
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnQuestionSendOk">공지사항 등록<i class="bi bi-check2"></i> </button>
				<button type="button" class="btn btn-secondary btnQuestionSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<script type="text/javascript">
// 탭 -----


// question -----
function listQuestion(page) {
	let num = '${dto.num}';
	let url = '${pageContext.request.contextPath}/together/list';
	let query = 'num='+num+'&pageNo='+page;
	
	const fn = function(data) {
		printQuestion(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);
}

function printQuestion(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	$('.title-qnaCount').html('(' + dataCount + ')');
	let out = '';
	for(let item of data.list) {
		let num = item.num;
		let userName = item.userName;
		let question = item.question;
		let question_date = item.question_date;
		let answer = item.answer;
		let answer_date = item.answer_date;

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2">' + question + '</div>';

		out += '  <div class="row p-2">';
		out += '     <div class="col-auto pt-2 pe-0">' + nickName + '</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;'+regDate+'</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>'+hitCount+'</span>';
		if(secret === 0) {
			out += '       |<span class="notifyQuestion" data-num="' + num + '">신고</span>';
		}
		out += '      </div>';
		if(answer) {
			out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
		}
		out += '  </div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	}

	$('.list-question').html(out);
}

$(function(){
	$('.list-question').on('click', '.btnAnswerView', function(){
		const $btn = $(this);
		const $EL = $(this).closest('.row').next('.answer-content');
		if($EL.is(':visible')) {
			$btn.html(' <i class="bi bi-chevron-down"></i> ');
			$EL.hide(100);
		} else {
			$btn.html(' <i class="bi bi-chevron-up"></i> ');
			$EL.show(100);
		}
	});
});

$(function(){
	var sel_files = [];
	
	$("body").on("click", ".qna-form", function(){
		$(this).closest(".qna-form").trigger("click");
	});

	
	$('.btnQuestion').click(function(){
		$("#questionDialogModal").modal("show");
	});

	$('.btnQuestionSendOk').click(function(){
		const f = document.questionForm;
		let s;
		
		s = f.question.value.trim();
		if( ! s ) {
			alert("문의 사항을 입력하세요.")	;
			f.question.focus();
			return false;
		}
		
		if(f.selectFile.files.length > 5) {
			alert("이미지는 최대 5개까지 가능합니다..")	;
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/qna/write";
		// FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공 
		// FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
		let query = new FormData(f); 
		
		const fn = function(data) {
			if(data.state === "true") {
				f.reset();
				$(".qna-form .img-item").each(function(){
					$(this).remove();
				});
				sel_files.length = 0;
				
				$("#questionDialogModal").modal("hide");
				
				listQuestion(1);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn, true);
	});
	
	$('.btnQuestionSendCancel').click(function(){
		const f = document.questionForm;
		f.reset();
		$(".qna-form .img-item").each(function(){
			$(this).remove();
		});
		sel_files.length = 0;
		
		$("#questionDialogModal").modal("hide");
	});	
	
	$('.btnMyQuestion').click(function(){
		location.href = '${pageContext.request.contextPath}/myPage/review?mode=qna';
	});
});
</script>
