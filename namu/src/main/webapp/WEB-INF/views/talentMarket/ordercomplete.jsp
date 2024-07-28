<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
  
    <style>
       
        .custom-container {
            max-width: 1000px;
            margin: 200px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        .custom-header {
            text-align: center;
            padding: 20px;
            background-color: #f4f4f4;
            border-bottom: 2px solid #e0e0e0;
        }
        .custom-header h2 {
            margin: 0;
            font-size: 28px;
            font-weight: 400;
            color: #666;
        }
        .custom-info, .custom-summary {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .custom-info img {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
            margin-right: 20px;
        }
        .custom-info .details {
            flex: 1;
            line-height: 1.5;
        }
        .custom-info p {
            margin: 5px 0;
        }
        .custom-info strong {
            color: #555;
        }
        .custom-summary {
            flex-direction: column;
            align-items: flex-end;
        }
        .custom-summary p {
            margin: 5px 0;
            font-size: 16px;
        }
        .custom-summary strong {
            font-size: 20px;
            color: #333;
        }
        .custom-buttons {
            text-align: center;
            margin-top: 30px;
        }
        .custom-btn {
            display: inline-block;
            padding: 10px 30px;
            margin: 5px;
            border-radius: 25px;
            font-size: 16px;
            color: #fff;
            background-color: #8e44ad;
            border: none;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .custom-btn:hover {
            background-color: #7d3c98;
        }
    </style>

<body>
    <div class="custom-container">
        <div class="custom-header">
            <h2>주문이 완료되었습니다</h2>
        </div>
        <div class="custom-info">
            <img src="${pageContext.request.contextPath}/uploads/photo/${dto.thumbnail}" alt="상품 이미지">
            <div class="details">
                <p><strong>상품명 : </strong>${dto.subject} </p>
                <p><strong>판매자 : </strong>${dto.nickName}</p>
                <p><strong>수량 : </strong> 1</p>
                <p><strong>선택 옵션 : </strong> <c:if test="${option1!=null}">${option1}</c:if> <c:if test="${option2!=null}">, option2</c:if></p>
            </div>
            <div class="custom-summary">
                <p><strong>주문금액 : </strong><fmt:formatNumber value="${usePoint}"/> 원</p>
                <p><strong>결제후 남은 포인트 : </strong><fmt:formatNumber value="${userPoint}"/>원</p>
            </div>
        </div>
        <div class="custom-buttons">
            <a href="#" class="custom-btn">주문 내역 확인</a>
            <a href="${pageContext.request.contextPath}/talent/list" class="custom-btn">리스트로 돌아가기</a>
        </div>
    </div>
</body>