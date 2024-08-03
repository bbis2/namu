<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

h1 {
  position: relative;
  padding: 0;
  margin: 20px;
  font-weight: 300;
  font-size: 40px;
  color: #080808;
  -webkit-transition: all 0.4s ease 0s;
  -o-transition: all 0.4s ease 0s;
  transition: all 0.4s ease 0s;
}

h1 span {
  display: block;
  font-size: 0.5em;
  line-height: 1.3;
}
h1 em {
  font-style: normal;
  font-weight: 600;
}

/* === HEADING STYLE #1 === */
.one h1 {
  text-align: center;
  text-transform: uppercase;
  padding-bottom: 5px;
}
.one h1:before {
  width: 28px;
  height: 5px;
  display: block;
  content: "";
  position: absolute;
  bottom: 3px;
  left: 50%;
  margin-left: -14px;
  background-color: #b361ed;
}
.one h1:after {
  width: 100px;
  height: 1px;
  display: block;
  content: "";
  position: relative;
  margin-top: 25px;
  left: 50%;
  margin-left: -50px;
  background-color: #b361ed;
}
         
.custom-container {
    width: 60%;
    margin: 100px auto;
    background-color: white;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}
.custom-header, .custom-footer {
    text-align: center;
    padding: 10px;
}
.custom-header h1 {
    margin: 0;
    font-size: 24px;
}
.order-summary {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    align-items: flex-start;
}
.order-details {
    width: 65%;
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 10px;
}
.order-details h2 {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 10px;
}
.order-item {
    display: flex;
    align-items: center;
}
.order-item img {
    width: 100px;
    height: 100px;
    margin-right: 20px;
    border-radius: 10px;
}
.order-info {
    flex-grow: 1;
}
.order-info p {
    margin: 5px 0;
    font-size: 16px;
}
.quantity-select, .date-select {
    margin-top: 10px;
    display: flex;
    align-items: center;
}
.quantity-select label, .date-select label {
    margin-right: 10px;
    font-size: 14px;
    font-weight: bold;
}
.quantity-select select, .date-select select {
    padding: 5px;
    font-size: 14px;
}
.order-price {
    width: 30%;
    text-align: right;
}
.order-price table {
    width: 100%;
    border-collapse: collapse;
}
.order-price td {
    padding: 10px 5px;
    font-size: 16px;
}
.order-price td:nth-child(2) {
    text-align: right;
}
.total-price {
    text-align: right;
    margin-top: 20px;
    font-size: 18px;
}
.total-price span {
    font-weight: bold;
}
.btn-pay {
    display: block;
    width: 100%;
    padding: 15px;
    background-color: #a393eb;
    border-color:#a393eb;
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 20px;
}
.btn-pay:hover {
    background-color: #8673e0;
}
.footer-notes {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
    color: #888;
}
.footer-notes p {
    margin: 5px 0;
}
.accordion-body {
    text-align: left;
}
</style>
<script type="text/javascript">
function updateOrderPrice() {
    const pricePerItem = ${dto.price};
    const quantity = document.getElementById('quantity').value;
    const orderAmount = pricePerItem * quantity;
	const userPoint = ${userPoint==null?'0':userPoint};
	
    document.getElementById('orderAmount').textContent = orderAmount + '원';
    document.getElementById('usePoint').value = orderAmount;
    if(orderAmount>userPoint){
    document.getElementById('totalAmount').textContent = orderAmount- userPoint + '원';
    document.getElementById('totalAmountText').textContent = orderAmount- userPoint + '원';
    document.getElementById('totalPoint').textContent = 0 + '원';
    }else{
    document.getElementById('totalAmount').textContent = 0 + '원';
    document.getElementById('totalAmountText').textContent = 0 + '원';
    document.getElementById('totalPoint').textContent = userPoint - orderAmount + '원';
    }
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
</script>
</head>
<body>
	<div class="custom-container">
        <div class="one">
            <h1>결제하기</h1>
        </div>
        <form name="orderForm" method="post">
        <div class="order-summary">
        	
			    <div class="order-details">
			        <h2>주문내역</h2>
			        <div class="order-item">
			            <img src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" alt="그림">
			            <div class="order-info">
			                <p>${dto.subject}</p>
			                <p>${dto.nickName}</p>
			                <div class="quantity-select">
			                  <label for="quantity">수량 선택 :</label>
			                    <select id="quantity" name="quantity" onchange="updateOrderPrice()">
			                        <option value="1">1</option>
			                        <option value="2">2</option>
			                        <option value="3">3</option>
			                        <option value="4">4</option>
			                        <option value="5">5</option>
			                    </select>
			                </div>
			                <div class="date-select">
			                    <label for="option">선택 옵션 : </label>
			                    <label>
			                        <c:choose>
			                            <c:when test="${option1 == '0'}">
			                                없음
			                            </c:when>
			                            <c:otherwise>
			                                 ${listOption[0].optionName} : ${option1}
			                            </c:otherwise>
			                        </c:choose>
			                    </label>
			                    <label>
			                        <c:choose>
			                            <c:when test="${option2 == '0'}">
			                            </c:when>
			                            <c:otherwise>
			                                , ${listOption[1].optionName} : ${option2}
			                            </c:otherwise>
			                        </c:choose>
			                    </label>
			                </div>
			            </div>
			        </div>
			    </div>
			    <div class="order-price">
			        <table>
			            <tr>
			                <td>주문금액</td>
			                <td id="orderAmount">${dto.price}원</td>
			            </tr>
			            <tr>
			                <td>보유 포인트</td>
			                <td>${userPoint==null?"0":userPoint}원</td>
			            </tr>
			           
			            <tr>
			                <td>총 결제금액</td>
			                <td id="totalAmount">${(dto.price - userPoint)<0?'0':(dto.price - userPoint)} 원</td>
			            </tr>
			             <tr>
			                <td>결제시 남는 포인트</td>
			                <td id="totalPoint">${(userPoint)-dto.price<0?'0':(userPoint)-dto.price}원</td>
			            </tr>
			        </table>
			    </div>
			</div>
			<div class="total-price">
			    <p>총 결제금액: <span id="totalAmountText">${(dto.price - userPoint)<0?'0':(dto.price - userPoint)}원</span></p>
			</div>
			
        
        <div class="footer-notes">
              <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            결제 전 안내사항
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse " aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>1. <strong>상품 설명:</strong> 해당 상품의 상세 설명을 충분히 읽고 이해한 후 구매하시기 바랍니다.</p>
                            <p>2. <strong>결제 수단:</strong> 결제는 신용카드, 체크카드, 또는 기타 제공되는 결제 수단을 통해 이루어집니다.</p>
                            <p>3. <strong>취소 및 환불:</strong> 결제 후 취소 및 환불은 [취소 및 환불 정책 링크]를 참고하여 주시기 바랍니다. 결제 후 24시간 이내에 취소 요청 시 전액 환불이 가능하며, 이후에는 일부 환불 또는 환불 불가할 수 있습니다.</p>
                            <p>4. <strong>배송 및 수령:</strong> 구매한 디지털 상품은 결제 완료 후 즉시 제공되며, 물리적인 상품의 경우 지정된 배송 방법에 따라 발송됩니다.</p>
                            <p>5. <strong>문의 사항:</strong> 결제와 관련된 문의 사항은 고객 센터([고객 센터 연락처])로 연락 주시기 바랍니다.</p>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            개인정보 제 3자 제공
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>1. <strong>제공 목적:</strong> 재능마켓의 서비스 제공 및 원활한 거래 진행을 위해 필요한 최소한의 개인정보를 제 3자에게 제공할 수 있습니다.</p>
                            <p>2. <strong>제공 항목:</strong></p>
                            <ul>
                                <li>닉네임</li>
                                <li>아이디</li>
                            </ul>
                            <p>3. <strong>제공받는 자:</strong></p>
                            <ul>
                                <li>서비스 제공을 위한 파트너사 (예: 배송업체, 결제 대행사 등)</li>
                            </ul>
                            <p>4. <strong>제공받는 자의 이용 목적:</strong></p>
                            <ul>
                                <li>서비스 제공 및 거래 이행을 위한 정보 확인</li>
                                <li>고객 지원 및 사후 관리</li>
                            </ul>
                            <p>5. <strong>보유 및 이용 기간:</strong> 개인정보는 제공된 목적 달성 시까지 보유하며, 이후 관련 법령에 따라 일정 기간 보관 후 안전하게 파기됩니다.</p>
                            <p>6. <strong>동의 거부 권리 및 불이익:</strong> 개인정보 제공에 동의하지 않을 권리가 있으며, 동의하지 않을 경우 서비스 이용에 제한이 있을 수 있습니다.</p>
                        </div>
                    </div>
                </div>
        </div>
        </div>
        <div>
			<button type="button" class="btn-pay" onclick="sendOk();">결제하기</button>
		</div>
		<input type="hidden" name="optionValue" value="${option1}">
		<input type="hidden" name="optionValue2" value="${option2}">
		<input type="hidden" name="tboardNum" value="${dto.tboardNum}">
		<input type="hidden" name="usePoint"  id="usePoint" value="${dto.price}">
        </form>	
    </div>
  
    
    <script type="text/javascript">
    
    function sendOk() {
    	 const f = document.orderForm;
    	 var totalAmountElement = document.getElementById("totalAmount");

 	  
 	    var totalAmountText = totalAmountElement.textContent || totalAmountElement.innerText;

 	    var numericValue = totalAmountText.replace(/[^0-9.-]+/g, "");
        var money =numericValue;
        if (money ==0) {
        	 f.action = "${pageContext.request.contextPath}/talent/order";
        	 f.submit();
        } else {
            selectSeq(function(sequence) {
                requestPay(money, sequence);
                if (requestPay==true) {
					f.submit();
				}else if (requestPay==false) {
					return false;
				}
            });
        }
    }

    function selectSeq(callback) {
    	    let url = "${pageContext.request.contextPath}/mypage/selectSeq";
    	    let query = "";

    	    const fn = function(data) {
    	        let state = data.state;
    	        if (state === "true") {
    	            var sequence = data.sequence;
    	            callback(sequence); // 콜백 함수를 호출하여 sequence 값을 전달
    	        } else {
    	            alert("실패");
    	        }
    	    };
    	    ajaxFun(url, "post", query, "json", fn);
    	}

    	function pointCharge(sequence,money) {
    	    let url = "${pageContext.request.contextPath}/mypage/pointCharge";
    	    let currentPoint = "${userPoint}";
    	    let pointVar = money;
    	    
    	    
    	    let formData = {currentPoint:currentPoint,pointVar:pointVar,pointNum:sequence};
    		console.log(formData);
    		
    	    const fn = function(data) {
    	        let state = data.state;
    	        if (state === "true") {
    	        } else {
    	        }
    	    };
    	    ajaxFun(url, "post", formData, "json", fn);
    	}
    </script>
    
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp62772272");
	
	
	function requestPay(money,sequence) {
		IMP.request_pay({
			pg : 'html5_inicis.INIpayTest', // 테스트 시 html5_inicis.INIpayTest 기재 
			pay_method : 'card',
			merchant_uid : sequence, // 상점에서 생성한 고유 주문번호
			name : '나무머니',
			amount : money, // 금액
			buyer_email : 'test@portone.io',
			buyer_name : '${sessionScope.member.userId}',
			buyer_tel : '010-1234-5678', // 필수 파라미터
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
		}, function(resp) { // callback
			if (resp.success) {
				 const f = document.orderForm;
				pointCharge(sequence,money);
				alert('결제가 완료되었습니다...');
				f.action='${pageContext.request.contextPath}/talent/order';
				f.submit();
				return true;
			} else {
				alert('결제 실패');
				console.log(resp);
				return false;
			}
		});
	}
</script>
    
</body>
</html>
