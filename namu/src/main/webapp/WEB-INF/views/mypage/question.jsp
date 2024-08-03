<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
    .body-container {
        max-width: 1000px;
        margin: auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .nav-tabs .nav-link {
        min-width: 170px;
        background: #f1f1f1;
        border-radius: 5px 5px 0 0;
        border: 1px solid #dee2e6;
        color: #333;
        font-weight: 600;
        margin-right: 5px;
        transition: background-color 0.3s, color 0.3s;
    }
    .nav-tabs .nav-link.active {
        background: #007bff;
        color: #fff;
        border-bottom-color: transparent;
    }
    .nav-tabs .nav-link:hover {
        background: #e2e6ea;
        color: #0056b3;
    }
    .tab-pane { 
        min-height: 300px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #dee2e6;
        border-radius: 0 0 5px 5px;
        margin-top: -1px;
    }

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
        color: #dc3545;
        font-weight: 500;
        transition: color 0.2s;
    }
    .deleteReview:hover, .deleteQuestion:hover {
        color: #ff6b6b;
    }

    .answer-content {
        background-color: #f8f9fa;
        border: 1px solid #e9ecef;
        border-radius: 5px;
        padding: 15px;
    }

   .page-navigation {
    text-align: center;
    padding: 10px 0;
}

	.page-navigation a,
	.page-navigation .active {
	    display: inline-block;
	    color: #7e57c2; /* 연한 보라색 텍스트 */
	    padding: 8px 16px;
	    margin: 0 4px;
	    border: 1px solid #e1bee7; /* 연한 보라색 테두리 */
	    text-decoration: none;
	    transition: background-color 0.3s, color 0.3s;
	    line-height: 20px;
	    font-size: 14px;
	    font-weight: bold;
	}
	
	.page-navigation a:hover {
	    background-color: #d1c4e9; /* 호버 시 더 진한 보라색 배경 */
	    color: #6a1b9a; /* 진한 보라색 텍스트 */
	}
	
	.page-navigation .active {
	    background-color: #9575cd; /* 선택된 페이지 보라색 배경 */
	    color: #fff; /* 흰색 텍스트 */
	    border-color: #7e57c2; /* 진한 보라색 테두리 */
	}
	
	.page-navigation .disabled {
	    cursor: not-allowed;
	    opacity: 0.5;
	    pointer-events: none;
	}
</style>

<script type="text/javascript">
$(function(){
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

<div class="container">
    <div class="body-container">    
        <div class="body-main">
            <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 리뷰 </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 상품문의 </button>
                </li>
            </ul>
            
            <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
                    <div class="mt-3 pt-3 border-bottom">
                        <p class="fs-4 fw-semibold">상품 리뷰</p> 
                    </div>
                    
                    <div id="listReview" class="mt-2"></div>
                </div>
                
                <div class="tab-pane fade show active" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
                    <div class="mt-3 pt-3 border-bottom">
                        <p class="fs-4 fw-semibold">상품 문의 사항</p> 
                    </div>
            
                    <div class="mt-1 p-2 list-question">
                        <c:forEach var="dto" items="${list}">
                            <div class="mt-1 border-bottom">
                                <div class="row p-2">
                                    <div class="col-auto fw-semibold">
                                        ${dto.subject}
                                    </div>
                                    <div class="col text-end">
                                        ${not empty dto.answer ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>'}
                                        | ${dto.questionDate}
                                        |<span class="deleteQuestion" data-num="${dto.num}">삭제</span>
                                    </div>
                                </div>
                                <div class="p-2">
                                    ${dto.question}
                                </div>
                                
                                <c:if test="${not empty dto.answer}">
                                    <div class="p-3 pt-0">
                                        <div class="bg-light">
                                            <div class="p-3 pb-0">
                                                <label class="text-bg-primary px-2"> </label> <label>${dto.answerDate}</label>
                                            </div>
                                            <div class="p-3 pt-1">${dto.answer}</div>
                                        </div>
                                    </div>                        
                                </c:if>                        
                            </div>
                        </c:forEach>
                    </div>
                    <div class="page-navigation">${paging}</div>
                </div>
            </div>

        </div>
    </div>
</div>
