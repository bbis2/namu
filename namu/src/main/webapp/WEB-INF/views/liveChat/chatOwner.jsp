<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<style type="text/css">
.chatting-wrap {
	display: flex;
	/* background-color: rgba(213, 213, 213, 0.2); */
	justify-content: center;
	align-items: center;
}

.chatting-wrap .chatting-content {
	/* width: 400px;*/
	width: 100%;
	height: 484px;
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	box-shadow: 3px 5px 5px 1px rgba(0,0,0,.2);
}

.chatting-content .chatting-body {
	display: flex;
	overflow-y: scroll;
	/* height: 430px; */
	height: 484px;
}

.chattingRoom-list { width: 100%; }
.chattingRoom-list-online, .chattingRoom-list-offline { width: 100%; }

.chatting-content .chattingRoom-list-header {
	display: flex;
	border-bottom: 1px solid #c6c7c8;
	width: 100%;
	padding: 7px 10px;
	align-items: center;
	justify-content: space-between;
}

.chatting-content .chattingRoom-list-body {
	display: flex;
	width: 100%;
	padding: 7px 10px;
	align-items: center;
	justify-content: space-between;
}

.list-body-left { display: flex; align-items: center; }
.list-header-left { display: flex; align-items: center; }

.person-icon { font-size: 17px; margin-right: 4px; }
.person-circle-icon { font-size: 15px; margin-right: 3px; padding: 7px 3px 5px 7px;  border-radius: 30px; border: 1px solid #ccc; width: 30px; height: 30px; }

.list-body-left .chatting-info-name { font-size: 13px; }
.list-body-left .chatting-info-message { 
	color: #999999;
	font-size: 10px;
	width: 270px;
	white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
}

.list-body-right .date { font-size: 9px; color: #999999; }

.chatting-content .chatting-footer {
	display: flex;
	background-color: #f8f9fa;
	border-top: 1px solid #c6c7c8;
	border-bottom: 1px solid #c6c7c8;
}

.message-main { display: none; background: #fefefe; padding: 0; }

.message-main .message-header {
	display: flex;
	width: 100%;
	padding: 7px 10px;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid #c6c7c8;
}

.message-main .message-header-left { display: flex; align-items: center; font-weight: 600; font-size: 12px; }

.message-main .message-body {
	overflow-y: scroll;
	height: 385px;
	border-bottom: 1px solid #c6c7c8;
}

.message-body .message-body-list {
	display: flex;
	flex-direction:column;
}

.message-body .message-user {
	/* color: #0d6efd;
	font-weight: 700; */
	font-size: 12px;
	margin-left: 3px;
	margin-bottom: 1px;
}

.message-body .message-body-date {
    font-size: 10px; 
    border: 1px solid #c6c7c8;
    background-color: #e8ffff;
    border-radius: 10px;
    padding: 3px 7px;
    margin: 5px auto;
}
.message-body .message-time { font-size: 9px; color: #999999; }
.message-body .message-unread { font-size: 9px; color: #507cd1; font-weight: 600; }
.message-body .message-body-left { margin-right: auto; margin-left: 8px; margin-bottom: 7px; }
.message-body .message-body-right { margin-left: auto; margin-right: 3px; margin-bottom: 7px; }
.message-body .message-content { display: flex; align-items: flex-end; }
.message-body .content-left { padding-left: 20px; }
.message-body .message-info { display: flex; flex-direction:column; padding: 3px 5px; align-items: flex-end;}
.message-body .message, .message-body .add-information {
	max-width: 280px;
	line-height: 1.5;
	font-size: 13px;
    padding: 0.35em 0.65em;
    border: 1px solid #cccccc;
    color: #333333;
    white-space: pre-wrap;
    vertical-align: baseline;
    border-radius: 0.25rem;
}
.message-body .message-right { background-color: #ffffd7; }

.message-body .add-information {
/*
	display: flex; flex-direction:column; 
	padding: 3px 5px; 
	background: #f8f9fa;
	font-size: 12px; color: #333333;
	margin: 5px;
*/
	font-size: 12px; color: #335553;
	background: #f8f9fa;
    padding: 3px;
    margin-right: auto;
    margin-left: 8px;
    margin-bottom: 5px;
}

.message-main .message-footer {
	display: flex;
	width: 100%;
	padding: 0;
	align-items: center;
	justify-content: space-between;
}

.message-main .message-footer-right { display: flex; width: 100%; border-left: 1px solid #c6c7c8; }
.message-footer textarea { width: 355px; resize: none; height: 45px; padding: 5px; border: none; }
.message-footer textarea:focus { outline: none; }

.btn-chatting {
	color: #333;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	vertical-align: baseline;
}

.btn-icon { border: 1px solid #f8f9fa; background-color: #f6f6f6; }
.btn-icon:hover, .btn-icon:active, .btn-icon:focus { border: 1px solid #adadad; }

.btn-body { border: 1px solid #ffffff; background-color: #ffffff; padding: 5px 5px; }
.btn-body:hover, .btn-body:active, .btn-body:focus { font-weight: 600; color: #0d58ba; }
.btn-dots { padding-left: 3px; padding-right: 3px; }

.btn-footer { border: none; border-right: 1px solid #c6c7c8; background-color: #f8f9fa; padding: 5px 20px; border-radius: 0; }
.btn-footer:hover, .btn-footer:active, .btn-footer:focus { font-weight: 600; }
.btn-footer[disabled] { pointer-events: none; cursor: default; opacity: .65; }

.btn-msg { border: 1px solid #fefefe; background-color: #fefefe; padding: 5px 5px; }
.btn-msg:hover, .btn-msg:active, .btn-msg:focus { font-weight: 600; color: #f28011; }

.btn-msg-send { border: 1px solid #ffffff; background-color: #ffffff; padding: 13px 13px; border-radius: 0; }
.btn-msg-send:hover, .btn-msg-send:active, .btn-msg-send:focus { font-weight: 600; color: #0d58ba; }

.font-10 { font-size: 10px; }
.font-11 { font-size: 11px; }
.font-9 { font-size: 9px; }
.bold { font-weight: 600; }

.chatting-room { cursor: pointer; }
.chatting-room:hover { color: #0d58ba; }

.chattingRoom-list-online { color: #000; }
.chattingRoom-list-offline { color: #999; }
</style>

<div class="modal fade" id="myLiveChatModal" tabindex="-1" aria-labelledby="myLiveChatModalLabel" 
		aria-hidden="true" data-bs-keyboard="false">
	<div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 410px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myLiveChatModalLabel"><i class="fa-regular fa-message"></i> 채팅</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body p-0">
				<!-- 채팅 화면 -->
				<div class="chatting-wrap">
					<div class="chatting-content">
						<!-- 온라인 / 오프라인 리스트 -->
						<div class="chatting-info-main">
							<div class="chatting-body">
								<!-- 리스트 시작 -->
								<div class="chattingRoom-list">
									<div class="chattingRoom-list-header">
										<div class="list-header-left"><small class="font-11 chatting-count">유저 리스트</small> </div>
										<div class="list-header-right">
											<button type="button" class="btn-chatting btn-body btn-chatting-search" title="검색"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
									
									<!-- 채팅방 리스트 시작 -->
									<div class="chattingRoom-list-wrap">
										<!-- 온라인 유저 -->
										<div class="chattingRoom-list-online">
										</div>
										
										<!-- 오프라인 유저 -->
										<div class="chattingRoom-list-offline">
										</div>
									</div>
									<!-- 채팅방 리스트 종료 -->
									
								</div>
								<!-- 리스트 종료-->
							</div>
							
						</div>
						<!-- 온라인 / 오프라인 리스트 종료-->
						
						<!-- 메시지 리스트 시작-->
						<div class="message-main" data-uidx="1">
							<div class="message-header">
								<div class="message-header-left">
									<button type="button" class="btn-chatting btn-msg btn-chattingRoom-back" title="돌아가기"><i class="fa-solid fa-arrow-left-long"></i></button>
									<label class="message-header-title"></label>
								</div>
								<div class="message-header-right">
									<button type="button" class="btn-chatting btn-msg btn-message-search" title="검색"><i class="fa-solid fa-magnifying-glass"></i></button>
									<button type="button" class="btn-chatting btn-msg btn-message-more" title="더보기"
										data-startDate="20240701"><i class="fa-solid fa-angle-down"></i></button>
									<button type="button" class="btn-chatting btn-msg btn-message-menu"><i class="fa-solid fa-bars"></i></button>
								</div>
							</div>
							
							<div class="message-body">
								<div class="message-body-list">
								</div>
							</div>
							
							<div class="message-footer">
								<div class="message-footer-left">
									<textarea class="send-message"></textarea>
								</div>
								<div class="message-footer-right">
									<button type="button" class="btn-chatting btn-msg-send" title="메시지 보내기"><i class="fa-solid fa-play"></i></button>
								</div>
							</div>
							
						</div>
						<!-- 메시지 리스트 종료-->
						
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</div>

<%
	String wHost = "ws://"+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/channel";
%>
<script type="text/javascript">
	var socket = null;
	var ownerIdx = null;
	var ownerName = null;
	
	function liveChatStart(room, oidx, oname) {
		const host = '<%=wHost%>/' + room + '/owner';

		// 웹소켓 객체 생성 -----
		if ('WebSocket' in window) {
			socket = new WebSocket(host);
	    } else if ('MozWebSocket' in window) {
	    	socket = new MozWebSocket(host);
	    } else {
	        return false;
	    }
		
		socket.onopen = function(evt) { onOpen(evt) };
		socket.onclose = function(evt) { onClose(evt) };
		socket.onmessage = function(evt) { onMessage(evt) };
		socket.onerror = function(evt) { onError(evt) };		
		
		$('.chattingRoom-list-online').empty();
		$('.chattingRoom-list-offline').empty();
		$('.chatting-info-main').show();
		
		$('.message-body-list').empty();
		$('.message-main').hide();
		
		$('.chatting-wrap').attr('data-state', '0'); // 상태:0-리스트화면, 1:채팅화면
		
		$('#myLiveChatModal').modal('show');
	}
	
	// 서버 접속이 성공한 경우 호출되는 콜백함수
	function onOpen(evt) {
		// 서버 접속이 성공 하면 회원번호와 이름을 JSON으로 서버에 전송
	    let obj = {};
	    obj.type = 'connect';
	    obj.oidx = '${sessionScope.member.userId}';
	    obj.userName = '${sessionScope.member.nickName}';
	    
	    let jsonStr = JSON.stringify(obj);
	    socket.send(jsonStr);		
	}

	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {
		socket = null;
		$('#myLiveChatModal').modal('hide');
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
    	let data = JSON.parse(evt.data);
    	let cmd = data.type;
    	
    	if(cmd === 'connectOk') { // 서버에 접속한 경우
    		connectOk(data);
    	} else if(cmd === 'inquiry') { // 질문을 전달 받은 경우
    		chatInquiry(data);
    	} else if(cmd === 'answerOk') { // 답변 등록 완료
    		chatAnswerOk(data);
    	} else if(cmd === 'startChatting') { // 채팅 시작을 전달 받은 경우
    		startChatting(data);
    	} else if(cmd === 'userConn') { // 유저가 접속한 경우
    		userConn(data);	
    	} else if(cmd === 'userDisConn') { // 유저가 접속 해제한 경우
    		userDisConn(data);
    	}
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {
		// console.log(evt);
	}		
	
	$(function(){
		const myModalEl = document.getElementById('myLiveChatModal');
		myModalEl.addEventListener('show.bs.modal', function(){
			// 모달 대화상자가 보일때
		});

		myModalEl.addEventListener('hidden.bs.modal', function(){
			// 모달 대화상자가 닫할때
			if(socket) {
				try {
					socket.close();
				} catch (e) {
				}
				socket = null;
			}		
		});	
	});
	
	$(function(){
		// 유저 리스트 : "유저이름"을 클릭한 경우 -> 해당 유저와 채팅할 채팅방으로 이동
		$('.chatting-wrap').on('click', '.chatting-room', function(){
			let userName = $(this).attr('data-userName');
			let uidx = $(this).attr('data-uidx');
			
			// 채팅 시작 알림
		    let obj = {};
		    obj.type = "startChatting";
		    obj.uidx = uidx;
		    let jsonStr = JSON.stringify(obj);
		    socket.send(jsonStr);
			
			$('.chatting-wrap').attr('data-state', '1') // 채팅화면
			$('.message-main').attr('data-uidx', uidx);
			$('.message-main').attr('data-userName', userName);
			
			$('.chatting-title').html('<i class="fa-regular fa-comments"></i> 채팅');
			$('.chatting-info-main').hide();
			
			$('.message-header-title').html(userName);
			$('.message-main').show();
			$('.message-body-list').empty();
			
			$('.send-message').val('');
			
			// 유저 리스트의 메시지를 읽은 상태로 변경 
			$('.chatting-room').each(function(){
				let $el = $(this);
				let idx = $el.attr('data-uidx');
				if(uidx === idx) {
					$el.find('.chatting-info-name').html(userName);
					return false;
				}
			});

		});

		// 온라인/오프라인 리스트 : "유저이름"의 우측 ":" 를 클릭한 경우 -> 채팅방 상세 정보, 채팅방 삭제
		$('.chatting-wrap').on('click', '.btn-room-info', function(){
			alert('채팅방 상세 정보');
		});
		
		// 채팅 메시지 리스트 : 돌아가기를 클릭한 경우
		$('.chatting-wrap').on('click', '.btn-chattingRoom-back', function(){
			let uidx = $('.message-main').attr('data-uidx');
			
			// 채팅 종료를 알림
			let obj = {};
			obj.type = 'endChatting';
			obj.uidx = uidx;
		
			let jsonStr = JSON.stringify(obj);
			socket.send(jsonStr);
			
			$('.message-main').hide();
			
			$('.chatting-info-main').show();
			$('.chatting-wrap').attr('data-state', '0'); // 목록화면
		});
		
		// 채팅 메시지 리스트 : 검색을 클릭한 경우 -> 채팅 문자열 검색
		$('.chatting-wrap').on('click', '.btn-message-search', function(){
			alert('채팅 메시지 검색');
		});

		// 채팅 메시지 리스트 : 더보기를 클릭한 경우
		$('.chatting-wrap').on('click', '.btn-message-more', function(){
			let startDate = $(this).attr('data-startDate');
			alert('더보기를 클릭 : ' + startDate);
		});
	});
	
	$(function(){
	    // 엔터키로 메시지 전송
	    $('.send-message').keypress(function(e) {
	        if (e.which === 13 && !e.shiftKey) {
	            e.preventDefault();
	            sendMessage();
	        }
	    });

	    // 하단 채팅 메시지 보내기
	    $('.chatting-wrap').on('click', '.btn-msg-send', function(){
	        sendMessage();
	    });
	});
	
	function sendMessage() {
	    if(! socket) {
	        alert('서버와 연결이 종료되었습니다.');
	        return false;
	    }
	    
	    let msg = $('.send-message').val().trim();
	    if(! msg) {
	        $('.send-message').focus();
	        return false;
	    }
	    
	    let uidx = $('.message-main').attr('data-uidx');
	    let userName = $('.message-main').attr('data-userName');
	    let obj = {};
	    obj.type = 'answer';
	    obj.uidx = uidx;
	    obj.userName = userName;
	    obj.answer = msg;
	    
	    let jsonStr = JSON.stringify(obj);
	    socket.send(jsonStr);
	    
	    $('.send-message').val('');
	    $('.send-message').focus();
	    
	    let date = new Date();
	    let h = date.getHours();
	    let m = date.getMinutes();
	    
	    let s = h >= 12 && h < 24 ? '오후 ' + (h - 12) : '오전 ' + (h == 24 ? 0 : h);
	    s += ':' + (m < 10 ? '0' + m : m);
	    
	    let out = senderMessageHTML(1, s, msg); // unread, time, content
	    
	    messageToScreen(out);
	    
	    // 유저 리스트의 메시지 변경
	    // 여기에 유저 리스트 업데이트 로직 추가
	}
	
	function connectOk(data) {
		// 서버에 접속한 경우
		let listOnline = data.onlineUsers;
		let listOffline = data.offlineUsers;
		
		for(let userRoom of listOnline) {
			appendChattingRoom(userRoom, '.chattingRoom-list-online');
		}
		
		for(let userRoom of listOffline) {
			appendChattingRoom(userRoom, '.chattingRoom-list-offline');
		}
	}
	
	
	function chatInquiry(data) {
		// 문의를 전달 받은 경우
		let fromIdx = data.msg.fromIdx;
		let fromName = data.msg.fromName;
		let classify = data.msg.classify;
		let content = data.msg.content;
		let date = data.msg.date;
		let dateWeek = data.msg.dateWeek;
		let time = data.msg.time;

		// 처음 문의한 경우
		let b = false;
		$('.chatting-room').each(function(){
			let $el = $(this);
			let idx = $el.attr('data-uidx');
			if(fromIdx === idx) {
				b = true;
				return false;
			}
		});

		if( ! b) {
			let obj = {};
			obj.uidx = fromIdx;
			obj.userName = fromName;
			obj.unread = 1;
			obj.content = content;
			obj.dateTime = time;
				
			appendChattingRoom(obj, '.chattingRoom-list-online');
		}
		
		// 오너가 현재 채팅 상태
		let state = $('.chatting-wrap').attr('data-state');
		// 현재 채팅 중인 유저
		let uidx = $('.message-main').attr('data-uidx');
		if(state === '0' || uidx !== fromIdx) {
			// 읽지 않은 메시지 상태
			$('.chatting-room').each(function(){
				let $el = $(this);
				let idx = $el.attr('data-uidx');

				if(uidx === idx) {
					$el.find('.chatting-info-name').html(fromName + '<small class="font-9"> (1)</small>');
					return false;
				}
			});
			
			return;
		}
		
		// 문의한 유저와 채팅 중인 경우
		let out;
		out = receverMessageHTML(fromName, content, time);
		
		b = false;
		$('.message-body-list .message-body-date').each(function() {
			let messageDate = $(this).attr('data-messageDate');
			if(date == messageDate) {
				b = true;
				return false;
			}
		});
		
		if(! b) {
			let s = '<div class="message-body-date" data-messageDate="' + date + '">' + dateWeek + '</div>';
			messageToScreen(s);
		}
		
		messageToScreen(out);		
	}
	
	function chatAnswerOk(data) {
		// 답변 등록 완료
		let unread = data.unread;
	
		if(unread == 0) { // 모든 메시지를 읽은 상태로 변경
			$('.message-body-list .message-unread').each(function(){
				$(this).html('');
			});
		}
	}	
	
	function startChatting(data) {
		// 채팅 시작을 전달 받은 경우
		let startDate = data.startDate; // 출력 시작날짜
		
		let nowDate = data.nowDate;
		let nowFullDate = data.nowFullDate;
		let userOnline = data.userOnline;
		let messageList = data.messageList;
		
		let title = userOnline == 1 ? '실시간 채팅 상담' : '문의 답변 등록';
		let userName = $('.message-main').attr('data-userName')
		$('.message-header-title').html(userName + '-' + title);
		
		let out;
		if(messageList.length == 0) {
			out = '<div class="message-body-date" data-messageDate="' + nowDate + '">' + nowFullDate + '</div>';
			messageToScreen(out);
			
			return;
		}
		
		for(let msg of messageList) {
			let fromIdx = msg.fromIdx;
			let fromName = msg.fromName;
			let classify = msg.classify;  //1:유저질문, 2:오너답변
			let content = msg.content;
			let toIdx = msg.toIdx;
			let toName = msg.toName;
			let readIdx = msg.readIdx;
			let date = msg.date;
			let dateWeek = msg.dateWeek;
			let time = msg.time;
			
			let out;
			if(classify == 1) {
				out = receverMessageHTML(fromName, content, time);
			} else {
				let unread = readIdx == toIdx ? '' : '1';
				
				out = senderMessageHTML(unread, time, content);
			}
			
			let b = false;
			$('.message-body-list .message-body-date').each(function(){
				let messageDate = $(this).attr('data-messageDate');
				if(date == messageDate) {
					b = true;
					return false;
				}
			});
			
			if(! b) {
				let s = '<div class="message-body-date" data-messageDate="' + date + '">' + dateWeek + '</div>';
				messageToScreen(s);
			}
			
			messageToScreen(out);
		}
	}
	
	function userConn(data) {
		// 유저가 접속한 경우
		let uidx = data.uidx;
		let userName = data.userName;
		
		let state = $('.chatting-wrap').attr('data-state');
		if(state === '1') {
			let cidx = $('.message-main').attr('data-uidx');
			if(uidx === cidx) {
				messageToScreen('<div class="add-information">' + userName + '님이 입장 하였습니다.</div>');
				$('.message-header-title').html(userName + '-실시간 채팅 상담');
			}
		}
		
		let b = false;
		$('.chattingRoom-list-offline .chatting-room').each(function(){
			let $el = $(this);
			let $elList = $el.closest('.chattingRoom-list-body');
			let idx = $el.attr('data-uidx');
			if(uidx == idx) {
				$elList.clone(true).prependTo('.chattingRoom-list-online');
				$elList.remove();
				
				b = true;
				return false;
			}
		});
	}
	
	function userDisConn(data) {
		 // 유저가 접속 해제한 경우
		let uidx = data.uidx;
		let userName = data.userName;

		let state = $('.chatting-wrap').attr('data-state');
		if(state === '1') {
			let cidx = $('.message-main').attr('data-uidx');
			if(uidx === cidx) {
				messageToScreen('<div class="add-information">' + userName + '님이 퇴장 하였습니다.</div>');
				$('.message-header-title').html(userName + '-문의 답변 등록');
			}
		}
		
		let b = false;
		$('.chattingRoom-list-online .chatting-room').each(function(){
			let $el = $(this);
			let $elList = $el.closest('.chattingRoom-list-body');
			let idx = $el.attr('data-uidx');
			if(uidx == idx) {
				$elList.clone(true).appendTo('.chattingRoom-list-offline');
				$elList.remove();
				
				b = true;
				return false;
			}
		});
	}
	
	// ----------------------------------------------
	function receverMessageHTML(name, content, time) {
		let out;

		out =  '<div class="message-body-left">';
		out += '  <div class="message-user"><i class="fa-regular fa-circle-user"></i> <span>' + name + '</span></div>';
		out += '  <div class="message-content content-left">';
		out += '    <div class="message">' + content + '</div>';
		out += '    <div class="message-info">';
		out += '      <div class="message-time">' + time + '</div>';
		out += '    </div>';
		out += '  </div>';
		out += '</div>';

		return out;
	}
	
	function senderMessageHTML(unread, time, content) {
		let out;
		
		out =  '<div class="message-body-right">';
		out += '  <div class="message-content">';
		out += '    <div class="message-info">';
		out += '      <div class="message-unread">' + unread + '</div>';
		out += '      <div class="message-time">' + time + '</div>';
		out += '    </div>';
		out += '    <div class="message message-right">' + content + '</div>';
		out += '  </div>';
		out += '</div>';
		
		return out;
	}

	// 채팅방 유저 목록 출력 -----
	function appendChattingRoom(userRoom, selector) {
		// console.log(userRoom);
		
		let uidx = userRoom.uidx;
		let userName = userRoom.userName;
		let unread = userRoom.unread;
		let name = userName;
		if(unread == 1) name = name + '<small class="font-9"> (1)</small>'; 
		let content = userRoom.content;
		if(! content) content = '';
		let dateTime = userRoom.dateTime;
		if(! content) dateTime = '';

		let out;
		out =  '<div class="chattingRoom-list-body">';
		out += '  <div class="list-body-left">';
		out += '    <div class="chatting-info-left">';
		out += '      <i class="fa-solid fa-user-large person-circle-icon"></i>';
		out += '    </div>';
		out += '    <div class="chatting-info-right chatting-room" data-uidx="'+ uidx + '" data-userName="' + userName + '">';
		out += '      <div class="chatting-info-name font-11">' + name + '</div>';
		out += '      <div class="room-user-message font-10">' + content + '</div>';
		out += '    </div>';
		out += '  </div>';
		out += '  <div class="list-body-right">';
		out += '  <div class="list-body-right">';
		out += '     <small class="date">' + dateTime + '</small>';
		out += '     <button type="button" class="btn-chatting btn-body btn-dots btn-room-info" data-uidx="' + uidx + '" title="채팅방 정보"><i class="fa-solid fa-ellipsis-vertical"></i></button>';
		out += '  </div>';
		out += '</div>';
		
		const $EL = $(selector);
	    $EL.append(out);
	}
	
	// 채팅 메시지 출력 -----
	function messageToScreen(data) {
		const $listEL = $('.message-body-list');
		$listEL.append(data);
	    
		// 스크롤을 최상단에 있도록 설정함
		const $bodyEL = $('.message-body');
		$bodyEL.scrollTop($bodyEL.prop('scrollHeight'));
	}
</script>
