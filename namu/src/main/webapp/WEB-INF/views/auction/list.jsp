<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Listing</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <img src="header-image.png" alt="Header Image" class="header-image">
        <div class="filter">
            <label for="filter">인덱스 계정구</label>
            <select id="filter">
                <option value="all">전체</option>
                <option value="action">Action</option>
            </select>
        </div>
    </header>
    <main>
        <div class="product">
            <img src="iphone.jpg" alt="아이폰 14Pro">
            <div class="product-details">
                <h3>아이폰 14Pro</h3>
                <p>55,000원</p>
                <p>입찰수 1 | 종료일 2024-07-07</p>
            </div>
        </div>
        <div class="product">
            <img src="treadmill.jpg" alt="런닝머신 대형급 새제품">
            <div class="product-details">
                <h3>런닝머신 대형급 새제품</h3>
                <p>350,000원</p>
                <p>입찰수 3 | 종료일 2024-07-08</p>
            </div>
        </div>
        <div class="product">
            <img src="food.jpg" alt="뿌셔뿌셔">
            <div class="product-details">
                <h3>뿌셔뿌셔</h3>
                <p>1,000원</p>
                <p>입찰수 1 | 종료일 2024-06-30</p>
            </div>
        </div>
        <div class="product">
            <img src="car.jpg" alt="고릴라 경차 풀옵션. 삼자간 협의중">
            <div class="product-details">
                <h3>고릴라 경차 풀옵션. 삼자간 협의중</h3>
                <p>67,893,500원</p>
                <p>입찰수 5 | 종료일 2024-07-01</p>
            </div>
        </div>
        <div class="product">
            <img src="starbucks.jpg" alt="스타벅스 기프트카드 3만원">
            <div class="product-details">
                <h3>스타벅스 기프트카드 3만원</h3>
                <p>29,999원</p>
                <p>입찰수 2 | 종료일 2024-07-11</p>
            </div>
        </div>
    </main>
</body>
</html>

<Style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.header-image {
    width: 100%;
    height: auto;
}

.filter {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.filter label {
    margin-right: 10px;
}

main {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.product {
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin: 10px;
    padding: 10px;
    text-align: center;
}

.product img {
    width: 100%;
    height: auto;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
}

.product-details {
    padding: 10px 0;
}
</Style>