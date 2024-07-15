<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
		.banner-card-img {
			width: 100%;
			height: 100%;
			object-fit: cover;
			transition: 0.2s;
			border-radius: 5px;
		}

		.img-container {
            border-radius: 5px;
		}

		.banner-card-img:hover {
			transform: scale(1.05);
            cursor: pointer;
        }
		
		.banner-card-container:hover {
            cursor: pointer;
		}

        .banner-user-img {
            width: 24px;
            height: 24px;
            object-fit: cover;
			border-radius: 50%;
			margin-right: 4px;
        }

        .banner-username {
			color: white;
			font-size: 16px;
			line-height: 20px;
        }

        .main-banner-text {
			color: white;
			font-size: 32px;
			line-height: 42px;
        }

        .main-banner-info {
            position: absolute;
            left: 30px;
            bottom: 30px;
        }

        .icon-img {
			margin: 0 auto;
			width: 88px;
			height: 76px;
			object-fit: cover;
        }

        .icon-text {
			margin-top: 8px;
        }

        .main-icon-item {
			text-align: center;
        }

        .main-icon-container {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
        }
		
		.icon-img, .icon-text:hover {
            cursor: pointer;
		}

        .my-gap {
            margin-top: 25px;
        }

        .main-label {
			margin-top: 20px;
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .main-best-board-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
			height: 237px;
        }

		.main-best-board-container div {
            overflow: hidden;
            position: relative;
		}

        .main-best-board-container img {
            transition: 0.2s;
        }

		.main-best-board-container img:hover {
            transform: scale(1.05);
            cursor: pointer;
		}


        .more-view-btn {
            color: #65C2EC;
            font-weight: 700;
            margin-right: 7px;
            font-size: 15px;
            transition: opacity .1s;
        }

        .more-view-btn:hover {
            color: #B2E0F5;
            cursor: pointer;
        }

        .home-img-container {
            width: 100%;
            height: 180px;
            border-radius: 5px;
        }
	</style>

<style>
.my-page-item {
	position: relative;
}

.selected-my-page-item {
	color: rgb(53, 197, 240);
}

.triangle {
	width: 0px;
	height: 0px;
	border-bottom: 10px solid #666666;
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
	border-top: 15px solid #666666;
}

.select-arrow {
	position: relative;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 12px solid #EBEDEF;
}

.select-arrow::before {
	content: '';
	position: absolute;
	top: 2px;
	left: -5px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 12px solid white;
}

.arrow-container {
	position: absolute;
	left: 50%;
	bottom: -1px;
	transform: translate(-50%, 0)
}

.my-page-menubar-main {
	/*padding: 0 92px;*/
	border-top: 1px solid #EBEDEF;
	display: none;
	margin: 0;
}

.my-page-menubar-sub {
	border-top: 1px solid #EBEDEF;
	display: none;
	margin: 0;
}

.cart-cnt {
	color: white;
	font-size: 10px;
	font-weight: 700
}
</style>

<div class="container body-container">
  <div class="inner-page-container">
    <div class="inner-page">
      <img class="img1" src="${pageContext.request.contextPath}/resources/images/main4.png" alt="Namu Image">
    </div>
    
    <div class="inner-page2">
      <div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="1000">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/sub1.png" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/slide2.png" class="d-block w-100">
          </div>
          <div class="carousel-item">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/slide3.png" class="d-block w-100">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
    </div>
  </div>
  <div style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">✨인기✨ 중고거래</div>

	        <%-- 클릭시 인기 집들이 탭으로 이동 --%>
			<div class="more-view-btn" onclick="navigateToList('${pageContext.request.contextPath}/used/list')">더보기</div>
			</div>

			<div class="main-best-board-container">
				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">🎶빌려드림</div>

				<div class="more-view-btn">더보기</div>
			</div>

			<div class="main-best-board-container">
				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
		</div>


		<div style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">나무일상</div>

				<div class="more-view-btn"onclick="navigateToList('${pageContext.request.contextPath}/daily/list')">더보기</div>
			</div>

			<div class="main-best-board-container">
				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 50px;">
			<div class="main-label">카테고리별 상품 찾기</div>
			<jsp:include page="/WEB-INF/views/layout/category.jsp"/>
		</div>

		<%-- 새로운 집들이 --%>
		<div style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">홈카페, 세팅부터 관리까지! 💁‍♀️</div>

				<%-- 클릭시 인기 집들이 탭으로 이동 --%>
				<div class="more-view-btn">더보기</div>
			</div>
		</div>
			<div class="main-best-board-container">
				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="${pageContext.request.contextPath}/">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
</div>

<script type="text/javascript">
function navigateToList(url) {
    location.href = url;
}

</script>

<style>
.inner-page-container {
    display: flex;
    flex-wrap: nowrap;
    width: 100%;
    gap: 20px;
}

.inner-page, .inner-page2 {
    height: 500px;
    flex-shrink: 0;
}

.inner-page {
    flex-basis: 68%; 
}

.inner-page2 {
    flex-basis: 30%;
}

.img1, .img2 {
    margin-top: 25px;
    border-radius: 5px;
    flex-shrink: 0;
}

.img1 {
    width: 100%;
    height: 500px;
}

.img2 {
    width: 100%;
    height: 500px;
}

@media screen and (max-width: 768px) {
    .inner-page-container {
        flex-wrap: wrap; 
    }
    
    .inner-page, .inner-page2 {
        flex-basis: 100%;
        min-width: 100%;
    }
}
</style>