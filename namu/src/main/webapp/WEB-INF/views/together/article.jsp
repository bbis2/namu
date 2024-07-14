<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>모임 상세</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #F8F9FA;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .fleamarket-cover {
            background-color: #FFFDD3;
            padding: 20px;
            text-align: center;
        }
        .htext {
            padding-top: 20px;
            padding-left: 20px;
        }
        .cover-content {
            padding: 20px;
            position: relative;
            height: 100%;
            box-sizing: border-box;
            margin-left: 20px;
        }
        .card {
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 16px;
            margin-bottom: 16px;
            background-color: #ffffff;
        }
        .card-title {
            font-size: 1.25rem;
            margin-bottom: 8px;
        }
        .card-text {
            font-size: 1rem;
            margin-bottom: 8px;
        }
        .list-group-item {
            cursor: pointer;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        .btn {
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #5a6268;
        }
        .profile-card {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-card img {
            border-radius: 50%;
            margin-right: 15px;
        }
        .profile-card div {
            flex: 1;
        }
        .meeting-info {
            margin-top: 20px;
        }
        .meeting-info div {
            margin-bottom: 10px;
        }
        .bookmark {
            position: absolute;
            right: 20px;
            top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <section class="fleamarket-cover">
            <h1 class="cover-title htext bd">함께하는<br>나무 모임</h1>
            <span class="cover-description htext">함께 즐기고 만들어가요!</span><br>
            <span class="cover-description htext">행복한 나무모임</span>
        </section>

        <div class="profile-card card">
            <img src="https://via.placeholder.com/80" alt="Profile Picture">
            <div>
                <h5>정유진</h5>
                <p>puedo_j</p>
                <p>서울특별시 마포구</p>
                <p>쪽지 | 스크랩 | 알림</p>
            </div>
        </div>

        <main class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="card">
                        <h2 class="card-title">토트넘짱</h2>
                        <img src="https://via.placeholder.com/800x200" alt="Meeting Image" class="img-fluid">
                        <div class="meeting-info">
                            <div>태그: #취미</div>
                            <div>모임장: 닉네임</div>
                            <div>멤버수: 10명</div>
                            <div>등록일: <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></div>
                        </div>
                        <p class="card-text">모임 소개: 여기 모임 소개 텍스트가 들어갑니다.</p>
                        <div class="bookmark">
                            <img src="https://via.placeholder.com/30" alt="Bookmark Icon">
                        </div>
                    </div>
                    <div class="mt-4">
                        <button class="btn">참가신청</button>
                        <button class="btn">리스트</button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="mb-4">
                        <input type="text" class="form-control mb-2" placeholder="나무일상">
                        <select class="form-control">
                            <option>나무모임</option>
                        </select>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">BEST TOP 10</h5>
                            <!-- 목록 추가 -->
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
