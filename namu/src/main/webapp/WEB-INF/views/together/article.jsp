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
    width: 640px;
    height: 470px;
    display: block;
    padding: 40px 10px;
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

<div class="body-title">
</div>    

<div class="container body-container">
    <div class="used">
        <div class="thumb">
            <div>
                <div>
                    <c:choose>
                        <c:when test="${dto.imageFile != null}">
                            <c:forEach var="vo" items="${listFile}" varStatus="status">
                                <div ${status.index == 0 ? 'active' : ''}>
                                    <img src="${pageContext.request.contextPath}/uploads/photo/${vo.thumbnail}" class="thumbnail">
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="d-block w-100">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="together-info">
            <div class="rpr">
                <h1>${dto.name }</h1>
                <div class="seller-location">주소1${dto.town}</div>
            </div>
            <hr>
            <div class="used-header">
                <div class="title">${dto.subject} 같이 즐겨요!</div>
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


</script>