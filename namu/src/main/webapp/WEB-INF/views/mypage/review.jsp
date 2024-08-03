<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
    .body-container {
        max-width: 1000px;
        margin: auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .nav-tabs .nav-link {
        min-width: 170px;
        background: #eaeaff;
        border-radius: 5px 5px 0 0;
        border: 1px solid #dee2e6;
        color: #555;
        font-weight: 600;
        margin-right: 5px;
        transition: background-color 0.3s, color 0.3s;
    }
    .nav-tabs .nav-link.active {
        background: #b39ddb;
        color: #fff;
        border-bottom-color: transparent;
    }
    .nav-tabs .nav-link:hover {
        background: #d1c4e9;
        color: #6a1b9a;
    }
    .tab-pane { 
        min-height: 300px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #dee2e6;
        border-radius: 0 0 5px 5px;
        margin-top: -1px;
    }

    .score-star { font-size: 0; letter-spacing: -4px; }
    .score-star .item {
        font-size: 22px; letter-spacing: 1px; display: inline-block;
        color: #ccc; text-decoration: none; vertical-align: middle;
    }
    .score-star .item:first-child{ margin-left: 0; }
    .score-star .on { color: #9575cd; }

    .md-img img {
        width: 150px;
        height: 150px;
        cursor: pointer;
        object-fit: cover;
        border-radius: 5px;
        transition: transform 0.2s;
    }
    .md-img img:hover {
        transform: scale(1.05);
    }

    .deleteReview, .deleteQuestion {
        cursor: pointer;
        padding-left: 5px;
        color: #c62828;
        font-weight: 500;
        transition: color 0.2s;
    }
    .deleteReview:hover, .deleteQuestion:hover {
        color: #e57373;
    }

    .answer-content {
        background-color: #f3e5f5;
        border: 1px solid #e1bee7;
        border-radius: 5px;
        padding: 15px;
    }

    .page-navigation {
        text-align: center;
        padding: 10px 0;
    }

    .page-navigation a {
        color: #7e57c2;
        padding: 8px 16px;
        margin: 0 4px;
        border: 1px solid #e1bee7;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s, color 0.3s;
    }
    .page-navigation a:hover {
        background-color: #d1c4e9;
        color: #4a148c;
    }
    .page-navigation .active {
        background-color: #9575cd;
        color: #fff;
        border-color: #7e57c2;
    }
</style>

<script type="text/javascript">
$(function(){
    // 기본적으로 리뷰 탭을 활성화
    $('#tab-1').addClass('active');
    $('#tab-pane-1').addClass('active show');

    // 리뷰 리스트를 기본으로 로드
    listReview(1);

    $("button[role='tab']").on('click', function(){
        const tab = $(this).attr("aria-controls");

        if(tab === "1") {
            listReview(1);
        } else if(tab === "2"){
            listQuestion(1);
        }
    });

    let mode = "${mode}";
    if(mode === "qna") {
        listQuestion(1);
    } else {
        listReview(1);
    }
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
        settings.processData = false;
        settings.contentType = false;
    }
    
    $.ajax(url, settings);
}
</script>


    
        <div class="body-main">
            <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link ${mode=='review'?'active':'' }" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 리뷰 </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link ${mode=='qna'?'active':'' }" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 상품문의 </button>
                </li>
            </ul>
            
            <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade ${mode=='review'?'active show':'' }" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
                    <div class="mt-3 pt-3 border-bottom">
                        <p class="fs-4 fw-semibold">상품 리뷰</p> 
                    </div>
                    
                    <div class="mt-2 list-review"></div>
                </div>
                
                <div class="tab-pane fade ${mode=='qna'?'active show':'' }" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
                    <div class="mt-3 pt-3 border-bottom">
                        <p class="fs-4 fw-semibold">상품 문의 사항</p> 
                    </div>
            
                    <div class="mt-1 p-2 list-question"></div>
                </div>
            </div>

        </div>
   


<script type="text/javascript">
// review -------------
function listReview(page) {
    let url = '${pageContext.request.contextPath}/tmreview/list2';
    let query = 'pageNo='+page;
    
    const fn = function(data) {
        printReview(data);
    };
    ajaxFun(url, 'get', query, 'json', fn);    
}

function printReview(data) {
    if (!data || typeof data.dataCount === 'undefined') {
        console.error("유효하지 않은 데이터:", data);
        alert('리뷰 목록을 불러오는 데 문제가 발생했습니다.');
        return;
    }

    let dataCount = data.dataCount;
    let pageNo = data.current_page; // 서버에서 current_page 반환
    let total_page = data.total_page;
    let size = 5; // 한 페이지에 표시할 리뷰 수
    let paging = data.paging; // 페이징 정보가 포함된 경우 사용

    let out = '';
    for (let item of data.list) {
        let num = item.num;
        let userName = item.nickName;
        let score = item.score;
        let review = item.review;
        let review_date = item.reviewDate;

        let productName = item.subject;
        let optionValue = item.optionValue;
        let optionValue2 = item.optionValue2;
        let opt = optionValue ? optionValue : '';
        opt = optionValue2 ? opt + ' / ' + optionValue2 : opt;
        opt = opt ? '(' + opt + ')' : '';

        out += '<div class="mt-3 border-bottom">';
        out += '  <div class="p-2 fw-semibold">';
        out +=        productName + opt;
        out += '  </div>';
        out += '  <div class="row p-2">';
        out += '    <div class="col-auto pt-0 ps-2 pe-1 score-star">';
        for (let i = 1; i <= 5; i++) {
            out += '  <span class="item fs-6 ' + (score >= i ? 'on' : '') + '"><i class="bi bi-star-fill"></i></span>';
        }
        out += '    </div>';
        out += '    <div class="col text-end"><span>'+review_date+'</span>';
        out += '       |<span class="deleteReview" data-num="'+num+'">삭제</span></div>';
        out += '  </div>';
        out += '  <div class="mt-2 p-2">' + review + '</div>';

        out += '</div>';
    }
    if (dataCount > 0) {
        out += '<div class="page-navigation">' + paging + '</div>';
    }

    $('.list-review').html(out);
}

$(function(){
    $('.list-review').on('click', '.deleteReview', function(){
        let num = $(this).attr('data-num');
        let url = '${pageContext.request.contextPath}/tmreview/delete';
        let formData = { num: num };

        const fn = function(data) {
            if (data.state === "true") {
                printReview(data); // 갱신된 데이터를 사용하여 리뷰 목록을 출력
            } else {
                alert('삭제 실패: ' + (data.message || 'Unknown error'));
            }
        };

        ajaxFun(url, 'POST', formData, 'json', fn);
    });
});
// question -------------
   function listQuestion(page) {
    let url = '${pageContext.request.contextPath}/tmqna/list2';
    let query = 'pageNo=' + page;
    
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

    let out = '<style>';
    out += '.badge-success { background-color: #28a745; }';
    out += '.badge-secondary { background-color: #6c757d; }';
    out += '.text-purple { color: #6f42c1; }';
    out += '.bg-light-purple { background-color: #f9f1ff; border: 1px solid #d4a0ff; border-radius: 0.25rem; }';
    out += '.border-purple { border-color: #d4a0ff; }';
    out += '.answer-content { background-color: #f3e6ff; padding: 15px; border-radius: 0.25rem; }';
    out += '</style>';

    for (let item of data.list) {
        let num = item.num;
        let userName = item.nickName;
        let question = item.question;
        let question_date = item.questionDate;
        let answer = item.answer;
        let answerName = item.answerName;
        let answer_date = item.answerDate;
        let answerState = answer_date ? '<span class="badge badge-success">답변완료</span>' : '<span class="badge badge-secondary">답변대기</span>';
        let productName = item.subject;

        out += '<div class="mt-1 border-bottom">';
        out += '  <div class="mt-2 p-2 fw-semibold text-purple">' + productName + '</div>';
        out += '  <div class="p-2">' + question + '</div>';

        out += '  <div class="row p-2">';
        out += '     <div class="col-auto pt-2 pe-0">' + answerState + '</div>';
        out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>'+question_date+'</span>';
        out += '        |<span class="deleteQuestion" data-num="' + num + '">삭제</span>';
        out += '      </div>';
        if(answer) {
            out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
        }
        out += '  </div>';
        if(answer) {
            out += '  <div class="p-3 pt-0 answer-content bg-light-purple" style="display: none;">';
            out += '    <div>';
            out += '      <div class="p-3 pb-0">';
            out += '        <label class="text-bg-primary px-2"> '+ answerName +' </label> <label>' + answer_date + '</label>';
            out += '      </div>';
            out += '      <div class="p-3 pt-1">' + answer + '</div>';
            out += '    </div>';
            out += '  </div>';
        }
        out += '</div>';
    }

    if (dataCount > 0) {
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
        $('.list-question').on('click', '.deleteQuestion', function(){
            let num = $(this).attr('data-num');
            let url = '${pageContext.request.contextPath}/tmqna/delete';
            let formData = { num: num };

            const fn = function(data) {
                if (data.state === "true") {
                    listQuestion(1); // 질문 목록 갱신
                } else {
                    alert('삭제 실패: ' + (data.message || 'Unknown error'));
                }
            };

            ajaxFun(url, 'POST', formData, 'json', fn);
        });
    });
</script>
