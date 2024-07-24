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

@media ( min-width : 768px) {
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

.form-group input, .form-group textarea {
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

.navigation, .actions, .comments {
	margin: 10px 0;
}

.navigation .btn, .actions .btn, .comments .btn {
	background-color: #5d4734;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
}

.navigation .btn:hover, .actions .btn:hover, .comments .btn:hover {
	background-color: #4c3b2b;
}

.comments input[type="text"] {
	margin-bottom: 10px;
}
</style>

<c:if test="${sessionScope.member.userId==dto.userId}">
	<script type="text/javascript">
		function deleteBoard() {
		    if(confirm('게시글을 삭제 하시 겠습니까 ? ')) {
			    let query = 'num=${dto.num}&${query}';
			    let url = '${pageContext.request.contextPath}/admin/noticeManage/delete?' + query;
		    	location.href = url;
		    }
		}
	</script>
</c:if>
<div class="container">
	<section class="fleamarket-cover">
		<h1 class="cover-title htext bd">
			소통하는<br>일상 생활
		</h1>
		<span class="cover-description htext"></span><br> <span
			class="cover-description htext">동네주민과 함께 만들어가요!</span>
		<div class="cover-image"></div>
	</section>

	<div class="body-title">
		<h2 style="font-weight: bold;">${dto.categoryName}</h2>
	</div>

	<table class="table mt-5 mb-0 board-article">
		<thead>
			<tr>
				<td colspan="2" align="center"
					style="font-size: 40px; font-weight: bold;">${dto.subject}</td>
			</tr>
		</thead>

		<tbody>
			<tr style="font-size: 17px;">
				<td width="50%" style="font-weight: bold;">${dto.nickName}</td>
				<td align="right">${dto.regDate}| 조회 ${dto.hitCount}</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;"><c:forEach var="vo"
						items="${listFile}" varStatus="status">
						<p class="mb-1">
							<i class="bi bi-folder2-open"></i> <a
								href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
							[${vo.fileSize} byte]
						</p>
					</c:forEach></td>
			</tr>


			<tr>
				<td colspan="2" valign="top" height="200"
					style="border-bottom: none;">${dto.content}</td>
			</tr>


			<tr>
				<td colspan="2">이전글 : <c:if test="${not empty prevDto}">
						<a
							href="${pageContext.request.contextPath}/notice/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
					</c:if>
				</td>
			</tr>

			<tr>
				<td colspan="2">다음글 : <c:if test="${not empty nextDto}">
						<a
							href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	
	   <table class="table table-borderless mb-2">
        <tr>
            <td width="50%">
                <c:choose>
                    <c:when test="${sessionScope.member.userId == dto.userId}">
                        <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/update?num=${dto.num}&page=${page}&categoryNum=${dto.categoryNum}&town=${town}';">수정</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-light" disabled>수정</button>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${sessionScope.member.userId == dto.userId}">
                        <button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-light" disabled>삭제</button>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="text-end">
                <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/daily/list?${query}';">리스트</button>
            </td>
        </tr>
    </table>
	
	<table class="table table-borderless mb-2">
		<tr>
			<td class="text-end">
				<button type="button" class="btn btn-light"
					onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
			</td>
		</tr>
	</table>

</div>

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

    $.ajax(url, settings);
}

$(function() {
    $('.btnSendnoticeLike').click(function() {
        const $i = $(this).find('i');
        let userLiked = $i.hasClass('bi-hand-thumbs-up-fill');
        let msg = userLiked ? '게시글 공감을 취소하시겠습니까?' : '게시글에 공감하십니까?';

        if (!confirm(msg)) {
            return false;
        }

        let url = '${pageContext.request.contextPath}/notice/insertnoticeLike';
		let num = '${dto.num}';
		let query = 'num=' + num + '&userLiked=' + userLiked;

        const fn = function(data) {
            let state = data.state;
            if (state === 'true') {
                if (userLiked) {
                    $i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
                } else {
                    $i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
                }
                let count = data.noticeLikeCount;
                $('#noticeLikeCount').text(count);
            } else if (state === 'liked') {
                alert('게시글 공감은 한번만 가능합니다!');
            } else if (state === 'false') {
                alert('게시물 공감 여부 처리가 실패했습니다.');
            }
        };

        ajaxFun(url, 'post', query, 'json', fn);
    });
});

// 페이징 처리
$(function() {
    listPage(1);
});

function listPage(page) {
	let url = '${pageContext.request.contextPath}/notice/listReply';
    let query = 'num=${dto.num}&pageNo=' + page;
    let selector = '#listReply';

    const fn = function(data) {
        $(selector).html(data);
    };

	ajaxFun(url, 'get', query, 'text', fn);
}

// 댓글 등록
$(function() {
    $('.btnSendReply').click(function() {
        let num = '${dto.num}';
        const $tb = $(this).closest('table');

        let content = $tb.find('textarea').val().trim();
        if (!content) {
            $tb.find('textarea').focus();
            return false;
        }
        content = encodeURIComponent(content);

        let url = '${pageContext.request.contextPath}/notice/insertReply';
        let query = 'num=' + num + '&content=' + content + '&answer=0';

        const fn = function(data) {
            $tb.find('textarea').val('');

            let state = data.state;
            if (state === 'true') {
                listPage(1);
            } else if (state === 'false') {
                alert('댓글을 추가하지 못했습니다.');
            }
        };

        ajaxFun(url, 'post', query, 'json', fn);
    });
});

// 삭제, 신고 메뉴
$(function() {
    $('.reply').on('click', '.reply-dropdown', function() {
        const $menu = $(this).next('.reply-menu');
        if ($menu.is(':visible')) {
            $menu.fadeOut(100);
        } else {
            $('.reply-menu').hide();
            $menu.fadeIn(100);

            let pos = $(this).offset(); 
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
        }
    });

	$('.reply').on('click', function() {
		if($(event.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

//댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let rNum = $(this).attr('data-rNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/notice/deleteReply';
		let query = 'rNum=' + rNum + '&mode=reply';
		
		const fn = function(data){
			listPage(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$('.reply').on('click', '.btnSendReplyLike', function(){
		let rNum = $(this).attr('data-rNum');
		let replyLike = $(this).attr('data-replyLike');
		const $btn = $(this);
		
		let msg = '게시물이 마음에 들지 않으십니까 ?';
		if(replyLike === '1') {
			msg = '게시물에 공감하십니까 ?';
		}
		
		if(! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/notice/insertReplyLike';
		let query = 'rNum=' + rNum + '&replyLike=' + replyLike;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				let likeCount = data.likeCount;
				let disLikeCount = data.disLikeCount;
				
				$btn.parent('td').children().eq(0).find('span').html(likeCount);
				$btn.parent('td').children().eq(1).find('span').html(disLikeCount);
			} else if(state === 'liked') {
				alert('게시물 공감 여부는 한번만 가능합니다!');
			} else {
				alert('게시물 공감 여부 처리가 실패했습니다');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});



</script>
