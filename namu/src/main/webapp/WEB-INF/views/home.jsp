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
      <img class="img1" src="${pageContext.request.contextPath}/resources/images/namu_used.png" alt="Namu Image">
    </div>
    <div class="inner-page2">

      <div id="carouselExample" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="img2" src="${pageContext.request.contextPath}/resources/images/slide1.png" class="d-block w-100">
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
      <h2>요즘 핫한 중고거래글!</h2>
  </div>
</div>

	<div class="content" style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">🏡 이주의 인기 집들이 best 🏡</div>

				<%-- 클릭시 인기 집들이 탭으로 이동 --%>
				<div class="more-view-btn">더보기</div>
			</div>

			<div class="main-best-board-container">
				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/168412784958746261.jpg?w=360&h=180&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/cards/projects/167661874383565334.jpg">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/168339197459485679.JPG?w=1280&h=850&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col banner-card-container">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/168438306650616160.jpg?w=850&h=640&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
		</div>

		<%-- 유용한 살림 팁 --%>
		<div class="content " style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">저장 필수 🚩 유용한 살림팁</div>

				<%-- 클릭시 인기 집들이 탭으로 이동 --%>
				<div class="more-view-btn">더보기</div>
			</div>

			<div class="main-best-board-container">
				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/166246625944344065.JPG?w=850&h=640&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/168438319689948709.jpg?w=850">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/projects/cover_images/162280293856900243.jpg?w=850&h=640&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/projects/cover_images/167469927873998349.png">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
		</div>


		<%-- 새로운 집들이 --%>
		<div class="content" style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">이번 주 나온 new 집들이 ✨</div>

				<%-- 클릭시 인기 집들이 탭으로 이동 --%>
				<div class="more-view-btn">더보기</div>
			</div>

			<div class="main-best-board-container">
				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/advices/165936125893801169.jpg?w=640&h=360&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/projects/cover_images/159364806618945549.jpg?w=640&h=360&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/projects/cover_images/167161229182910445.png">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/cards/expert_reviews/168497804300036152.JPG">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>
		</div>

		<div class="content" style="margin-top: 50px;">
			<div class="main-label">카테고리별 상품 찾기</div>
			<jsp:include page="/WEB-INF/views/layout/category.jsp"/>
		</div>

		<%-- 새로운 집들이 --%>
		<div class="content" style="margin-top: 50px">
			<div class="flex-row" style="justify-content: space-between; align-items: center">
				<div class="main-label">홈카페, 세팅부터 관리까지! 💁‍♀️</div>

				<%-- 클릭시 인기 집들이 탭으로 이동 --%>
				<div class="more-view-btn">더보기</div>
			</div>
		</div>
			<div class="main-best-board-container">
				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/advices/168130872193819157.jpg?w=2560&h=2560&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/advices/168308667455982722.png?w=2560&h=2560&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/projects/cover_images/165518609078536085.jpg?w=2560&h=2560&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>

				<div class="flex-col">
					<div class="home-img-container">
						<img style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/projects/cover_images/168508161129572623.jpg?w=1920&h=2560&c=c">
					</div>

					<div style="font-weight: 700; color: #65C2EC; margin-top: 10px">수납공간 확실하게!</div>
					<div>동선을 고려한 30평대 신축 리모델링</div>
				</div>
			</div>


<style>

.inner-page-container {
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  gap: 20px;
}

.inner-page {
  height: 500px;
  flex: 1;
}

.inner-page img.inner-page {
  max-width: 100%;
  max-height: 100%;
}

.inner-page2 {
  height: 500px;
  flex: 1;
}

.img1 {
  width: 1000px;
  height: 500px;
  flex: 1;
  border-radius: 5px;
}

.img2 {
  width: 276px;
  height: 500px;
  flex: 1;
  border-radius: 5px;
}


@media screen and (max-width: 768px) {
  .inner-page, .inner-page2 {
    min-width: 100%;
  }
}

</style>